Extension { #name : #ORModel }

{ #category : #'*OrionFamixJava' }
ORModel >> addInheritanceFrom: subclass to: superclass [
	^ (self entityNamed: subclass mooseName) addInheritanceTo: (self entityNamed: superclass mooseName) inModel: self
]

{ #category : #'*OrionFamixJava' }
ORModel >> addInheritanceFrom: subclass toStub: superclass [
	| actualClass |
	(self entityNamed: superclass mooseName)
		ifNil: [ actualClass := self addStubClass: superclass ]
		ifNotNil: [ actualClass := superclass ].
	^ (self entityNamed: subclass mooseName)
		addInheritanceTo: (self entityNamed: superclass mooseName)
		inModel: self
]

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
	| actualClass |
	(self entityNamed: aFAMIXClass mooseName)
		ifNil: [ actualClass := self addStubClass: aFAMIXClass ]
		ifNotNil: [ actualClass := aFAMIXClass ].
	^ self addReferenceFrom: aFAMIXMethod to: actualClass
]

{ #category : #'*OrionFamixJava' }
ORModel >> addStubClass: aFAMIXClass [
	(self entityNamed: aFAMIXClass container mooseName)
		ifNil: [ self addStubNamespace: aFAMIXClass container ].
	^ ((self entityNamed: aFAMIXClass container mooseName)
		addClassNamed: aFAMIXClass name
		inModel: self) entity
]

{ #category : #'*OrionFamixJava' }
ORModel >> addStubNamespace: aFAMIXNamespace [
	aFAMIXNamespace parentScope
		ifNotNil: [ :parentScope | 
			(self entityNamed: parentScope mooseName) ifNil: [ self addStubNamespace: parentScope ].
			self addNamespaceNamed: aFAMIXNamespace name inORNamespace: (self entityNamed: parentScope mooseName) ]
		ifNil: [ self addNamespaceNamed: aFAMIXNamespace name ]
]
