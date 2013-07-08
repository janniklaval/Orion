Extension { #name : #ORPackage }

{ #category : #'*OrionBrowser' }
ORPackage >> addClassNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddClass new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ORPackage >> deleteInModel: aModelVersion [

	(ORActionRemovePackage new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ORPackage >> mergePackage: aPackage inModel: aModelVersion [

	(ORActionMergePackage  new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ORPackage >> renamePackage: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenamePackage new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
