"
A TFAMIXParameter is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameter,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameter classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameter >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXParameter >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
TFAMIXParameter >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXParameter >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXParameter >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #testing }
TFAMIXParameter >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXParameter >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameter >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXParameter >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameter >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXParameter >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameter >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameter >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXParameter >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXParameter >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXParameter >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXParameter >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> parentBehaviouralEntityOR: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameter >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameter >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameter >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameter >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
