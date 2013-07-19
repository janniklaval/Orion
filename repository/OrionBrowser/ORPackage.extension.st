Extension { #name : #ORPackage }

{ #category : #'*OrionBrowser' }
ORPackage >> addClassNamed: aString inModel: aModelVersion [

	self addClassNamed: aString  withNamespace: aModelVersion allNamespaces first  inModel: aModelVersion.
]

{ #category : #'*OrionBrowser' }
ORPackage >> addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion [

	aString  ifNotNil: [ 
		((ORActionAddClass new
			orionModel: aModelVersion ;
			parent: self ;
			container: aNamespace ;
			newName: aString )
		manualRun)  ]
]

{ #category : #'*OrionBrowser' }
ORPackage >> deleteInAction: anAction [

	ORActionRemovePackageOnly new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run. 
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
ORPackage >> rename: aString inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionRenamePackage new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun ]
]

{ #category : #'*OrionBrowser' }
ORPackage >> unsafeDeleteInModel: aModelVersion [

	(ORActionRemovePackageOnly new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 
]
