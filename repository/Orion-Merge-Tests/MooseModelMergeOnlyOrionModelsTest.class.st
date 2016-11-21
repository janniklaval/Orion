"
These tests should apply on only 2 orion models. They are skipped for now.


For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MooseModelMergeOnlyOrionModelsTest,
	#superclass : #MooseModelMergeTest,
	#traits : 'TMooseModelMergeTest',
	#classTraits : 'TMooseModelMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeOnlyOrionModelsTest >> setUp [
	super setUp.
	self skip.
	model2 := model2 convertToOrion.
	self modelMerger: (FXDiff baseModel: model1 targetModel: model2 diffTransformers: {MooseModelMerge})
]

{ #category : #'tests-expected failures' }
MooseModelMergeOnlyOrionModelsTest >> testCreateRename [

	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff') name: 'X3diff'.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRename.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') notNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 2
]

{ #category : #'tests-expected failures' }
MooseModelMergeOnlyOrionModelsTest >> testCreateRenameMethod [

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenameMethod.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-expected failures' }
MooseModelMergeOnlyOrionModelsTest >> testCreateRenamePackage [

	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenamePackage.
	self assert: (self modelMerger baseModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'totoPackage') isNotNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-expected failures' }
MooseModelMergeOnlyOrionModelsTest >> testSetOfRenameMethodChanges [

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRenameMethodChanges notNil.
	self assert: self modelMerger setOfRenameMethodChanges size equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isMethod ] ]).
	self assert: (self modelMerger setOfRenameMethodChanges collect: [ :e | e entity name = 'c3' ]) isNotNil.
	self assert: (self modelMerger setOfRenameMethodChanges collect: [ :e | e targetEntity name = 'd3()' ]) isNotNil
]

{ #category : #'tests-expected failures' }
MooseModelMergeOnlyOrionModelsTest >> testSetOfRenamePackageChanges [

	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRenamePackageChanges isNotNil.
	self assert: self modelMerger setOfRenamePackageChanges size equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isPackage ] ]).
	self assert: (self modelMerger setOfRenamePackageChanges collect: [ :e | e entity name = 'Moose-TestResources-ModelDiff-P3' ]) isNotNil.
	self assert: (self modelMerger setOfRenamePackageChanges collect: [ :e | e targetEntity name = 'totoPackage' ]) isNotNil
]
