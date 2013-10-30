"
A TFAMIXAnnotationInstanceAttribute is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ self annotationTypeAttributeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttributeOR: aVersion [
	^ self privateAnnotationTypeAttribute versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #private }
TFAMIXAnnotationInstanceAttribute >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXAnnotationInstanceAttribute >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ self parentAnnotationInstanceOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstanceOR: aVersion [
	^ self privateParentAnnotationInstance versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> value [
	^ self valueOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> valueOR: aVersion [
	^ self privateValue versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
