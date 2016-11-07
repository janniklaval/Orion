Class {
	#name : #MooseModelMergeOnlyOrionModelsTest,
	#superclass : #MooseModelMergeTest,
	#traits : 'TMooseModelMergeTest - {#testSetOfRenameMethodChanges}',
	#classTraits : 'TMooseModelMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeOnlyOrionModelsTest >> setUp [ 
	super setUp.
	
	model2 := model2 convertToOrion.
	

	modelMerger := MooseModelMerge new withBase: model1 target: model2.
]
