Extension { #name : #FAMIXAssociation }

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privateNext [
	^ next
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privateNext: anAssociation [
	next := anAssociation
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privatePrevious [
	^ previous
]

{ #category : #'*OrionCore-model' }
FAMIXAssociation >> privatePrevious: anAssociation [ 
	previous := anAssociation
]
