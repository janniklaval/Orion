Trait {
	#name : #TFAMIXParameter,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : #'OrionCore-model-trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameter >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> name [
	^ self nameOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentBehaviouralEntity [
	^ self parentBehaviouralEntityOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentBehaviouralEntityOR: aVersion [
	^ self privateParentBehaviouralEntity versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #'as yet unclassified' }
TFAMIXParameter >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]
