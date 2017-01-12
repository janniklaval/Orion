Extension { #name : #TFAMIXStructuralEntity }

{ #category : #'*OrionFamixC' }
TFAMIXStructuralEntity >> dereferencedInvocations [
	^ self dereferencedInvocationsOR: self currentContext
]

{ #category : #'*OrionFamixC' }
TFAMIXStructuralEntity >> dereferencedInvocationsOR: aVersion [
	^ self privateDereferencedInvocations versionIn: aVersion
]
