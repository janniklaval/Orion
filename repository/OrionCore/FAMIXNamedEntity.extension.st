Extension { #name : #FAMIXNamedEntity }

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateAnnotationInstances [
	^ annotationInstances
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateAnnotationInstances: aAnnotationInstance [
	 annotationInstances := aAnnotationInstance
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateIsStub [
	^ isStub
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateIsStub: aBoolean [
	 isStub := aBoolean
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateModifiers [
	^ modifiers
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateModifiers: aString [
	 modifiers := aString
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateName [
	^ name
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateName: aString [
	 name := aString
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateParentPackage [
	^ parentPackage
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateParentPackage: aPackage [
	 parentPackage := aPackage
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateReceivingInvocations [
	^ receivingInvocations
]

{ #category : #'*OrionCore-model' }
FAMIXNamedEntity >> privateReceivingInvocations: aInvocation [
	 receivingInvocations := aInvocation
]
