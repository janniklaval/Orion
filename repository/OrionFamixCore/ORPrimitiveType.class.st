"
A ORPrimitiveType is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORPrimitiveType,
	#superclass : #FAMIXPrimitiveType,
	#traits : 'TFAMIXPrimitiveType',
	#classTraits : 'TFAMIXPrimitiveType classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORPrimitiveType class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORPrimitiveType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORPrimitiveType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORPrimitiveType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORPrimitiveType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORPrimitiveType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORPrimitiveType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORPrimitiveType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORPrimitiveType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORPrimitiveType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORPrimitiveType >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORPrimitiveType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORPrimitiveType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORPrimitiveType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORPrimitiveType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORPrimitiveType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORPrimitiveType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORPrimitiveType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORPrimitiveType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORPrimitiveType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORPrimitiveType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORPrimitiveType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
