Trait {
	#name : #TFAMIXBehaviouralEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> accesses [
	^ self accessesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> accessesAS: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> declaredType [
	^ self declaredTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> declaredTypeAS: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> incomingInvocations [
	^ self incomingInvocationsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> incomingInvocationsAS: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> localVariables [
	^ self localVariablesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> localVariablesAS: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> outgoingInvocations [
	^ self outgoingInvocationsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> outgoingInvocationsAS: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> parameters [
	^ self parametersAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> parametersAS: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> signature [
	^ self signatureAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity >> signatureAS: aVersion [
	^ self privateSignature versionIn: aVersion
]
