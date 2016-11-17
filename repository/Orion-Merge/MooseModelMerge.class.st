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
	#superclass : #FamixDiffAbstractPostOperator,
	#instVars : [
		'orionVersionedModel',
		'actions'
	],
	#category : #'Orion-Merge'
}

{ #category : #accessing }
MooseModelMerge >> actions [
	^ orionVersionedModel changes
]

{ #category : #adding }
MooseModelMerge >> addReferenceFrom: aFamixMethod to: aFamixClass [
	(aFamixMethod belongsTo isAnonymousClass not and: [ aFamixMethod belongsTo isInnerClass not ])
		ifTrue: [ 
			(self orionVersionedModel entityNamed: aFamixMethod mooseName)
				addReferenceTo: (self orionVersionedModel entityNamed: aFamixClass mooseName)
				inModel: self orionVersionedModel ]
]

{ #category : #adding }
MooseModelMerge >> addReferenceFrom: aFamixMethod toStub: aFamixStubClass [
	(self orionVersionedModel entityNamed: aFamixStubClass mooseName)
		ifNil: [ self addStubClass: aFamixStubClass ]
		ifNotNil: [ self addReferenceFrom: aFamixMethod to: aFamixStubClass ]
]

{ #category : #adding }
MooseModelMerge >> addStubClass: aFamixStubClass [
	(self orionVersionedModel entityNamed: aFamixStubClass container mooseName)
		ifNil: [ self addStubNamespace: aFamixStubClass container ].
		(self orionVersionedModel entityNamed: aFamixStubClass container mooseName) addClassNamed: aFamixStubClass name inModel: self orionVersionedModel.
]

{ #category : #adding }
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

{ #category : #'private-run' }
MooseModelMerge >> createAddAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfAddAccessChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity from mooseName) 
								addAccessTo: (self orionVersionedModel entityNamed: chg entity to mooseName) inModel: self orionVersionedModel.]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createAddAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAttributeChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addAttributeNamed: chg entityName
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
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

{ #category : #'private-run' }
MooseModelMerge >> createAddInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result  setOfAddInvocationChanges
		do: [ :chg | |cand|
			(chg entity candidates isEmpty)
				ifFalse: [ 
					cand := OrderedCollection new.
					(chg entity candidates) do: [:e | cand add: (self orionVersionedModel entityNamed: (e mooseName))].
					(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (cand "retrouver les versions orion de ces éléments" ) 
						inModel: self orionVersionedModel ]
				ifTrue: [(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (self orionVersionedModel entityNamed: chg entity to mooseName) 
						receiver: (self orionVersionedModel entityNamed: chg entity receiver mooseName) 
						withSignature: chg entity signature 
						inModel: self orionVersionedModel   ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createAddMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createAddMethodOfInnerClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifTrue: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createAddReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddReferenceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self orionVersionedModel addReferenceFrom: chg entity from toStub: chg entity to ]
				ifFalse: [ self orionVersionedModel addReferenceFrom: chg entity from to: chg entity to ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createAddScopingEntity [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	(self sortAddScopingEntityChanges: self result setOfAddScopingEntityChanges) do: [ :chg | 
		chg entity isPackage
			ifTrue: [ self orionVersionedModel addPackageNamed: chg entityName].
		chg entity isNamespace
			ifTrue: [ "Halt now." self orionVersionedModel addNamespaceNamed: chg entity mooseName inORNamespace: (self orionVersionedModel entityNamed: chg entity parentScope mooseName) ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createAddType [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"create class when it's not an inner class or anonymous class"

	"self changes
		do: [ :chg | 
			(chg isAddition and:[ chg isForType and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ]])
				ifTrue: [ "

	self result setOfAddClassChanges
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

{ #category : #'private-run' }
MooseModelMerge >> createMoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfMoveAttributeChanges do: [ :chg | chg entity moveTo: 
		(self orionVersionedModel entityNamed:( chg targetEntity belongsTo mooseName) ) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createMoveClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"
	self result setOfMoveClassChanges do: [ :chg | chg targetEntity parentPackage ifNil: [ chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity belongsTo mooseName)) inModel: self orionVersionedModel ] ifNotNil: [chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity parentPackage mooseName)) inModel: self orionVersionedModel] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createMoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfMoveMethodChanges
		do: [ :chg | 
			chg entity belongsTo mooseName = chg targetEntity belongsTo mooseName
				ifFalse: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity belongsTo mooseName)
						inModel: self orionVersionedModel ].
			chg entity packageScope mooseName = chg targetEntity packageScope mooseName
				ifFalse: [ 
					chg entity
						updatePackage: (self orionVersionedModel entityNamed: chg targetEntity packageScope mooseName)
						inModel: self orionVersionedModel]  ].
				
]

{ #category : #'private-run' }
MooseModelMerge >> createMoveNamespace [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"

	self result setOfMoveNamespaceChanges
		do: [ :chg | 
			chg targetEntity parentScope
				ifNotNil: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity parentScope mooseName)
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRemove [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	| coll |
	coll := OrderedCollection new.

	"The order in which the changes are added in the collection is relevant"
	coll addAll: self result setOfRemoveAccessChanges.
	coll addAll: self result setOfRemoveReferenceChanges.
	coll addAll: self result setOfRemoveAttributeChanges.
	coll addAll: self result setOfRemoveMethodChanges.
	coll addAll: self result setOfRemoveClassChanges.
	coll addAll: self result setOfRemovePackageChanges.
	coll do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRemoveAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result  setOfRemoveAccessChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createRemoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveAttributeChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createRemoveInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveInvocationChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createRemoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveMethodChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createRemoveReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveReferenceChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
MooseModelMerge >> createRename [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result  setOfRenameChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRenameAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameAttributeChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRenameClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameClassChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRenameMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameMethodChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
MooseModelMerge >> createRenamePackage [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenamePackageChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
MooseModelMerge >> createVersion [
	"create the new version of the OrionModel by successively calling all message creating ORActions"

	orionVersionedModel := self baseModel createNewChildVersion.
	self createAddScopingEntity.
	self createAddType.
	self createAddMethod.
	self createRename.
	self createAddAccess.
	self createAddInvocation.
	self createAddAttribute.
	self createAddReference.
	self createMoveClass.
	self createMoveMethod.
	
	self createRemove
]

{ #category : #initialize }
MooseModelMerge >> initialize [
	actions := OrderedCollection new
]

{ #category : #accessing }
MooseModelMerge >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #accessing }
MooseModelMerge >> orionVersionedModel: anObject [
	orionVersionedModel := anObject
]

{ #category : #accessing }
MooseModelMerge >> run [
	self createVersion.
]

{ #category : #deprecated }
MooseModelMerge >> snapshot [
	self
		deprecated: 'Use famixDiff instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot' -> '`@receiver orchestrator'.
	^ self orchestrator
]

{ #category : #deprecated }
MooseModelMerge >> snapshot: anObject [
	self
		deprecated: 'Use famixDiff: instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot: `@arg' -> '`@receiver famixDiff: `@arg'.
	^ self famixDiff: anObject
]

{ #category : #categorizing }
MooseModelMerge >> sortAddScopingEntityChanges: aCollection [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ aCollection sort: [ :a :b | a mooseName < b mooseName ].
]

{ #category : #initialize }
MooseModelMerge >> withBase: base target: target [
	"base should be an Orion modelbase
	 target should be a MooseModel"

	(base isKindOf: ORModel) should beTrue.
	(target isKindOf: MooseModel) should beTrue.
	famixDiff := FXDiff baseModel: base targetModel: target
]
