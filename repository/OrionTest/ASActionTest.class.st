Class {
	#name : #ASActionTest,
	#superclass : #ASTest,
	#category : #OrionTest
}

{ #category : #'testing OrionModel' }
ASActionTest >> testAttributeGet [

	|antaresModel asAction |
	
	antaresModel := (ASModel withParent: self model) name: #antaresModel.
	
	self assert: ((antaresModel entityNamed:#'Smalltalk::Class5') extendedMethods isEmpty).

	asAction := ASActionExtendMethod new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: ((antaresModel entityNamed:#'Smalltalk::Class5') extendedMethods notEmpty).
]

{ #category : #'testing OrionModel' }
ASActionTest >> testCreateEntityFrom [
	
	|antaresModel asS oldPackage newPackage|
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	oldPackage := antaresModel entityNamed:#'Orion-TestModel-Constellation2'.
	
	self assert: (antaresModel entityNamed:#'Orion-TestModel-Constellation2') = oldPackage.
	self assert: oldPackage mooseModel = self model.
	
	newPackage := antaresModel createEntityFrom: oldPackage.
	
	self assert: oldPackage mooseModel = self model.
	self assert: newPackage mooseModel = antaresModel.
	self assert: (antaresModel entityNamed:#'Orion-TestModel-Constellation2') = newPackage.
	self assert: (asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') = oldPackage.
	
	self assert: (antaresModel contains: newPackage).
	self deny: (antaresModel contains: oldPackage).
]

{ #category : #'testing OrionModel' }
ASActionTest >> testLookUp [
	
	|antaresModel asSys antaresAction antaresModel2 antaresAction2 |
	
	asSys := self model system.
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	antaresAction := ASActionAddInheritance new
					antaresModel: antaresModel;
					to: (antaresModel entityNamed: 'Smalltalk::Class1');
					from: (antaresModel entityNamed: 'Smalltalk::Class2').
	antaresAction run.

	antaresModel2 := (ASModel withParent: antaresModel) name:  'AsM2'.
	
	antaresAction2 := ASActionAddInheritance new
					antaresModel: antaresModel2;
					to: (antaresModel2 entityNamed: 'Smalltalk::Class1');
					from: (antaresModel2 entityNamed: 'Smalltalk::Class2').
	antaresAction2 run.
	
	self assert: ((antaresModel2 entityNamed:  'Smalltalk::Class1.accessOrion1Class2()') parentType) equals: (antaresModel2 entityNamed: 'Smalltalk::Class1').
	self assert: (antaresModel2 allInheritanceDefinitions collect:[:entity | entity superclass = (antaresModel2 entityNamed: 'Smalltalk::Class1') and:[entity subclass = (antaresModel2 entityNamed: 'Smalltalk::Class2') ] ]) notNil.
	
]

{ #category : #'testing OrionModel' }
ASActionTest >> testModelCreation [
	
	|antaresModel asS|
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	self assert: asS antaresModels size = 2.
	self assert: (asS sourceModel childrenModel includes: antaresModel).
	self assert: antaresModel parentModel = asS sourceModel.
	self assert: antaresModel system = asS.
	self assert: antaresModel sourceLanguage = asS sourceModel sourceLanguage.
	self assert: antaresModel entityStorage size = asS sourceModel entityStorage size.
	self assert: antaresModel entityStorage size ~= 0.
	
]

{ #category : #'testing long' }
ASActionTest >> testMultipleActions [
	
	| antaresModel act|
	antaresModel := self modelNetwork.

	
	act := ASActionMoveClass new
						entity: (antaresModel entityNamed:#'Smalltalk::HTTPSocket');
						newContainer: (antaresModel entityNamed:#'Network-Url');
						runOnNewVersionFrom: antaresModel.
		

	ASActionMoveClass new
						entity: (antaresModel entityNamed:#'Smalltalk::HTTPSocket');
						newContainer: (antaresModel entityNamed:#'Network-Kernel');
						runOnNewVersionFrom: act antaresModel.
						
						
		self expectedFailures.	

]

{ #category : #testing }
ASActionTest >> testOPAddClass [
	
	|mod sys act class|
	sys := self model system. 
	mod := (ASModel withParent: self model) name: #antaresModel.
	
	act := ASActionAddClass new
					antaresModel: mod;
					container: (mod entityNamed:#'Orion-TestModel-Constellation2');
					newName: 'ClassTest'.
	
	self assert: (mod entityNamed: 'Orion-TestModel-Constellation2::ClassTest') isNil.
	self assert: mod changes size = 1.

	act run.
	
	class := mod entityNamed: 'Orion-TestModel-Constellation2::ClassTest'.
	self assert: class notNil.
	self assert: (mod contains: class).
	self deny: (sys sourceModel contains: class).
	
	self assert:(mod  includes: class).
	self deny:(sys sourceModel includes: class).
	
	self assert: class parentPackage equals: (mod entityNamed:#'Orion-TestModel-Constellation2').
	self assert: ((mod entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: class).

	self deny: (((sys sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntitiesAS: sys sourceModel) includes: class).
	
	
	self deny: (((sys sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities) includes: class).
	
	self assert: (mod contains: (mod entityNamed:#'Orion-TestModel-Constellation2')).
	self deny: (sys sourceModel contains: (mod entityNamed:#'Orion-TestModel-Constellation2')).
	
	self assert: (mod size) equals: (sys sourceModel size + 1).

]

{ #category : #testing }
ASActionTest >> testOPAddInheritance [
	
	|antaresModel asS asAction inheritance|
	asS := self model system. 
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddInheritance new
					antaresModel: antaresModel;
					to: (antaresModel entityNamed: 'Smalltalk::Class1');
					from: (antaresModel entityNamed: 'Smalltalk::Class2').
	asAction run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed: 'Smalltalk::Class1')).
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'Smalltalk::Class1')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Smalltalk::Class1')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1')).
	self deny: ((antaresModel entityNamed: 'Smalltalk::Class1') hash =
		(asS sourceModel entityNamed: 'Smalltalk::Class1') hash).
	
	
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1') subInheritances size) equals: 1.
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class2') superInheritances size) equals: 2.
	
	inheritance := (antaresModel entityNamed: 'Smalltalk::Class1') subInheritances at:1.
	
	self assert: (antaresModel contains: inheritance).
	self deny: (asS sourceModel contains: inheritance).
	
	self assert:(antaresModel  includes: inheritance).
	self deny:(asS sourceModel includes: inheritance).
	
	self assert: inheritance subclass equals: (antaresModel entityNamed: 'Smalltalk::Class2').
	self assert: inheritance superclass equals: (antaresModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #testing }
ASActionTest >> testOPAddInvocation [
	
	|antaresModel asS asAction invoc|
	asS := self model system. 
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddInvocation new
					antaresModel: antaresModel;
					from: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
					to: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()').
					
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size) equals: 1.
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size) equals: 0.
	asAction run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size) equals: 2.
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size) equals: 1.
	
	invoc := (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations at:1.
	
	self assert: (antaresModel contains: invoc).
	self deny: (asS sourceModel contains: invoc).
	
	self assert:(antaresModel  includes: invoc).
	self deny:(asS sourceModel includes: invoc).
	
	self assert: (invoc candidates includes: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()')).
	self assert: invoc sender equals: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()').
]

{ #category : #testing }
ASActionTest >> testOPAddMethod [
	
	|antaresModel asS asAction|
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'methodTest';
					container: (antaresModel entityNamed: 'Smalltalk::Class5').
	asAction run.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self assert: (antaresModel contains: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asS sourceModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:(asS sourceModel includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((antaresModel entityNamed: 'Smalltalk::Class5') methods includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asS sourceModel entityNamed: 'Smalltalk::Class5') methods includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(antaresModel entityNamed: 'Smalltalk::Class5.methodTest()') parentPackage = (antaresModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert:(antaresModel entityNamed: 'Smalltalk::Class5.methodTest()') parentType = (antaresModel entityNamed: 'Smalltalk::Class5').

	self assert: antaresModel size equals: (asS sourceModel size + 1)
]

{ #category : #testing }
ASActionTest >> testOPAddNamespace [
	
	|antaresModel asS asAction ns|
	asS := self model system. 
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionAddNamespace new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'NamespaceTest'.
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest') isNil.
	asAction run.
	
	ns := antaresModel entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest'.
	self assert: ns notNil.
	self assert: (antaresModel contains: ns).
	self deny: (asS sourceModel contains: ns).
	
	self assert:(antaresModel  includes: ns).
	self deny:(asS sourceModel includes: ns).
	
	self assert: ns parentPackage equals: (antaresModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert: ((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: ns).
	self deny: ((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: ns).
	
	self assert: (antaresModel size) equals: (asS sourceModel size + 1).
	
]

{ #category : #testing }
ASActionTest >> testOPAddPackage [
	
	|antaresModel asS asAction|
	asS := self model system. 
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionAddPackage new
					antaresModel: antaresModel;
					newName: 'PackageTest'.
	asAction run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed:#'PackageTest')).
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'PackageTest')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed:#'PackageTest')).
	self deny:(asS sourceModel includes: (antaresModel entityNamed:#'PackageTest')).
	
	self assert:(antaresModel entityNamed:#'PackageTest') parentPackage = nil.
	self assert:(antaresModel entityNamed:#'PackageTest') childNamedEntities isEmpty.	

	self assert: (antaresModel size = (asS sourceModel size + 1)).
	
]

{ #category : #testing }
ASActionTest >> testOPAddReference [
	
	|antaresModel asS asAction ref|
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddReference new
					antaresModel: antaresModel;
					from: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
					to: (antaresModel entityNamed: 'Smalltalk::Class5').
					
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size) equals: 1.
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class5') incomingReferences size) equals: 0.
	asAction run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size) equals: 2.
	self assert: ((antaresModel entityNamed: 'Smalltalk::Class5') incomingReferences size) equals: 1.
	
	ref := (antaresModel entityNamed: 'Smalltalk::Class5') incomingReferences at: 1.
	
	self assert: (antaresModel contains: ref).
	self deny: (asS sourceModel contains: ref).
	
	self assert:(antaresModel  includes: ref).
	self deny:(asS sourceModel includes: ref).
	
	self assert: ref target equals: (antaresModel entityNamed: 'Smalltalk::Class5').
	self assert: ref source equals: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()').
]

{ #category : #testing }
ASActionTest >> testOPExtendMethod [
	
	|antaresModel asS asAction |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	
	asAction := ASActionExtendMethod new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (antaresModel entityNamed:#'Smalltalk::Class5').

	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation2').
	
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') extendedInPackages includes: ((antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage)).
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5') extendedInPackages size = 1.
]

{ #category : #testing }
ASActionTest >> testOPMoveClassInNamespace [
	
	|antaresModel asS asAction asAction2 |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name:  'AsM'.

	asAction2 := ASActionAddNamespace new
					antaresModel: antaresModel;
					newName: 'NamespaceTest'.
	asAction2 run.
	
	asAction := ASActionMoveClass new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed: 'Smalltalk::Class5');
					newContainer:(antaresModel entityNamed: 'NamespaceTest').
	asAction run.

	self assert: (antaresModel entityNamed: 'NamespaceTest::Class5') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'NamespaceTest::Class5')).
	
	self deny: (asS sourceModel entityNamed: 'Smalltalk::Class5') = (antaresModel entityNamed: 'NamespaceTest::Class5').
	
	self assert:((antaresModel entityNamed: 'NamespaceTest') types includes: (antaresModel entityNamed: 'NamespaceTest::Class5')).
	self deny:((antaresModel entityNamed: 'Smalltalk') types includes: (antaresModel entityNamed: 'NamespaceTest::Class5')).
	
	self deny:((asS sourceModel entityNamed: 'Smalltalk') types includes: (antaresModel entityNamed: 'Smalltalk::Class5')).
	self deny:((antaresModel entityNamed: 'Smalltalk') types includes: (antaresModel entityNamed: 'NamespaceTest::Class5')).
	self assert:((asS sourceModel entityNamed: 'Smalltalk') types includes: (asS sourceModel entityNamed: 'Smalltalk::Class5')).
	
	self assert:((antaresModel entityNamed: 'NamespaceTest::Class5') methods includes: (antaresModel entityNamed: 'NamespaceTest::Class5.accessOrion2Class3()')).
	
	
	self assert:(antaresModel entityNamed: 'NamespaceTest::Class5') parentPackage = (antaresModel entityNamed: 'Orion-TestModel-Constellation2').
	self assert:(antaresModel entityNamed: 'NamespaceTest::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed: 'Orion-TestModel-Constellation2').
]

{ #category : #testing }
ASActionTest >> testOPMoveClassInPackage [
	
	|antaresModel asS asAction |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.

	asAction := ASActionMoveClass new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (antaresModel entityNamed:#'Smalltalk::Class5') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Smalltalk::Class5')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5') = (antaresModel entityNamed:#'Smalltalk::Class5').
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5')).
	self deny:((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (asS sourceModel entityNamed:#'Smalltalk::Class5')).
	self deny:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (asS sourceModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (asS sourceModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (antaresModel entityNamed:#'Smalltalk::Class5').
]

{ #category : #testing }
ASActionTest >> testOPMoveMethod [
	
	|antaresModel asS asAction |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.

	asAction := ASActionMoveMethod new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(antaresModel entityNamed:#'Smalltalk::Class2').
	asAction run.

	self assert: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') notNil.
	self assert: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') isNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()').
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self deny:((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	
	self assert:((antaresModel entityNamed:#'Smalltalk::Class2') methods includes: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self deny:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self assert:(antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (asS sourceModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') parentType = (antaresModel entityNamed:#'Smalltalk::Class2').
]

{ #category : #testing }
ASActionTest >> testOPMoveNamespaceInNamespace [
	
	|antaresModel asS asAction orionA |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name:  'AsM'.

	orionA := ASActionAddNamespace new
					antaresModel: antaresModel;
					newName: 'NamespaceTest'.
	orionA run.
	
	asAction := ASActionMoveNamespace new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed: 'Smalltalk');
					newContainer:(antaresModel entityNamed: 'NamespaceTest').
	asAction run.

	self assert: (antaresModel entityNamed: 'NamespaceTest::Smalltalk') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed: 'NamespaceTest::Smalltalk')).
	
	self deny: (asS sourceModel entityNamed: 'Smalltalk') = (antaresModel entityNamed: 'NamespaceTest::Smalltalk').
	
	self assert:((antaresModel entityNamed: 'NamespaceTest::Smalltalk') types includes: (antaresModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed: 'Smalltalk') types includes: (antaresModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	
	self assert:((antaresModel entityNamed: 'NamespaceTest') childScopes includes: (antaresModel entityNamed: 'NamespaceTest::Smalltalk')).
	self assert:((antaresModel entityNamed: 'NamespaceTest::Smalltalk') parentScope = (antaresModel entityNamed: 'NamespaceTest')).
	
	self assert:(antaresModel entityNamed: 'NamespaceTest::Smalltalk::Class5') container = (antaresModel entityNamed: 'NamespaceTest::Smalltalk').
]

{ #category : #testing }
ASActionTest >> testOPMoveNamespaceInPackage [
	
	|antaresModel asS asAction |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #antaresModel.
	
	asAction := ASActionMoveNamespace new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	self assert: (antaresModel entityNamed:#'Smalltalk') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Smalltalk')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk') = (antaresModel entityNamed:#'Smalltalk').
	
	self assert:((antaresModel entityNamed:#'Smalltalk') types includes: (antaresModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((asS sourceModel entityNamed:#'Smalltalk') types includes: (antaresModel entityNamed:#'Smalltalk::Class5')).
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') childScopes includes: (antaresModel entityNamed:#'Smalltalk')).
	self assert:((antaresModel entityNamed:#'Smalltalk') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1')).

	self assert:(antaresModel entityNamed:#'Smalltalk::Class5') container = (antaresModel entityNamed:#'Smalltalk::Class5') container.
	self deny:(antaresModel entityNamed:#'Smalltalk::Class5') container = (asS sourceModel entityNamed:#'Smalltalk::Class5') container.
]

{ #category : #testing }
ASActionTest >> testOPMovePackage [
	
	|antaresModel asS asAction |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionMovePackage new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Orion-TestModel-Constellation1');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation2').
	asAction run.

	self assert: (antaresModel entityNamed:#'Orion-TestModel-Constellation1') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self deny: (asS sourceModel entityNamed:#'Orion-TestModel-Constellation1') = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self deny:((asS sourceModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Orion-TestModel-Constellation1')).
	
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation2')).
]

{ #category : #testing }
ASActionTest >> testOPRemoveClass [
	
	|antaresModel asAction asM2 asAction2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTest'.
	asAction run.
	
	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.
	asAction2 := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTest').
	asAction2 run.

	self assert: (antaresModel contains: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTest')).
	self deny: (asM2 contains: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTest')).
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTest')).
	
	self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: #'ClassTest')).
	
	
	self assert: (antaresModel size = (asM2 size + 1)).
]

{ #category : #testing }
ASActionTest >> testOPRemoveClassWithInvocationFrom [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodFrom' ;
					container:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestFrom').
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodTo' ;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo').
	asAction run.

	asAction := ASActionAddInvocation new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()');
					from:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom') isNil.
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom')).
	"self deny:(asM2 includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()') incomingInvocations size equals: 1.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()') incomingInvocations size equals: 0.

	self assert: (antaresModel size) equals: (asM2 size + 3).     "removed: ClassTestFrom , aMethodFrom , Invocation"
]

{ #category : #testing }
ASActionTest >> testOPRemoveClassWithInvocationTo [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodFrom' ;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom') ;
					signature: 'aMethodFrom()'.
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodTo' ;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') ;
					signature: 'aMethodTo()'.
	asAction run.

	asAction := ASActionAddInvocation new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()');
					from:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') isNil.
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo.aMethodTo()') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo')).
	"self deny:(asM2 includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'ClassTestTo'))."
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') outgoingInvocations size equals: 1.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') outgoingInvocations size equals: 0.

	self assert: (antaresModel size) equals: (asM2 size + 3).     "removed: ClassTestTo , aMethodTo , Invocation"
]

{ #category : #testing }
ASActionTest >> testOPRemoveClassWithReferenceFrom [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodFrom' ;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom').
	asAction run.

	asAction := ASActionAddReference new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo');
					from:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom') isNil.
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom')).
	"self deny:(asM2 includes: (antaresModel entityNamed:#'ClassTestFrom'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (asM2 entityNamed:#'ClassTestFrom'))."

	self assert: ((antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') notNil).
	self assert: ((asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') isNil).

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') incomingReferences size equals: 1.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') incomingReferences size equals: 0.

	self assert: (antaresModel size) equals: (asM2 size + 3).   "removed: ClassTestFrom , aMethodFrom , Reference"
]

{ #category : #testing }
ASActionTest >> testOPRemoveClassWithReferenceTo [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestTo'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestFrom'.
	asAction run.

	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'aMethodFrom' ;
					container:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestFrom').
	asAction run.

	asAction := ASActionAddReference new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestTo');
					from:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo')).
	"self deny:(asM2 includes: (antaresModel entityNamed:#'ClassTestTo'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestTo')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'ClassTestTo'))."
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') outgoingReferences size equals: 1.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom.aMethodFrom()') outgoingReferences size equals: 0.

	self assert: (antaresModel size) equals: (asM2 size + 2).    "ClassTestTo , Reference"
]

{ #category : #testing }
ASActionTest >> testOPRemoveInheritance [
	
	|antaresModel  asAction oldInh asM2 asAction2 |
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddInheritance new
					antaresModel: antaresModel;
					to: (antaresModel entityNamed: 'Smalltalk::Class1');
					from: (antaresModel entityNamed: 'Smalltalk::Class2').
	oldInh := asAction run.
	
	
	asM2 := (ASModel withParent: antaresModel) name:  'AsM2'.
	asAction2 := ASActionRemoveInheritance new
					antaresModel: asM2;
					entity: oldInh.
	asAction2 run.
	
	self assert: (antaresModel contains: oldInh).
	self deny: (asM2 contains: oldInh).
	
	self assert:(antaresModel  includes: oldInh).
	self deny:(asM2 includes: oldInh).
	
	self deny: (antaresModel entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	
	self assert: (antaresModel entityNamed: 'Smalltalk::Class2') superInheritances size equals: 2.
	
	self assert: (asM2 entityNamed: 'Smalltalk::Class2') superInheritances size equals: 1.
]

{ #category : #testing }
ASActionTest >> testOPRemoveInheritedClass [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestChild'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestParent'.
	asAction run.

	asAction := ASActionAddInheritance new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent');
					from:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild')).
	"self deny:(asM2 includes: (antaresModel entityNamed:#'ClassTestTo'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'ClassTestTo'))."
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent') subInheritances size equals: 1.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent') subInheritances size equals: 0.

	self assert: (antaresModel size) equals: (asM2 size + 2).      "ClassTestTo , Inheritance"
]

{ #category : #testing }
ASActionTest >> testOPRemoveInvocation [
	
	|antaresModel asAction oldInv asM2 asAction2 |
	
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionAddInvocation new
					antaresModel: antaresModel;
					from: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()');
					to: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion2Class3()').
	oldInv := asAction run.
	
	asM2 := (ASModel withParent: antaresModel) name: #AsM2.
	asAction2 := ASActionRemoveInvocation new
					antaresModel: asM2;
					entity: oldInv.
	asAction2 run.
	
	
	self assert: (antaresModel contains: oldInv).
	self deny: (asM2 contains: oldInv).
	
	self assert:(antaresModel  includes: oldInv).
	self deny:(asM2 includes: oldInv).
	self assert: ((antaresModel entityNamed:#'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self assert: ((antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv).
	
	self deny: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self deny: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv).
]

{ #category : #testing }
ASActionTest >> testOPRemoveMethod [
	
	|antaresModel asAction asM2 asAction2 |
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	asAction := ASActionAddMethod new
					antaresModel: antaresModel;
					newName: 'methodTest';
					container: (antaresModel entityNamed: 'Smalltalk::Class5').
	asAction run.
	
	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.
	asAction2 := ASActionRemoveMethod new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()').
	asAction2 run.


	self assert: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self deny: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	
	self assert: (antaresModel contains: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asM2 contains: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny:(asM2 includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert:((antaresModel entityNamed: 'Smalltalk::Class5') methods includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self deny:((asM2 entityNamed: 'Smalltalk::Class5') methods includes: (antaresModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	
	self assert: antaresModel size equals: (asM2 size + 1).
]

{ #category : #testing }
ASActionTest >> testOPRemoveNamespace [
	| antaresModel asAction asM2 asAction2 |
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	asAction := ASActionAddNamespace new
		antaresModel: antaresModel;
		container: (antaresModel entityNamed:  'Orion-TestModel-Constellation2');
		newName: 'NamespaceTest'.

	asAction run.

	asM2 := (ASModel withParent: antaresModel) name:  'AsM2'.

	asAction2 := ASActionRemoveNamespace new
		antaresModel: asM2;
		entity: (asM2 entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest').
	asAction2 run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: (asM2 contains: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: (antaresModel includes: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: (asM2 includes: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: ((antaresModel entityNamed:  'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	self deny: ((asM2 entityNamed:  'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:  'Orion-TestModel-Constellation2::NamespaceTest')).
	
	self assert: antaresModel size = (asM2 size + 1)
]

{ #category : #testing }
ASActionTest >> testOPRemovePackage [
	
	|antaresModel asAction asM2 asAction2 pckg |
	
	antaresModel := (ASModel withParent: self model) name: 'AsM'.
	
	pckg := antaresModel entityNamed: 'Orion-TestModel-Constellation1'.	
	
	asM2 := (ASModel withParent: antaresModel) name: 'AsM2'.
		
	asAction2 := ASActionRemovePackage new
					antaresModel: asM2 ;
					entity: pckg.

	asAction2 run.
	
	self assert: (antaresModel includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation1')).
	self deny: (asM2 includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation1')).
	
	"self assert:(antaresModel  includes: (antaresModel entityNamed:#'PackageTest')).
	self deny:(asM2 includes: (antaresModel entityNamed:#'PackageTest'))."
	
	self assert: antaresModel size equals: (asM2 size + 15). "Classes and methods have been removed"
	
]

{ #category : #testing }
ASActionTest >> testOPRemoveReference [
	
	|antaresModel asAction oldInh asM2 asAction2 |
	
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	asAction := ASActionAddReference new
					antaresModel: antaresModel;
					from: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()');
					to: (antaresModel entityNamed:#'Smalltalk::Class5').
					
	oldInh := asAction run.
	
	
	asM2 := (ASModel withParent: antaresModel) name: #AsM2.
	asAction2 := ASActionRemoveReference new
					antaresModel: asM2;
					entity: oldInh.
	asAction2 run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asM2 contains: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	self assert:(asM2 includes: (asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()')).
	
	self assert: ((antaresModel entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 2).
	self assert: ((antaresModel entityNamed:#'Smalltalk::Class5') incomingReferences size = 1).
	
	self assert: ((asM2 entityNamed:#'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 1).
	self assert: ((asM2 entityNamed:#'Smalltalk::Class5') incomingReferences size = 0).
	
	self assert:(antaresModel  includes: oldInh).
	self deny:(asM2 includes: oldInh).
]

{ #category : #testing }
ASActionTest >> testOPRemoveSuperClassWithSubInheritance [
	
	|antaresModel asAction asM2 |
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestParent'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'ClassTestChild'.
	asAction run.

	asAction := ASActionAddClass new
					antaresModel: antaresModel;
					container: (antaresModel entityNamed: 'Orion-TestModel-Constellation2');
					newName: 'SuperClassTestParent'.
	asAction run.

	asAction := ASActionAddInheritance new
					antaresModel: antaresModel ;
					to:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestParent');
					from:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestChild').
	asAction run.

	asAction := ASActionAddInheritance new
					antaresModel: antaresModel ;
					from:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::ClassTestParent');
					to:  (antaresModel entityNamed:  'Orion-TestModel-Constellation2::SuperClassTestParent').
	asAction run.

	asM2 := (ASModel withParent: antaresModel) name:  'AsM2'.

	asAction := ASActionRemoveClass new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent').
	asAction run.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent') notNil.
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent') isNil.
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent')).
	"self deny:(asM2 includes: (antaresModel entityNamed: 'ClassTestFrom'))."
	
	self assert:((antaresModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed: 'ClassTestFrom'))."
	
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild') superInheritances first superclass equals: (antaresModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestParent').
	self assert: (asM2 entityNamed: 'Orion-TestModel-Constellation2::ClassTestChild') superInheritances first superclass equals: (asM2 entityNamed: 'Orion-TestModel-Constellation2::SuperClassTestParent').
	
	self assert: (antaresModel size) equals: (asM2 size + 2).         "ClassTestFrom , Inheritance"
]

{ #category : #testing }
ASActionTest >> testOPSafeRemovePackage [
	
	|antaresModel asAction asM2 asAction2 |
	
	antaresModel := (ASModel withParent: self model) name:  'AsM'.
	
	asAction := ASActionAddPackage new
					antaresModel: antaresModel;
					newName: 'PackageTest'.
	asAction run.
	
	asM2 := (ASModel withParent: antaresModel) name:  'AsM2'.
	asAction2 := ASActionSafeRemovePackage new
					antaresModel: asM2;
					entity: (asM2 entityNamed: 'PackageTest').
	asAction2 run.
	
	self assert: (antaresModel contains: (antaresModel entityNamed: 'PackageTest')).
	self deny: (asM2 contains: (antaresModel entityNamed: 'PackageTest')).
	
	self assert:(antaresModel  includes: (antaresModel entityNamed: 'PackageTest')).
	self deny:(asM2 includes: (antaresModel entityNamed: 'PackageTest')).
	
	self assert: antaresModel size equals: (asM2 size + 1)
	
]

{ #category : #testing }
ASActionTest >> testOPUnextendMethod [
	
	|antaresModel asS asAction asAction2 |
	
	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.

	asAction := ASActionExtendMethod new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()');
					newContainer:(antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	asAction run.

	asAction2 := ASActionUnextendMethod new
					antaresModel: antaresModel;
					entity: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	asAction2 run.
	

	self assert: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny: (asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') = (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()').
	
	self deny:((antaresModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((antaresModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self assert:((antaresModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	self deny:((asS sourceModel entityNamed:#'Smalltalk::Class5') methods includes: (antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()')).
	
	self deny:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation1').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (antaresModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentType = (antaresModel entityNamed:#'Smalltalk::Class5').
	
	self assert:(antaresModel entityNamed:#'Smalltalk::Class5') extendedInPackages size = 0.
]

{ #category : #'testing OrionModel' }
ASActionTest >> testParenActions [
	
	| act1 act2 act3 |

	act1 := ASActionAddEntity new
				newName: 'parentAct' ;
				yourself.
	self assert: (act1 childrenActions isEmpty).
	self assert: (act1 isManual).
	
	act2 := ASActionAddEntity new
				newName: '1stChildAct' ;
				parentAction: act1 ;
				yourself.
	self assert: (act1 isManual).
	self deny: (act2 isManual).
	self assert: (act2 parentAction) equals: act1.
	self assert: (act1 childrenActions size) equals: 1.
	
	act3 := ASActionAddEntity new
				newName: '2ndChildAct' ;
				parentAction: act1 ;
				yourself.
	self assert: (act1 childrenActions size) equals: 2.
	
	act2 parentAction: nil.
	self assert: (act2 isManual).
	self assert: (act1 childrenActions size) equals: 1.

]
