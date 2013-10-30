Extension { #name : #ORInheritance }

{ #category : #'*OrionCore-model' }
ORInheritance >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORInheritance >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
