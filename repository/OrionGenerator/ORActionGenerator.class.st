"
An ORActionGenerator is a tool to easily create the skeleton of ORActions.

You can use it by providing a collection of OREntities: 
	ORActionGenerator new createActionsForACollectionOfORClasses: { MyOREntityClass1 . MyOREntityClass2 }

Look at the class side method for actual usage.

"
Class {
	#name : #ORActionGenerator,
	#superclass : #Object,
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
	^ 'ORAction', aTypeOfAction , anOREntity superclass name.
	
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
ORActionGenerator >> createGetterFor: aString on: aClass [
	aClass compile: aString , String cr , String tab , '^ ' , aString classified: #'accessing - generated'
]

{ #category : #'creating method' }
ORActionGenerator >> createSetterFor: aString on: aClass [
	aClass compile: aString asMutator , ' aValue' , String cr , String tab , aString , ' := aValue' classified: #'accessing - generated'
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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
ORActionGenerator >> generateGettersAndSettersFrom: aFM3MetaDescription on: aClass [
	| notDerivedAttributes selector |
	notDerivedAttributes := aFM3MetaDescription allAttributes reject: #isDerived.
	notDerivedAttributes
		collect: [ :e | 
			selector := e implementingSelector.
			self addInstanceVariable: selector on: aClass.
			self createGetterFor: selector on: aClass.
			self createSetterFor: selector on: aClass ].
]

{ #category : #'as yet unclassified' }
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
	| mooseDescription stringProperties stream multivalueLinkProperties |
	"(aClass methodDict includesKey: #run)
		ifTrue: [ ^ self ]."
	mooseDescription := anOREntity mooseDescription.
	self generateGettersAndSettersFrom: mooseDescription on: aClass.
	stringProperties := self settingOfPropertiesFrom: mooseDescription.
	multivalueLinkProperties := self settingOfMultivalueLinksFrom: mooseDescription.
	stream := WriteStream on: ''.
	stream
		<<
			'run
	<generatedMethod>
	| newEntity |
	super run.
	newEntity := ';
		<< anOREntity name;
		<< ' new.';
		cr.
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream
				<< 'newEntity name: self newName.';
				cr ].
	stream
		tab;
		<< 'self orionModel add: newEntity.';
		cr.
	stream
		tab;
		<< '"Set primitive not derived properties of the entity"';
		cr.
	stringProperties
		do: [ :propertiesSettingString | 
			stream
				<< propertiesSettingString;
				cr ].
	stream
		tab;
		<< '"Set complex not derived properties of the entity"';
		cr.
	multivalueLinkProperties do: [ :propertiesSettingString | stream << propertiesSettingString ] separatedBy: [ stream cr ].
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream
				<< 'newAttribute resetMooseName.';
				cr ].
	stream
		tab;
		<< 'entity := newEntity.';
		cr;
		tab;
		<< '^ entity'.
	stream contents.
	aClass compile: stream contents classified: 'method execution - generated'
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
		ifTrue: [ 
			(anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ORActionAddLink ]
				ifFalse: [ ORActionAddEntity ] ]
		ifFalse: [ Smalltalk globals at: ('ORAction' , anActionType) asSymbol ]
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> settingOfMultivalueLinksFrom: aFM3MetaDescription [
	^ aFM3MetaDescription allComplexAttributesNotDerived
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
ORActionGenerator >> settingOfPropertiesFrom: aFM3MetaDescription [
	| getter setter result |
	result := aFM3MetaDescription allPrimitiveAttributesNotDerived
		collect: [ :propertyNotDerived | 
			getter := propertyNotDerived implementingSelector.
			setter := ('private' , propertyNotDerived implementingSelector capitalized) asSymbol asMutator.
			String tab, 'newEntity ' , setter , ' self ' , getter , ' orionCopy.'  ].
	^ result
]
