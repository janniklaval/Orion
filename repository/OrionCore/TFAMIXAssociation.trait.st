Trait {
	#name : #TFAMIXAssociation,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> next [
	^ self nextAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> nextAS: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> previous [
	^ self previousAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAssociation >> previousAS: aVersion [
	^ self privatePrevious versionIn: aVersion
]
