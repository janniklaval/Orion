Class {
	#name : #OrionMergeIntegrationTestWithFullModelsOrion2FX,
	#superclass : #OrionMergeIntegrationTestWithFullModels,
	#category : #'Orion-Merge-Tests'
}

{ #category : #adding }
OrionMergeIntegrationTestWithFullModelsOrion2FX >> addAllFromMseString: mse [
	| model1 |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: mse readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff
		baseModel: model1 
		targetModel: model2 convertToOrion
		diffTransformers:
			{FamixDiffChangesSorter.
			OrionMergeWithVisitor}.
	modelMerger run
]

{ #category : #adding }
OrionMergeIntegrationTestWithFullModelsOrion2FX >> delAllFromMseString: mse [
	| model1 |
	model1 := MooseModel new.
	model1 importFromMSEStream: mse readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 name: 'baseEmpty'.
	modelMerger := FXDiff
		baseModel: model1 
		targetModel: model2 convertToOrion
		diffTransformers:
			{FamixDiffChangesSorter.
			OrionMergeWithVisitor}.
	modelMerger run
]
