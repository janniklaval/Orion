"
A MooseModelMerge enables to create a versioned OrionModel from a diff between two models.

Instance Variables
	actions:		<Object>
	orionVersionedModel:		<Object>
	snapshot:		<Object>

actions
	- collection of ORActions

orionVersionedModel
	- versioned OrionModel

snapshot
	- snapshot associated to the base and target models

"
Class {
	#name : #MooseModelMerge,
	#superclass : #Object,
	#instVars : [
		'snapshot',
		'orionVersionedModel'
	],
	#category : #'Orion-Merge'
}

{ #category : #'instance creation' }
MooseModelMerge class >> base: base changes: changes target: target [

	^ self new
		base: base;
		changes: changes;
		target: target;
		yourself
]

{ #category : #accessing }
MooseModelMerge >> actions [
	^ orionVersionedModel changes
]

{ #category : #run }
MooseModelMerge >> addReferenceFrom: aFamixMethod to: aFamixClass [
	(aFamixMethod belongsTo isAnonymousClass not and: [ aFamixMethod belongsTo isInnerClass not ])
		ifTrue: [ 
			(self orionVersionedModel entityNamed: aFamixMethod mooseName)
				addReferenceTo: (self orionVersionedModel entityNamed: aFamixClass mooseName)
				inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> addReferenceFrom: aFamixMethod toStub: aFamixStubClass [
	(self orionVersionedModel entityNamed: aFamixStubClass mooseName)
		ifNil: [ self addStubClass: aFamixStubClass ]
		ifNotNil: [ self addReferenceFrom: aFamixMethod to: aFamixStubClass ]
]

{ #category : #run }
MooseModelMerge >> addStubClass: aFamixStubClass [
	(self orionVersionedModel entityNamed: aFamixStubClass container mooseName)
		ifNil: [ self addStubNamespace: aFamixStubClass container ].
		(self orionVersionedModel entityNamed: aFamixStubClass container mooseName) addClassNamed: aFamixStubClass name inModel: self orionVersionedModel.
]

{ #category : #run }
MooseModelMerge >> addStubNamespace: aFamixStubNamespace [
	aFamixStubNamespace parentScope
		ifNotNil: [ 
			(self orionVersionedModel entityNamed: aFamixStubNamespace parentScope mooseName)
				ifNil: [ self addStubNamespace: aFamixStubNamespace parentScope ].
			self orionVersionedModel
				addNamespaceNamed: aFamixStubNamespace name
				inORNamespace: (self orionVersionedModel entityNamed: aFamixStubNamespace parentScope mooseName) ]
		ifNil: [ self orionVersionedModel addNamespaceNamed: aFamixStubNamespace name ]
]

{ #category : #accessing }
MooseModelMerge >> changes [
	"Return a dictionary of FamixChange"
	^ snapshot changes
]

{ #category : #run }
MooseModelMerge >> createAddAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfAddAccessChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity from mooseName) 
								addAccessTo: (self orionVersionedModel entityNamed: chg entity to mooseName) inModel: self orionVersionedModel.]
	
]

{ #category : #run }
MooseModelMerge >> createAddAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfAddAttributeChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addAttributNamed: chg entityName
						inModel: self orionVersionedModel ] ]
]

{ #category : #run }
MooseModelMerge >> createAddInnerClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self changes
		do: [ :chg | 
			(chg isAddition and: [ chg isForType and: [ chg entity isInnerClass or: [ chg entity isAnonymousClass ] ]])
				ifTrue: [ 
					chg entity container
						ifNotNil: [ 
							chg entity container isType ifTrue: [ (self orionVersionedModel entityNamed: chg entity container mooseName)
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ].
							chg entity container isMethod ifTrue: [ (self orionVersionedModel entityNamed: (chg entity container name, '()'))
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ] ] ] ]
]

{ #category : #run }
MooseModelMerge >> createAddInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfAddInvocationChanges
		do: [ :chg | |cand|
			(chg entity candidates isEmpty)
				ifFalse: [ 
					cand := OrderedCollection new.
					(chg entity candidates) do: [:e | cand add: (self orionVersionedModel entityNamed: (e mooseName))].
					(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (cand "retrouver les versions orion de ces éléments" ) 
						inModel: self orionVersionedModel ]
				ifTrue: [(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationToNew: (self orionVersionedModel entityNamed: chg entity receiver mooseName) 
						withSignature: chg entity signature 
						inModel: self orionVersionedModel   ] ]
]

{ #category : #run }
MooseModelMerge >> createAddMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #run }
MooseModelMerge >> createAddMethodOfInnerClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifTrue: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #run }
MooseModelMerge >> createAddReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfAddReferenceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self addReferenceFrom: chg entity from 
						toStub: chg entity to ]
				ifFalse: [ 
					self addReferenceFrom: chg entity from 
						to: chg entity to
						] ]
]

{ #category : #run }
MooseModelMerge >> createAddScopingEntity [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	(self sortAddScopingEntityChanges: self setOfAddScopingEntityChanges) do: [ :chg | 
		chg entity isPackage
			ifTrue: [ self orionVersionedModel addPackageNamed: chg entityName].
		chg entity isNamespace
			ifTrue: [ "Halt now." self orionVersionedModel addNamespaceNamed: chg entity mooseName inORNamespace: (self orionVersionedModel entityNamed: chg entity parentScope mooseName) ] ]
]

{ #category : #run }
MooseModelMerge >> createAddType [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"create class when it's not an inner class or anonymous class"

	"self changes
		do: [ :chg | 
			(chg isAddition and:[ chg isForType and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ]])
				ifTrue: [ "

	self setOfAddClassChanges
		do: [ :chg | 
			chg entity parentPackage
				ifNotNil: [ 
					(self orionVersionedModel entityNamed: chg entity parentPackage mooseName)
						addClassNamed: chg entityName
						inModel: self orionVersionedModel ]
				ifNil: [ 
					(self orionVersionedModel entityNamed: chg entity container mooseName)
						addClassNamed: chg entityName
						inModel: self orionVersionedModel ] ]
]

{ #category : #run }
MooseModelMerge >> createMoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfMoveAttributeChanges do: [ :chg | chg entity moveTo: 
		(self orionVersionedModel entityNamed:( chg targetEntity belongsTo mooseName) ) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createMoveClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"
	self setOfMoveClassChanges do: [ :chg | chg targetEntity parentPackage ifNil: [ chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity belongsTo mooseName)) inModel: self orionVersionedModel ] ifNotNil: [chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity parentPackage mooseName)) inModel: self orionVersionedModel] ]
]

{ #category : #run }
MooseModelMerge >> createMoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self setOfMoveMethodChanges
		do: [ :chg | 
			chg entity belongsTo mooseName = chg targetEntity belongsTo mooseName
				ifFalse: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity belongsTo mooseName)
						inModel: self orionVersionedModel ].
			chg entity parentPackage mooseName = chg targetEntity parentPackage mooseName
				ifFalse: [ 
					chg entity
						updatePackage: (self orionVersionedModel entityNamed: chg targetEntity parentPackage mooseName)
						inModel: self orionVersionedModel]  ].
				
]

{ #category : #run }
MooseModelMerge >> createMoveNamespace [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"

	self setOfMoveNamespaceChanges
		do: [ :chg | 
			chg targetEntity parentScope
				ifNotNil: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity parentScope mooseName)
						inModel: self orionVersionedModel ] ]
]

{ #category : #run }
MooseModelMerge >> createRemove [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	| coll | 
	coll := OrderedCollection new.
	
	"The order in which the changes are added in the collection is relevant"
	coll addAll: self setOfRemoveAccessChanges.
	coll addAll: self setOfRemoveReferenceChanges.
	coll addAll: self setOfRemoveAttributeChanges.
	coll addAll: self setOfRemoveMethodChanges.
	coll addAll: self setOfRemoveClassChanges.
	coll addAll: self setOfRemovePackageChanges.

	coll do: [ :chg | 
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #run }
MooseModelMerge >> createRemoveAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRemoveAccessChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #run }
MooseModelMerge >> createRemoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRemoveAttributeChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #run }
MooseModelMerge >> createRemoveInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRemoveInvocationChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #run }
MooseModelMerge >> createRemoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRemoveMethodChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #run }
MooseModelMerge >> createRemoveReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRemoveReferenceChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #run }
MooseModelMerge >> createRename [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRenameChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createRenameAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRenameAttributeChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createRenameClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRenameClassChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createRenameMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRenameMethodChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createRenamePackage [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self setOfRenamePackageChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createVersion [
	"create the new version of the OrionModel by successively calling all message creating ORActions"
	snapshot diff.

	orionVersionedModel := self orionModel createNewChildVersion.
	
	self createAddScopingEntity.
	self createAddType.
	self createAddMethod.
	self createAddAccess.
	"self createAddInvocation."
	self createAddAttribute.
	self createAddReference .
	self createMoveClass.
	self createMoveMethod.
	self createRename.
	self createRemove.

]

{ #category : #initialize }
MooseModelMerge >> initialize [

	actions := OrderedCollection new.
	snapshot := nil.
]

{ #category : #accessing }
MooseModelMerge >> mooseModel [
	
	^ snapshot target
]

{ #category : #accessing }
MooseModelMerge >> orionModel [
	
	^ snapshot base
]

{ #category : #accessing }
MooseModelMerge >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #accessing }
MooseModelMerge >> orionVersionedModel: anObject [
	orionVersionedModel := anObject
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddAccessChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self snapshot assocChanges select: [ :chg |
		(chg isAddition and: [chg entity isAccess ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isAddition and: [chg entity isAttribute ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	"Only the classes that are neither inner nor anonymous classes are considered"

	^ self changes
		select: [ :chg | chg isAddition and: [ chg entity isClass and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ] ] ]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddInvocationChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self snapshot assocChanges select: [ :chg |
		(chg isAddition and: [chg entity isInvocation ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg | (chg isAddition and: [chg entity isMethod ])]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddReferenceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self snapshot assocChanges
		select: [ :chg | 
			chg isAddition
				and: [ 
					chg entity isReference
						and: [ chg entity target isClass and: [ chg entity target isInnerClass not and: [ chg entity target isAnonymousClass not ] ] ] ] ]
]

{ #category : #categorizing }
MooseModelMerge >> setOfAddScopingEntityChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isAddition and: [chg isForScopingEntity ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfMoveAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isMove and: [chg entity isAttribute ])
	] )asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfMoveClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isMove and: [chg entity isClass and: [ (chg entity isKindOf: FAMIXParameterizableClass) not ] ])
	]) asSet 
]

{ #category : #categorizing }
MooseModelMerge >> setOfMoveMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^ (self changes select: [ :chg | chg isMove and: [ chg entity isMethod ] ]) asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfMoveNamespaceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isMove and: [chg isForScopingEntity ])
	]) asSet 
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveAccessChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self snapshot assocChanges select: [ :chg |
		(chg isRemoval and: [chg entity isAccess ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isRemoval and: [chg entity isAttribute ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveChanges [
	"select the FamixChanges of the dictionnary according to their type"
	^ self changes select: [ :chg | chg isRemoval ]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isRemoval and: [chg entity isClass ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveInvocationChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self snapshot assocChanges select: [ :chg |
		(chg isRemoval and: [chg entity isInvocation ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isRemoval and: [chg entity isMethod ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemovePackageChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self changes select: [ :chg |
		(chg isRemoval and: [chg entity isPackage ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRemoveReferenceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^self snapshot assocChanges select: [ :chg |
		(chg isRemoval and: [chg entity isReference ])
	]
]

{ #category : #categorizing }
MooseModelMerge >> setOfRenameAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^ (self changes select: [ :chg | chg isRename and: [ chg entity isAttribute ] ]) asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfRenameChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^ (self changes select: [ :chg | chg isRename ]) asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfRenameClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isRename and: [chg entity isClass ])
	]) asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfRenameMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isRename and: [chg entity isMethod ])
	]) asSet
]

{ #category : #categorizing }
MooseModelMerge >> setOfRenamePackageChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	^(self changes select: [ :chg |
		(chg isRename and: [chg entity isPackage ])
	]) asSet
]

{ #category : #accessing }
MooseModelMerge >> snapshot [
	^ snapshot 
]

{ #category : #accessing }
MooseModelMerge >> snapshot: anObject [
	snapshot := anObject
]

{ #category : #categorizing }
MooseModelMerge >> sortAddScopingEntityChanges: aDictionary [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"
	| collection keys |
	collection := OrderedCollection new.
	keys := aDictionary keys.
	(keys sort: [ :a :b | a mooseName < b mooseName ]) do: [:k | collection add: (aDictionary at:k)].
	^ collection.
]

{ #category : #initialize }
MooseModelMerge >> withBase: base  target: target [
	"base should be an Orion modelbase
	 target should be a mooseModel"
	
	(base isKindOf: ORModel) should beTrue.
	(target isKindOf: MooseModel) should beTrue.

	snapshot := FamixDiff new base: base ; target: target ; yourself.
	
	^ self
]
