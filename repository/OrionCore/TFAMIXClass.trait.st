Trait {
	#name : #TFAMIXClass,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXClass >> isInterface [
	^ self isInterfaceOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXClass >> isInterfaceOR: aVersion [
	^ self privateIsInterface versionIn: aVersion
]
