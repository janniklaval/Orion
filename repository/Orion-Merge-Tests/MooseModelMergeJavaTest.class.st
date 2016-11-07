Class {
	#name : #MooseModelMergeJavaTest,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeJavaTest >> setUp [
	| model1  model2 |
	model1 := MooseModel new.	
	model1 importFromMSEStream: self wholeMSE readStream.
	model1 name: 'base01'.

	
	model2 := MooseModel new.	
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.

	modelMerger:= MooseModelMerge new withBase: model1 convertToOrion target: model2.
]

{ #category : #tests }
MooseModelMergeJavaTest >> test [
	"comment stating purpose of message"

	self assert: modelMerger snapshot base notEmpty
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddContainedStubNamespace [

	"The parent namespace is a stub and does not already exist in the model"
	|ns nsc|
	ns := FAMIXNamespace new name: 'Namespace2'; isStub: true; yourself.
	modelMerger snapshot target add: ns. 
	nsc := FAMIXNamespace new name: 'NamespaceCont2'; isStub: true; parentScope: ns; yourself.
	modelMerger snapshot target add: nsc. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubNamespace: nsc.
	
	self assert: (modelMerger orionModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self assert: (modelMerger orionModel entityNamed: 'Namespace2::NamespaceCont2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') notNil.
		self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') parentScope equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddContainedStubNamespace2 [

	"The parent namespace is not a stub and already exist in the model"
	|ns|
	ns := FAMIXNamespace new name: 'Namespace2'; isStub: true; parentScope: (modelMerger snapshot target entityNamed: 'NamespaceTest') yourself.
	modelMerger snapshot target add: ns. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubNamespace: ns.
	
	self assert: (modelMerger orionModel entityNamed: 'NamespaceTest::Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') parentScope equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddContainedStubNamespace3 [

	"The parent namespace is a stub and already exists in the model"
	|ns|
	ns := FAMIXNamespace new name: 'Namespace2'; isStub: true; parentScope: (modelMerger snapshot target entityNamed: 'java') yourself.
	modelMerger snapshot target add: ns. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubNamespace: ns.
	
	self assert: (modelMerger orionModel entityNamed: 'java::Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'java::Namespace2') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'java::Namespace2') parentScope equals: (modelMerger orionVersionedModel entityNamed: 'java').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddReference [

	| cl meth ref |
	
	cl := modelMerger snapshot target entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := modelMerger snapshot target entityNamed: 'NamespaceTest::Class1.supersimple()'.
	ref := FAMIXReference new source: meth; target: cl; yourself.
	modelMerger snapshot target add: ref. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addReferenceFrom: modelMerger setOfAddReferenceChanges first entity from to: modelMerger setOfAddReferenceChanges first entity to.
	
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences first to equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2') .

]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddReference2 [

	| cl meth ref |
	
	cl := modelMerger snapshot target entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth:= FAMIXMethod new signature: 'methAdded()'; name: 'methAdded'; parentType: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1'); yourself .
	modelMerger snapshot target add: meth. 
	ref := FAMIXReference new source: meth; target: cl; yourself.
	modelMerger snapshot target add: ref. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddMethod.
	modelMerger addReferenceFrom: modelMerger setOfAddReferenceChanges first entity from to: modelMerger setOfAddReferenceChanges first entity to.

	
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences first to equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2') .

]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddReferenceFromMethOfAnonymousClass [

	|cl meth |
	cl := FAMIXClass new name: 'AnonymousClass'; container: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1.supersimple()');
					yourself .
	modelMerger snapshot target add: cl. 
	meth:= FAMIXMethod new signature: 'methInAnonymousClass'; name: 'methInAnonymousClass'; parentType: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1.supersimple()::AnonymousClass'); yourself .
	modelMerger snapshot target add: meth. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	

	modelMerger addReferenceFrom: meth to: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1'). 
	
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty.

]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddReferenceFromMethOfInnerClass [

	| cl meth |
	cl := FAMIXClass new name: 'InnerClass';
					container: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1');
					yourself.
	modelMerger snapshot target add: cl. 
	meth:= FAMIXMethod new signature: 'methInInnerClass'; name: 'methInInnerClass'; parentType: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1::InnerClass'); yourself .
	modelMerger snapshot target add: meth. 

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddMethod.
	
	modelMerger addReferenceFrom: meth to: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1'). 
	
	self assert: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty.

]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddReferenceToStubClass [

		|cl|
	cl := FAMIXClass new name: 'ClassTest'; isStub: true; container: (modelMerger snapshot target entityNamed: 'NamespaceTest'); yourself.
	modelMerger snapshot target add: cl. 

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	modelMerger addReferenceFrom: (modelMerger snapshot target entityNamed: 'NamespaceTest::Class1.supersimple()') toStub: cl. 
	
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isEmpty.

]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddStubClass [

	|cl|
	cl := FAMIXClass new name: 'ClassTest'; isStub: true; container: (modelMerger snapshot target entityNamed: 'NamespaceTest'); yourself.
	modelMerger snapshot target add: cl. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubClass: cl.
	
	self assert: (modelMerger orionModel entityNamed: 'NamespaceTest::ClassTest') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ClassTest') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ClassTest') container equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddStubClassInExistingStubNS [

	|cl|
	cl := FAMIXClass new name: 'ClassTest'; isStub: true; container: (modelMerger snapshot target entityNamed: 'java'); yourself.
	modelMerger snapshot target add: cl. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubClass: cl.
	
	self assert: (modelMerger orionModel entityNamed: 'java::ClassTest') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'java::ClassTest') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'java::ClassTest') container equals: (modelMerger orionVersionedModel entityNamed: 'java').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddStubClassInNonExistingStubNS [

	| cl ns |
	ns := FAMIXNamespace new name: 'Namespace2'; isStub: true; yourself.
	modelMerger snapshot target add: ns. 
	
	cl := FAMIXClass new name: 'ClassTest'; isStub: true; container: ns; yourself.
	modelMerger snapshot target add: cl. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubClass: cl.
	
	self assert: (modelMerger orionModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionModel entityNamed: 'Namespace2::ClassTest') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') container equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2').
]

{ #category : #tests }
MooseModelMergeJavaTest >> testAddStubNamespace [

	|ns|
	ns := FAMIXNamespace new name: 'Namespace2'; isStub: true; yourself.
	modelMerger snapshot target add: ns. 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger addStubNamespace: ns.
	
	self assert: (modelMerger orionModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
]

{ #category : #tests }
MooseModelMergeJavaTest >> testCreateAddNamespace [

	modelMerger snapshot target add: (FAMIXNamespace new name: 'Namespace2'). 
	self assert: modelMerger snapshot base notEmpty.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger createAddScopingEntity.
	
	self assert: (modelMerger orionModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
]

{ #category : #tests }
MooseModelMergeJavaTest >> testCreateMoveNamespace [

	(modelMerger snapshot target entityNamed: 'NamespaceTest::ContainedNamespace') parentScope: (modelMerger snapshot target entityNamed: 'java'). 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger createMoveNamespace .
	
	self assert: (modelMerger orionModel entityNamed: 'NamespaceTest::ContainedNamespace') parentScope name equals: 'NamespaceTest'.
	self assert: (modelMerger orionVersionedModel entityNamed: 'java::ContainedNamespace') parentScope name equals: 'java'.
]

{ #category : #tests }
MooseModelMergeJavaTest >> testSetOfAddNamespace [

	modelMerger snapshot target add: (FAMIXNamespace new name: 'Namespace2'). 
	self assert: modelMerger snapshot base notEmpty.
	
	modelMerger snapshot diff.	
	
	self assert: (modelMerger setOfAddScopingEntityChanges) notNil.
	self assert: modelMerger setOfAddScopingEntityChanges size equals: 1.

]

{ #category : #tests }
MooseModelMergeJavaTest >> testSetOfMoveNamespaceChanges [

	(modelMerger snapshot target entityNamed: 'NamespaceTest::ContainedNamespace') parentScope: (modelMerger snapshot target entityNamed: 'java'). 
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	self assert: (modelMerger setOfMoveNamespaceChanges ) notNil.
	self assert: modelMerger setOfMoveNamespaceChanges size equals: 1.

]

{ #category : #accessing }
MooseModelMergeJavaTest >> wholeMSE [	
	^ '(
    	(FAMIX.Method (id: 2)
    		(name ''whileWhile'')
    		(cyclomaticComplexity 4)
    		(declaredType (ref: 11))
    		(numberOfStatements 5)
    		(parentType (ref: 7))
    		(signature ''whileWhile()'')
    		(sourceAnchor (ref: 4)))
    	(FAMIX.PrimitiveType (id: 1)
    		(name ''boolean'')
    		(isStub true))
    	(FAMIX.FileAnchor (id: 4)
    		(element (ref: 2))
    		(endLine 27)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 16))
    	(FAMIX.Class (id: 3)
    		(name ''Object'')
    		(container (ref: 10))
    		(isStub true))
    	(FAMIX.FileAnchor (id: 5)
    		(element (ref: 7))
    		(endLine 38)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 1))
    	(FAMIX.Method (id: 6)
    		(name ''aLittleOfVariables'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 24))
    		(numberOfStatements 1)
    		(parentType (ref: 7))
    		(signature ''aLittleOfVariables()'')
    		(sourceAnchor (ref: 15)))
	(FAMIX.Method (id: 35)
    		(name ''aLittleOfVariables2'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 36))
    		(numberOfStatements 1)
    		(parentType (ref: 7))
    		(signature ''aLittleOfVariables2()'')
    		(sourceAnchor (ref: 15)))
	(FAMIX.Method (id: 40)
    		(name ''aLittleOfVariables3'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 36))
    		(numberOfStatements 1)
    		(parentType (ref: 7))
    		(signature ''aLittleOfVariables3()'')
    		(sourceAnchor (ref: 15)))
	(FAMIX.Method (id: 50)
    		(name ''aLittleOfVariables4'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 37))
    		(numberOfStatements 1)
    		(parentType (ref: 101))
    		(signature ''aLittleOfVariables4()'')
    		(sourceAnchor (ref: 15)))
	(FAMIX.Method (id: 60)
    		(name ''aLittleOfVariables5'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 37))
    		(numberOfStatements 1)
    		(parentType (ref: 101))
    		(signature ''aLittleOfVariables5()'')
    		(sourceAnchor (ref: 15)))		
    	(FAMIX.Class (id: 7)
    		(name ''Class1'')
    		(container (ref: 13))
    		(modifiers ''public'')
    		(sourceAnchor (ref: 5)))
    	(FAMIX.Parameter (id: 8)
    		(name ''a'')
    		(declaredType (ref: 24))
    		(parentBehaviouralEntity (ref: 19)))
    	(FAMIX.Parameter (id: 9)
    		(name ''b'')
    		(declaredType (ref: 12))
    		(parentBehaviouralEntity (ref: 19)))
    	(FAMIX.Namespace (id: 10)
    		(name ''lang'')
    		(isStub true)
    		(parentScope (ref: 21)))
    	(FAMIX.PrimitiveType (id: 11)
    		(name ''void'')
    		(isStub true))
    	(FAMIX.PrimitiveType (id: 12)
    		(name ''float'')
    		(isStub true))
    	(FAMIX.Namespace (id: 13)
    		(name ''NamespaceTest'')
    		(isStub false))
    	(FAMIX.Method (id: 14)
    		(name ''ifMethod'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 11))
    		(numberOfStatements 0)
    		(parentType (ref: 7))
    		(signature ''ifMethod()'')
    		(sourceAnchor (ref: 23)))
    	(FAMIX.FileAnchor (id: 15)
    		(element (ref: 6))
    		(endLine 6)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 3))
    	(FAMIX.Method (id: 16)
    		(name ''supersimple'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 1))
    		(numberOfStatements 1)
    		(parentType (ref: 7))
    		(signature ''supersimple()'')
    		(sourceAnchor (ref: 25)))
    	(FAMIX.Parameter (id: 17)
    		(name ''c'')
    		(declaredType (ref: 26))
    		(parentBehaviouralEntity (ref: 19)))
    	(FAMIX.FileAnchor (id: 18)
    		(element (ref: 19))
    		(endLine 10)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 8))
    	(FAMIX.Method (id: 19)
    		(name ''params'')
    		(cyclomaticComplexity 1)
    		(declaredType (ref: 11))
    		(numberOfStatements 0)
    		(parentType (ref: 7))
    		(signature ''params(int,float,double)'')
    		(sourceAnchor (ref: 18)))
    	(FAMIX.JavaSourceLanguage (id: 20))
    	(FAMIX.Namespace (id: 21)
    		(name ''java'')
    		(isStub true))
    	(FAMIX.Inheritance (id: 22)
    		(subclass (ref: 7))
    		(superclass (ref: 3)))
    	(FAMIX.PrimitiveType (id: 24)
    		(name ''int'')
    		(isStub true))
	(FAMIX.PrimitiveType (id: 36)
    		(name ''float'')
    		(isStub true))
	(FAMIX.PrimitiveType (id: 37)
    		(name ''String'')
    		(isStub true))
	(FAMIX.PrimitiveType (id: 37)
    		(name ''char'')
    		(isStub true))
    	(FAMIX.FileAnchor (id: 23)
    		(element (ref: 14))
    		(endLine 36)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 29))
    	(FAMIX.FileAnchor (id: 25)
    		(element (ref: 16))
    		(endLine 14)
    		(fileName ''simpleJava/DummyClass.java'')
    		(startLine 12))
    	(FAMIX.PrimitiveType (id: 26)
    		(name ''double'')
    		(isStub true))
	(FAMIX.Namespace (id: 100)
    		(name ''ContainedNamespace'')
    		(isStub false)
		(parentScope (ref: 13)))
	(FAMIX.Class (id: 101)
    		(name ''Class2'')
    		(container (ref: 100))
    		(modifiers ''public''))
	(FAMIX.Attribute (id: 102)
		(name ''att1'')
		(declaredType (ref: 1))
		(parentType (ref: 101)))
)'
]