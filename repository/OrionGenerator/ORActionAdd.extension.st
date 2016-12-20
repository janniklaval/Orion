Extension { #name : #ORActionAdd }

{ #category : #'*OrionGenerator' }
ORActionAdd class >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [
	^ anORActionGenerator generateRequiredMethods: self forAnAddEntity: aClass
]
