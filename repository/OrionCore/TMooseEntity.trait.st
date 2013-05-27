Trait {
	#name : #TMooseEntity,
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TMooseEntity >> antaresID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
TMooseEntity >> antaresModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
TMooseEntity >> antaresModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
TMooseEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
TMooseEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
TMooseEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ASDefaultState
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isCreatedBetween: anAntaresModel and: anotherAntaresModel [
		
		^(anAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isCreatedIn: anAntaresModel [
		|parent|
		parent := anAntaresModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isModifiedBetween: anAntaresModel and: anotherAntaresModel [
		|old new|
		old := anAntaresModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherAntaresModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isModifiedIn: anAntaresModel [
		|parent|
		parent := anAntaresModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isRemovedBetween: anAntaresModel and: anotherAntaresModel [
		
		^(anAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TMooseEntity >> isRemovedIn: anAntaresModel [
		|parent|
		parent := anAntaresModel parentModel.
		parent ifNil:[
			^(anAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anAntaresModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TMooseEntity >> stateBetween: anAntaresModel and: anotherAntaresModel [

	(self isCreatedBetween: anAntaresModel and: anotherAntaresModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anAntaresModel and: anotherAntaresModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anAntaresModel and: anotherAntaresModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TMooseEntity >> stateIn: anAntaresModel [

	(self isCreatedIn: anAntaresModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anAntaresModel) ifTrue:[^#isModified].
	(self isRemovedIn: anAntaresModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TMooseEntity >> versionIn: anAntaresModel [

	|upEntity|
	
	upEntity := anAntaresModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anAntaresModel.
	^upEntity
]
