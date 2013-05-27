Trait {
	#name : #TFAMIXGlobalVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXGlobalVariable >> parentScope [
	^ self parentScopeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXGlobalVariable >> parentScopeAS: aVersion [
	^ self privateParentScope versionIn: aVersion
]
