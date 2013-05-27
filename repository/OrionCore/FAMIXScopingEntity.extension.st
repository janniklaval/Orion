Extension { #name : #FAMIXScopingEntity }

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateChildScopes [
	^ childScopes
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateChildScopes: aCollectionOfScopingEntity [ 
	childScopes := aCollectionOfScopingEntity
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateFunctions [
	^ functions
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateFunctions: aCollectionOfFunctions [
	functions := aCollectionOfFunctions
]

{ #category : #'*OrionCore-model' }
FAMIXScopingEntity >> privateGlobalVariables [
	^globalVariables
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
FAMIXScopingEntity >> privateParentScope: aScopingEntity [ 
	parentScope := aScopingEntity
]
