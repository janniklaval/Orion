Extension { #name : #FAMIXAccess }

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateAccessor [
	^ accessor
]

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateAccessor: aBehaviouralEntity [
	 accessor := aBehaviouralEntity
]

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateIsWrite [
	^ isWrite
]

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateIsWrite: aBoolean [
	 isWrite := aBoolean
]

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateVariable [
	^ variable
]

{ #category : #'*OrionCore-model' }
FAMIXAccess >> privateVariable: aStructuralEntity [
	 variable := aStructuralEntity
]
