Extension { #name : #ASMethod }

{ #category : #'*OrionBrowser' }
ASMethod >> addInvocationTo: aMethod inModel: aModelVersion [

	(ASActionAddInvocation new
		antaresModel: aModelVersion;
		from: self ;
		to: aMethod)
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASMethod >> addReferenceTo: aClass inModel: aModelVersion [

	(ASActionAddReference new
		antaresModel: aModelVersion;
		from: self ;
		to: aClass )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASMethod >> deleteInModel: aModelVersion [

	(ASActionRemoveMethod new
		antaresModel: aModelVersion ;
		entity: self )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASMethod >> moveTo: aClass inModel: aModelVersion [

	(ASActionMoveMethod new
		antaresModel: aModelVersion ;
		entity: self ;
		newContainer: aClass )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ASMethod >> renameMethod: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ASActionRenameMethod new
			antaresModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
