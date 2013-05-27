Trait {
	#name : #TFAMIXParameterizedType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> arguments [
	^ self argumentsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType >> argumentsAS: aVersion [
	^ self privateArguments versionIn: aVersion
]
