Trait {
	#name : #TFAMIXReference,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXReference >> source [
	^ self sourceAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> sourceAS: aVersion [
	^ self privateSource versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> target [
	^ self targetAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> targetAS: aVersion [
	^ self privateTarget versionIn: aVersion
]
