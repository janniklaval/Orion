Trait {
	#name : #TFAMIXSourceLanguage,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourceLanguage >> sourcedEntities [
	^ self sourcedEntitiesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXSourceLanguage >> sourcedEntitiesAS: aVersion [
	^ self privateSourcedEntities versionIn: aVersion
]
