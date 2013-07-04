Trait {
	#name : #TFAMIXFunction,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFunction >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
