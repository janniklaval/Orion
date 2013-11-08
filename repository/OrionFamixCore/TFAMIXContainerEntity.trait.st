"
A TFAMIXContainerEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXContainerEntity,
	#traits : 'TFAMIXNamedEntity',
	#classTraits : 'TFAMIXNamedEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXContainerEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXContainerEntity >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXContainerEntity >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXContainerEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXContainerEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXContainerEntity >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXContainerEntity >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
