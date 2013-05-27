Extension { #name : #ASReference }

{ #category : #'*OrionBrowser' }
ASReference >> deleteInModel:  aModelVersion [
	(ASActionRemoveReference new
		antaresModel: aModelVersion;
		entity: self )
	manualRun. 
]
