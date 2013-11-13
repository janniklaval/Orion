Extension { #name : #ORNamespace }

{ #category : #'*OrionFamixJava' }
ORNamespace >> addClassNamed: aString inModel: aModelVersion [
	aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				newName: aString) manualRun; postRun ]
]

{ #category : #'*OrionFamixJava' }
ORNamespace >> moveTo: aNamespace inModel: aModelVersion [
	
	(ORActionMoveNamespace new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aNamespace )
	manualRun;
	postRun
]
