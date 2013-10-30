"
A ORUnknownVariable is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORUnknownVariable,
	#superclass : #FAMIXUnknownVariable,
	#traits : 'TFAMIXUnknownVariable',
	#classTraits : 'TFAMIXUnknownVariable classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORUnknownVariable class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORUnknownVariable >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORUnknownVariable >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
ORUnknownVariable >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORUnknownVariable >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORUnknownVariable >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #testing }
ORUnknownVariable >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORUnknownVariable >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORUnknownVariable >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORUnknownVariable >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORUnknownVariable >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORUnknownVariable >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORUnknownVariable >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORUnknownVariable >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORUnknownVariable >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORUnknownVariable >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORUnknownVariable >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORUnknownVariable >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORUnknownVariable >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORUnknownVariable >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORUnknownVariable >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORUnknownVariable >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
