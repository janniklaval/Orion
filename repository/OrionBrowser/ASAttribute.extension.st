Extension { #name : #ASAttribute }

{ #category : #'*OrionBrowser' }
ASAttribute >> deleteInModel: aModelVersion [

	(ASActionRemoveAttribute new
		antaresModel: aModelVersion ;
		entity: self )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ASAttribute >> moveTo: aClass inModel: aModelVersion [

	(ASActionMoveAttribute  new
		antaresModel: aModelVersion ;
		entity: self ;
		newContainer: aClass )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ASAttribute >> renameAttribut: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionRenameAttribute new
			antaresModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
