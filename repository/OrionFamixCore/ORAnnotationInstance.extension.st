Extension { #name : #ORAnnotationInstance }

{ #category : #'*OrionCore-model' }
ORAnnotationInstance >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORAnnotationInstance >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
