Trait {
	#name : #TFAMIXParameterType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> container [
	^ self containerOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> orionID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
