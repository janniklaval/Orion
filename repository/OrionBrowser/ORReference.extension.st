Extension { #name : #ORReference }

{ #category : #'*OrionBrowser' }
ORReference >> deleteInModel:  aModelVersion [
	(ORActionRemoveReference new
		orionModel: aModelVersion;
		entity: self )
	manualRun. 
]
