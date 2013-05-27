Trait {
	#name : #TFAMIXCustomSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXCustomSourceLanguage >> name [
	^ self nameAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXCustomSourceLanguage >> nameAS: aVersion [
	^ self privateName versionIn: aVersion
]
