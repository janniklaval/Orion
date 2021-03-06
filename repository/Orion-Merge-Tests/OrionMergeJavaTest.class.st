"
NB: tests discarded should be corrected and reinserted
"
Class {
	#name : #OrionMergeJavaTest,
	#superclass : #TestCase,
	#traits : 'TOrionMergeJavaTest - {#testAddReferenceToStubClass. #testAddStubClass. #testAddStubClassInExistingStubNS. #testAddStubClassInNonExistingStubNS}',
	#classTraits : 'TOrionMergeJavaTest classTrait',
	#instVars : [
		'modelMerger'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #accessing }
OrionMergeJavaTest class >> wholeMSE [	
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

{ #category : #accessing }
OrionMergeJavaTest >> modelMerger [
	^ modelMerger
]

{ #category : #accessing }
OrionMergeJavaTest >> modelMerger: anObject [
	modelMerger := anObject
]

{ #category : #'as yet unclassified' }
OrionMergeJavaTest >> mooseModelMerge [
	^ modelMerger orionMergeTransformer
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

{ #category : #accessing }
OrionMergeJavaTest >> wholeMSE [
	^ self class wholeMSE
]
