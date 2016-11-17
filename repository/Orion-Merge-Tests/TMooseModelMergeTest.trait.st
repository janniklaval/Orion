"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
 
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Trait {
	#name : #TMooseModelMergeTest,
	#category : #'Orion-Merge-Tests'
}

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddAccess [

	| var2  |

	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	
	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self modelMerger createAddAccess.

	self assert: ((self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses first isNil) .
	self assert: ((self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses first accessor) equals: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()')  .


	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddAttribute [
	| diff |
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff')
		addAttributeNamed: 'attAdded'
		inModel: self modelMerger targetModel.
	diff := self diff.
	self modelMerger
		orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	self modelMerger createAddAttribute.
	self modelMerger createAddMethod.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.attAdded')
				isNil.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.attAdded') isNotNil.
	self
		assert: self modelMerger orionVersionedModel changes size
		equals: diff numberOfAdds
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddInvocation [
	| meth |
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		candidates: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()') asOrderedCollection.
	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddInvocation.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations size equals: 1.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations size equals: 3
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddMethod [
	| meth |
	meth := FAMIXMethod new
		name: 'toto';
		yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	self modelMerger createAddMethod.
	self modelMerger createAddAttribute.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.toto()') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto()') notNil.
	self assert: self modelMerger orionVersionedModel changes size equals: self diff numberOfAdds
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddReference [

	| meth  |

	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new source: meth ; target: (self modelMerger targetModel entityNamed: 'Smalltalk::B2diff').
	
	
	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	self modelMerger createAddMethod.

	self modelMerger createAddReference.

	self assert: ((self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences size) equals: 1.
	self assert: ((self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences size) equals: 2.


	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddScopingEntity [

	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	
	self modelMerger createAddScopingEntity.
	
	self assert: (self modelMerger baseModel entityNamed: 'Moose-TestResources-ModelDiff-P2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P2') notNil.

	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateAddType [

	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A2diff') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A2diff') notNil.

	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateMoveAttribute [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').

	"creation of the attribute and the 3 accesses in the target model"
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'attAdded' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createMoveAttribute.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') notNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.attAdded') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') notNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') belongsTo mooseName equals: 'Smalltalk::A4diff'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') belongsTo mooseName equals: 'Smalltalk::A3diff'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateMoveClass [
	"moving A3 into P2" 

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	self modelMerger snapshot diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddScopingEntity.
	self assert: self modelMerger orionVersionedModel changes size equals: 1.
	self modelMerger createMoveClass.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') parentPackage name equals: 'Moose-TestResources-ModelDiff-P3'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff') parentPackage name equals: 'Moose-TestResources-ModelDiff-P2'
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateMoveExtendedMethod [
	| orAction meth extendedMeth |
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger baseModel.
	extendedMeth := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.extendedMeth()'.
	orAction := ORActionExtendMethod new
		orionModel: self modelMerger baseModel;
		entity: extendedMeth;
		newContainer: (self modelMerger baseModel entityNamed: #'Moose-TestResources-ModelDiff-P4').
	orAction run.
	self assert: extendedMeth isNotNil.
	self assert: extendedMeth parentPackage mooseName equals: 'Moose-TestResources-ModelDiff-P4'.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger targetModel.
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.extendedMeth'.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger targetModel.
	meth parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	"	Halt now."
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	self modelMerger createAddMethod.
	self modelMerger createMoveMethod.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') parentPackage mooseName
		equals: 'Moose-TestResources-ModelDiff-P2'
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateMoveMethod [

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') parentType: (self modelMerger  targetModel entityNamed: 'Smalltalk::C3diff').
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self modelMerger createMoveMethod.
	
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3()') isNotNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') belongsTo mooseName equals:  'Smalltalk::A3diff'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3()') belongsTo mooseName equals:  'Smalltalk::C3diff'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1.

	

	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemove [
	
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self modelMerger createRemove.
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') isNil.

	
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemoveAccess [
	| var1 |
	var1 := self modelMerger snapshot baseModel
		entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger snapshot baseModel;
		from:
			(self modelMerger snapshot baseModel
				entityNamed: 'Smalltalk::A3diff.b3()');
		to: var1;
		run.
	self modelMerger snapshot diff.
	self modelMerger
		orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRemoveAccess.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1')
				incomingAccesses notEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses isEmpty
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemoveAttribute [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRemoveAttribute.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.toto') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.toto') isNil.
	self
		assert: self modelMerger orionVersionedModel changes size
		equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isAttribute ] ])
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemoveInvocation [
	| var1 cand |
	var1 := self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	cand := {(self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()').
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()')}
		asOrderedCollection.
	ORActionAddInvocation new
		orionModel: self modelMerger snapshot baseModel;
		from: var1;
		candidates: cand;
		run.
	self diff.
	self modelMerger
		orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRemoveInvocation.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingInvocations isNotEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations isEmpty
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemoveMethod [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRemoveMethod.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRemoveReference [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new
		orionModel: self modelMerger baseModel;
		from: var1;
		to: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff');
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createAddScopingEntity.
	self modelMerger createAddType.
	self modelMerger createAddMethod.
	self modelMerger createRemoveReference.
	self
		assert:
			((self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences select: [ :ref | ref target mooseID = (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') mooseID ])
				isNotEmpty.
	self
		assert:
			((self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences
				select: [ :ref | ref target mooseID = (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') mooseID ]) isEmpty
]

{ #category : #'tests-expected failures' }
TMooseModelMergeTest >> testCreateRename [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff') name: 'X3diff'.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRename.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') notNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 2
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRenameAttribute [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1') name: 'toto'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenameAttribute.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto') isNotNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateRenameClass [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenameClass.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') isNotNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-expected failures' }
TMooseModelMergeTest >> testCreateRenameMethod [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenameMethod.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-expected failures' }
TMooseModelMergeTest >> testCreateRenamePackage [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger createRenamePackage.
	self assert: (self modelMerger baseModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'totoPackage') isNotNil.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-create' }
TMooseModelMergeTest >> testCreateVersion [

	self modelMerger createVersion.
	
	self assert: self modelMerger orionVersionedModel notNil.
	
	
	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testInitialize [

	self assert: (self modelMerger notNil).
	self assert: (self modelMerger class) equals: MooseModelMerge.

	self assert: (self modelMerger snapshot notNil).
	self assert: (self modelMerger snapshot class) equals: FamixDiff .	
	
	(ORSystem root isNotEmpty) ifTrue: [((ORSystem root last orionModels first = self modelMerger baseModel))
	ifTrue: [ORSystem root remove: ORSystem root last ifAbsent: []. ]]
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddAccessChanges [
	| var2 |
	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new
		variable: var2;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfAddAccessChanges isNotNil.
	self
		assert: self modelMerger setOfAddAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isAccess ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddAttributeChanges [
	| att |
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfAddAttributeChanges isNotNil.
	self
		assert: self modelMerger setOfAddAttributeChanges size
		equals: (self diff changes count: [ :e | e isAddition and: [ e entity isAttribute ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddClassChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfAddClassChanges isNotNil.
	self assert: self modelMerger setOfAddClassChanges size equals: (self diff changes count: [ :e | e isAddition and: [ e entity isType ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddInvocationChanges [
	| meth |
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		signature: 'c3'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfAddInvocationChanges isNotNil.
	self
		assert: self modelMerger setOfAddInvocationChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isInvocation ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddMethodChanges [
	| meth |
	meth := FAMIXMethod new name: 'toto'  ; yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	
	self assert: (self modelMerger setOfAddMethodChanges) notNil.
	self assert: self modelMerger setOfAddMethodChanges size equals: 1.

	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfAddReferenceChanges [
	
	| meth  |

	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new source: meth ; target: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger setOfAddReferenceChanges) notNil.
	self assert: self modelMerger setOfAddReferenceChanges size equals:  (self diff assocChanges count: [ :e | e isAddition and: [ e entity isReference ] ]).


	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfMoveAttributeChanges [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').

	"creation of the attribute and the 3 accesses in the target model"
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'attAdded' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
		addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded')
		inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()')
		addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded')
		inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()')
		addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded')
		inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfMoveAttributeChanges notNil.
	self assert: self modelMerger setOfMoveAttributeChanges size equals: 1.
	self assert: (self modelMerger setOfMoveAttributeChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.attAdded' ]) notNil
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfMoveClassChanges [

	| fmxEntity |
	
	"moving A3 into P2"
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	fmxEntity := FAMIXMethod new
					name: 'b2' ;
					signature: 'b2()' ;
					parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self modelMerger targetModel add: fmxEntity.
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	
	self assert: (self modelMerger setOfMoveClassChanges) notNil.
	self assert: self modelMerger setOfMoveClassChanges size equals: 1.
	self assert: (self modelMerger setOfMoveClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ] ) notNil .

	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfMoveMethodChanges [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()')
		parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::A2diff').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfMoveMethodChanges notNil.
	self
		assert: self modelMerger setOfMoveMethodChanges size
		equals: (self diff changes count: [ :e | e isMove and: [ e entity isBehaviouralEntity ] ]) /2 "Because of the move on both sides".
	self assert: (self modelMerger setOfMoveMethodChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.c3()' ]) isNotEmpty
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRemoveAccessChanges [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger baseModel;
		from: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()');
		to: var1;
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRemoveAccessChanges notNil.
	self
		assert: self modelMerger setOfRemoveAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isAccess ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRemoveAttributeChanges [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger changes anySatisfy: [ :c | c isRemoval and: [ c entity name = 'toto' ] ]).
	self assert: self modelMerger setOfRemoveAttributeChanges isNotNil.
	self
		assert: self modelMerger setOfRemoveAttributeChanges size
		equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isAttribute ] ])
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRemoveChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRemoveChanges notNil.
	self assert: self modelMerger setOfRemoveChanges size equals: (self diff changes count: [ :e | e isRemoval ]).
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRemoveMethodChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger changes anySatisfy: [ :c | c isRemoval and: [ c entity name = 'b3' ] ]).
	self assert: self modelMerger setOfRemoveMethodChanges notNil.
	self assert: self modelMerger setOfRemoveMethodChanges size equals: 1
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRemoveReferenceChanges [

	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new 		
			orionModel: self modelMerger baseModel; 
			from: var1; 
			to: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') ; 
			run.
	
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger setOfRemoveReferenceChanges) isNotNil.
	self assert: self modelMerger setOfRemoveReferenceChanges size equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isReference  ] ])..


	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRenameAttributeChanges [

	| var1 var2  |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			from: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b2()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			from: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') ; 
			to: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			from: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') ; 
			to: var1; 
			run.

	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b2()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').
	var2 name: 'toto'.
	
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger setOfRenameAttributeChanges) notNil.
	self assert: self modelMerger setOfRenameAttributeChanges size equals: 1.
	self assert: (self modelMerger setOfRenameAttributeChanges collect: [ :e | e entity name = 'att1' ] ) isNotEmpty.
	self assert:  (self modelMerger setOfRenameAttributeChanges collect: [ :e | e entity name = 'toto' ] ) isNotEmpty.

	
]

{ #category : #'tests-set' }
TMooseModelMergeTest >> testSetOfRenameClassChanges [

	
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	
	self assert: (self modelMerger setOfRenameClassChanges) notNil.
	self assert: self modelMerger setOfRenameClassChanges size equals: 1.
	self assert: (self modelMerger setOfRenameClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ] ) notNil.


]

{ #category : #'tests-expected failures' }
TMooseModelMergeTest >> testSetOfRenameMethodChanges [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRenameMethodChanges notNil.
	self assert: self modelMerger setOfRenameMethodChanges size equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isMethod ] ]).
	self assert: (self modelMerger setOfRenameMethodChanges collect: [ :e | e entity name = 'c3' ]) isNotNil.
	self assert: (self modelMerger setOfRenameMethodChanges collect: [ :e | e targetEntity name = 'd3()' ]) isNotNil
]

{ #category : #'tests-expected failures' }
TMooseModelMergeTest >> testSetOfRenamePackageChanges [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger setOfRenamePackageChanges isNotNil.
	self assert: self modelMerger setOfRenamePackageChanges size equals: (self diff changes count: [ :e | e isRemoval and: [ e entity isPackage ] ]).
	self assert: (self modelMerger setOfRenamePackageChanges collect: [ :e | e entity name = 'Moose-TestResources-ModelDiff-P3' ]) isNotNil.
	self assert: (self modelMerger setOfRenamePackageChanges collect: [ :e | e targetEntity name = 'totoPackage' ]) isNotNil
]
