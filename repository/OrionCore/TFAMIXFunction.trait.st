Trait {
	#name : #TFAMIXFunction,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parentScope [
	^ self parentScopeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXFunction >> parentScopeAS: aVersion [
	^ self privateParentScope versionIn: aVersion
]
