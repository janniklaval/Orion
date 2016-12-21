Extension { #name : #ORActionMove }

{ #category : #'*OrionGenerator' }
ORActionMove class >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [ 
		^ anORActionGenerator generateRequiredMethods: self forAMovedEntity: aClass
]
