Trait {
	#name : #TFAMIXStructuralEntity,
	#traits : 'TFAMIXLeafEntity',
	#classTraits : 'TFAMIXLeafEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> declaredType [
	^ self declaredTypeAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> declaredTypeAS: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> incomingAccesses [
	^ self incomingAccessesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> incomingAccessesAS: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]
