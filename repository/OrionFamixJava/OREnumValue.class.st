"
A OREnumValue is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #OREnumValue,
	#superclass : #FAMIXEnumValue,
	#traits : 'TFAMIXEnumValue',
	#classTraits : 'TFAMIXEnumValue classTrait',
	#category : #'OrionFamixJava-Class'
}

{ #category : #'as yet unclassified' }
OREnumValue class >> isOrionClass [
	^ true
]

{ #category : #accessing }
OREnumValue >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
OREnumValue >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
OREnumValue >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
OREnumValue >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
OREnumValue >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
OREnumValue >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #testing }
OREnumValue >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
OREnumValue >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
OREnumValue >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
OREnumValue >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
OREnumValue >> isOrionEntity [
	^ true
]

{ #category : #testing }
OREnumValue >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
OREnumValue >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
OREnumValue >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
OREnumValue >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> orionID [
	^ self mooseID
]

{ #category : #accessing }
OREnumValue >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
OREnumValue >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
OREnumValue >> parentEnum [
	^ self parentEnumOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> parentEnumOR: aVersion [
	^ self privateParentEnum versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
OREnumValue >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
OREnumValue >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
OREnumValue >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
OREnumValue >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
