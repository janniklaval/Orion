Trait {
	#name : #TFAMIXStructuralEntity,
	#traits : 'TFAMIXLeafEntity',
	#classTraits : 'TFAMIXLeafEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]
