Trait {
	#name : #TFAMIXInvocation,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> candidates [
	^ self candidatesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> candidatesOR: aVersion [
	^ self privateCandidates versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> next [
	^ self nextOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> previous [
	^ self previousOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiver [
	^ self receiverOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverOR: aVersion [
	^ self privateReceiver versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverSourceCode [
	^ self receiverSourceCodeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> receiverSourceCodeOR: aVersion [
	^ self privateReceiverSourceCode versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> sender [
	^ self senderOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> senderOR: aVersion [
	^ self privateSender versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXInvocation >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]
