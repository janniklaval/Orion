Extension { #name : #FAMIXContainerEntity }

{ #category : #'*OrionFamixJava' }
FAMIXContainerEntity >> privateDefinedAnnotationTypes [
	^ self privateState attributeAt: #definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
FAMIXContainerEntity >> privateDefinedAnnotationTypes: aValue [
	self privateState attributeAt: #definedAnnotationTypes put: aValue
]
