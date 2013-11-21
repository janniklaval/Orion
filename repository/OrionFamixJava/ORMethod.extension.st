Extension { #name : #ORMethod }

{ #category : #'*OrionFamixJava' }
ORMethod >> addClassNamed: aString inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				newName: aString) manualRun; postRun ]
]
