Extension { #name : #ORComment }

{ #category : #'*OrionCore-model' }
ORComment >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORComment >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
