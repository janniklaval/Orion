"
An ORActionGenerator is a tool to easily create the skeleton of ORActions.

You can use it by providing a collection of OREntities: 
	ORActionGenerator new createActionsForACollectionOfORClasses: { MyOREntityClass1 . MyOREntityClass2 }

Look at the class side method for actual usage.

"
Class {
	#name : #ORActionGenerator,
	#superclass : #ORAbstractGenerator,
	#category : #OrionGenerator
}

{ #category : #running }
ORActionGenerator class >> createActionsForORClasses: aCollectionOfClasses [
	^ ORActionGenerator new
		createActionsForACollectionOfORClasses: aCollectionOfClasses
]

{ #category : #running }
ORActionGenerator class >> runOnOrionExistingClasses [

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixCore')
				classesForClassTag: 'Class')
]

{ #category : #running }
ORActionGenerator class >> runOnOrionExistingClassesForJava [

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixJava')
				classesForClassTag: 'Class')
]

{ #category : #'creating method' }
ORActionGenerator >> addInstanceVariable: aString on: aClass [
	[ aClass addInstVarNamed: aString ]
		on: DuplicatedSlotName
		do: [ "Slot already existing, just break and continue" ]
]

{ #category : #'creating method' }
ORActionGenerator >> applyGenerationOfActionsOn: aListOfProperties onBlock: block [
	| props |
	props := aListOfProperties groupedBy: #package.
	props associationsDo: block
]

{ #category : #'creating method' }
ORActionGenerator >> catNameFor: aFamePackage defaultName: normalCatName [
	^ aFamePackage
		ifNil: [ normalCatName , ' - generated' ]
		ifNotNil: [ '*OrionFamix' , aFamePackage name ]
]

{ #category : #'creating method' }
ORActionGenerator >> complexProperties: aCollectionOfProperties [
	^ aCollectionOfProperties
		select: [ :e | e isMultivalued not and: [ e opposite isMultivalued ] ]
]

{ #category : #preparation }
ORActionGenerator >> createActionCategoryName: anOREntity [
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: 'Orion'.
			($- split: anOREntity superclass category) asStringOn: stream delimiter: ''.
			stream nextPutAll: '-Action' ]
]

{ #category : #preparation }
ORActionGenerator >> createActionClassNameWithType: aTypeOfAction for: anOREntity [
	^ 'ORAction', aTypeOfAction , anOREntity mooseDescription superclass name.
	
]

{ #category : #'creating Actions' }
ORActionGenerator >> createActionFor: anOREntity type: action [
	| aClass |
	aClass := (self obtainActionSuperClass: anOREntity actionType: action)
		subclass: (self createActionClassNameWithType: action for: anOREntity) asSymbol
		uses: { }
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category:( self createActionCategoryName: anOREntity).
	self createCommentToAnORAction: aClass.
	self generateRequiredMethods: aClass for: anOREntity.
]

{ #category : #'creating Actions' }
ORActionGenerator >> createActionForORClass: anORClass [
	anORClass isOrionClass
		ifTrue: [ 
			#(#Add #Remove #Move #Rename)
				do: [ :action | 
					(self isAction: action validFor: anORClass)
						ifTrue: [ self createActionFor: anORClass type: action ] ] ]
]

{ #category : #'creating Actions' }
ORActionGenerator >> createActionsForACollectionOfORClasses: aCollectionOfOREntities [
	aCollectionOfOREntities do: [ :anEntity | self createActionForORClass: anEntity ]
]

{ #category : #preparation }
ORActionGenerator >> createCommentToAnORAction: anORAction [
	anORAction
		comment:
			(String
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'A ';
						nextPutAll: anORAction name;
						nextPutAll:
								' is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element ' ])
]

{ #category : #'creating method' }
ORActionGenerator >> createGetterFor: aString on: aClass classified: aCat [
	aClass compile: aString , String cr , String tab , '^ ' , aString classified: aCat
]

{ #category : #'creating method' }
ORActionGenerator >> createSetterFor: aString on: aClass classified: aCat [
	aClass compile: aString asMutator , ' aValue' , String cr , String tab , aString , ' := aValue' classified: aCat
]

{ #category : #'creating method' }
ORActionGenerator >> generate1To1SetterFrom: property [ 
	| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream |
				stream tab; << 'self ' ; << selector; cr.
				stream tab; tab;<< 'ifNotNil: [ | theNewEntity |'; cr.
				stream tab; tab;tab;<< 'theNewEntity := self orionModel retrieveEntity: ' ; << 'self ' ; << selector ;<<'.'; cr.
				stream tab; tab;tab;<< 'newEntity private'; << selector capitalized asMutator; << ' theNewEntity orionCopy.'; cr.
				stream tab; tab;tab;<< 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' newEntity orionCopy ].'; cr.	
	]
]

{ #category : #'creating method' }
ORActionGenerator >> generate1ToNSetterFrom: property [ 
	| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream |
				stream tab; << 'self ' ; << selector; cr.
				stream tab; tab;<< 'ifNotNil: [ | theNewEntity |'; cr.
				stream tab; tab;tab;<< 'theNewEntity := self orionModel retrieveEntity: ' ; << 'self ' ; << selector ;<<'.'; cr.
				stream tab; tab;tab;<< 'newEntity private'; << selector capitalized asMutator; << ' theNewEntity orionCopy.'; cr.
				stream tab; tab;tab;<< 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized ; << ' orionCopy unsafeAdd: newEntity) ].'; cr.
	]

]

{ #category : #'creating method' }
ORActionGenerator >> generateGettersAndSettersFrom: aCollectionOfFameProperties on: aClass withPackage: aFamePackage [
	| selector |
	aCollectionOfFameProperties
		do: [ :e | 
			| cat |
			selector := e implementingSelector.
			self addInstanceVariable: selector on: aClass.
			cat := self catNameFor: aFamePackage defaultName: 'accessing'.
			self createGetterFor: selector on: aClass classified: cat.
			self createSetterFor: selector on: aClass classified: cat ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateNTo1SetterFrom: property [
| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream |
				stream tab; << 'self ' ; << selector; cr.
				stream tab; tab;<< 'ifNotNil: [ | theNewEntities |'; cr.
				stream tab; tab;tab;<< 'theNewEntities := OrderedCollection withAll: (self ' ;<< selector ; << ' collect: [:e | self orionModel retrieveEntity: e ]).'; cr.
				stream tab; tab;tab;<< 'newEntity private'; << selector capitalized asMutator; << ' theNewEntities orionCopy.'; cr.
				stream tab; tab;tab;<< 'theNewEntities do: [:e | e private'; << oppositeSelector capitalized asMutator; << ' newEntity ] ].'; cr.
	]

]

{ #category : #'creating method' }
ORActionGenerator >> generateNToNSetterFrom: property [ 
		| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream |
				stream tab; << 'self ' ; << selector; cr.
				stream tab; tab;<< 'ifNotNil: [ | theNewEntity |'; cr.
				stream tab; tab;tab;<< 'theNewEntity := self orionModel retrieveEntity: ' ; << 'self ' ; << selector ;<<'.'; cr.
				stream tab; tab;tab;<< 'newEntity private'; << oppositeSelector capitalized asMutator; << ' (newEntity private'; << oppositeSelector capitalized ; << ' orionCopy unsafeAdd: theNewEntity).'; cr.	
				stream tab; tab;tab;<< 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized ; << ' orionCopy unsafeAdd: newEntity) ].'; cr.
	]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: aClass for: anOREntity [
	aClass generateRequiredMethodsFor: anOREntity generator: self
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAMovedEntity: anOREntity [
	| stream |

	(anOREntity mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].
	stream := WriteStream on: ''.
	stream << 'run'; cr; tab; << '<generated>'; cr.
	stream tab; << '| theNewContainer theEntity |'; cr.
	stream tab; << 'theEntity := self orionModel retrieveEntity: entity.'; cr.
	stream tab; << 'theNewContainer := self orionModel retrieveEntity: newContainer.'; cr.
	anOREntity mooseDescription allContainerAttributes
		do: [ :aContainerProp | 
			"	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allContainerAttributes 
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forAMovedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]"
			stream tab; << 'entity '; << aContainerProp implementingSelector; << ' ifNotNil: ['; cr.
			stream tab; tab; << '| theOldEntity |'; cr.
			stream tab; tab; << 'theOldEntity := (self orionModel retrieveEntity: entity '; << aContainerProp implementingSelector; << ').'; cr.
			stream tab; tab; << 'theOldEntity private'; << aContainerProp opposite implementingSelector capitalized asMutator; << ' (theOldEntity private'; 
					<< aContainerProp opposite implementingSelector capitalized; << ' orionCopy orionRemove: theEntity).'; cr.
			stream tab; tab; << 'theEntity private'; << aContainerProp implementingSelector capitalized asMutator; << ' theEntity orionCopy.'; 
					cr.
			stream tab; tab; << 'theNewContainer private'; << aContainerProp opposite implementingSelector capitalized asMutator; << ' (theNewContainer private'; 
					<< aContainerProp opposite implementingSelector capitalized; << ' unsafeAdd: theEntity)'; cr.
			stream tab;<< '].'; cr ].
	stream tab; << 	'^ theEntity'.
	anAction compile: stream contents classified: 'method execution - generated'
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARemovedEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allComplexAttributesWithOpposite
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forARemovedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARemovedEntity: anOREntity withPackage: aFamePackage withProps: aCollectionOfProperties [
	| complexPropsToRemove simplePropsToRemove stream cat |
	"methodName"
	stream := WriteStream on: ''.
	complexPropsToRemove := self complexProperties: aCollectionOfProperties.
	simplePropsToRemove := aCollectionOfProperties difference: complexPropsToRemove.
	self writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: nil.
	(simplePropsToRemove select: #isMultivalued)
		do: [ :prop | 
			stream tab; << 'entity '; << prop implementingSelector asString.
			stream << ' do: [:each | each deleteInAction: self ].'; cr ].
	(simplePropsToRemove reject: #isMultivalued)
		do: [ :prop | 
			stream tab; << 'entity '; << prop implementingSelector asString.
			stream << ' ifNotNil: [ entity deleteInAction: self ].'; cr ].
	complexPropsToRemove
		do: [ :prop | 
			stream tab; << 'entity '; << prop implementingSelector asString; cr.
			stream tab; tab; << 'ifNotNil: [ |theEntity|'; cr.
			stream tab; tab; tab; << 'theEntity := self orionModel retrieveEntity: entity '; << prop implementingSelector asString; << '.'; cr.
			stream tab; tab; tab; << 'theEntity private'; << prop opposite implementingSelector asMutator capitalized; << ' (theEntity private'; << prop opposite implementingSelector capitalized; 
					<< ' orionCopy orionRemove: entity) ].'; cr ].
	aFamePackage
		ifNil: [ stream << 'self runExtendedPropertiesForEntity: entity.'.
			stream << '	self orionModel remove: entity' ].
	cat := self catNameFor: aFamePackage defaultName: 'method execution'.
	anAction compile: stream contents classified: cat
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARenamedEntity: anOREntity [
	| stream |
	(anOREntity mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].
	stream := WriteStream on: ''.
	stream << 'run'; cr.
	stream tab; << '<generated>'; cr.
	stream tab; << '| theEntity |'; cr.
	stream tab; << 'super run.'; cr.
	stream tab; << 'theEntity := (self orionModel retrieveEntity: entity).'; cr.
	stream tab; << 'theEntity name: newName.'; cr.
	stream tab; << 'entity := theEntity.'; cr.
	stream tab; << '^ entity'.
	anAction compile: stream contents classified: 'method exectution - generated'
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAnAddEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allAttributes
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forAnAddedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAnAddedEntity: anOREntity withPackage: aFamePackage withProps: listOfProperties [
	| stringProperties stream multivalueLinkProperties propsWithSetters cat |
	"(aClass methodDict includesKey: #run)
		ifTrue: [ ^ self ]."
	stream := WriteStream on: ''.
	propsWithSetters := aFamePackage ifNil: [ self selectPropertiesAmong: listOfProperties ] ifNotNil: [ self selectExtendedPropertiesAmong: listOfProperties ].
	self generateGettersAndSettersFrom: propsWithSetters on: anAction withPackage: aFamePackage.
	stringProperties := self settingOfPropertiesFrom: (propsWithSetters select: [ :e | e type isPrimitive ]).
	multivalueLinkProperties := self setLinksFrom: (propsWithSetters reject: [ :e | e type isPrimitive ]).
	self writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: 'newEntity'.
	aFamePackage
		ifNil: [ stream tab; << 'newEntity := '; << anOREntity name; << ' new.'; cr.
			stream tab; << 'self orionModel add: newEntity.'; cr ].
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream << 'newEntity name: self newName.'; cr ].
	stream tab; << '"Set primitive not derived properties of the entity"'; cr.
	stringProperties do: [ :propertiesSettingString | stream << propertiesSettingString; cr ].
	stream tab; << '"Set complex not derived properties of the entity"'; cr.
	multivalueLinkProperties do: [ :propertiesSettingString | stream << propertiesSettingString ] separatedBy: [ stream cr ].
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream << 'newEntity resetMooseName.'; cr ].
	aFamePackage
		ifNil: [ stream tab; << 'self runExtendedPropertiesForEntity: newEntity.'; cr.
			stream tab; << 'entity := newEntity.'; cr; tab; << '^ entity' ].
	cat := self catNameFor: aFamePackage defaultName: 'method execution'.
	anAction compile: stream contents classified: cat
]

{ #category : #preparation }
ORActionGenerator >> isAction: action validFor: anOREntity [
	action = #Move
		ifTrue: [ 
			(anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ^ false ] ].
	action = #Rename
		ifTrue: [ 
			(anOREntity inheritsFrom: FAMIXNamedEntity)
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #preparation }
ORActionGenerator >> obtainActionSuperClass: anOREntity actionType: anActionType [
	^ anActionType = #Add
		ifTrue: [ (anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ORActionAddLink ]
				ifFalse: [ anOREntity = OREntity
						ifFalse: [ ORActionAddEntity ]
						ifTrue: [ ORActionAdd ] ] ]
		ifFalse: [ Smalltalk globals at: ('ORAction' , anActionType) asSymbol ]
]

{ #category : #'creating method' }
ORActionGenerator >> setLinksFrom: aFM3MetaDescription [
	^ aFM3MetaDescription
		collect: [ :property | 
			| result |
			property opposite
				ifNil: [ self halt.
					nil ]
				ifNotNil: [ (property isMultivalued not and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generate1ToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generateNToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generateNTo1SetterFrom: property ].
					(property isMultivalued not and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generate1To1SetterFrom: property ].
					result ] ]
		thenSelect: #isNotNil
]

{ #category : #'creating method' }
ORActionGenerator >> settingOfPropertiesFrom: listOfProperties [

	^ listOfProperties
		collect: [ :propertyNotDerived | 
			String
				streamContents: [ :stream | 
					stream << ' self '; << propertyNotDerived implementingSelector; << ' ifNotNil: [ :e | '; cr.
					stream tab; << 'newEntity '; << ('private' , propertyNotDerived implementingSelector capitalized) asSymbol asMutator.
					stream << ' e orionCopy ].'; cr ] ]
]

{ #category : #'creating method' }
ORActionGenerator >> writeMethodHeaderOn: stream withPackage: aFamePackage [
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension'; cr; tab; << '<toRun>'; cr ].
	stream tab; << '<generatedMethod>'; cr.
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: stringOfVariables [
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension: '; << (stringOfVariables ifNil: ['anEntity']); cr.
			stream tab; << '<toRun>'; cr ].
	stream tab; << '<generatedMethod>'; cr.
	(aFamePackage isNil and: [ stringOfVariables isNotNil ])
		ifTrue: [ stream tab; << '| '; << stringOfVariables; << ' |'; cr ].
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]
]
