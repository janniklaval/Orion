Trait {
	#name : #TFAMIXTypeAlias,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXTypeAlias >> aliasedType [
	^ self aliasedTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXTypeAlias >> aliasedTypeAS: aVersion [
	^ self privateAliasedType versionIn: aVersion
]
