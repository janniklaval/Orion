Trait {
	#name : #TFAMIXAnnotationType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> container [
	^ self containerOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> instances [
	^ self instancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType >> instancesOR: aVersion [
	^ self privateInstances versionIn: aVersion
]
