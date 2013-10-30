"
A ORAnnotationInstanceAttribute is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. 
"
Class {
	#name : #ORAnnotationInstanceAttribute,
	#superclass : #FAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXAnnotationInstanceAttribute',
	#classTraits : 'TFAMIXAnnotationInstanceAttribute classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationInstanceAttribute class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ self annotationTypeAttributeOR: self currentContext
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> annotationTypeAttributeOR: aVersion [
	^ self privateAnnotationTypeAttribute versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #private }
ORAnnotationInstanceAttribute >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'*OrionCore-model' }
ORAnnotationInstanceAttribute >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORAnnotationInstanceAttribute >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ self parentAnnotationInstanceOR: self currentContext
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> parentAnnotationInstanceOR: aVersion [
	^ self privateParentAnnotationInstance versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> value [
	^ self valueOR: self currentContext
]

{ #category : #accessing }
ORAnnotationInstanceAttribute >> valueOR: aVersion [
	^ self privateValue versionIn: aVersion
]

{ #category : #'*OrionCore-model' }
ORAnnotationInstanceAttribute >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
