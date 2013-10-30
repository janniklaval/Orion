"
A ORType is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORType,
	#superclass : #FAMIXType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORType class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
ORType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
ORType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
ORType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
ORType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORType >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
ORType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
ORType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
ORType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
ORType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
ORType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
ORType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
