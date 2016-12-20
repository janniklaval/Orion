Extension { #name : #FAMIXType }

{ #category : #'*OrionFamixJava' }
FAMIXType >> privateArgumentsInParameterizedTypes [
	^ self privateState attributeAt: #argumentsInParameterizedTypes
]

{ #category : #'*OrionFamixJava' }
FAMIXType >> privateArgumentsInParameterizedTypes: aValue [
	self privateState attributeAt: #argumentsInParameterizedTypes put: aValue
]
