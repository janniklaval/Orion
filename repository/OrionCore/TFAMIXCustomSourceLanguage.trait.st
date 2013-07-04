Trait {
	#name : #TFAMIXCustomSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXCustomSourceLanguage >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXCustomSourceLanguage >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]
