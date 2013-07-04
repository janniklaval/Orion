Trait {
	#name : #TFAMIXPackage,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPackage >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> childNamedEntities [
	^ self childNamedEntitiesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> childNamedEntitiesOR: aVersion [
	^ self privateChildNamedEntities versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> types [
	^ self typesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXPackage >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
