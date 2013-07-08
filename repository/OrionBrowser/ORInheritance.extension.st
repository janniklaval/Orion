Extension { #name : #ORInheritance }

{ #category : #'*OrionBrowser' }
ORInheritance >> deleteInModel:  aModelVersion [
	(ORActionRemoveInheritance new
		orionModel: aModelVersion;
		entity: self )
	manualRun. 

]
