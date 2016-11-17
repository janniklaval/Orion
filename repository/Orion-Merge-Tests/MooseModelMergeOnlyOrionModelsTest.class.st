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
