Extension { #name : #ORInvocation }

{ #category : #'*OrionBrowser' }
ORInvocation >> deleteInModel:  aModelVersion [
	(ORActionRemoveInvocation new
		orionModel: aModelVersion;
		entity: self )
	manualRun. 

]
