Class {
	#name : #MooseModelMergeAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger',
		'model2',
		'model1',
		'diff'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #'as yet unclassified' }
MooseModelMergeAbstractTest >> baseModel [
	^ self model1
]

{ #category : #'as yet unclassified' }
MooseModelMergeAbstractTest >> diff [
	diff ifNil: [ diff := self modelMerger snapshot diff ].
	^ diff
]

{ #category : #accessing }
MooseModelMergeAbstractTest >> model1 [
	^ model1
]

{ #category : #accessing }
MooseModelMergeAbstractTest >> model2 [
	^ model2
]

{ #category : #accessing }
MooseModelMergeAbstractTest >> modelMerger [
	^ modelMerger
]

{ #category : #accessing }
MooseModelMergeAbstractTest >> modelMerger: anObject [
	modelMerger := anObject
]

{ #category : #'as yet unclassified' }
MooseModelMergeAbstractTest >> targetModel [
	^ self model2
]

{ #category : #running }
MooseModelMergeAbstractTest >> tearDown [

	ORSystem root notEmpty
		ifTrue: [ 
			(ORSystem root last orionModels first = modelMerger targetModel
				and: [ ORSystem root last orionModels last = modelMerger orionVersionedModel ])
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] 
			]	"ORSystem remove: modelMerger orionVersionedModel."
]
