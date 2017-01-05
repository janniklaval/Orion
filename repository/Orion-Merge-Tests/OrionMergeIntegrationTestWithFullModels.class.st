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
	| model1 |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: mse readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff
		baseModel: model1 convertToOrion
		targetModel: model2
		diffTransformers:
			{FamixDiffChangesSorter.
			OrionMergeWithVisitor}.
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
OrionMergeIntegrationTestWithFullModels >> mseFromVerveineJTest [
	^ VerveineJTestResource current mse
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> test0AddAllFromOrionMergeJavaTest [
	"comment stating purpose of message"

	| mse |
	mse := OrionMergeJavaTest wholeMSE.
	self addAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> test0AddAndDiffAllFromOrionMergeJavaTest [
	| res |
	self addAllFromMseString: OrionMergeJavaTest wholeMSE.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	self diffFromScratch.
	res := self diffFromScratch.
	self deny: res isEmpty.
	self assert: res size equals: 28
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> test1AddAllFromVerveineJTest [
	"comment stating purpose of message"

	| mse |
	mse := self mseFromVerveineJTest.
	self addAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2
]

{ #category : #tests }
OrionMergeIntegrationTestWithFullModels >> test1AddAndDiffAllFromVerveineJTest [
	| res |
	self addAllFromMseString: self mseFromVerveineJTest.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	self diffFromScratch.
	res := self diffFromScratch.
	self deny: res isEmpty.
	self assert: res size equals: 465.
	res do: [ :e | self assert: e isVersion ]
]
