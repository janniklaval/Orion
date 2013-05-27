Trait {
	#name : #TFAMIXSourceTextAnchor,
	#traits : 'TFAMIXSourceAnchor',
	#classTraits : 'TFAMIXSourceAnchor classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourceTextAnchor >> source [
	^ self sourceAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourceTextAnchor >> sourceAS: aVersion [
	^ self privateSource versionIn: aVersion
]
