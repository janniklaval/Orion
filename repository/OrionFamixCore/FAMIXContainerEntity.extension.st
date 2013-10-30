Extension { #name : #FAMIXContainerEntity }

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateIncomingReferences [
	^ incomingReferences
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateIncomingReferences: aReference [
	 incomingReferences := aReference
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateOutgoingReferences [
	^ outgoingReferences
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateOutgoingReferences: aReference [
	 outgoingReferences := aReference
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateTypes [
	^ types
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXContainerEntity >> privateTypes: aType [
	 types := aType
]
