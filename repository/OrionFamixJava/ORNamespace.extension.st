Extension { #name : #ORNamespace }

{ #category : #'*OrionFamixJava' }
ORNamespace >> addClassNamed: aString inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				newName: aString) manualRun; postRun ]
]
