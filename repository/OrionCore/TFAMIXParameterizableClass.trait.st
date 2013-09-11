Trait {
	#name : #TFAMIXParameterizableClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> container [
	^ self containerOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isInterface [
	^ self isInterfaceOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isInterfaceOR: aVersion [
	^ self privateIsInterface versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> orionID [
	^ self mooseID
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> parameterizedTypes [
	^ self parameterizedTypesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> parameterizedTypesOR: aVersion [
	^ self privateParameterizedTypes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
