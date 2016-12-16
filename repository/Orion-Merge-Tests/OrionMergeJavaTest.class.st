Class {
	#name : #OrionMergeJavaTest,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #'as yet unclassified' }
OrionMergeJavaTest >> mooseModelMerge [
	^ modelMerger diffTransformers first
]

{ #category : #accessing }
OrionMergeJavaTest >> orionVersionedModel: anORModel [
	self mooseModelMerge orionVersionedModel: anORModel
]

{ #category : #running }
OrionMergeJavaTest >> setUp [
	| model1 model2 |
	model1 := MooseModel new.
	model1 importFromMSEStream: self wholeMSE readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}
]

{ #category : #tests }
OrionMergeJavaTest >> test [
	"comment stating purpose of message"

	self assert: modelMerger baseModel notEmpty
]

{ #category : #tests }
OrionMergeJavaTest >> test0AddAllFromEmptyModel [
	"comment stating purpose of message"

	| model1 model2 |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2
]

{ #category : #tests }
OrionMergeJavaTest >> test0AddAllFromEmptyModelAndCheckDiff [
	| modelDiff res model1 model2 |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	modelDiff := FXDiff baseModel: modelMerger baseModel system orionModels second targetModel: model2 diffTransformers: {}.
	res := modelDiff run result.
	self assert: res isEmpty
	

]

{ #category : #tests }
OrionMergeJavaTest >> testAddContainedStubNamespace [
	"The parent namespace is a stub and does not already exist in the model"

	| ns nsc |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	nsc := FAMIXNamespace new
		name: 'NamespaceCont2';
		isStub: true;
		parentScope: ns;
		yourself.
	modelMerger targetModel add: nsc.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: nsc.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') isNotNil.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2::NamespaceCont2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') parentScope equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddContainedStubNamespace2 [
	"The parent namespace is not a stub and already exist in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope:
			(modelMerger targetModel entityNamed: 'NamespaceTest') yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger 
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self
		assert: (modelMerger baseModel entityNamed: 'NamespaceTest::Namespace2') isNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::Namespace2') notNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::Namespace2') parentScope
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddContainedStubNamespace3 [
	"The parent namespace is a stub and already exists in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (modelMerger targetModel entityNamed: 'java') yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self
		assert: (modelMerger baseModel entityNamed: 'java::Namespace2') isNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::Namespace2')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::Namespace2')
				parentScope
		equals: (modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddInheritance [
	| c1 c2 inh |
	c1 := modelMerger targetModel entityNamed: 'NamespaceTest::Class1'.
	c2 := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	inh := FAMIXInheritance new
		superclass: c1;
		subclass: c2;
		yourself.
	modelMerger targetModel add: inh.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddInheritance.
	modelMerger orionVersionedModel
		addInheritanceFrom: modelMerger result setOfAddInheritanceChanges first entity from
		to: modelMerger result setOfAddInheritanceChanges first entity to.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
				superInheritances notEmpty.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') subInheritances
				notEmpty
]

{ #category : #tests }
OrionMergeJavaTest >> testAddReference [
	| cl meth ref changedReference |
	cl := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()'.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	modelMerger targetModel add: ref.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	changedReference := modelMerger result setOfAddReferenceChanges first entity.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel addReferenceFrom: changedReference from to: changedReference to.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isNotEmpty.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences first to
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddReference2 [
	| cl meth ref |
	cl := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := FAMIXMethod new
		signature: 'methAdded()';
		name: 'methAdded';
		parentType: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	modelMerger targetModel add: meth.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	modelMerger targetModel add: ref.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel
		addReferenceFrom: modelMerger result setOfAddReferenceChanges first entity from
		to: modelMerger result setOfAddReferenceChanges first entity to.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences notEmpty.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences first to
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddReferenceFromMethOfAnonymousClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'AnonymousClass';
		container:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1.supersimple()');
		yourself.
	modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInAnonymousClass';
		name: 'methInAnonymousClass';
		parentType:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1.supersimple()::AnonymousClass');
		yourself.
	modelMerger targetModel add: meth.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1')
				incomingReferences isEmpty
]

{ #category : #tests }
OrionMergeJavaTest >> testAddReferenceFromMethOfInnerClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'InnerClass';
		container: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInInnerClass';
		name: 'methInInnerClass';
		parentType:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1::InnerClass');
		yourself.
	modelMerger targetModel add: meth.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(modelMerger targetModel entityNamed: 'NamespaceTest::Class1')
				incomingReferences isEmpty
]

{ #category : #tests }
OrionMergeJavaTest >> testAddReferenceToStubClass [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel addReferenceFrom: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()') toStub: cl.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences notEmpty
]

{ #category : #tests }
OrionMergeJavaTest >> testAddStubClass [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self
		assert: (modelMerger baseModel entityNamed: 'NamespaceTest::ClassTest') isNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::ClassTest') notNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::ClassTest') container
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddStubClassInExistingStubNS [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'java');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self
		assert: (modelMerger baseModel entityNamed: 'java::ClassTest') isNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::ClassTest')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::ClassTest')
				container
		equals: (modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddStubClassInNonExistingStubNS [
	| cl ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: ns;
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self
		assert: (modelMerger baseModel entityNamed: 'Namespace2::ClassTest') isNil.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest')
				container
		equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
OrionMergeJavaTest >> testAddStubNamespace [
	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil
]

{ #category : #tests }
OrionMergeJavaTest >> testCreateAddNamespace [
	modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: modelMerger baseModel notEmpty.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil
]

{ #category : #tests }
OrionMergeJavaTest >> testCreateMoveNamespace [
	(modelMerger targetModel
		entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (modelMerger targetModel entityNamed: 'java').
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createMoveNamespace.
	self
		assert:
			(modelMerger baseModel
				entityNamed: 'NamespaceTest::ContainedNamespace') parentScope name
		equals: 'NamespaceTest'.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'java::ContainedNamespace') parentScope name
		equals: 'java'
]

{ #category : #tests }
OrionMergeJavaTest >> testSetOfAddNamespace [
	modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: modelMerger baseModel isNotEmpty.
	modelMerger run.
	self assert: modelMerger result setOfAddScopingEntityChanges isNotNil.
	self assert: modelMerger result setOfAddScopingEntityChanges size equals: 1
]

{ #category : #tests }
OrionMergeJavaTest >> testSetOfMoveNamespaceChanges [
	(modelMerger targetModel
		entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (modelMerger targetModel entityNamed: 'java').
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self assert: modelMerger result setOfMoveNamespaceChanges notNil.
	self assert: modelMerger result setOfMoveNamespaceChanges size equals: 1
]

{ #category : #accessing }
OrionMergeJavaTest >> wholeMSE [	
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
