"
A TFAMIXDeclaredException is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXDeclaredException,
	#traits : 'TFAMIXException',
	#classTraits : 'TFAMIXException classTrait',
	#category : #'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException classSide >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> definingMethod [
	^ self definingMethodOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> definingMethodOR: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]

{ #category : #accessing }
TFAMIXDeclaredException >> exceptionClass [
	^ self exceptionClassOR: self currentContext
]

{ #category : #accessing }
TFAMIXDeclaredException >> exceptionClassOR: aVersion [
	^ self privateExceptionClass versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXDeclaredException >> isOrionEntity [
	^ true
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> orionID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXDeclaredException >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
