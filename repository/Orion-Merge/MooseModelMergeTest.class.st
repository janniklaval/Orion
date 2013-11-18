"
A MooseModelMergeTest is a test class for testing the behavior of MooseModelMerge
"
Class {
	#name : #MooseModelMergeTest,
	#superclass : #TestCase,
	#instVars : [
		'modelMerger'
	],
	#category : #'Orion-Merge-Tests'
}

{ #category : #running }
MooseModelMergeTest >> setUp [ 
	|importer model1 model2 |
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass. 
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer model: MooseModel new; addFromPackagesNamed: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3' ); run.
	model1 :=  importer model.
	model1 name: 'base'.
	model1 install. "required by convertToOrion, otherwise useless"
	model1 := model1 convertToOrion.

	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass. 
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer model: MooseModel new; addFromPackagesNamed: #(#'Moose-TestResources-ModelDiff-P2' #'Moose-TestResources-ModelDiff-P3' ); run.
	model2 :=  importer model.
	model2 name: 'target'.

	modelMerger := MooseModelMerge new withBase: model1 target: model2.
]

{ #category : #running }
MooseModelMergeTest >> tearDown [
	"Halt now."

	ORSystem root notEmpty
		ifTrue: [ 
			(ORSystem root last orionModels first = modelMerger orionModel
				and: [ ORSystem root last orionModels last = modelMerger orionVersionedModel ])
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] 
			]	"ORSystem remove: modelMerger orionVersionedModel."
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddAccess [

	| var2  |

	var2 := modelMerger snapshot target entityNamed: 'Smalltalk::A3.att1'.
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()').
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddAccess.

	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.att1') incomingAccesses first isNil) .
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.att1') incomingAccesses first accessor) equals: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.b3()')  .


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddAttribute [
	| att |
	att := FAMIXAttribute new name: 'attAdded' ; yourself.
	modelMerger snapshot target add: att.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addAttribute: (att).
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	modelMerger createAddAttribute.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.attAdded') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.attAdded') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 4.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddInvocation [

	| meth  |

	meth := modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()'.
	FAMIXInvocation new sender: meth ; receiver: (modelMerger snapshot target entityNamed: 'Smalltalk::B3'); candidates: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.c3()') asOrderedCollection.
	
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddInvocation.

	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') outgoingInvocations size )  equals: 1.
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.b3()') outgoingInvocations size ) equals: 3.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddMethod [
	| meth |
	meth := FAMIXMethod new name: 'toto'  ; yourself.
	modelMerger snapshot target add: meth.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addMethod: meth.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	modelMerger createAddMethod.
	
	self assert: (modelMerger orionModel entityNamed: 'toto()') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'toto()') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 4.
	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddReference [

	| meth  |

	meth := modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()'.
	FAMIXReference new source: meth ; target: (modelMerger snapshot target entityNamed: 'Smalltalk::B2').
	
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	modelMerger createAddMethod.

	modelMerger createAddReference.

	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') outgoingReferences size) equals: 1.
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.b3()') outgoingReferences size) equals: 2.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddScopingEntity [

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	
	modelMerger createAddScopingEntity.
	
	self assert: (modelMerger orionModel entityNamed: 'Moose-TestResources-ModelDiff-P2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P2') notNil.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateAddType [

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A2') notNil.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateMoveAttribute [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new name: 'attAdded' ; yourself.
	modelMerger snapshot target add: att.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addAttribute: (att).
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()').
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()').
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.c3()').
	
	"creation of the attribute and the 3 accesses in the target model"
	(modelMerger orionModel entityNamed: 'Smalltalk::A4')
	addAttributNamed: 'attAdded'  inModel: modelMerger orionModel.
	(modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	(modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	(modelMerger orionModel entityNamed: 'Smalltalk::B3.c3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createMoveAttribute.
	
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') notNil.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.attAdded') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.attAdded') notNil.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') belongsTo mooseName equals:  'Smalltalk::A4'.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.attAdded') belongsTo mooseName equals:  'Smalltalk::A3'.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateMoveClass [
	
	"moving A3 into P2"
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') parentPackage: (modelMerger snapshot target entityNamed: 'Moose-TestResources-ModelDiff-P2').
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	self assert: modelMerger orionVersionedModel changes size equals: 1.
	modelMerger createMoveClass.
	
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3') notNil.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3') parentPackage name equals: 'Moose-TestResources-ModelDiff-P3'.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3') parentPackage name equals: 'Moose-TestResources-ModelDiff-P2'.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateMoveExtendedMethod [

	| asAction meth var1 var2 var3 var4 |

	(modelMerger snapshot base entityNamed:#'Smalltalk::A3') addMethodNamed: 'extendedMeth' inModel: modelMerger orionModel.
		
	asAction := ORActionExtendMethod new
					orionModel: modelMerger orionModel ;
					entity: (modelMerger orionModel entityNamed:#'extendedMeth()');
					newContainer:(modelMerger orionModel entityNamed:#'Moose-TestResources-ModelDiff-P4').
	asAction run.
	
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att1'.
	(modelMerger orionModel entityNamed: 'extendedMeth()') addAccessTo: var1 inModel:  modelMerger orionModel. 
	var2 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att2'.
	(modelMerger orionModel entityNamed: 'extendedMeth()') addAccessTo: var2 inModel:  modelMerger orionModel. 
	var3 := modelMerger snapshot base entityNamed: 'Smalltalk::B3.att1'.
	(modelMerger orionModel entityNamed: 'extendedMeth()') addAccessTo: var3 inModel:  modelMerger orionModel. 
	var4 := modelMerger snapshot base entityNamed: 'Smalltalk::B3.att2'.
	(modelMerger orionModel entityNamed: 'extendedMeth()') addAccessTo: var4 inModel:  modelMerger orionModel. 
			
	self assert: (modelMerger orionModel entityNamed: 'extendedMeth()') notNil.	
	self assert: (modelMerger orionModel entityNamed: 'extendedMeth()') parentPackage mooseName equals:  'Moose-TestResources-ModelDiff-P4'.

	meth := FAMIXMethod new name: 'extendedMeth'  ; yourself.
	
	FAMIXAccess new variable: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.att1') ; accessor: meth.
	FAMIXAccess new variable: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.att2') ; accessor: meth.
	FAMIXAccess new variable: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.att1') ; accessor: meth.
	FAMIXAccess new variable: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.att2') ; accessor: meth.
	
	modelMerger snapshot target add: meth.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addMethod: meth.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.extendedMeth') parentPackage: (modelMerger snapshot target entityNamed: 'Moose-TestResources-ModelDiff-P2').
"	Halt now."
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	modelMerger createAddMethod.
	
	modelMerger createMoveMethod.
	

	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.extendedMeth()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.extendedMeth()') parentPackage mooseName equals:  'Moose-TestResources-ModelDiff-P2'.


	

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateMoveMethod [

	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()') parentType: (modelMerger snapshot target entityNamed: 'Smalltalk::C3').
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	modelMerger createMoveMethod.
	
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3.c3()') notNil.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') belongsTo mooseName equals:  'Smalltalk::A3'.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3.c3()') belongsTo mooseName equals:  'Smalltalk::C3'.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemove [
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRemove.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4.b3()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4.b3()') isNil.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4') isNil.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemoveAccess [

	| var1 |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att1'.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.b3()') ; 
			to: var1; 
			run.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRemoveAccess.

	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.att1') incomingAccesses) notEmpty.
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.att1') incomingAccesses) isEmpty .

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemoveAttribute [
	(modelMerger orionModel entityNamed: 'Smalltalk::A4')
	addAttributNamed: 'toto'  inModel: modelMerger orionModel.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRemoveAttribute.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4.toto') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4.toto') isNil.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemoveInvocation [

	| var1 cand |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.b3()'.
	cand := { (modelMerger snapshot base entityNamed: 'Smalltalk::A3.c3()'). (modelMerger snapshot base entityNamed: 'Smalltalk::B3.c3()') } asOrderedCollection.
	ORActionAddInvocation new 		
			orionModel: modelMerger snapshot base; 
			from: var1; 
			candidates: cand ; 
			run.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRemoveInvocation .

	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') outgoingInvocations ) notEmpty.
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.b3()') outgoingInvocations) isEmpty .

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemoveMethod [
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRemoveMethod.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A4.b3()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4.b3()') isNil.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRemoveReference [

	| var1 |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.b3()'.
	ORActionAddReference new 		
			orionModel: modelMerger snapshot base; 
			from: var1; 
			to: (modelMerger snapshot base entityNamed: 'Smalltalk::A4') ; 
			run.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createAddScopingEntity.
	modelMerger createAddType.
	modelMerger createAddMethod.
	modelMerger createRemoveReference.
	
	self assert: ((modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') outgoingReferences select: [:ref | ref target mooseID = (modelMerger orionModel entityNamed: 'Smalltalk::A4') mooseID]) notEmpty.
	self assert: ((modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.b3()') outgoingReferences select: [:ref | ref target mooseID = (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4') mooseID]) isEmpty.
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRename [


	(modelMerger snapshot target entityNamed: 'Smalltalk::B3') name: 'X3'.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()') name: 'd3()'.

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRename.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.c3()') name equals: 'd3()'.
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::B3') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 2.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRenameAttribute [

	| var1 var2  |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att1'.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.b2()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.c3()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::B3.c3()') ; 
			to: var1; 
			run.

	var2 := modelMerger snapshot target entityNamed: 'Smalltalk::A3.att1'.
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b2()').
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()').
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.c3()').
	var2 name: 'toto'.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRenameAttribute.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.att1') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.toto') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRenameClass [

	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') name: 'X3'.

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRenameClass.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRenameMethod [

	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()') name: 'd3()'.

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRenameMethod.
	
	self assert: (modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3.c3()') name equals: 'd3()'.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateRenamePackage [

	(modelMerger snapshot target entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	modelMerger createRenamePackage.
	
	self assert: (modelMerger orionModel entityNamed: 'Moose-TestResources-ModelDiff-P3') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'totoPackage') notNil.
	self assert: modelMerger orionVersionedModel changes size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testCreateVersion [

	modelMerger createVersion.
	
	self assert: modelMerger orionVersionedModel notNil.
	
	
	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testInitialize [

	self assert: (modelMerger notNil).
	self assert: (modelMerger class) equals: MooseModelMerge.

	self assert: (modelMerger snapshot notNil).
	self assert: (modelMerger snapshot class) equals: FamixDiff .	
	
	(ORSystem root notEmpty) ifTrue: [((ORSystem root last orionModels first = modelMerger orionModel))
	ifTrue: [ORSystem root remove: ORSystem root last ifAbsent: []. ]]
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddAccessChanges [

	| var2  |

	var2 := modelMerger snapshot target entityNamed: 'Smalltalk::A3.att1'.
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()').
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfAddAccessChanges) notNil.
	self assert: modelMerger setOfAddAccessChanges size equals: 1.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddAttributeChanges [
	| att |
	att := FAMIXAttribute new name: 'attAdded' ; yourself.
	modelMerger snapshot target add: att.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addAttribute: (att).
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfAddAttributeChanges) notNil.
	self assert: modelMerger setOfAddAttributeChanges size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddClassChanges [

	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfAddClassChanges) notNil.
	self assert: modelMerger setOfAddClassChanges size equals: 2.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddInvocationChanges [

	| meth  |

	meth := modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()'.
	FAMIXInvocation new sender: meth ; receiver: (modelMerger snapshot target entityNamed: 'Smalltalk::B3'); signature: 'c3'.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfAddInvocationChanges) notNil.
	self assert: modelMerger setOfAddInvocationChanges size equals: 4.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddMethodChanges [
	| meth |
	meth := FAMIXMethod new name: 'toto'  ; yourself.
	modelMerger snapshot target add: meth.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addMethod: meth.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfAddMethodChanges) notNil.
	self assert: modelMerger setOfAddMethodChanges size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfAddReferenceChanges [
	
	| meth  |

	meth := modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()'.
	FAMIXReference new source: meth ; target: (modelMerger snapshot target entityNamed: 'Smalltalk::B3').
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfAddReferenceChanges) notNil.
	self assert: modelMerger setOfAddReferenceChanges size equals: 1.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfMoveAttributeChanges [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new name: 'attAdded' ; yourself.
	modelMerger snapshot target add: att.
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') addAttribute: (att).
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b3()').
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()').
	FAMIXAccess new variable: att ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.c3()').
	
	"creation of the attribute and the 3 accesses in the target model"
	(modelMerger orionModel entityNamed: 'Smalltalk::A4')
	addAttributNamed: 'attAdded'  inModel: modelMerger orionModel.
	(modelMerger orionModel entityNamed: 'Smalltalk::A3.b3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	(modelMerger orionModel entityNamed: 'Smalltalk::A3.c3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	(modelMerger orionModel entityNamed: 'Smalltalk::B3.c3()') addAccessTo: (modelMerger orionModel entityNamed: 'Smalltalk::A4.attAdded') inModel: modelMerger orionModel .
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).
	self assert: (modelMerger setOfMoveAttributeChanges) notNil.
	self assert: modelMerger setOfMoveAttributeChanges size equals: 1.
	self assert: (modelMerger setOfMoveAttributeChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3.attAdded' ] ) notNil .
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfMoveClassChanges [

	| fmxEntity |
	
	"moving A3 into P2"
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') parentPackage: (modelMerger snapshot target entityNamed: 'Moose-TestResources-ModelDiff-P2').
	fmxEntity := FAMIXMethod new
					name: 'b2' ;
					signature: 'b2()' ;
					parentType: (modelMerger snapshot target entityNamed: 'Smalltalk::B3').
	modelMerger snapshot target add: fmxEntity.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfMoveClassChanges) notNil.
	self assert: modelMerger setOfMoveClassChanges size equals: 1.
	self assert: (modelMerger setOfMoveClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3' ] ) notNil .

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfMoveMethodChanges [

	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()') parentType: (modelMerger snapshot target entityNamed: 'Smalltalk::A2').
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfMoveMethodChanges) notNil.
	self assert: modelMerger setOfMoveMethodChanges size equals: 1.
	self assert: (modelMerger setOfMoveMethodChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3.c3()' ] ) notNil .

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRemoveAccessChanges [

	| var1 |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att1'.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.b3()') ; 
			to: var1; 
			run.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfRemoveAccessChanges) notNil.
	self assert: modelMerger setOfRemoveAccessChanges size equals: 1.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRemoveAttributeChanges [
	(modelMerger orionModel entityNamed: 'Smalltalk::A4')
	addAttributNamed: 'toto'  inModel: modelMerger orionModel.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger changes anySatisfy: [ :c | c isRemoval and: [c entity name = 'toto'] ] ).
	self assert: (modelMerger setOfRemoveAttributeChanges) notNil.
	self assert: modelMerger setOfRemoveAttributeChanges size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRemoveChanges [
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).


	self assert: (modelMerger setOfRemoveChanges) notNil.
	self assert: modelMerger setOfRemoveChanges size equals: 4.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRemoveMethodChanges [
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger changes anySatisfy: [ :c | c isRemoval and: [c entity name = 'b3'] ] ).
	self assert: (modelMerger setOfRemoveMethodChanges) notNil.
	self assert: modelMerger setOfRemoveMethodChanges size equals: 1.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRemoveReferenceChanges [

	| var1 |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.b3()'.
	ORActionAddReference new 		
			orionModel: modelMerger snapshot base; 
			from: var1; 
			to: (modelMerger snapshot base entityNamed: 'Smalltalk::A4') ; 
			run.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfRemoveReferenceChanges) notNil.
	self assert: modelMerger setOfRemoveReferenceChanges size equals: 2.


	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRenameAttributeChanges [

	| var1 var2  |
	var1 := modelMerger snapshot base entityNamed: 'Smalltalk::A3.att1'.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.b2()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::A3.c3()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: modelMerger snapshot base; 
			from: (modelMerger snapshot base entityNamed: 'Smalltalk::B3.c3()') ; 
			to: var1; 
			run.

	var2 := modelMerger snapshot target entityNamed: 'Smalltalk::A3.att1'.
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.b2()').
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()').
	FAMIXAccess new variable: var2 ; accessor: (modelMerger snapshot target entityNamed: 'Smalltalk::B3.c3()').
	var2 name: 'toto'.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	self assert: (modelMerger setOfRenameAttributeChanges) notNil.
	self assert: modelMerger setOfRenameAttributeChanges size equals: 1.
	self assert: (modelMerger setOfRenameAttributeChanges collect: [ :e | e entity name = 'att1' ] ) notNil.
	self assert:  (modelMerger setOfRenameAttributeChanges collect: [ :e | e entity name = 'toto' ] ) notNil.

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRenameClassChanges [

	
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3') name: 'X3'.
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfRenameClassChanges) notNil.
	self assert: modelMerger setOfRenameClassChanges size equals: 1.
	self assert: (modelMerger setOfRenameClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3' ] ) notNil.


]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRenameMethodChanges [

	
	(modelMerger snapshot target entityNamed: 'Smalltalk::A3.c3()') name: 'd3()'.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfRenameMethodChanges) notNil.
	self assert: modelMerger setOfRenameMethodChanges size equals: 1.
	self assert: (modelMerger setOfRenameMethodChanges collect: [ :e | e entity name = 'c3' ] ) notNil.
	self assert: (modelMerger setOfRenameMethodChanges collect: [ :e | e targetEntity name = 'd3()' ] ) notNil .

	
]

{ #category : #'tests-run' }
MooseModelMergeTest >> testSetOfRenamePackageChanges [

	
	(modelMerger snapshot target entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	
	modelMerger snapshot diff.
	modelMerger orionVersionedModel: (modelMerger orionModel createNewChildVersion).

	
	self assert: (modelMerger setOfRenamePackageChanges) notNil.
	self assert: modelMerger setOfRenamePackageChanges size equals: 1.
	self assert: (modelMerger setOfRenamePackageChanges collect: [ :e | e entity name = 'Moose-TestResources-ModelDiff-P3' ] ) notNil .
	self assert: (modelMerger setOfRenamePackageChanges collect: [ :e | e targetEntity name = 'totoPackage' ] ) notNil.

	
]
