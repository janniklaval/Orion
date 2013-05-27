Trait {
	#name : #TFAMIXEnumValue,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEnumValue >> parentEnum [
	^ self parentEnumAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXEnumValue >> parentEnumAS: aVersion [
	^ self privateParentEnum versionIn: aVersion
]
