Class {
	#name : #MooseModelMergeSimpleTest,
	#superclass : #MooseModelMergeAbstractTest,
	#traits : 'TMooseModelMergeTest - {#testCreateAddType. #testCreateAddScopingEntity. #testCreateAddReference. #testCreateMoveClass. #testCreateMoveExtendedMethod. #testCreateRemove. #testCreateRename. #testCreateRenameMethod. #testCreateRenamePackage. #testSetOfAddMethodChanges. #testSetOfRenamePackageChanges. #testSetOfRenameMethodChanges. #testSetOfRenameAttributeChanges}',
	#classTraits : 'TMooseModelMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeSimpleTest >> setUp [
	| importer  |
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer
		model: MooseModel new;
		addFromPackagesNamed: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3');
		run.
	model1 := importer model.
	model1 name: 'base'.
	model1 := model1 convertToOrion.
	model1 install.	"required by convertToOrion, otherwise useless"
		
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer
		model: MooseModel new;
		addFromPackagesNamed: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3');
		run.
	model2 := importer model.
	model2 name: 'target'.
	modelMerger := MooseModelMerge new withBase: model1 target: model2
]
