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

{ #category : #'*OrionFamixJava' }
ORModel >> addReferenceFrom: aFamixMethod to: aFamixClass [
	(aFamixMethod belongsTo isAnonymousClass not and: [ aFamixMethod belongsTo isInnerClass not ])
		ifTrue: [ (self entityNamed: aFamixMethod mooseName) addReferenceTo: (self entityNamed: aFamixClass mooseName) inModel: self ]
]

{ #category : #'*OrionFamixJava' }
ORModel >> addReferenceFrom: aFAMIXMethod toStub: aFAMIXClass [
	(self entityNamed: aFAMIXClass mooseName) ifNil: [ self addStubClass: aFAMIXClass ] ifNotNil: [ self addReferenceFrom: aFAMIXMethod to: aFAMIXClass ]
]

{ #category : #'*OrionFamixJava' }
ORModel >> addStubClass: aFAMIXClass [
	(self entityNamed: aFAMIXClass container mooseName) ifNil: [ self addStubNamespace: aFAMIXClass container ].
	(self entityNamed: aFAMIXClass container mooseName) addClassNamed: aFAMIXClass name inModel: self
]

{ #category : #'*OrionFamixJava' }
ORModel >> addStubNamespace: aFAMIXNamespace [
	aFAMIXNamespace parentScope
		ifNotNil: [ :parentScope | 
			(self entityNamed: parentScope mooseName) ifNil: [ self addStubNamespace: parentScope ].
			self addNamespaceNamed: aFAMIXNamespace name inORNamespace: (self entityNamed: parentScope mooseName) ]
		ifNil: [ self addNamespaceNamed: aFAMIXNamespace name ]
]
