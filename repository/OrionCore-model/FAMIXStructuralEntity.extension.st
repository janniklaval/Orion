Extension { #name : #FAMIXStructuralEntity }

{ #category : #'*OrionCore-model' }
FAMIXStructuralEntity >> privateDeclaredType [
	^ declaredType
]

{ #category : #'*OrionCore-model' }
FAMIXStructuralEntity >> privateDeclaredType: aType [
	 declaredType := aType
]

{ #category : #'*OrionCore-model' }
FAMIXStructuralEntity >> privateIncomingAccesses [
	^ incomingAccesses
]

{ #category : #'*OrionCore-model' }
FAMIXStructuralEntity >> privateIncomingAccesses: aAccess [
	 incomingAccesses := aAccess
]
