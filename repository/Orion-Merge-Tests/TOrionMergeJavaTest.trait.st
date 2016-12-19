"
trait to see with test is failling
"
Trait {
	#name : #TOrionMergeJavaTest,
	#category : #'Orion-Merge-Tests'
}

{ #category : #tests }
TOrionMergeJavaTest >> test [
	"comment stating purpose of message"

	self assert: modelMerger baseModel notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace [
	"The parent namespace is a stub and does not already exist in the model"

	| ns nsc |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	nsc := FAMIXNamespace new
		name: 'NamespaceCont2';
		isStub: true;
		parentScope: ns;
		yourself.
	modelMerger targetModel add: nsc.
	modelMerger run. 
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: nsc.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') isNotNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') isStub.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2::NamespaceCont2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') notNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') parentScope equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace2 [
	"The parent namespace is not a stub and already exist in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope:
			(modelMerger targetModel entityNamed: 'NamespaceTest') yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger 
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self
		assert: (modelMerger baseModel entityNamed: 'NamespaceTest::Namespace2') isNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::Namespace2') notNil.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'NamespaceTest::Namespace2') parentScope
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace3 [
	"The parent namespace is a stub and already exists in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (modelMerger targetModel entityNamed: 'java') yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self
		assert: (modelMerger baseModel entityNamed: 'java::Namespace2') isNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::Namespace2')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::Namespace2')
				parentScope
		equals: (modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddInheritance [
	| c1 c2 inh |
	c1 := modelMerger targetModel entityNamed: 'NamespaceTest::Class1'.
	c2 := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	inh := FAMIXInheritance new
		superclass: c1;
		subclass: c2;
		yourself.
	modelMerger targetModel add: inh.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddInheritance.
	modelMerger orionVersionedModel
		addInheritanceFrom: modelMerger result setOfAddInheritanceChanges first entity from
		to: modelMerger result setOfAddInheritanceChanges first entity to.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
				superInheritances notEmpty.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') subInheritances
				notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReference [
	| cl meth ref changedReference |
	cl := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()'.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	modelMerger targetModel add: ref.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	changedReference := modelMerger result setOfAddReferenceChanges first entity.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel addReferenceFrom: changedReference from to: changedReference to.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isNotEmpty.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences first to
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReference2 [
	| cl meth ref |
	cl := modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := FAMIXMethod new
		signature: 'methAdded()';
		name: 'methAdded';
		parentType: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	modelMerger targetModel add: meth.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	modelMerger targetModel add: ref.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel
		addReferenceFrom: modelMerger result setOfAddReferenceChanges first entity from
		to: modelMerger result setOfAddReferenceChanges first entity to.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences notEmpty.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()') outgoingReferences first to
		equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceFromMethOfAnonymousClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'AnonymousClass';
		container:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1.supersimple()');
		yourself.
	modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInAnonymousClass';
		name: 'methInAnonymousClass';
		parentType:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1.supersimple()::AnonymousClass');
		yourself.
	modelMerger targetModel add: meth.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1')
				incomingReferences isEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceFromMethOfInnerClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'InnerClass';
		container: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInInnerClass';
		name: 'methInInnerClass';
		parentType:
			(modelMerger targetModel
				entityNamed: 'NamespaceTest::Class1::InnerClass');
		yourself.
	modelMerger targetModel add: meth.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(modelMerger targetModel entityNamed: 'NamespaceTest::Class1')
				incomingReferences isEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceToStubClass [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences isEmpty.
	modelMerger orionVersionedModel addReferenceFrom: (modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()') toStub: cl.
	self assert: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()') outgoingReferences notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClass [
	| cl stubClass |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self assert: (modelMerger baseModel entityNamed: 'NamespaceTest::ClassTest') isNil.
	stubClass := modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ClassTest'.
	self assert: stubClass isNotNil.
	self assert: stubClass isStub.
	self assert: stubClass container equals: (modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClassInExistingStubNS [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (modelMerger targetModel entityNamed: 'java');
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self
		assert: (modelMerger baseModel entityNamed: 'java::ClassTest') isNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::ClassTest')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'java::ClassTest')
				container
		equals: (modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClassInNonExistingStubNS [
	| cl ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: ns;
		yourself.
	modelMerger targetModel add: cl.
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubClass: cl.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self
		assert: (modelMerger baseModel entityNamed: 'Namespace2::ClassTest') isNil.
	self
		assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest')
				notNil.
	self
		assert:
			(modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest')
				container
		equals: (modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubNamespace [
	| ns stubNamespace |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	modelMerger targetModel add: ns.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	stubNamespace := modelMerger orionVersionedModel entityNamed: 'Namespace2'.
	self assert: stubNamespace isNotNil.
	self assert: stubNamespace isStub
]

{ #category : #tests }
TOrionMergeJavaTest >> testCreateAddNamespace [
	modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: modelMerger baseModel notEmpty.
	modelMerger run.
	modelMerger orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self assert: (modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil
]

{ #category : #tests }
TOrionMergeJavaTest >> testCreateMoveNamespace [
	(modelMerger targetModel
		entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (modelMerger targetModel entityNamed: 'java').
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createMoveNamespace.
	self
		assert:
			(modelMerger baseModel
				entityNamed: 'NamespaceTest::ContainedNamespace') parentScope name
		equals: 'NamespaceTest'.
	self
		assert:
			(modelMerger orionVersionedModel
				entityNamed: 'java::ContainedNamespace') parentScope name
		equals: 'java'
]

{ #category : #tests }
TOrionMergeJavaTest >> testSetOfAddNamespace [
	modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: modelMerger baseModel isNotEmpty.
	modelMerger run.
	self assert: modelMerger result setOfAddScopingEntityChanges isNotNil.
	self assert: modelMerger result setOfAddScopingEntityChanges size equals: 1
]

{ #category : #tests }
TOrionMergeJavaTest >> testSetOfMoveNamespaceChanges [
	(modelMerger targetModel
		entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (modelMerger targetModel entityNamed: 'java').
	modelMerger run.
	modelMerger
		orionVersionedModel: modelMerger baseModel createNewChildVersion.
	self assert: modelMerger result setOfMoveNamespaceChanges notNil.
	self assert: modelMerger result setOfMoveNamespaceChanges size equals: 1
]
