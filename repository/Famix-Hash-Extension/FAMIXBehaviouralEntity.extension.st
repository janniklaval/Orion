Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*Famix-Hash-Extension' }
FAMIXBehaviouralEntity >> bodyHash [
	<MSEProperty: #bodyHash type: #String>
	<MSEComment: 'The md5 checksum of the body of the content associated with the behavioural entity'>

	^ self privateState attributeAt: #bodyHash ifAbsent: [ nil ]
]

{ #category : #'*Famix-Hash-Extension' }
FAMIXBehaviouralEntity >> bodyHash: hashValue [
	^ self privateState attributeAt: #bodyHash put: hashValue
]
