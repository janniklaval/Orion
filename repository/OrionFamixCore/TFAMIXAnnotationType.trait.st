"
A TFAMIXAnnotationType is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
TFAMIXAnnotationType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXAnnotationType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXAnnotationType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> instances [
	^ self instancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> instancesOR: aVersion [
	^ self privateInstances versionIn: aVersion
]

{ #category : #testing }
TFAMIXAnnotationType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXAnnotationType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXAnnotationType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXAnnotationType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXAnnotationType >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXAnnotationType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXAnnotationType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXAnnotationType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXAnnotationType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXAnnotationType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXAnnotationType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXAnnotationType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXAnnotationType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXAnnotationType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
