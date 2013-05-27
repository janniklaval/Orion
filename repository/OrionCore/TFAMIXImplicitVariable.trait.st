Trait {
	#name : #TFAMIXImplicitVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXImplicitVariable >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXImplicitVariable >> parentBehaviouralEntityAS: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]
