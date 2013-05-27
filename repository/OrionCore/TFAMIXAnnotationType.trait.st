Trait {
	#name : #TFAMIXAnnotationType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> instances [
	^ self instancesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> instancesAS: aVersion [
	^ self privateinstances versionIn: aVersion
]
