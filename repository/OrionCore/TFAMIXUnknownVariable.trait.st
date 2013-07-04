Trait {
	#name : #TFAMIXUnknownVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXUnknownVariable >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]
