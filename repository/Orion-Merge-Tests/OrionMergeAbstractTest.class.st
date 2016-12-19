Class {
	#name : #OrionMergeAbstractTest,
	#superclass : #TestCase,
	#traits : 'TMooseSmalltalkModelImporterForTests',
	#classTraits : 'TMooseSmalltalkModelImporterForTests classTrait',
	#instVars : [
		'modelMerger',
		'model2',
		'model1',
		'diff'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #accessing }
OrionMergeAbstractTest >> baseModel [
	^ self model1
]

{ #category : #accessing }
OrionMergeAbstractTest >> diff [
	diff ifNil: [ diff := self modelMerger run result ].
	^ diff
]

{ #category : #accessing }
OrionMergeAbstractTest >> model1 [
	^ model1
]

{ #category : #accessing }
OrionMergeAbstractTest >> model2 [
	^ model2
]

{ #category : #accessing }
OrionMergeAbstractTest >> modelMerger [
	^ modelMerger
]

{ #category : #accessing }
OrionMergeAbstractTest >> modelMerger: anObject [
	modelMerger := anObject
]

{ #category : #accessing }
OrionMergeAbstractTest >> mooseModelMerge [
	^ self modelMerger diffTransformers first
]

{ #category : #accessing }
OrionMergeAbstractTest >> targetModel [
	^ self model2
]

{ #category : #running }
OrionMergeAbstractTest >> tearDown [

	ORSystem root notEmpty
		ifTrue: [ 
			(ORSystem root last orionModels first = modelMerger targetModel
				and: [ ORSystem root last orionModels last = modelMerger orionVersionedModel ])
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] 
			]	"ORSystem remove: modelMerger orionVersionedModel."
]