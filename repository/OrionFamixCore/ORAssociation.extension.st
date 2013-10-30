Extension { #name : #ORAssociation }

{ #category : #'*OrionCore-model' }
ORAssociation >> isOrionEntity [
	^ true
]

{ #category : #'*OrionCore-model' }
ORAssociation >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
