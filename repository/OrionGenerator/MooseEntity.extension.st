Extension { #name : #MooseEntity }

{ #category : #'*OrionGenerator' }
MooseEntity class >> isRootEntity [
	^ self class = FAMIXEntity
]
