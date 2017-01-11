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
OrionMergeFamixChangeVisitor >> createAdd: descr entity: aFamixAddChange [
	| entity changeAction |
	entity := aFamixAddChange entity.
	changeAction := ('ORActionAdd' , descr name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction manualRun; postRun
]

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
		ifNil: [ self orionVersionedModel ])
		addAnnotationTypeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel
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
	| entity descr changeAction |
	entity := aFamixAddChange entity.
	descr := entity mooseDescription.
	changeAction := ('ORActionAdd' , descr name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction manualRun; "	OLD VERSION : aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]"
			postRun
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddEnum: aFamixAddChange [
		^ self createAddType: aFamixAddChange
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
OrionMergeFamixChangeVisitor >> createAddLocalVariable: aFamixAddChange [ 
	self flag: 'Not yet implemented!'
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
		^ self createAddType: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddParameterizedType: aFamixAddChange [
		^ self createAddType: aFamixAddChange
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddPrimitiveType: aFamixAddChange [
	self flag: #'Not Implemted yet!'
]

{ #category : #'as yet unclassified' }
OrionMergeFamixChangeVisitor >> createAddType: aFamixAddChange [
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
OrionMergeFamixChangeVisitor >> findEntityInOrionModel: entity [
	entity mooseName = #noname
		ifTrue: [ self halt ].
	^ self orionVersionedModel entityNamed: entity mooseName
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

{ #category : #initialization }
OrionMergeFamixChangeVisitor >> setProperty: aFM3PropertyDescription from: aMooseEntity to: anActionClass [
	| selector fromEntityResult result |
	selector := aFM3PropertyDescription implementingSelector.
	fromEntityResult := aMooseEntity perform: selector.
	fromEntityResult ifNil: [ ^ self ].
	result := fromEntityResult.
	aFM3PropertyDescription type isPrimitive
		ifFalse: [ aFM3PropertyDescription isMultivalued
				ifTrue: [ result := fromEntityResult collect: [ :e | self findEntityInOrionModel: e ] ]
				ifFalse: [ result := self findEntityInOrionModel: fromEntityResult ] ].
	[ anActionClass perform: selector asMutator with: result ] on: MessageNotUnderstood do: [ :e | Transcript logCr: e printString ].
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
