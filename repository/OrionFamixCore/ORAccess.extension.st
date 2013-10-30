Extension { #name : #ORAccess }

{ #category : #'*OrionCore-model' }
ORAccess >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORAccess >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
