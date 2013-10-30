"
A TFAMIXMethod is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXMethod,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXMethod classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXMethod >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXMethod >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
TFAMIXMethod >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXMethod >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXMethod >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXMethod >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXMethod >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXMethod >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXMethod >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXMethod >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXMethod >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXMethod >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXMethod >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXMethod >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> kind [
	^ self kindOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> kindOR: aVersion [
	^ self privateKind versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXMethod >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXMethod >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXMethod >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXMethod >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXMethod >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
