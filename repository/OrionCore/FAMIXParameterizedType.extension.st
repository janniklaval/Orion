Extension { #name : #FAMIXParameterizedType }

{ #category : #'*OrionCore-model' }
FAMIXParameterizedType >> privateArguments [
	^ arguments
]

{ #category : #'*OrionCore-model' }
FAMIXParameterizedType >> privateArguments: aType [
	 arguments := aType
]

{ #category : #'*OrionCore-model' }
FAMIXParameterizedType >> privateParameterizableClass [
	^ parameterizableClass
]

{ #category : #'*OrionCore-model' }
FAMIXParameterizedType >> privateParameterizableClass: aParameterizableClass [
	 parameterizableClass := aParameterizableClass
]
