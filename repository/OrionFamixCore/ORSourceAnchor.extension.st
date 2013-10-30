Extension { #name : #ORSourceAnchor }

{ #category : #'*OrionCore-model' }
ORSourceAnchor >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORSourceAnchor >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
