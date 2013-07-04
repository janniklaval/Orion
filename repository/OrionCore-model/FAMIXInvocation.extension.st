Extension { #name : #FAMIXInvocation }

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateCandidates [
	^ candidates
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateCandidates: aBehaviouralEntity [
	 candidates := aBehaviouralEntity
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateReceiver [
	^ receiver
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateReceiver: aNamedEntity [
	 receiver := aNamedEntity
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateReceiverSourceCode [
	^ receiverSourceCode
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateReceiverSourceCode: aString [
	 receiverSourceCode := aString
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateSender [
	^ sender
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateSender: aBehaviouralEntity [
	 sender := aBehaviouralEntity
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateSignature [
	^ signature
]

{ #category : #'*OrionCore-model' }
FAMIXInvocation >> privateSignature: aString [
	 signature := aString
]
