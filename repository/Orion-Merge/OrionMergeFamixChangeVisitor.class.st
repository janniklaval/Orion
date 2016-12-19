Class {
	#name : #OrionMergeFamixChangeVisitor,
	#superclass : #FamixChangeVisitor,
	#instVars : [
		'famixAddVisitor',
		'orionVersionedModel'
	],
	#category : #'Orion-Merge'
}

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddAnnotationInstance: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAnnotationInstanceOfType: aFamixAddChange entityName
		inModel: self orionVersionedModel
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddAnnotationType: aFamixAddChange [
	(aFamixAddChange entity belongsTo
		ifNotNil: [ self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName ]
		ifNil: [ self orionVersionedModel ]) addAnnotationTypeNamed: aFamixAddChange entityName inModel: self orionVersionedModel
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddAnnotationTypeAttribute: aFamixAddChange [
	self createAddAttribute: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddAttribute: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAttributeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddClass: aFamixAddChange [
	aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddEnum: aFamixAddChange [
	self createAddClass: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddEnumValue: aFamixAddChange [ 
	self flag: 'Not yet implemented!'
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddInheritance: aFamixAddChange [
	aFamixAddChange entity to isStub
		ifTrue: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from toStub: aFamixAddChange entity to ]
		ifFalse: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from to: aFamixAddChange entity to ]
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddMethod: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addMethodNamed: aFamixAddChange entityName
		withSignature: aFamixAddChange entity signature
		inModel: self orionVersionedModel
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddNamespace: aFamixAddChange [
	self orionVersionedModel
		addNamespaceNamed: aFamixAddChange entity name
		inORNamespace: (self orionVersionedModel entityNamed: aFamixAddChange entity parentScope mooseName)
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddParameter: aFamixAddChange [ 
	self flag: 'Not yet implemented!'.
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddParameterType: aFamixAddChange [
	self flag: 'Not yet implemented!'
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddParameterizableClass: aFamixAddChange [
	self createAddClass: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddParameterizedType: aFamixAddChange [
	self createAddClass: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddPrimitiveType: aFamixAddChange [
	self flag: #'Not Implemted yet!'
]

{ #category : #initialization }
OrionMergeFamixChangeVisitor >> initialize [
	famixAddVisitor := OrionMergeFamixVisitor
		new
		changeVisitor: self;
		yourself
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> orionVersionedModel: anORModel [
	orionVersionedModel := anORModel
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitAddChange: aFamixAddChange [
	famixAddVisitor currentEntity: aFamixAddChange.
	aFamixAddChange entity accept: famixAddVisitor
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitChange: aFamixAddChange [ 
	self shouldBeImplemented.
]
