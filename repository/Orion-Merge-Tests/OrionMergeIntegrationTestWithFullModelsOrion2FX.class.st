Class {
	#name : #OrionMergeIntegrationTestWithFullModelsOrion2FX,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger',
		'model2'
	],
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
	modelMerger := FXDiff baseModel: model1 targetModel: model2 convertToOrion.
	modelMerger run
]

{ #category : #adding }
OrionMergeIntegrationTestWithFullModelsOrion2FX >> mseFromVerveineJTest [
	^ VerveineJTestResource current mse
]

{ #category : #adding }
OrionMergeIntegrationTestWithFullModelsOrion2FX >> test0AddAndDiffAllFromOrionMergeJavaTest [
	| res |
	self addAllFromMseString: OrionMergeJavaTest wholeMSE.
	res := modelMerger result.
	self deny: res isEmpty.
	self assert: res size equals: 28 + 1.	"Inheritance link"
	res do: [ :e | self assert: e isAddition ]
]

{ #category : #adding }
OrionMergeIntegrationTestWithFullModelsOrion2FX >> test1AddAndDiffAllFromVerveineJTest [
	| res numberOfEntities |
	self addAllFromMseString: self mseFromVerveineJTest.
	res := modelMerger result.
	numberOfEntities := modelMerger targetModel size.
	self deny: res isEmpty.
	self assert: res numberOfEntities equals: 781.
	res do: [ :e | self assert: e isAddition ]
]
