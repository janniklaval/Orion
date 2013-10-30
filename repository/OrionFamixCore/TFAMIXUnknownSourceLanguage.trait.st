"
A TFAMIXUnknownSourceLanguage is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXUnknownSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXUnknownSourceLanguage classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #private }
TFAMIXUnknownSourceLanguage >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXUnknownSourceLanguage >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> sourcedEntities [
	^ self sourcedEntitiesOR: self currentContext
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> sourcedEntitiesOR: aVersion [
	^ self privateSourcedEntities versionIn: aVersion
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXUnknownSourceLanguage >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
