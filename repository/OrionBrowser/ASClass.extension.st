Extension { #name : #ASClass }

{ #category : #'*OrionBrowser' }
ASClass >> addAttributNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionAddAttribute new
			antaresModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ASClass >> addMethodNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionAddMethod new
			antaresModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ASClass >> addSuperClass: newSuperClass inModel: aModelVersion [ 

	(ASActionAddInheritance new
		antaresModel: aModelVersion ;
		from: self ;
		to:  newSuperClass )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASClass >> changeSuperClassTo: newSuperClass inModel: aModelVersion [ 

	(ASActionReplaceInheritance new 
			antaresModel: aModelVersion; 
			entity: self;
			from: self ;
			to: newSuperClass) 
			manualRun
]

{ #category : #'*OrionBrowser' }
ASClass >> deleteInModel: aModelVersion [

	(ASActionRemoveClass new
		antaresModel: aModelVersion ;
		entity: self )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ASClass >> moveTo: aPackage inModel: aModelVersion [

	(ASActionMoveClass new
		antaresModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ASClass >> renameClass: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionRenameClass new
			antaresModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
