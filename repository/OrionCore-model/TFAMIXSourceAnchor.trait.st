Trait {
	#name : #TFAMIXSourceAnchor,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourceAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourceAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]
