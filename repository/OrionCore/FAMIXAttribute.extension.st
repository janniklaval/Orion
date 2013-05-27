Extension { #name : #FAMIXAttribute }

{ #category : #'*OrionCore-model' }
FAMIXAttribute >> privateHasClassScope [
	^ hasClassScope
]

{ #category : #'*OrionCore-model' }
FAMIXAttribute >> privateHasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'*OrionCore-model' }
FAMIXAttribute >> privateParentType [
	^ parentType
]

{ #category : #'*OrionCore-model' }
FAMIXAttribute >> privateParentType: aType [ 
	parentType := aType
]
