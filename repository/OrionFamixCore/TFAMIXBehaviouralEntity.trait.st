"
A TFAMIXBehaviouralEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXBehaviouralEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
TFAMIXBehaviouralEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXBehaviouralEntity >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
