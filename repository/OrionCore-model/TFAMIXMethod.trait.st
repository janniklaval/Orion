Trait {
	#name : #TFAMIXMethod,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXMethod >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> kind [
	^ self kindOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> kindOR: aVersion [
	^ self privateKind versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
