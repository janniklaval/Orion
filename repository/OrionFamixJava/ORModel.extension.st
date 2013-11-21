Extension { #name : #ORModel }

{ #category : #'*OrionFamixJava' }
ORModel >> addNamespaceNamed: aString [

	^self addNamespaceNamed: aString inORNamespace: nil.
]

{ #category : #'*OrionFamixJava' }
ORModel >> addNamespaceNamed: aString inORNamespace: aNamespace [
	^aString ifNotNil: [ "Halt now."
			 ((ORActionAddNamespace new
				orionModel: self;
				container: aNamespace;
				newName: aString)
				manualRun;
				postRun )]
]

{ #category : #'*OrionFamixJava' }
ORModel >> addPackageNamed: aString inORPackage: aPackage [

	^self addPackageNamed: aString inORPackage: nil.
]
