Trait {
	#name : #TFAMIXAttribute,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> hasClassScope [
	^ self hasClassScopeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> hasClassScopeAS: aVersion [
	^ self privateHasClassScope versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> parentType [
	^ self parentTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> parentTypeAS: aVersion [
	^ self privateParentType versionIn: aVersion
]
