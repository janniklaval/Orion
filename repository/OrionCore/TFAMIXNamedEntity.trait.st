Trait {
	#name : #TFAMIXNamedEntity,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> annotationInstances [
	^ self annotationInstancesAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> annotationInstancesAS: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> isStub [
	^ self isStubAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> isStubAS: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> modifiers [
	^ self modifiersAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> modifiersAS: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> name [
	^ self nameAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> nameAS: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> parentPackage [
	^ self parentPackageAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> parentPackageAS: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> receivingInvocations [
	^ self receivingInvocationsAS: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXNamedEntity >> receivingInvocationsAS: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]
