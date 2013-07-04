Extension { #name : #FAMIXContainerEntity }

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateIncomingReferences [
	^ incomingReferences
]

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateIncomingReferences: aReference [
	 incomingReferences := aReference
]

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateOutgoingReferences [
	^ outgoingReferences
]

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateOutgoingReferences: aReference [
	 outgoingReferences := aReference
]

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateTypes [
	^ types
]

{ #category : #'*OrionCore-model' }
FAMIXContainerEntity >> privateTypes: aType [
	 types := aType
]
