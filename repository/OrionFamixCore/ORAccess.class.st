"
An ORAccess is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. 
"
Class {
	#name : #ORAccess,
	#superclass : #FAMIXAccess,
	#traits : 'TFAMIXAccess',
	#classTraits : 'TFAMIXAccess classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAccess class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORAccess >> accessor [
	^ self accessorOR: self currentContext
]

{ #category : #accessing }
ORAccess >> accessorOR: aVersion [
	^ self privateAccessor versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORAccess >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORAccess >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORAccess >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORAccess >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORAccess >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORAccess >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #testing }
ORAccess >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORAccess >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORAccess >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORAccess >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'*OrionCore-model' }
ORAccess >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORAccess >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORAccess >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
ORAccess >> isWrite [
	^ self isWriteOR: self currentContext
]

{ #category : #testing }
ORAccess >> isWriteOR: aVersion [
	^ self privateIsWrite versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> next [
	^ self nextOR: self currentContext
]

{ #category : #accessing }
ORAccess >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORAccess >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORAccess >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORAccess >> previous [
	^ self previousOR: self currentContext
]

{ #category : #accessing }
ORAccess >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORAccess >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORAccess >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAccess >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAccess >> variable [
	^ self variableOR: self currentContext
]

{ #category : #accessing }
ORAccess >> variableOR: aVersion [
	^ self privateVariable versionIn: aVersion
]

{ #category : #'*OrionCore-model' }
ORAccess >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
