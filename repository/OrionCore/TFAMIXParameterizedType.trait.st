Trait {
	#name : #TFAMIXParameterizedType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> arguments [
	^ self argumentsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> argumentsOR: aVersion [
	^ self privateArguments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> container [
	^ self containerOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> orionID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> parameterizableClass [
	^ self parameterizableClassOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> parameterizableClassOR: aVersion [
	^ self privateParameterizableClass versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
