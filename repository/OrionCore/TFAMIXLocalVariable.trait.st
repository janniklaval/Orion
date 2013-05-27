Trait {
	#name : #TFAMIXLocalVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXLocalVariable >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXLocalVariable >> parentBehaviouralEntityAS: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]
