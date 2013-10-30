"
A ORAnnotationTypeAttribute is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORAnnotationTypeAttribute,
	#superclass : #FAMIXAnnotationTypeAttribute,
	#traits : 'TFAMIXAnnotationTypeAttribute',
	#classTraits : 'TFAMIXAnnotationTypeAttribute classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationTypeAttribute class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> annotationAttributeInstances [
	^ self annotationAttributeInstancesOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> annotationAttributeInstancesOR: aVersion [
	^ self privateAnnotationAttributeInstances versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
ORAnnotationTypeAttribute >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> hasClassScope [
	^ self hasClassScopeOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> hasClassScopeOR: aVersion [
	^ self privateHasClassScope versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORAnnotationTypeAttribute >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORAnnotationTypeAttribute >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
