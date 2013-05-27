Trait {
	#name : #TFAMIXMethod,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXMethod >> kind [
	^ self kindAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> kindAS: aVersion [
	^ self privateKind versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parentType [
	^ self parentTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXMethod >> parentTypeAS: aVersion [
	^ self privateParentType versionIn: aVersion
]
