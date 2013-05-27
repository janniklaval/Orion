Extension { #name : #FAMIXFunction }

{ #category : #'*OrionCore-model' }
FAMIXFunction >> privateParentScope [

	^ parentScope
]

{ #category : #'*OrionCore-model' }
FAMIXFunction >> privateParentScope: aScopingEntity [ 
	parentScope := aScopingEntity
]
