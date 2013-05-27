Trait {
	#name : #TFAMIXAbstractFile,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> belongsTo [
	^ self belongsToAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> belongsToAS: aVersion [
	^ self privateBelongsTo versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> entities [
	^ self entitiesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> entitiesAS: aVersion [
	^ self privateEntities versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> name [
	^ self nameAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAbstractFile >> nameAS: aVersion [
	^ self privateName versionIn: aVersion
]
