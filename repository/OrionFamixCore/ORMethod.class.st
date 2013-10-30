"
A ORMethod is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORMethod,
	#superclass : #FAMIXMethod,
	#traits : 'TFAMIXMethod',
	#classTraits : 'TFAMIXMethod classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORMethod class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORMethod >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORMethod >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORMethod >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORMethod >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORMethod >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
ORMethod >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #private }
ORMethod >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORMethod >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORMethod >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORMethod >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORMethod >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORMethod >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORMethod >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORMethod >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORMethod >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORMethod >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORMethod >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORMethod >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORMethod >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> kind [
	^ self kindOR: self currentContext
]

{ #category : #accessing }
ORMethod >> kindOR: aVersion [
	^ self privateKind versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORMethod >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORMethod >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORMethod >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORMethod >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORMethod >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORMethod >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
ORMethod >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORMethod >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #accessing }
ORMethod >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORMethod >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
ORMethod >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORMethod >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORMethod >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORMethod >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORMethod >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORMethod >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
