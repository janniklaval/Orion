Trait {
	#name : #TFAMIXContainerEntity,
	#traits : 'TFAMIXNamedEntity',
	#classTraits : 'TFAMIXNamedEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> incomingReferences [
	^ self incomingReferencesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> incomingReferencesAS: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> outgoingReferences [
	^ self outgoingReferencesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> outgoingReferencesAS: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> types [
	^ self typesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity >> typesAS: aVersion [
	^ self privateTypes versionIn: aVersion
]
