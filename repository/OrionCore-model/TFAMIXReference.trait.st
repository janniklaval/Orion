Trait {
	#name : #TFAMIXReference,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXReference >> next [
	^ self nextOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> previous [
	^ self previousOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> source [
	^ self sourceOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> sourceOR: aVersion [
	^ self privateSource versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> target [
	^ self targetOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXReference >> targetOR: aVersion [
	^ self privateTarget versionIn: aVersion
]
