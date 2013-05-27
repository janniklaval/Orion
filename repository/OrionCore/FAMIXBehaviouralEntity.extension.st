Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateAccesses [
	^ accesses
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateAccesses: anAccess [ 
	accesses := anAccess
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateDeclaredType [
	^ declaredType
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateDeclaredType: aType [
	declaredType :=  aType
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateIncomingInvocations [
	^incomingInvocations
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateIncomingInvocations: anInvocation [
	incomingInvocations := anInvocation
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateLocalVariables [

	^localVariables
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateLocalVariables: aLocalVariable [
	localVariables := aLocalVariable
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateOutgoingInvocations [
	^outgoingInvocations
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateOutgoingInvocations: outgoing [
	outgoingInvocations := outgoing
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateParameters [

	^parameters
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateParameters: param [
	parameters := param
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateSignature [
	^signature
]

{ #category : #'*OrionCore-model' }
FAMIXBehaviouralEntity >> privateSignature: aString [

	signature := aString
]
