Extension { #name : #ORAnnotationInstanceAttribute }

{ #category : #'*OrionCore-model' }
ORAnnotationInstanceAttribute >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORAnnotationInstanceAttribute >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
