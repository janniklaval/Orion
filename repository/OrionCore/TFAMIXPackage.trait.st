Trait {
	#name : #TFAMIXPackage,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPackage >> childNamedEntities [
	^ self childNamedEntitiesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> childNamedEntitiesAS: aVersion [
	^ self privateChildNamedEntities versionIn: aVersion
]
