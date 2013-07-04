Extension { #name : #FAMIXScopingEntity }

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateChildScopes [
	^ childScopes
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateChildScopes: aScopingEntity [
	 childScopes := aScopingEntity
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateFunctions [
	^ functions
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateFunctions: aFunction [
	 functions := aFunction
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateGlobalVariables [
	^ globalVariables
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateGlobalVariables: aGlobalVariable [
	 globalVariables := aGlobalVariable
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateParentScope [
	^ parentScope
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateParentScope: aFunction [
	 parentScope := aFunction
]
