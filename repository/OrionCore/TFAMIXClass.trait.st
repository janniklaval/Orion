Trait {
	#name : #TFAMIXClass,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXClass >> isInterface [
	^ self isInterfaceAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXClass >> isInterfaceAS: aVersion [
	^ self privateIsInterface versionIn: aVersion
]
