Trait {
	#name : #TFAMIXAssociation,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> next [
	^ self nextOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> previous [
	^ self previousOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]
