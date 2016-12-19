"
A MooseModelMergeTest is a test class for testing the behavior of MooseModelMerge
"
Class {
	#name : #OrionMergeTest,
	#superclass : #OrionMergeAbstractTest,
	#traits : 'TOrionMergeTest',
	#classTraits : 'TOrionMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
OrionMergeTest >> setUp [
	model1 := self importModelNamed: 'base' fromPackages: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	model1 := model1 convertToOrion.
	model1 install.	"required by convertToOrion, otherwise useless"
	model2 := self importModelNamed: 'target' fromPackages: #(#'Moose-TestResources-ModelDiff-P2' #'Moose-TestResources-ModelDiff-P3').
	self modelMerger: (FXDiff baseModel: model1 targetModel: model2 diffTransformers: {OrionMerge})
]

{ #category : #'tests-create' }
OrionMergeTest >> testAddAllFromStModel [

	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2
]

{ #category : #'tests-create' }
OrionMergeTest >> testAddAndDiffAllFromStModel [
	<expectedFailure>
	| modelDiff res |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	modelDiff := FXDiff baseModel: modelMerger baseModel system orionModels second targetModel: model2 diffTransformers: {}.
	res := modelDiff run result.
	self assert: res isEmpty
]
