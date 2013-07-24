Extension { #name : #ORAccess }

{ #category : #'*OrionBrowser' }
ORAccess >> deleteInAction:  anAction [
	ORActionRemoveAccess new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run. 
]
