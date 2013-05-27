Trait {
	#name : #TFAMIXException,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXException >> definingMethod [
	^ self definingMethodAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXException >> definingMethodAS: aVersion [
	^ self privateDefiningMethod versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXException >> exceptionClass [
	^ self exceptionClassAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXException >> exceptionClassAS: aVersion [
	^ self privateExceptionClass versionIn: aVersion
]
