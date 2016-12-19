Class {
	#name : #OrionMergeIntegrationTestWithFullModels,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger',
		'model2'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> addAllFromMseString: mse [
	| model1  |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: mse readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff
		baseModel: model1 convertToOrion
		targetModel: model2
		diffTransformers: {OrionMerge}.
	modelMerger run
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> diffFromScratch [
	| modelDiff |
	modelDiff := FXDiff
		baseModel: modelMerger baseModel system orionModels second
		targetModel: model2
		diffTransformers: {}.
	^ modelDiff run result
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> testAddAllFromOrionMergeJavaTest [
	"comment stating purpose of message"

	| mse |
	mse := OrionMergeJavaTest wholeMSE.
	self addAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> testAddAndDiffAllFromOrionMergeJavaTest [
	| res |
	self addAllFromMseString: OrionMergeJavaTest wholeMSE.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	self diffFromScratch.
	res := self diffFromScratch.
	self deny: res isEmpty.
	self
		flag: 'It should be empty but only if the model is fully done... Now some items are missing'.
	self assert: res size equals: 28.
	self assert: res numberOfAdds equals: 11.
	self assert: res numberOfVersions equals: 28 - 11.
	self
		assert: (res allImpactingChanges collectAsSet: [ :e | e entity class ])
		equals: (Set with: FAMIXParameter with: FAMIXPrimitiveType)
]
