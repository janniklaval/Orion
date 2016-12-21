Extension { #name : #ORActionRename }

{ #category : #'*OrionGenerator' }
ORActionRename class >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [ 
	^ anORActionGenerator generateRequiredMethods: self forARenamedEntity: aClass
]
