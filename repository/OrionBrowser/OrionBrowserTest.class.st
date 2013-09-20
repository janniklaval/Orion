Class {
	#name : #OrionBrowserTest,
	#superclass : #ORTest,
	#category : #'OrionBrowser-Test'
}

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddAttribute [

	| asS orionModel  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addAttributNamed: 'attributeTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'attributeTest') isNil.
	self assert: (orionModel entityNamed: 'attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddAttributeNoName [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addAttributNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddClass [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'ClassTest') isNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: 'ClassTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'ClassTest') isNil.
	self assert: (orionModel entityNamed: 'ClassTest') parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddClassNoName [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'ClassTest') isNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddMethod [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'methodTest()') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addMethodNamed: 'methodTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'methodTest()') isNil.
	self assert: (orionModel entityNamed: 'methodTest()') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddMethodNoName [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addMethodNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddPackage [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.

	orionModel addPackageNamed: 'PackageTest'.

	self deny: (orionModel entityNamed: 'PackageTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddPackageNoName [

	| asS orionModel |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.

	orionModel addPackageNamed: nil.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testClassAddInheritance [

	| asS orionModel class |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 1.
	self assert: class superInheritances first to equals: (orionModel entityNamed: 'Smalltalk::Object').

	class addSuperClass: (orionModel entityNamed: 'Smalltalk::Class5') inModel:  orionModel .
	
	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 2.
	self assert: (class superInheritances contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Object')]).
	self assert: (class superInheritances contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class5')]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testClassChangeInheritance [

	| asS orionModel class |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 1.
	self assert: class superInheritances first to equals: (orionModel entityNamed: 'Smalltalk::Object').

	class changeSuperClassTo: (orionModel entityNamed: 'Smalltalk::Class5') inModel:  orionModel .

	class := orionModel entityNamed: 'Smalltalk::Class1'.	
	self assert: (class superInheritances size) equals: 1.
	self assert: (class superInheritances first to) equals: (orionModel entityNamed: 'Smalltalk::Class5').

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteAttribute [

	| asS orionModel att |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self assert: att notNil.

	att deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Object.DependentsFields') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteClass [

	| asS orionModel class |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class notNil.
	class deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteInvocation [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 1.

	meth outgoingInvocations first deleteInModel: orionModel.
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 0.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteMethod [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	

	self assert: meth notNil.

	meth deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeletePackage [

	| asS orionModel pckg |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	pckg := orionModel entityNamed: 'Orion-TestModel-Constellation1'.	

	self assert: pckg notNil.

	pckg deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteReference [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingReferences size equals: 1.

	(meth outgoingReferences first) deleteInModel: orionModel.
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingReferences size equals: 0.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMergePackage [

	| asS orionModel pckg1 pckg2 |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	pckg1 := orionModel entityNamed: 'Orion-TestModel-Constellation1'.	
	pckg2 := orionModel entityNamed: 'Orion-TestModel-Constellation2'.

	self assert: pckg1 childNamedEntities size equals: 5.
	self assert: pckg2 childNamedEntities size equals: 4.

	pckg1 mergePackage: pckg2  inModel: orionModel.

	self assert:  (orionModel entityNamed: 'Orion-TestModel-Constellation1')  equals: nil.
	"self assert:  (orionModel entityNamed: 'Orion-TestModel-Constellation2')  equals: nil.     DOESN'T WORK BECAUSE MATCHES Orion-TestModel-Constellation2Orion-TestModel-Constellation1"

	self deny:  (orionModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') isNil.
	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') childNamedEntities size equals: 9.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMethodAddInvocation [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 1.
	self assert: meth outgoingInvocations first receiver equals: (orionModel entityNamed: 'Smalltalk::Class3').

	meth addInvocationTo: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') asOrderedCollection inModel:  orionModel .
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 2.
	self assert: (meth outgoingInvocations contains: [:inv | inv receiver = (orionModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingInvocations contains: [:inv | inv to size =1 and: [ inv to  first = (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')]]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMethodAddReference [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 1.
	self assert: meth outgoingReferences first to equals: (orionModel entityNamed: 'Smalltalk::Class3').

	meth addReferenceTo: (orionModel entityNamed: 'Smalltalk::Class2') inModel:  orionModel .
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 2.
	self assert: (meth outgoingReferences contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingReferences contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class2')]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveAttribute [

	| asS orionModel att  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self deny: att isNil.
	self assert: att parentType equals: (orionModel entityNamed: 'Smalltalk::Object').	

	att moveTo: (orionModel entityNamed: 'Smalltalk::Class1') inModel: orionModel.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	
	self assert: att isNil.
	
	att := orionModel entityNamed: 'Smalltalk::Class1.DependentsFields'.	
	
	self deny: att isNil.
	self assert: att parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveClass [

	| asS orionModel class |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation1').	

	class moveTo: (orionModel entityNamed: 'Orion-TestModel-Constellation2') inModel: orionModel .

	class := orionModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveMethod [

	| asS orionModel meth |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (orionModel entityNamed: 'Smalltalk::Class5').	

	meth moveTo: (orionModel entityNamed: 'Smalltalk::Class1') inModel: orionModel.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self assert: meth isNil.
	
	meth := orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameAttribute [

	| asS orionModel  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.att1') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1.att1') rename: 'attributeTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1.att1') notNil.
	self deny: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameClass [

	| asS orionModel  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1') rename: 'ClassTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1') notNil.
	self deny: (orionModel entityNamed: 'Smalltalk::ClassTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameMethod [

	| asS orionModel  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') rename: 'methodTest' inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') name equals: 'methodTest'.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenamePackage [

	| asS orionModel  |

	asS := self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1') notNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') rename: 'PackageTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Orion-TestModel-Constellation1') notNil.
	self deny: (orionModel entityNamed: 'PackageTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."
]
