Extension { #name : #FAMIXAssociation }

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privateNext [
	^ next
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privateNext: aAssociation [
	 next := aAssociation
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privatePrevious [
	^ previous
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privatePrevious: aAssociation [
	 previous := aAssociation
]
