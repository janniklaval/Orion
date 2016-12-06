Extension { #name : #ORClass }

{ #category : #'*OrionBrowser' }
ORClass >> addAttributeNamed: aString inAction: anAction [

	aString  ifNotNil: [ 
		(ORActionAddAttribute new
			parentAction: anAction ;
			orionModel: anAction orionModel ;
			container: self ;
			newName: aString )
		run ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addAttributeNamed: aString inModel: aModelVersion [

	^aString  ifNotNil: [ 
		(ORActionAddAttribute new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addClassNamed: aString inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				newName: aString) manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addMethodNamed: aString inAction: anAction [ 

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			parentAction: anAction ;
			orionModel: anAction orionModel ;
			container: self ;
			newName: aString )
		run ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addMethodNamed: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString )
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addMethodNamed: aString withSignature: aSignature inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString ;
			signature: aSignature)
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> addSuperClass: newSuperClass inModel: aModelVersion [
	[ 
	(ORActionAddInheritance new
		orionModel: aModelVersion;
		from: self;
		to: newSuperClass) manualRun;
		postRun ]
		orBrowserExceptionsLauncher: newSuperClass.
]

{ #category : #'*OrionBrowser' }
ORClass >> changeSuperClassTo: newSuperClass inModel: aModelVersion [ 

	[(ORActionReplaceInheritance new 
			orionModel: aModelVersion; 
			entity: self;
			from: self ;
			to: newSuperClass) 
			manualRun;
			postRun ]
		orBrowserExceptionsLauncher: newSuperClass 
]

{ #category : #'*OrionBrowser' }
ORClass >> deleteInAction: anAction [

	ORActionRemoveClass new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 

]

{ #category : #'*OrionBrowser' }
ORClass >> deleteInModel: aModelVersion [
	(ORActionRemoveClass new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun
]

{ #category : #'*OrionBrowser' }
ORClass >> deleteOnlyInAction: anAction [

	^(ORActionRemoveClassOnly new
		parentAction: anAction ;
		orionModel: anAction orionModel  ;
		entity: self  )
	run. 

]

{ #category : #'*OrionBrowser' }
ORClass >> deleteOnlyInModel: aModelVersion [

	(ORActionRemoveClassOnly new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun. 

]

{ #category : #'*OrionBrowser' }
ORClass >> extractClassFromClass: aString selectedAttributes: aList inModel: aModelVersion [

"|teste|"
	"aString  ifNotNil: [ "
		( "teste :=" ORActionExtractClass new
			orionModel: aModelVersion ;
			container: self;
			entity: self;
			selectedAttributes: aList;
			newName: aString)
			 manualRun; postRun"]."
		
	"Transcript show: teste entity ."
	
]

{ #category : #'*OrionBrowser' }
ORClass >> moveTo: aPackage inModel: aModelVersion [
	
	[^(ORActionMoveClass new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun;
	postRun ]
	orBrowserExceptionsLauncher: aPackage  

]

{ #category : #'*OrionBrowser' }
ORClass >> rename: aString inModel: aModelVersion [

	^aString  ifNotNil: [ 
		(ORActionRenameClass new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORClass >> simplyMoveTo: aPackage inAction: anAction [

	^(ORActionSimplyMoveClass new
		parentAction: anAction ;
		orionModel: anAction orionModel  ;
		entity: self ;
		newContainer: aPackage )
		run. 

]
