Trait {
	#name : #TFAMIXParameter,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentBehaviouralEntityAS: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]
