Extension { #name : #FAMIXClass }

{ #category : #'*OrionFamixJava' }
FAMIXClass >> privateExceptions [
	^ self privateState attributeAt: #exceptions
]

{ #category : #'*OrionFamixJava' }
FAMIXClass >> privateExceptions: aValue [
	self privateState attributeAt: #exceptions put: aValue
]
