Class {
	#name : #ORActionTest,
	#superclass : #ORTest,
	#category : #OrionTest
}

{ #category : #'testing OrionModel' }
ORActionTest >> testAttributeGet [

	|orionModel asAction |
	
	orionModel := (ORModel withParent: self model) name: #orionModel. 
	
	self assert: ((orionModel entityNamed:#'Smalltalk::Class5') extendedMethods isEmpty).

	asAction := ORActionExtendMethod new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: ((orionModel entityNamed:#'Smalltalk::Class5') extendedMethods notEmpty).
]

{ #category : #'testing OrionModel' }
ORActionTest >> testCreateEntityFrom [
	
	|orionModel asS oldPackage newPackage|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	oldPackage := orionModel entityNamed:#'Orion-TestModel-Constellation2'.
	
	self assert: (orionModel entityNamed:#'Orion-TestModel-Constellation2') = oldPackage.
	self assert: oldPackage mooseModel = self model.
	
	newPackage := orionModel createEntityFrom: oldPackage.
	
	self assert: oldPackage mooseModel = self model.
	self assert: newPackage mooseModel = orionModel.
	self assert: (orionModel entityNamed:#'Orion-TestModel-Constellation2') = newPackage.
	self assert: (asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') = oldPackage.
	
	self assert: (orionModel contains: newPackage).
	self deny: (orionModel contains: oldPackage).
]

{ #category : #'testing OrionModel' }
ORActionTest >> testLookUp [
	
	|orionModel asSys orionAction orionModel2 orionAction2 |
	 
	asSys := self model system.
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	orionAction := ORActionAddInheritance new
					orionModel: orionModel;
					to: (orionModel entityNamed: 'Smalltalk::Class1');
					from: (orionModel entityNamed: 'Smalltalk::Class2').
	orionAction run.

	orionModel2 := (ORModel withParent: orionModel) name:  'AsM2'.
	
	orionAction2 := ORActionAddInheritance new
					orionModel: orionModel2;
					to: (orionModel2 entityNamed: 'Smalltalk::Class1');
					from: (orionModel2 entityNamed: 'Smalltalk::Class2').
	orionAction2 run.
	
	self assert: ((orionModel2 entityNamed:  'Smalltalk::Class1.accessOrion1Class2()') parentType) equals: (orionModel2 entityNamed: 'Smalltalk::Class1').
	self assert: (orionModel2 allInheritanceDefinitions collect:[:entity | entity superclass = (orionModel2 entityNamed: 'Smalltalk::Class1') and:[entity subclass = (orionModel2 entityNamed: 'Smalltalk::Class2') ] ]) notNil.
	
]

{ #category : #'testing OrionModel' }
ORActionTest >> testModelCreation [
	
	|orionModel asS|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	self assert: asS orionModels size = 2.
	self assert: (asS sourceModel childrenModel includes: orionModel).
	self assert: orionModel parentModel = asS sourceModel.
	self assert: orionModel system = asS.
	self assert: orionModel sourceLanguage = asS sourceModel sourceLanguage.
	self assert: orionModel entityStorage size = asS sourceModel entityStorage size.
	self assert: orionModel entityStorage size ~= 0.
	
]

{ #category : #'testing long' }
ORActionTest >> testMultipleActions [
	
	| orionModel act|
	orionModel := self modelNetwork.

	
	act := ORActionMoveClass new
						entity: (orionModel entityNamed:#'Smalltalk::Socket');
						newContainer: (orionModel entityNamed:#'Network-Url');
						runOnNewVersionFrom: orionModel.
		

	ORActionMoveClass new
						entity: (orionModel entityNamed:#'Smalltalk::Socket');
						newContainer: (orionModel entityNamed:#'Network-Kernel');
						runOnNewVersionFrom: act orionModel.
						
						
		self expectedFailures.	

]

{ #category : #testing }
ORActionTest >> testOPAddClass [
	
	|mod sys act class|
	sys := self model system. 
	mod := (ORModel withParent: self model) name: #orionModel. 
	
	act := ORActionAddClass new
					orionModel: mod;
					parent: (mod entityNamed:#'Orion-TestModel-Constellation2');
					newName: 'ClassTest';
					postRun .
	
	self assert: (mod entityNamed: ':ClassTest') isNil.
	self assert: mod changes size = 1.

	act run.
	
	class := mod entityNamed: 'ClassTest'.
	self assert: class notNil.
	self assert: (mod contains: class).
	self deny: (sys sourceModel contains: class).
	
	self assert:(mod  includes: class).
	self deny:(sys sourceModel includes: class).
	
	self assert: class parentPackage equals: (mod entityNamed:#'Orion-TestModel-Constellation2').
	self assert: ((mod entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: class).

	self deny: (((sys sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntitiesOR: sys sourceModel) includes: class).
	
	
	self deny: (((sys sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities) includes: class).
	
	self assert: (mod contains: (mod entityNamed:#'Orion-TestModel-Constellation2')).
	self deny: (sys sourceModel contains: (mod entityNamed:#'Orion-TestModel-Constellation2')).
	
	self assert: (mod size) equals: (sys sourceModel size + 1).

]

{ #category : #testing }
ORActionTest >> testOPAddInheritance [
	
	|orionModel asS asAction inheritance|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name: 'AsM'. 
	
	asAction := ORActionAddInheritance new
					orionModel: orionModel;
					to: (orionModel entityNamed: 'Smalltalk::Class1');
					from: (orionModel entityNamed: 'Smalltalk::Class2').
	asAction run.
	
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'Smalltalk::Class1')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1')).
	self deny: ((orionModel entityNamed: 'Smalltalk::Class1') hash =
		(asS sourceModel entityNamed: 'Smalltalk::Class1') hash).
	
	
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1') subInheritances size) equals: 1.
	self assert: ((orionModel entityNamed: 'Smalltalk::Class2') superInheritances size) equals: 2.
	
	inheritance := (orionModel entityNamed: 'Smalltalk::Class1') subInheritances at:1.
	
	self assert: (orionModel contains: inheritance).
	self deny: (asS sourceModel contains: inheritance).
	
	self assert:(orionModel  includes: inheritance).
	self deny:(asS sourceModel includes: inheritance).
	
	self assert: inheritance subclass equals: (orionModel entityNamed: 'Smalltalk::Class2').
	self assert: inheritance superclass equals: (orionModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #testing }
ORActionTest >> testOPAddInvocation [
	
	|orionModel asS asAction invoc|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name:  'AsM'. 
	
	asAction := ORActionAddInvocation new
					orionModel: orionModel;
					from: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
					candidates: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') asOrderedCollection .
					
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size) equals: 1.
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size) equals: 0.
	asAction run.
	
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size) equals: 2.
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size) equals: 1.
	
	invoc := (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations at:1.
	
	self assert: (orionModel contains: invoc).
	self deny: (asS sourceModel contains: invoc).
	
	self assert:(orionModel  includes: invoc).
	self deny:(asS sourceModel includes: invoc).
	
	self assert: (invoc candidates includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()')).
	self assert: invoc sender equals: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()').
]

{ #category : #testing }
ORActionTest >> testOPAddMethod [
	
	|orionModel asS asAction|
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name:  'AsM'. 
	
	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'methodTest';
					container: (orionModel entityNamed: 'Smalltalk::Class5').
	asAction run.

	self assert: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asS sourceModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:(asS sourceModel includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((orionModel entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asS sourceModel entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(orionModel entityNamed: 'Smalltalk::Class5.methodTest()') parentPackage = (orionModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert:(orionModel entityNamed: 'Smalltalk::Class5.methodTest()') parentType = (orionModel entityNamed: 'Smalltalk::Class5').

	self assert: orionModel size equals: (asS sourceModel size + 1)
]

{ #category : #testing }
ORActionTest >> testOPAddNamespace [
	
	|orionModel asS asAction ns|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name: #AsM. 
	
	asAction := ORActionAddNamespace new
					orionModel: orionModel;
					container: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'NamespaceTest'.
	
	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest') isNil.
	asAction run.
	
	ns := orionModel entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest'.
	self assert: ns notNil.
	self assert: (orionModel contains: ns).
	self deny: (asS sourceModel contains: ns).
	
	self assert:(orionModel  includes: ns).
	self deny:(asS sourceModel includes: ns).
	
	self assert: ns parentScope equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert: ((orionModel entityNamed:#'Orion-TestModel-Constellation2') childScopes includes: ns).
	self deny: ((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childScopes includes: ns).
	
	self assert: (orionModel size) equals: (asS sourceModel size + 1).
	
]

{ #category : #testing }
ORActionTest >> testOPAddPackage [
	
	|orionModel asS asAction|
	asS := self model system. 
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	asAction := ORActionAddPackage new
					orionModel: orionModel;
					newName: 'PackageTest'.
	asAction run.
	
	self assert: (orionModel contains: (orionModel entityNamed:#'PackageTest')).
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'PackageTest')).
	
	self assert:(orionModel  includes: (orionModel entityNamed:#'PackageTest')).
	self deny:(asS sourceModel includes: (orionModel entityNamed:#'PackageTest')).
	
	self assert:(orionModel entityNamed:#'PackageTest') parentPackage = nil.
	self assert:(orionModel entityNamed:#'PackageTest') childNamedEntities isEmpty.	

	self assert: (orionModel size = (asS sourceModel size + 1)).
	
]

{ #category : #testing }
ORActionTest >> testOPAddReference [
	
	|orionModel asS asAction ref|
	asS := self model system.
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	asAction := ORActionAddReference new
					orionModel: orionModel;
					from: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
					to: (orionModel entityNamed: 'Smalltalk::Class5').
					
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size) equals: 1.
	self assert: ((orionModel entityNamed: 'Smalltalk::Class5') incomingReferences size) equals: 0.
	asAction run.
	
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size) equals: 2.
	self assert: ((orionModel entityNamed: 'Smalltalk::Class5') incomingReferences size) equals: 1.
	
	ref := (orionModel entityNamed: 'Smalltalk::Class5') incomingReferences at: 1.
	
	self assert: (orionModel contains: ref).
	self deny: (asS sourceModel contains: ref).
	
	self assert:(orionModel  includes: ref).
	self deny:(asS sourceModel includes: ref).
	
	self assert: ref target equals: (orionModel entityNamed: 'Smalltalk::Class5').
	self assert: ref source equals: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()').
]

{ #category : #testing }
ORActionTest >> testOPChangeInheritance [
	
	|orionModel  asM2 |
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	self assert: (orionModel entityNamed: 'Smalltalk::Class1') superclass equals: (orionModel entityNamed: 'Smalltalk::Object').
	asM2 := (ORModel withParent: orionModel) name:  'AsM2'.
	
	(orionModel entityNamed: 'Smalltalk::Class1') changeSuperClassTo: (orionModel entityNamed: 'Smalltalk::Class2') inModel: asM2.
			

	self assert: (asM2 entityNamed: 'Smalltalk::Class1') superclass equals: (asM2 entityNamed: 'Smalltalk::Class2').
	
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') superInheritances size equals: 1.
	

]

{ #category : #testing }
ORActionTest >> testOPExtendMethod [
	
	|orionModel asS asAction |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM. 
	
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	
	asAction := ORActionExtendMethod new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (orionModel entityNamed:#'Smalltalk::Class5').

	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation2').
	
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	self assert:(orionModel entityNamed:#'Smalltalk::Class5') extendedInPackages size = 1.
]

{ #category : #testing }
ORActionTest >> testOPMoveClassInNamespace [
	
	|orionModel asS asAction asAction2 |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	asAction2 := ORActionAddNamespace new
					orionModel: orionModel;
					newName: 'NamespaceTest'.
	asAction2 run.
	
	asAction := ORActionMoveClass new
					orionModel: orionModel;
					entity: (orionModel entityNamed: 'Smalltalk::Class5');
					newContainer:(orionModel entityNamed: 'NamespaceTest').
	asAction run.

	self assert: (orionModel entityNamed: 'NamespaceTest::Class5') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'NamespaceTest::Class5')).
	
	self deny: (asS sourceModel entityNamed: 'Smalltalk::Class5') = (orionModel entityNamed: 'NamespaceTest::Class5').
	
	self assert:((orionModel entityNamed: 'NamespaceTest') types includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self deny:((orionModel entityNamed: 'Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	
	self deny:((asS sourceModel entityNamed: 'Smalltalk') types includes: (orionModel entityNamed: 'Smalltalk::Class5')).
	self deny:((orionModel entityNamed: 'Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self assert:((asS sourceModel entityNamed: 'Smalltalk') types includes: (asS sourceModel entityNamed: 'Smalltalk::Class5')).
	
	self assert:((orionModel entityNamed: 'NamespaceTest::Class5') methods includes: (orionModel entityNamed: 'NamespaceTest::Class5.accessOrion2Class3()')).
	
	
	self assert:(orionModel entityNamed: 'NamespaceTest::Class5') parentPackage = (orionModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert:(orionModel entityNamed: 'NamespaceTest::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed: 'Orion-TestModel-Constellation2').
]

{ #category : #testing }
ORActionTest >> testOPMoveClassInPackage [
	
	|orionModel asS asAction |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM. 

	asAction := ORActionMoveClass new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (orionModel entityNamed:#'Smalltalk::Class5') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Smalltalk::Class5')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5') = (orionModel entityNamed:#'Smalltalk::Class5').
	
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5')).
	self deny:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (asS sourceModel entityNamed:#'Smalltalk::Class5')).
	self deny:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (asS sourceModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	
	self assert:(orionModel entityNamed:#'Smalltalk::Class5') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (asS sourceModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (orionModel entityNamed:#'Smalltalk::Class5').
]

{ #category : #testing }
ORActionTest >> testOPMoveMethod [
	
	|orionModel asS asAction |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.

	asAction := ORActionMoveMethod new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(orionModel entityNamed:#'Smalltalk::Class2').
	asAction run.

	self assert: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') notNil.
	self assert: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') isNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()').
	
	"self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self deny:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()'))."
	
	self assert:((orionModel entityNamed:#'Smalltalk::Class2') methods includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self deny:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	"self assert:(orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (asS sourceModel entityNamed:#'Orion-TestModel-Constellation2')."
	self assert:(orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') parentType = (orionModel entityNamed:#'Smalltalk::Class2').
]

{ #category : #testing }
ORActionTest >> testOPMoveNamespaceInNamespace [
	
	|orionModel asS asAction orionA |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name:  'AsM'.

	orionA := ORActionAddNamespace new
					orionModel: orionModel;
					newName: 'NamespaceTest'.
	orionA run.
	
	asAction := ORActionMoveNamespace new
					orionModel: orionModel;
					entity: (orionModel entityNamed: 'Smalltalk');
					newContainer:(orionModel entityNamed: 'NamespaceTest').
	asAction run.

	self assert: (orionModel entityNamed: 'NamespaceTest::Smalltalk') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'NamespaceTest::Smalltalk')).
	
	self deny: (asS sourceModel entityNamed: 'Smalltalk') = (orionModel entityNamed: 'NamespaceTest::Smalltalk').
	
	self assert:((orionModel entityNamed: 'NamespaceTest::Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed: 'Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	
	self assert:((orionModel entityNamed: 'NamespaceTest') childScopes includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk')).
	self assert:((orionModel entityNamed: 'NamespaceTest::Smalltalk') parentScope = (orionModel entityNamed: 'NamespaceTest')).
	
	self assert:(orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5') container = (orionModel entityNamed: 'NamespaceTest::Smalltalk').
]

{ #category : #testing }
ORActionTest >> testOPMoveNamespaceInPackage [
	
	|orionModel asS asAction |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #orionModel.
	
	asAction := ORActionMoveNamespace new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (orionModel entityNamed:#'Smalltalk') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Smalltalk')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk') = (orionModel entityNamed:#'Smalltalk').
	
	self assert:((orionModel entityNamed:#'Smalltalk') types includes: (orionModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed:#'Smalltalk') types includes: (orionModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childScopes includes: (orionModel entityNamed:#'Smalltalk')).
	self assert:((orionModel entityNamed:#'Smalltalk') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1')).

	self assert:(orionModel entityNamed:#'Smalltalk::Class5') container = (orionModel entityNamed:#'Smalltalk::Class5') container.
	self deny:(orionModel entityNamed:#'Smalltalk::Class5') container = (asS sourceModel entityNamed:#'Smalltalk::Class5') container.
]

{ #category : #testing }
ORActionTest >> testOPMovePackage [
	
	|orionModel asS asAction |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	asAction := ORActionMovePackage new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Orion-TestModel-Constellation1');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation2').
	asAction run.

	self assert: (orionModel entityNamed:#'Orion-TestModel-Constellation1') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self deny: (asS sourceModel entityNamed:#'Orion-TestModel-Constellation1') = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self deny:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation2')).
]

{ #category : #testing }
ORActionTest >> testOPRemoveClass [
	
	|orionModel asAction asM2 asAction2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTest'.
	asAction run.
	
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTest').
	asAction2 run.

	self assert: (orionModel contains: (orionModel entityNamed: 'ClassTest')).
	self deny: (asM2 contains: (orionModel entityNamed: 'ClassTest')).
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTest')).
	
	self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: #'ClassTest')).
	
	
	self assert: (orionModel size = (asM2 size + 1)).
]

{ #category : #testing }
ORActionTest >> testOPRemoveClassWithInvocationFrom [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodFrom' ;
					container:  (orionModel entityNamed:  'ClassTestFrom').
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodTo' ;
					container:  (orionModel entityNamed: 'ClassTestTo').
	asAction run.

	asAction := ORActionAddInvocation new
					orionModel: orionModel ;
					candidates:  (orionModel entityNamed: 'ClassTestTo.aMethodTo()') asOrderedCollection ; "candidates is a collection of candidates methods and manage as such in the run"
					from:  (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestFrom').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestFrom') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom') isNil.
	
	self assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:(asM2 includes: (orionModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	
	self assert: (orionModel entityNamed: 'ClassTestTo.aMethodTo()') incomingInvocations size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestTo.aMethodTo()') incomingInvocations size equals: 0.

	self assert: (orionModel size) equals: (asM2 size + 3).     "removed: ClassTestFrom , aMethodFrom , Invocation"
]

{ #category : #testing }
ORActionTest >> testOPRemoveClassWithInvocationTo [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodFrom' ;
					container:  (orionModel entityNamed:  'ClassTestFrom');
					signature: 'aMethodFrom()'.
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodTo' ;
					container:  (orionModel entityNamed: 'ClassTestTo') ;
					signature: 'aMethodTo()'.
	asAction run.

	asAction := ORActionAddInvocation new
					orionModel: orionModel ;
					candidates:  (orionModel entityNamed: 'ClassTestTo.aMethodTo()') asOrderedCollection ; "candidates is a collection of candidates methods and manage as such in the run"
					from:  (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestTo').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestTo') notNil.
	self assert: (asM2 entityNamed: 'ClassTestTo') isNil.
	
	self assert: (orionModel entityNamed: 'ClassTestTo.aMethodTo()') notNil.
	self assert: (asM2 entityNamed: 'ClassTestTo.aMethodTo()') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestTo')).
	"self deny:(asM2 includes: (orionModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestTo')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'ClassTestTo'))."
	
	self assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') outgoingInvocations size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') outgoingInvocations size equals: 0.

	self assert: (orionModel size) equals: (asM2 size + 3).     "removed: ClassTestTo , aMethodTo , Invocation"
]

{ #category : #testing }
ORActionTest >> testOPRemoveClassWithReferenceFrom [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodFrom' ;
					container:  (orionModel entityNamed:  'ClassTestFrom').
	asAction run.

	asAction := ORActionAddReference new
					orionModel: orionModel ;
					to:  (orionModel entityNamed: 'ClassTestTo');
					from:  (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestFrom').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestFrom') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom') isNil.
	
	self assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:(asM2 includes: (orionModel entityNamed:#'ClassTestFrom'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (asM2 entityNamed:#'ClassTestFrom'))."

	self assert: ((orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') notNil).
	self assert: ((asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') isNil).

	self assert: (orionModel entityNamed: 'ClassTestTo') incomingReferences size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestTo') incomingReferences size equals: 0.

	self assert: (orionModel size) equals: (asM2 size + 3).   "removed: ClassTestFrom , aMethodFrom , Reference"
]

{ #category : #testing }
ORActionTest >> testOPRemoveClassWithReferenceTo [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name: #AsM.
	
		asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'aMethodFrom' ;
					container:  (orionModel entityNamed:  'ClassTestFrom').
	asAction run.
	
	asAction := ORActionAddReference new
					orionModel: orionModel ;
					to:  (orionModel entityNamed:  'ClassTestTo');
					from:  (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestTo').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestTo') notNil.
	self assert: (asM2 entityNamed: 'ClassTestTo') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestTo')).
	"self deny:(asM2 includes: (orionModel entityNamed:#'ClassTestTo'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestTo')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'ClassTestTo'))."
	
	self assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') outgoingReferences size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') outgoingReferences size equals: 0.

	self assert: (orionModel size) equals: (asM2 size + 2).    "ClassTestTo , Reference"
]

{ #category : #testing }
ORActionTest >> testOPRemoveInheritance [
	
	|orionModel  asAction oldInh asM2 asAction2 |
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	asAction := ORActionAddInheritance new
					orionModel: orionModel;
					to: (orionModel entityNamed: 'Smalltalk::Class1');
					from: (orionModel entityNamed: 'Smalltalk::Class2').
	oldInh := asAction run.
	
	
	asM2 := (ORModel withParent: orionModel) name:  'AsM2'.
	asAction2 := ORActionRemoveInheritance new
					orionModel: asM2;
					entity: oldInh.
	asAction2 run.
	
	self assert: (orionModel contains: oldInh).
	self deny: (asM2 contains: oldInh).
	
	self assert:(orionModel  includes: oldInh).
	self deny:(asM2 includes: oldInh).
	
	self deny: (orionModel entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	
	self assert: (orionModel entityNamed: 'Smalltalk::Class2') superInheritances size equals: 2.
	
	self assert: (asM2 entityNamed: 'Smalltalk::Class2') superInheritances size equals: 1.
]

{ #category : #testing }
ORActionTest >> testOPRemoveInheritedClass [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestChild'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent:  (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestParent'.
	asAction run.

	asAction := ORActionAddInheritance new
					orionModel: orionModel ;
					to:  (orionModel entityNamed: 'ClassTestParent');
					from:  (orionModel entityNamed: 'ClassTestChild').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestChild').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestChild') notNil.
	self assert: (asM2 entityNamed: 'ClassTestChild') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:(asM2 includes: (orionModel entityNamed:#'ClassTestTo'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'ClassTestTo'))."
	
	self assert: (orionModel entityNamed: 'ClassTestParent') subInheritances size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestParent') subInheritances size equals: 0.

	self assert: (orionModel size) equals: (asM2 size + 2).      "ClassTestTo , Inheritance"
]

{ #category : #testing }
ORActionTest >> testOPRemoveInvocation [
	
	|orionModel asAction oldInv asM2 asAction2 |
	
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	asAction := ORActionAddInvocation new
					orionModel: orionModel;
					from: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()');
					"candidates is a collection of candidates methods and manage as such in the run"
					candidates: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion2Class3()')asOrderedCollection.
	oldInv := asAction run.
	
	asM2 := (ORModel withParent: orionModel) name: #AsM2.
	asAction2 := ORActionRemoveInvocation new
					orionModel: asM2;
					entity: oldInv.
	asAction2 run.
	
	
	self assert: (orionModel contains: oldInv).
	self deny: (asM2 contains: oldInv).
	
	self assert:(orionModel  includes: oldInv).
	self deny:(asM2 includes: oldInv).
	self assert: ((orionModel entityNamed:#'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self assert: ((orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv).
	
	self deny: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self deny: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv).
]

{ #category : #testing }
ORActionTest >> testOPRemoveMethod [
	
	|orionModel asAction asM2 asAction2 |
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	asAction := ORActionAddMethod new
					orionModel: orionModel;
					newName: 'methodTest';
					container: (orionModel entityNamed: 'Smalltalk::Class5').
	asAction run.
	
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveMethod new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()').
	asAction2 run.


	self assert: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self deny: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asM2 contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:(asM2 includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((orionModel entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self deny:((asM2 entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert: orionModel size equals: (asM2 size + 1).
]

{ #category : #testing }
ORActionTest >> testOPRemoveNamespace [
	| orionModel asAction asM2 asAction2 |
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	asAction := ORActionAddNamespace new
		orionModel: orionModel;
		container: (orionModel entityNamed:  'Orion-TestModel-Constellation2');
		newName: 'NamespaceTest'.

	asAction run.

	asM2 := (ORModel withParent: orionModel) name:  'AsM2'.

	asAction2 := ORActionRemoveNamespace new
		orionModel: asM2;
		entity: (asM2 entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest').
	asAction2 run.
	
	self assert: (orionModel contains: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: (asM2 contains: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: (orionModel includes: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: (asM2 includes: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: ((orionModel entityNamed:  'Orion-TestModel-Constellation2') childScopes  includes: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: ((asM2 entityNamed:  'Orion-TestModel-Constellation2') childScopes includes: (orionModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: orionModel size = (asM2 size + 1)
]

{ #category : #testing }
ORActionTest >> testOPRemovePackage [
	
	|orionModel asAction asM2 asAction2 pckg |
	
	orionModel := (ORModel withParent: self model) name: 'AsM'.
	
	pckg := orionModel entityNamed: 'Orion-TestModel-Constellation1'.	
	
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
		
	asAction2 := ORActionRemovePackage new
					orionModel: asM2 ;
					entity: pckg.

	asAction2 run.
	
	self assert: (orionModel includes: (orionModel entityNamed: 'Orion-TestModel-Constellation1')).
	self deny: (asM2 includes: (orionModel entityNamed: 'Orion-TestModel-Constellation1')).
	
	"self assert:(orionModel  includes: (orionModel entityNamed:#'PackageTest')).
	self deny:(asM2 includes: (orionModel entityNamed:#'PackageTest'))."
	
	self assert: orionModel size equals: (asM2 size + 15). "Classes and methods have been removed"
	
]

{ #category : #testing }
ORActionTest >> testOPRemoveReference [
	
	|orionModel asAction oldInh asM2 asAction2 |
	
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	asAction := ORActionAddReference new
					orionModel: orionModel;
					from: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()');
					to: (orionModel entityNamed:#'Smalltalk::Class5').
					
	oldInh := asAction run.
	
	
	asM2 := (ORModel withParent: orionModel) name: #AsM2.
	asAction2 := ORActionRemoveReference new
					orionModel: asM2;
					entity: oldInh.
	asAction2 run.
	
	self assert: (orionModel contains: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asM2 contains: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(orionModel  includes: (orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asM2 includes: (asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((orionModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 2).
	self assert: ((orionModel entityNamed:#'Smalltalk::Class5') incomingReferences size = 1).
	
	self assert: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 1).
	self assert: ((asM2 entityNamed:#'Smalltalk::Class5') incomingReferences size = 0).
	
	self assert:(orionModel  includes: oldInh).
	self deny:(asM2 includes: oldInh).
]

{ #category : #testing }
ORActionTest >> testOPRemoveSuperClassWithSubInheritance [
	
	|orionModel asAction asM2 |
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestParent'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestChild'.
	asAction run.

	asAction := ORActionAddClass new
					orionModel: orionModel;
					parent: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'SuperClassTestParent'.
	asAction run.

	asAction := ORActionAddInheritance new
					orionModel: orionModel ;
					to:  (orionModel entityNamed:  'ClassTestParent');
					from:  (orionModel entityNamed:  'ClassTestChild').
	asAction run.

	asAction := ORActionAddInheritance new
					orionModel: orionModel ;
					from:  (orionModel entityNamed:  'ClassTestParent');
					to:  (orionModel entityNamed:  'SuperClassTestParent').
	asAction run.

	asM2 := (ORModel withParent: orionModel) name:  'AsM2'.

	asAction := ORActionRemoveClass new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'ClassTestParent').
	asAction run.

	self assert: (orionModel entityNamed: 'ClassTestParent') notNil.
	self assert: (asM2 entityNamed: 'ClassTestParent') isNil.
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'ClassTestParent')).
	"self deny:(asM2 includes: (orionModel entityNamed: 'ClassTestFrom'))."
	
	self assert:((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestFrom'))."
	
	self assert: (orionModel entityNamed: 'ClassTestChild') superInheritances first superclass equals: (orionModel entityNamed: 'ClassTestParent').
	self assert: (asM2 entityNamed: 'ClassTestChild') superInheritances first superclass equals: (asM2 entityNamed: 'SuperClassTestParent').
	
	self assert: (orionModel size) equals: (asM2 size + 2).         "ClassTestFrom , Inheritance"
]

{ #category : #testing }
ORActionTest >> testOPSafeRemovePackage [
	
	|orionModel asAction asM2 asAction2 |
	
	orionModel := (ORModel withParent: self model) name:  'AsM'.
	
	asAction := ORActionAddPackage new
					orionModel: orionModel;
					newName: 'PackageTest'.
	asAction run.
	
	asM2 := (ORModel withParent: orionModel) name:  'AsM2'.
	asAction2 := ORActionSafeRemovePackage new
					orionModel: asM2;
					entity: (asM2 entityNamed: 'PackageTest').
	asAction2 run.
	
	self assert: (orionModel contains: (orionModel entityNamed: 'PackageTest')).
	self deny: (asM2 contains: (orionModel entityNamed: 'PackageTest')).
	
	self assert:(orionModel  includes: (orionModel entityNamed: 'PackageTest')).
	self deny:(asM2 includes: (orionModel entityNamed: 'PackageTest')).
	
	self assert: orionModel size equals: (asM2 size + 1)
	
]

{ #category : #testing }
ORActionTest >> testOPUnextendMethod [
	
	|orionModel asS asAction asAction2 |
	
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.

	asAction := ORActionExtendMethod new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(orionModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	asAction2 := ORActionUnextendMethod new
					orionModel: orionModel;
					entity: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	asAction2 run.
	

	self assert: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	
	self deny:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((orionModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') methods includes: (orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(orionModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (orionModel entityNamed:#'Smalltalk::Class5').
	
	self assert:(orionModel entityNamed:#'Smalltalk::Class5') extendedInPackages size = 0.
]

{ #category : #'testing OrionModel' }
ORActionTest >> testParenActions [
	
	| act1 act2 act3 |

	act1 := ORActionAddEntity new
				newName: 'parentAct' ;
				yourself.
	self assert: (act1 childrenActions isEmpty).
	self assert: (act1 isManual).
	
	act2 := ORActionAddEntity new
				newName: '1stChildAct' ;
				parentAction: act1 ;
				yourself.
	self assert: (act1 isManual).
	self deny: (act2 isManual).
	self assert: (act2 parentAction) equals: act1.
	self assert: (act1 childrenActions size) equals: 1.
	
	act3 := ORActionAddEntity new
				newName: '2ndChildAct' ;
				parentAction: act1 ;
				yourself.
	self assert: (act1 childrenActions size) equals: 2.
	
	act2 parentAction: nil.
	self assert: (act2 isManual).
	self assert: (act1 childrenActions size) equals: 1.

]
