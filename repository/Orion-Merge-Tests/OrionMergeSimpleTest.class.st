Class {
	#name : #OrionMergeSimpleTest,
	#superclass : #OrionMergeAbstractTest,
	#traits : 'TOrionMergeTest - {#testCreateAddType. #testCreateAddScopingEntity. #testCreateAddReference. #testCreateMoveClass. #testCreateMoveExtendedMethod. #testCreateRemove. #testCreateRename. #testCreateRenameMethod. #testCreateRenamePackage. #testSetOfAddMethodChanges. #testSetOfRenamePackageChanges. #testSetOfRenameMethodChanges. #testSetOfRenameAttributeChanges. #testSetOfMoveClassChanges. #testSetOfMoveMethodChanges}',
	#classTraits : 'TOrionMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
OrionMergeSimpleTest >> setUp [
	model1 := self importModelNamed: 'base' fromPackages: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	model1 := model1 convertToOrion.
	model1 install.	"required by convertToOrion, otherwise useless"
	model2 := self importModelNamed: 'target' fromPackages: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	modelMerger := FXDiff baseModel: model1 targetModel: model2 diffTransformers: {OrionMerge}
]