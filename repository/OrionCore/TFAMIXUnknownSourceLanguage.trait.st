Trait {
	#name : #TFAMIXUnknownSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXUnknownSourceLanguage >> name [
	^ self nameAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownSourceLanguage >> nameAS: aVersion [
	^ self privateName versionIn: aVersion
]
