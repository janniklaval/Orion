"
A MooseModelMergeTest is a test class for testing the behavior of MooseModelMerge
"
Class {
	#name : #MooseModelMergeTest,
	#superclass : #MooseModelMergeAbstractTest,
	#traits : 'TMooseModelMergeTest - {#testCreateAddAccess. #testCreateAddInvocation. #testCreateAddReference. #testCreateMoveClass}',
	#classTraits : 'TMooseModelMergeTest classTrait',
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeTest >> setUp [
	| importer |
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer
		model: MooseModel new;
		addFromPackagesNamed:
			#(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3');
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
		addFromPackagesNamed:
			#(#'Moose-TestResources-ModelDiff-P2' #'Moose-TestResources-ModelDiff-P3');
		run.
	model2 := importer model.
	model2 name: 'target'.
	self modelMerger: (MooseModelMerge new
		withBase: model1
		target: model2)
]
