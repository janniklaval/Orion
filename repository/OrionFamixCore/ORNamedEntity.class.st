"
A ORNamedEntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORNamedEntity,
	#superclass : #FAMIXNamedEntity,
	#traits : 'TFAMIXNamedEntity',
	#classTraits : 'TFAMIXNamedEntity classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORNamedEntity class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORNamedEntity >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORNamedEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORNamedEntity >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORNamedEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORNamedEntity >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #testing }
ORNamedEntity >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORNamedEntity >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORNamedEntity >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORNamedEntity >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORNamedEntity >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORNamedEntity >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORNamedEntity >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORNamedEntity >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORNamedEntity >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORNamedEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORNamedEntity >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORNamedEntity >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORNamedEntity >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORNamedEntity >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORNamedEntity >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORNamedEntity >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
