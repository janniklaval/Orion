Trait {
	#name : #TFAMIXEnum,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEnum >> values [
	^ self valuesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXEnum >> valuesAS: aVersion [
	^ self privateValues versionIn: aVersion
]
