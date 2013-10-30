"
A TFAMIXInvocation is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXInvocation,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInvocation classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXInvocation >> candidates [
	^ self candidatesOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> candidatesOR: aVersion [
	^ self privateCandidates versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
TFAMIXInvocation >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXInvocation >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #testing }
TFAMIXInvocation >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXInvocation >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXInvocation >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXInvocation >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXInvocation >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXInvocation >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXInvocation >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
TFAMIXInvocation >> next [
	^ self nextOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXInvocation >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXInvocation >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXInvocation >> previous [
	^ self previousOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> receiver [
	^ self receiverOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> receiverOR: aVersion [
	^ self privateReceiver versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> receiverSourceCode [
	^ self receiverSourceCodeOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> receiverSourceCodeOR: aVersion [
	^ self privateReceiverSourceCode versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> sender [
	^ self senderOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> senderOR: aVersion [
	^ self privateSender versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXInvocation >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXInvocation >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
