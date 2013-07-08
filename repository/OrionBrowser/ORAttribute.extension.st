Extension { #name : #ORAttribute }

{ #category : #'*OrionBrowser' }
ORAttribute >> deleteInModel: aModelVersion [

	(ORActionRemoveAttribute new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> moveTo: aClass inModel: aModelVersion [

	(ORActionMoveAttribute  new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aClass )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> renameAttribut: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenameAttribute new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
