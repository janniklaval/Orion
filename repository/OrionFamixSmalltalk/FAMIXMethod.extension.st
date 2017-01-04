Extension { #name : #FAMIXMethod }

{ #category : #'*OrionFamixSmalltalk' }
FAMIXMethod >> privateCategory [
		^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'*OrionFamixSmalltalk' }
FAMIXMethod >> privateCategory: aValue [
	self privateState attributeAt: #category put: aValue
]

{ #category : #'*OrionFamixSmalltalk' }
FAMIXMethod >> privateTimeStamp [
		^ self privateState attributeAt: #timeStamp ifAbsentPut: [ nil ]
]

{ #category : #'*OrionFamixSmalltalk' }
FAMIXMethod >> privateTimeStamp: aValue [
	self privateState attributeAt: #timeStamp put: aValue
]
