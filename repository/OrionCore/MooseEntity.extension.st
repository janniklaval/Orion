Extension { #name : #MooseEntity }

{ #category : #'*OrionCore' }
MooseEntity >> isModel [
	^ false
]

{ #category : #'*OrionCore' }
MooseEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]
