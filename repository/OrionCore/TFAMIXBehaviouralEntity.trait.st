Trait {
	#name : #TFAMIXBehaviouralEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]
