Trait {
	#name : #TFAMIXGlobalVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXGlobalVariable >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXGlobalVariable >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]
