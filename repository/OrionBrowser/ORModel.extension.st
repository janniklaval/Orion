Extension { #name : #ORModel }

{ #category : #'*OrionBrowser' }
ORModel >> addPackageNamed: aString [

	aString notNil ifTrue: [ 
		(ORActionAddPackage new
			orionModel: self;
			newName: aString )
		manualRun; postRun ]
]
