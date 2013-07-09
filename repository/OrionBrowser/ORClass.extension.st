Extension { #name : #ORClass }

{ #category : #'*OrionBrowser' }
ORClass >> addAttributNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddAttribute new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addMethodNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addSuperClass: newSuperClass inModel: aModelVersion [ 

	(ORActionAddInheritance new
		orionModel: aModelVersion ;
		from: self ;
		to:  newSuperClass )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ORClass >> changeSuperClassTo: newSuperClass inModel: aModelVersion [ 

	(ORActionReplaceInheritance new 
			orionModel: aModelVersion; 
			entity: self;
			from: self ;
			to: newSuperClass) 
			manualRun
]

{ #category : #'*OrionBrowser' }
ORClass >> deleteInAction: anAction [

	ORActionRemoveClass new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run. 

]

{ #category : #'*OrionBrowser' }
ORClass >> deleteInModel: aModelVersion [

	(ORActionRemoveClass new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ORClass >> moveTo: aPackage inModel: aModelVersion [

	(ORActionMoveClass new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun. 

]

{ #category : #'*OrionBrowser' }
ORClass >> renameClass: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenameClass new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]
