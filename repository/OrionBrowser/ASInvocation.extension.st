Extension { #name : #ASInvocation }

{ #category : #'*OrionBrowser' }
ASInvocation >> deleteInModel:  aModelVersion [
	(ASActionRemoveInvocation new
		antaresModel: aModelVersion;
		entity: self )
	manualRun. 

]
