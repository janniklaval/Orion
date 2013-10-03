"
An ORActionGenerator is a tool to easily create the skeleton of ORActions.

You can use it by providing a collection of OREntities: 
	ORActionGenerator new createActionsForACollectionOfOREntities: { MyOREntityClass1 . MyOREntityClass2 }

Instance Variables

"
Class {
	#name : #ORActionGenerator,
	#superclass : #Object,
	#category : #OrionGenerator
}

{ #category : #'as yet unclassified' }
ORActionGenerator >> createActionCategoryName: anOREntity [
	^ 'OrionAction-' , anOREntity superclass category.
	
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> createActionClassNameWithType: aTypeOfAction for: anOREntity [
	^ 'ORAction', aTypeOfAction , anOREntity superclass name.
	
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> createActionFor: anOREntity type: action [
	| aClass |
	aClass := (self obtainActionSuperClass: anOREntity actionType: action)
		subclass: (self createActionClassNameWithType: action for: anOREntity) asSymbol
		uses: { }
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category:( self createActionCategoryName: anOREntity).
	self generateRequiredMethods: aClass
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> createActionForORClass: anORClass [
	anORClass isOrionClass
		ifTrue: [ 
			#(#Add #Remove #Move #Rename)
				do: [ :action | 
					(self isAction: action validFor: anORClass)
						ifTrue: [ self createActionFor: anORClass type: action ] ] ]
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> createActionsForACollectionOfORClasses: aCollectionOfOREntities [
	aCollectionOfOREntities do: [ :anEntity | self createActionForORClass: anEntity ]
]

{ #category : #'as yet unclassified' }
ORActionGenerator >> generateRequiredMethods: aClass [
	aClass compile: 'run
	self shouldBeImplemented' classified: 'method execution'
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
ORActionGenerator >> obtainActionSuperClass: anOREntity actionType: anActionType [
	^ anActionType = #Add
		ifTrue: [ 
			(anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ORActionAddLink ]
				ifFalse: [ ORActionAddEntity ] ]
		ifFalse: [ Smalltalk globals at: ('ORAction' , anActionType) asSymbol ]
]
