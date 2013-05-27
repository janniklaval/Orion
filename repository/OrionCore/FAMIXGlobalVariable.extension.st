Extension { #name : #FAMIXGlobalVariable }

{ #category : #'*OrionCore-model' }
FAMIXGlobalVariable >> privateParentScope [
	^ parentScope
]

{ #category : #'*OrionCore-model' }
FAMIXGlobalVariable >> privateParentScope: aScopingEntity [ 
	parentScope := aScopingEntity
]
