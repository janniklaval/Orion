"
An ORInvocation is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. 
"
Class {
	#name : #ORInvocation,
	#superclass : #FAMIXInvocation,
	#traits : 'TFAMIXInvocation',
	#classTraits : 'TFAMIXInvocation classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORInvocation class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORInvocation >> candidates [
	^ self candidatesOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> candidatesOR: aVersion [
	^ self privateCandidates versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORInvocation >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORInvocation >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORInvocation >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORInvocation >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #testing }
ORInvocation >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORInvocation >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORInvocation >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORInvocation >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORInvocation >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORInvocation >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORInvocation >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
ORInvocation >> next [
	^ self nextOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORInvocation >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORInvocation >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORInvocation >> previous [
	^ self previousOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> receiver [
	^ self receiverOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> receiverOR: aVersion [
	^ self privateReceiver versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> receiverSourceCode [
	^ self receiverSourceCodeOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> receiverSourceCodeOR: aVersion [
	^ self privateReceiverSourceCode versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> sender [
	^ self senderOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> senderOR: aVersion [
	^ self privateSender versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORInvocation >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORInvocation >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORInvocation >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORInvocation >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
