Extension { #name : #FAMIXException }

{ #category : #'*OrionCore-model' }
FAMIXException >> privateDefiningMethod [
	^ definingMethod
]

{ #category : #'*OrionCore-model' }
FAMIXException >> privateDefiningMethod: anObject [
	definingMethod := anObject
]

{ #category : #'*OrionCore-model' }
FAMIXException >> privateExceptionClass [
	^ exceptionClass
]

{ #category : #'*OrionCore-model' }
FAMIXException >> privateExceptionClass: anObject [
	exceptionClass := anObject
]
