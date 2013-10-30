"
A ORParameter is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORParameter,
	#superclass : #FAMIXParameter,
	#traits : 'TFAMIXParameter',
	#classTraits : 'TFAMIXParameter classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORParameter class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORParameter >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORParameter >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORParameter >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORParameter >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORParameter >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORParameter >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
ORParameter >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
ORParameter >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORParameter >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORParameter >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
ORParameter >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #testing }
ORParameter >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORParameter >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORParameter >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORParameter >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORParameter >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORParameter >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORParameter >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORParameter >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORParameter >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORParameter >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORParameter >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORParameter >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORParameter >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORParameter >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityOR: self currentContext
]

{ #category : #accessing }
ORParameter >> parentBehaviouralEntityOR: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORParameter >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORParameter >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORParameter >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORParameter >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORParameter >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORParameter >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
