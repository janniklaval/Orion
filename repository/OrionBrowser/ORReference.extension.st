Extension { #name : #ORReference }

{ #category : #'*OrionBrowser' }
ORReference >> deleteInAction: anAction [

	ORActionRemoveReference new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; addToListOfChanges . 

]

{ #category : #'*OrionBrowser' }
ORReference >> deleteInModel:  aModelVersion [
	(ORActionRemoveReference new
		orionModel: aModelVersion;
		entity: self )
	manualRun; addToListOfChanges . 
]
