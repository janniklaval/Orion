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
	self generateRequiredMethods: aClass
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
ORActionGenerator >> generateRequiredMethods: aClass [
	aClass compile: 'run
	self shouldBeImplemented' classified: 'method execution'
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
