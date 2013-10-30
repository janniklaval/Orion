"
A ORBehaviouralEntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORBehaviouralEntity,
	#superclass : #FAMIXBehaviouralEntity,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORBehaviouralEntity class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORBehaviouralEntity >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
ORBehaviouralEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORBehaviouralEntity >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORBehaviouralEntity >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORBehaviouralEntity >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORBehaviouralEntity >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORBehaviouralEntity >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORBehaviouralEntity >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORBehaviouralEntity >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORBehaviouralEntity >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORBehaviouralEntity >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORBehaviouralEntity >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORBehaviouralEntity >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORBehaviouralEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORBehaviouralEntity >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORBehaviouralEntity >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORBehaviouralEntity >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORBehaviouralEntity >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORBehaviouralEntity >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORBehaviouralEntity >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
