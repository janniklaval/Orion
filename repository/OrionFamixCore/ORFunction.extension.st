Extension { #name : #ORFunction }

{ #category : #'*OrionCore-model' }
ORFunction >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORFunction >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
