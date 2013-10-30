Extension { #name : #ORInvocation }

{ #category : #'*OrionCore-model' }
ORInvocation >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORInvocation >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
