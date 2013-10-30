Extension { #name : #ORReference }

{ #category : #'*OrionCore-model' }
ORReference >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORReference >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
