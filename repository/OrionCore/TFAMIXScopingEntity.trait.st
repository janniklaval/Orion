Trait {
	#name : #TFAMIXScopingEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> childScopes [
	^ self childScopesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> childScopesAS: aVersion [
	^ self privateChildScopes versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> functions [
	^ self functionsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> functionsAS: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> globalVariables [
	^ self globalVariablesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> globalVariablesAS: aVersion [
	^ self privateGlobalVariables versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentScope [
	^ self parentScopeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity >> parentScopeAS: aVersion [
	^ self privateParentScope versionIn: aVersion
]
