Class {
	#name : #ORModel,
	#superclass : #MooseModel,
	#instVars : [
		'parentModel',
		'childrenModel',
		'changes',
		'system',
		'cache'
	],
	#category : #OrionCore
}

{ #category : #'class initialization' }
ORModel class >> asMooseDescription [

	^MooseModel meta descriptionOf: MooseModel
]

{ #category : #'class initialization' }
ORModel class >> withParent: aModel [

	^ self new withParent:aModel
]

{ #category : #'adding/removing-ok' }
ORModel >> add: anElement [ 
	super add: anElement. 
	anElement versionIn: self.
	^anElement
]

{ #category : #'adding/removing-ok' }
ORModel >> addToListOfChanges: anAction [ 
	self changes add: anAction.
]

{ #category : #'changes-ok' }
ORModel >> allChanges [

	|collection current|
	collection := OrderedCollection new.
	current := self.
	
	[collection addAllFirst: current changes.
	current := current parentModel.
	current isNil] whileFalse.

	^collection
	
	
]

{ #category : #'navigation-ok' }
ORModel >> allWithType: aMetaDesription [ 
	|try|
	try := ORConverter mapping at: aMetaDesription ifAbsent:[aMetaDesription].
	^ 
			MooseGroup 
				withAll: (self entityStorage selectAllWithType: try)
				withDescription: 'All ' , try name asLowercase
]

{ #category : #'navigation-ok' }
ORModel >> at: anID [

	^self entityStorage at:anID.
]

{ #category : #'accessing-ok' }
ORModel >> baseName [
	|op|
	op := 1.
	^self name copyFrom: 1 to: ((self name indexOf:$_ ifAbsent:[op := 0.self name size]) - op)
]

{ #category : #'accessing-ok' }
ORModel >> cache [
	^ cache
]

{ #category : #'accessing-ok' }
ORModel >> cache: anObject [
	cache := anObject
]

{ #category : #'accessing-ok' }
ORModel >> changes [
	^ changes
]

{ #category : #'accessing-ok' }
ORModel >> changes: anObject [
	changes := anObject
]

{ #category : #'accessing-ok' }
ORModel >> childrenModel [
	^ childrenModel
]

{ #category : #'accessing-ok' }
ORModel >> childrenModel: anObject [
	childrenModel := anObject
]

{ #category : #'testing-ok' }
ORModel >> contains: anElement [
	^ anElement orionModel = self.
]

{ #category : #'creating-ok' }
ORModel >> createEntityFrom: anEntity [ 
	| newEntity |
	self remove: anEntity.
	
	
	newEntity := anEntity shallowCopy.
	newEntity privateState: (ORDefaultState with: newEntity).
	newEntity orionModel: self.
	
	^ newEntity
]

{ #category : #'creating-ok' }
ORModel >> createNewChildVersion [
	|newModel|
	newModel := ORModel withParent: self.
	
	newModel name: (self baseName, '_', Date current yyyymmdd, '_', Time current print24).
	^newModel
]

{ #category : #'initialize-release-ok' }
ORModel >> defaultStateClass [ 
	"Answer the default implementator of this element's state." 
	 
	^ORDefaultState
]

{ #category : #'adding/removing-ok' }
ORModel >> delete [
	"remove the version and all its children"
	
	self childrenModel do:[:each | each remove].
	
	self parentModel ifNotNil:[
		self parentModel childrenModel remove: self].
	self = self system sourceModel ifTrue:[
		ORSystem remove: self system
	].
	self system orionModels remove: self.
	
	"ORContext currentModel = self ifTrue:[ORContext currentModel: self parentModel]."
	^ self
]

{ #category : #'adding/removing-ok' }
ORModel >> error [

	Transcript show: 'should not be there'
]

{ #category : #'initialize-release-ok' }
ORModel >> initialize [ 
	super initialize.
	childrenModel := OrderedCollection new.
	changes := OrderedCollection new. 
	storage := ORStorage new.
	storage model: self.
	state currentContext: self.
]

{ #category : #'testing-ok' }
ORModel >> isModifiable [
	^ self childrenModel isEmpty and: [ self ~= self system sourceModel ]
]

{ #category : #'as yet unclassified' }
ORModel >> mooseInterestingEntity [ 
	"-- interestingEntity is called before UI actions, hence we optimize for runtime --" 
	
	self entityStorage. 
	^ self
]

{ #category : #'accessing-ok' }
ORModel >> parentModel [
	^ parentModel
]

{ #category : #'accessing-ok' }
ORModel >> parentModel: anObject [
	parentModel := anObject
]

{ #category : #'creating-ok' }
ORModel >> populateModel [
	
	self sourceLanguage: self parentModel sourceLanguage.
	self parentModel entityStorage do: [:anElement |
		self entityStorage add: anElement
		].
]

{ #category : #'adding/removing-ok' }
ORModel >> remove [

	^self delete
]

{ #category : #'adding/removing-ok' }
ORModel >> remove: anElement [
	"remove an entity in the version"
	
	^self entityStorage remove:anElement ifAbsent:[self error.]
]

{ #category : #'creating-ok' }
ORModel >> retrieveEntity: anEntity [
	^(self contains: anEntity) 
		ifTrue:[anEntity]
		ifFalse:[
			|old new|
			old := (self at: anEntity orionID). 
			new := self createEntityFrom: old.
			new].
]

{ #category : #'accessing-ok' }
ORModel >> system [
	^ system
]

{ #category : #'accessing-ok' }
ORModel >> system: anObject [

	system := anObject.
	anObject orionModels add: self.
	"ORContext currentModel: self."
]

{ #category : #'creating-ok' }
ORModel >> withParent: aModel [
	self parentModel: aModel.
	aModel childrenModel add: self.
	self system: aModel system.
	self populateModel.
	^ self
]
