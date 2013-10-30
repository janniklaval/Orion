"
A ORDeclaredException is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORDeclaredException,
	#superclass : #FAMIXDeclaredException,
	#traits : 'TFAMIXDeclaredException',
	#classTraits : 'TFAMIXDeclaredException classTrait',
	#category : #'OrionFamixJava-Class'
}

{ #category : #'as yet unclassified' }
ORDeclaredException class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> definingMethod [
	^ self definingMethodOR: self currentContext
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> definingMethodOR: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]

{ #category : #accessing }
ORDeclaredException >> exceptionClass [
	^ self exceptionClassOR: self currentContext
]

{ #category : #accessing }
ORDeclaredException >> exceptionClassOR: aVersion [
	^ self privateExceptionClass versionIn: aVersion
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORDeclaredException >> isOrionEntity [
	^ true
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> orionID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
ORDeclaredException >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
