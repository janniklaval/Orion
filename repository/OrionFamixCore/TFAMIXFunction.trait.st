"
A TFAMIXFunction is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXFunction,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFunction classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXFunction >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXFunction >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
TFAMIXFunction >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXFunction >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXFunction >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXFunction >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXFunction >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXFunction >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXFunction >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXFunction >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXFunction >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXFunction >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXFunction >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXFunction >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXFunction >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXFunction >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXFunction >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXFunction >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXFunction >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
