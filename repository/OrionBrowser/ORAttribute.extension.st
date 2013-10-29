Extension { #name : #ORAttribute }

{ #category : #'*OrionBrowser' }
ORAttribute >> deleteInAction: anAction [

	ORActionRemoveAttribute new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; addToListOfChanges. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> deleteInModel: aModelVersion [

	(ORActionRemoveAttribute new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; addToListOfChanges. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> moveTo: aClass inModel: aModelVersion [
[ 
	(ORActionMoveAttribute  new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aClass )
	manualRun; addToListOfChanges ]
		orBrowserExceptionsLauncher: aClass.

]

{ #category : #'*OrionBrowser' }
ORAttribute >> rename: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenameAttribute new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; addToListOfChanges ]
]
