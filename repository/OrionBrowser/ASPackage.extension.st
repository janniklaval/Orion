Extension { #name : #ASPackage }

{ #category : #'*OrionBrowser' }
ASPackage >> addClassNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionAddClass new
			antaresModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ASPackage >> deleteInModel: aModelVersion [

	(ASActionRemovePackage new
		antaresModel: aModelVersion ;
		entity: self )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASPackage >> mergePackage: aPackage inModel: aModelVersion [

	(ASActionMergePackage  new
		antaresModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ASPackage >> renamePackage: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionRenamePackage new
			antaresModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
