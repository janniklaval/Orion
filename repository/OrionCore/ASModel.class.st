Class {
	#name : #ASModel,
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
ASModel class >> asMooseDescription [

	^MooseModel meta descriptionOf: MooseModel
]

{ #category : #'class initialization' }
ASModel class >> withParent: aModel [

	^ self new withParent:aModel
]

{ #category : #'adding/removing-ok' }
ASModel >> add: anElement [ 
	 
	super add: anElement. 
	anElement versionIn: self.
	^anElement
]

{ #category : #'changes-ok' }
ASModel >> allChanges [

	|collection current|
	collection := OrderedCollection new.
	current := self.
	
	[collection addAllFirst: current changes.
	current := current parentModel.
	current isNil] whileFalse.

	^collection
	
	
]

{ #category : #'navigation-ok' }
ASModel >> allWithType: aMetaDesription [ 
	|try|
	try := ASConverter mapping at: aMetaDesription ifAbsent:[aMetaDesription].
	^ 
			MooseGroup 
				withAll: (self entityStorage selectAllWithType: try)
				withDescription: 'All ' , try name asLowercase
]

{ #category : #'navigation-ok' }
ASModel >> at: anID [

	^self entityStorage at:anID.
]

{ #category : #'accessing-ok' }
ASModel >> baseName [
	|op|
	op := 1.
	^self name copyFrom: 1 to: ((self name indexOf:$_ ifAbsent:[op := 0.self name size]) - op)
]

{ #category : #'accessing-ok' }
ASModel >> cache [
	^ cache
]

{ #category : #'accessing-ok' }
ASModel >> cache: anObject [
	cache := anObject
]

{ #category : #'accessing-ok' }
ASModel >> changes [
	^ changes
]

{ #category : #'accessing-ok' }
ASModel >> changes: anObject [
	changes := anObject
]

{ #category : #'accessing-ok' }
ASModel >> childrenModel [
	^ childrenModel
]

{ #category : #'accessing-ok' }
ASModel >> childrenModel: anObject [
	childrenModel := anObject
]

{ #category : #'testing-ok' }
ASModel >> contains: anElement [
	^ anElement antaresModel = self.
]

{ #category : #'creating-ok' }
ASModel >> createEntityFrom: anEntity [ 
	| newEntity |
	self remove: anEntity.
	
	
	newEntity := anEntity shallowCopy.
	newEntity privateState: (ASDefaultState with: newEntity).
	newEntity antaresModel: self.
	
	^ newEntity
]

{ #category : #'creating-ok' }
ASModel >> createNewChildVersion [
	|newModel|
	newModel := ASModel withParent: self.
	
	newModel name: (self baseName, '_', Date current yyyymmdd, '_', Time current print24).
	^newModel
]

{ #category : #'initialize-release-ok' }
ASModel >> defaultStateClass [ 
	"Answer the default implementator of this element's state." 
	 
	^ASDefaultState
]

{ #category : #'adding/removing-ok' }
ASModel >> delete [
	"remove the version and all its children"
	
	self childrenModel do:[:each | each remove].
	
	self parentModel ifNotNil:[
		self parentModel childrenModel remove: self].
	self = self system sourceModel ifTrue:[
		ASSystem remove: self system
	].
	self system antaresModels remove: self.
	
	"ASContext currentModel = self ifTrue:[ASContext currentModel: self parentModel]."
	^ self
]

{ #category : #'adding/removing-ok' }
ASModel >> error [

	Transcript show: 'should not be there'
]

{ #category : #'initialize-release-ok' }
ASModel >> initialize [ 
	super initialize.
	childrenModel := OrderedCollection new.
	changes := OrderedCollection new.
	storage := ASStorage new.
	storage model: self.
	state currentContext: self.
]

{ #category : #'testing-ok' }
ASModel >> isModifiable [

	^ self childrenModel isEmpty and:[(self = self system sourceModel) not]
]

{ #category : #'as yet unclassified' }
ASModel >> mooseInterestingEntity [ 
	"-- interestingEntity is called before UI actions, hence we optimize for runtime --" 
	
	self entityStorage. 
	^ self
]

{ #category : #'accessing-ok' }
ASModel >> parentModel [
	^ parentModel
]

{ #category : #'accessing-ok' }
ASModel >> parentModel: anObject [
	parentModel := anObject
]

{ #category : #'creating-ok' }
ASModel >> populateModel [
	
	self sourceLanguage: self parentModel sourceLanguage.
	self parentModel entityStorage do: [:anElement |
		self entityStorage add: anElement
		].
]

{ #category : #'adding/removing-ok' }
ASModel >> remove [

	^self delete
]

{ #category : #'adding/removing-ok' }
ASModel >> remove: anElement [
	"remove an entity in the version"
	
	^self entityStorage remove:anElement ifAbsent:[self error.]
]

{ #category : #'creating-ok' }
ASModel >> retrieveEntity: anEntity [
	^(self contains: anEntity) 
		ifTrue:[anEntity]
		ifFalse:[
			|old new|
			old := (self at: anEntity antaresID). 
			new := self createEntityFrom: old.
			new].
]

{ #category : #'accessing-ok' }
ASModel >> system [
	^ system
]

{ #category : #'accessing-ok' }
ASModel >> system: anObject [

	system := anObject.
	anObject antaresModels add: self.
	"ASContext currentModel: self."
]

{ #category : #'creating-ok' }
ASModel >> withParent: aModel [
	self parentModel: aModel.
	aModel childrenModel add: self.
	self system: aModel system.
	self populateModel.
	^ self
]
