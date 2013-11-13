Extension { #name : #ORClass }

{ #category : #'*OrionFamixJava' }
ORClass >> addClassNamed: aString inModel: aModelVersion [
	aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				newName: aString) manualRun; postRun ]
]
