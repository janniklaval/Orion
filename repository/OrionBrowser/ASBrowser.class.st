Class {
	#name : #ASBrowser,
	#superclass : #Object,
	#instVars : [
		'selectedVersion'
	],
	#category : #OrionBrowser
}

{ #category : #'as yet unclassified' }
ASBrowser class >> open [ 

	self new browser openOn: ASSystem root first
]

{ #category : #'as yet unclassified' }
ASBrowser >> actionsFor: each [
	|posAction elements listOfAct |

	elements :=  each selection mooseInterestingEntity.
	posAction := (((ASAction withAllSubclasses flatCollect: [:act | Pragma allNamed: #AntaresActionFor: in: act class])
					select:[:e | e arguments includes: elements class asString asSymbol]) collect:[:e | e methodClass soleInstance]) asOrderedCollection.
	listOfAct := OrderedCollection new.
	posAction do:[:ie | 
						|depend|
						depend := ie needs: elements.
						depend isNil 
							ifTrue:[
								listOfAct add:(
								(GLMAction new)
									action:[:anAct | 
										elements currentContext isModifiable ifTrue:[
											ie new entity: elements; antaresModel: elements currentContext; manualRun.
											elements currentContext system announcer announce: ASModelChanged]
										ifFalse:[
											ie new entity:elements; runOnNewVersionFrom: elements currentContext.
											elements currentContext system announcer announce: ASModelAdded
										]
									];
									title:ie description;
									yourself).]
							ifFalse:[
								depend do:[:anEl |
									listOfAct add:(
									(GLMAction new)
										action:[:anAct | 
											elements currentContext isModifiable ifTrue:[
												ie new entity:elements; to:anEl; antaresModel: elements currentContext; manualRun.
												elements currentContext system announcer announce: ASModelChanged]
											ifFalse:[
												ie new entity:elements; to:anEl; runOnNewVersionFrom: elements currentContext.
												elements currentContext system announcer announce: ASModelAdded]
										];
										title:anEl mooseName;
										category:ie description;
										yourself).]].				
				].
	^listOfAct.
]

{ #category : #'as yet unclassified' }
ASBrowser >> browser [
	"
		self new browser openOn: ASSystem root
	"
	| browser  |
	
	browser := GLMTabulator new.
	
	browser column: #models span: 1; column: [:c | c row:#versions; row: #changes] span: 1; column: #categories span: 4.
	(browser transmit) to: #models; andShow: [:b |
		b list
			format:[:system | system name];
			display: [:each | each ].
	].
	
	(browser transmit) from: #models; to: #versions; andShow: [:b | 
		b tree
			allExpanded;
			format:[:system | system name];
			display: [:each | each antaresModels select:[:om | om parentModel = nil]];
			children: [:each | each childrenModel];
			act: [:each | each selection inspect] entitled: 'inspect';
			act: [:each | |new|
				new := each selection createNewChildVersion. ASSystem announcer announce: ASModelAdded. browser announce: ASAnnouncement] entitled: 'create a child version';
			act: [:each | each selection delete. ASSystem announcer announce: ASModelRemoved. browser announce: ASAnnouncement] entitled: 'delete'.
	].
	(browser transmit) to: #changes; from: #versions; andShow: [:b |
		b list
			display: [:each | each changes];
			title: [ :each | each changes size asString, ' changes'].
	].
	(browser transmit) to: #categories; from: #versions; andShow: [:b |
		b finder
			show: [:a |
				a custom: (self groupList).
				a custom: self entityNavigation.
			].
	 ].
	browser subscribe: ASAnnouncement do: [browser update].
	^ browser
]

{ #category : #'as yet unclassified' }
ASBrowser >> displayFor: anObject [
	| entity pragmaValueAssociations |
	entity := anObject mooseInterestingEntity.
	pragmaValueAssociations := entity complexPropertyPragmas collect: [ :pragma | 
		pragma -> (anObject mooseInterestingEntity perform: pragma selector) mooseInterestingEntity ].
	^ (pragmaValueAssociations
		reject: [ :association | 
			association value isNil or: [ 
				association value isCollection and: [ 
					association value isEmpty ] ] ])
		sorted: [:a :b | 
			(a key argumentAt: 1) asLowercase asString < (b key argumentAt: 1) asLowercase asString ]
]

{ #category : #'as yet unclassified' }
ASBrowser >> entityNavigation [
	^ GLMListPresentation new
			title: 'Navigation';
			display: [ :anObject | |entity |
				entity := anObject mooseInterestingEntity.
				(entity mooseInterestingEntity isKindOf: FAMIXEntity) ifFalse:[self selectedVersion: entity] ifTrue:[entity currentContext: self selectedVersion.].
				self displayFor: entity value.
			];
			when: [:input | input mooseInterestingEntity isCollection not or: [input mooseInterestingEntity isKindOf: MooseModel] ];
			dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ].
]

{ #category : #'as yet unclassified' }
ASBrowser >> groupList [
	^ GLMListPresentation new
			beMultiple;
			showOnly: 50;
			display: [:e | e mooseInterestingEntity];
			send: [:each | each isNil ifTrue: [nil] ifFalse: [each asMooseGroup]];
			format: #mooseName;
			title: [ :each | each mooseInterestingEntity size asString, ' items'];
			when: [:input | (input mooseInterestingEntity isKindOf: MooseGroup) or:[
					(input mooseInterestingEntity isKindOf: Collection) and:[(input mooseInterestingEntity isKindOf: ByteSymbol)not]]];
			dynamicActionsOnSelection: [ :list | OrderedCollection new 
					addAll: list selection mooseInterestingEntity mooseFinderActions;
					addAll: (self actionsFor: list);
					yourself].
				
	
]

{ #category : #accessing }
ASBrowser >> selectedVersion [
	^ selectedVersion
]

{ #category : #accessing }
ASBrowser >> selectedVersion: anObject [
	selectedVersion := anObject
]
