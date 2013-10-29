Extension { #name : #ORAccess }

{ #category : #'*OrionBrowser' }
ORAccess >> deleteInAction:  anAction [
	ORActionRemoveAccess new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; addToListOfChanges. 
]

{ #category : #'*OrionBrowser' }
ORAccess >> deleteInModel:  aModel [
	ORActionRemoveAccess new
		orionModel: aModel ;
		entity: self ;
	run; addToListOfChanges. 
	
]
