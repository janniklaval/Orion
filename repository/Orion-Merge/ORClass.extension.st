Extension { #name : #ORClass }

{ #category : #'*Orion-Merge' }
ORClass >> addMethodNamed: aString withSignature: aSignature inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString ;
			signature: aSignature)
		manualRun; postRun ]
]
