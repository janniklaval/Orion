Trait {
	#name : #TFAMIXInvocation,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> candidates [
	^ self candidatesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> candidatesAS: aVersion [
	^ self privateCandidates versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiver [
	^ self receiverAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverAS: aVersion [
	^ self privateReceiver versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverSourceCode [
	^ self receiverSourceCodeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverSourceCodeAS: aVersion [
	^ self privateReceiverSourceCode versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> sender [
	^ self senderAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> senderAS: aVersion [
	^ self privateSender versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> signature [
	^ self signatureAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> signatureAS: aVersion [
	^ self privateSignature versionIn: aVersion
]
