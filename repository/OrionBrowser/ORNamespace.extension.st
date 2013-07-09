Extension { #name : #ORNamespace }

{ #category : #'*OrionBrowser' }
ORNamespace >> deleteInAction: anAction [

	ORActionRemoveNamespace  new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run. 
]
