Trait {
	#name : #TFAMIXAttribute,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> hasClassScope [
	^ self hasClassScopeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> hasClassScopeOR: aVersion [
	^ self privateHasClassScope versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXAttribute >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]
