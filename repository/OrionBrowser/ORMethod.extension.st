Extension { #name : #ORMethod }

{ #category : #'*OrionBrowser' }
ORMethod >> addAccessTo: aStructuralEntity inModel: aModelVersion [

	(ORActionAddAccess new
		orionModel: aModelVersion;
		from: self ;
		to: aStructuralEntity )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> addInvocationTo: anOrderedCollection inModel: aModelVersion [
[ 
	(ORActionAddInvocation new
		orionModel: aModelVersion;
		from: self ;
		candidates: anOrderedCollection )
	manualRun; addToListOfChanges ] 
		orBrowserExceptionsLauncherCollection: anOrderedCollection. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> addInvocationToNew: aClass withSignature: aSymbol inModel: aModelVersion [

	(ORActionAddInvocation new
		orionModel: aModelVersion;
		from: self ;
		receiver: aClass;
		signature: aSymbol )
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> addReferenceTo: aClass inModel: aModelVersion [
[ 

	(ORActionAddReference new
		orionModel: aModelVersion;
		from: self ;
		to: aClass)
	manualRun; addToListOfChanges ]
	orBrowserExceptionsLauncher: aClass. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> deleteInAction: anAction [

	ORActionRemoveMethod new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> deleteInModel: aModelVersion [

	(ORActionRemoveMethod new
		orionModel: aModelVersion ;
		entity: self ;
		yourself) 
	manualRun. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> moveTo: aClass inModel: aModelVersion [
[ 
	(ORActionMoveMethod new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aClass )
	manualRun; addToListOfChanges ] orBrowserExceptionsLauncher: aClass.
]

{ #category : #'*OrionBrowser' }
ORMethod >> rename: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenameMethod new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ORMethod >> updatePackage: aPackage inAnAction: anAction [
	ORActionMoveMethodInPackage new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		newContainer: aPackage;
		run
]
