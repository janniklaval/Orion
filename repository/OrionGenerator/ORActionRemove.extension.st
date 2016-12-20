Extension { #name : #ORActionRemove }

{ #category : #'*OrionGenerator' }
ORActionRemove class >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [
	^ anORActionGenerator generateRequiredMethods: self forARemovedEntity: aClass
]
