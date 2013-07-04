Trait {
	#name : #TFAMIXPrimitiveType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
