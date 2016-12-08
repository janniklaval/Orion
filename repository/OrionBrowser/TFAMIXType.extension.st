Extension { #name : #TFAMIXType }

{ #category : #'*OrionBrowser' }
TFAMIXType >> addMethodNamed: aString withSignature: aSignature inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			container: self ;
			newName: aString ;
			signature: aSignature)
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
TFAMIXType >> addMethodNamed: aString withSignature: aSignature withBodyHash: anHash inModel: aModelVersion [
	Halt
		if: [ self mooseName= 'org::infinitest::QueueAggregator::AggregatingQueueListener' ].
	aString
		ifNotNil: [ (ORActionAddMethodWithBodyHash new
				orionModel: aModelVersion;
				container: self;
				newName: aString;
				bodyHash: anHash;
				signature: aSignature)
				manualRun;
				postRun ]
]
