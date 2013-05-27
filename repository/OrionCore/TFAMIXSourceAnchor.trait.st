Trait {
	#name : #TFAMIXSourceAnchor,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourceAnchor >> element [
	^ self elementAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourceAnchor >> elementAS: aVersion [
	^ self privateElement versionIn: aVersion
]
