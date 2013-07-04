Extension { #name : #FAMIXGlobalVariable }

{ #category : #'*OrionCore-model' }
FAMIXGlobalVariable >> privateParentScope [
	^ parentScope
]

{ #category : #'*OrionCore-model' }
FAMIXGlobalVariable >> privateParentScope: aFunction [
	 parentScope := aFunction
]
