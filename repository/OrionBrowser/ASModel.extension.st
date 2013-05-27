Extension { #name : #ASModel }

{ #category : #'*OrionBrowser' }
ASModel >> addPackageNamed: aString [

	aString notNil ifTrue: [ 
		(ASActionAddPackage new
			antaresModel: self;
			newName: aString )
		manualRun ]
]
