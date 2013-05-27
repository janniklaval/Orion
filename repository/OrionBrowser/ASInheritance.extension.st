Extension { #name : #ASInheritance }

{ #category : #'*OrionBrowser' }
ASInheritance >> deleteInModel:  aModelVersion [
	(ASActionRemoveInheritance new
		antaresModel: aModelVersion;
		entity: self )
	manualRun. 

]
