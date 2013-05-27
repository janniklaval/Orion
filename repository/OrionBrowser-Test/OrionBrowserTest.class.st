Class {
	#name : #OrionBrowserTest,
	#superclass : #ASTest,
	#category : #'OrionBrowser-Test'
}

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddAttribute [

	| asS antaresModel  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(antaresModel entityNamed: 'Smalltalk::Class1') addAttributNamed: 'attributeTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddAttributeNoName [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(antaresModel entityNamed: 'Smalltalk::Class1') addAttributNamed: nil inModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddClass [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') isNil.

	(antaresModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: 'ClassTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') isNil.
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') parentPackage equals: (antaresModel entityNamed: 'Orion-TestModel-Constellation1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddClassNoName [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'ClassTest') isNil.

	(antaresModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: nil inModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddMethod [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.

	(antaresModel entityNamed: 'Smalltalk::Class1') addMethodNamed: 'methodTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1')
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddMethodNoName [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.

	(antaresModel entityNamed: 'Smalltalk::Class1') addMethodNamed: nil inModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddPackage [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'PackageTest') isNil.

	antaresModel addPackageNamed: 'PackageTest'.

	self deny: (antaresModel entityNamed: 'PackageTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testAddPackageNoName [

	| asS antaresModel |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'PackageTest') isNil.

	antaresModel addPackageNamed: nil.

	self assert: (antaresModel entityNamed: 'PackageTest') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testClassAddInheritance [

	| asS antaresModel class |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 1.
	self assert: class superInheritances first to equals: (antaresModel entityNamed: 'Smalltalk::Object').

	class addSuperClass: (antaresModel entityNamed: 'Smalltalk::Class5') inModel:  antaresModel .
	
	class := antaresModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 2.
	self assert: (class superInheritances contains: [:inh | inh to = (antaresModel entityNamed: 'Smalltalk::Object')]).
	self assert: (class superInheritances contains: [:inh | inh to = (antaresModel entityNamed: 'Smalltalk::Class5')]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testClassChangeInheritance [

	| asS antaresModel class |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 1.
	self assert: class superInheritances first to equals: (antaresModel entityNamed: 'Smalltalk::Object').

	class changeSuperClassTo: (antaresModel entityNamed: 'Smalltalk::Class5') inModel:  antaresModel .

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	
	self assert: (class superInheritances size) equals: 1.
	self assert: (class superInheritances first to) equals: (antaresModel entityNamed: 'Smalltalk::Class5').

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteAttribute [

	| asS antaresModel att |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	att := antaresModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self assert: att notNil.

	att deleteInModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Smalltalk::Object.DependentsFields') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteClass [

	| asS antaresModel class |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class notNil.
	class deleteInModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteInvocation [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 1.

	meth outgoingInvocations first deleteInModel: antaresModel.
	
	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 0.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteMethod [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	

	self assert: meth notNil.

	meth deleteInModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeletePackage [

	| asS antaresModel pckg |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: #AsM.
	
	pckg := antaresModel entityNamed: 'Orion-TestModel-Constellation1'.	

	self assert: pckg notNil.

	pckg deleteInModel: antaresModel .

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation1') isNil.
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testDeleteReference [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingReferences size equals: 1.

	(meth outgoingReferences first) deleteInModel: antaresModel.
	
	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingReferences size equals: 0.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMergePackage [

	| asS antaresModel pckg1 pckg2 |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	pckg1 := antaresModel entityNamed: 'Orion-TestModel-Constellation1'.	
	pckg2 := antaresModel entityNamed: 'Orion-TestModel-Constellation2'.

	self assert: pckg1 childNamedEntities size equals: 5.
	self assert: pckg2 childNamedEntities size equals: 4.

	pckg1 mergePackage: pckg2  inModel: antaresModel.

	self assert:  (antaresModel entityNamed: 'Orion-TestModel-Constellation1')  equals: nil.
	"self assert:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2')  equals: nil.     DOESN'T WORK BECAUSE MATCHES Orion-TestModel-Constellation2Orion-TestModel-Constellation1"

	self deny:  (antaresModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') isNil.
	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') childNamedEntities size equals: 9.

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMethodAddInvocation [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 1.
	self assert: meth outgoingInvocations first receiver equals: (antaresModel entityNamed: 'Smalltalk::Class3').

	meth addInvocationTo: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') inModel:  antaresModel .
	
	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 2.
	self assert: (meth outgoingInvocations contains: [:inv | inv receiver = (antaresModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingInvocations contains: [:inv | inv to size =1 and: [ inv to  first = (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')]]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMethodAddReference [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 1.
	self assert: meth outgoingReferences first to equals: (antaresModel entityNamed: 'Smalltalk::Class3').

	meth addReferenceTo: (antaresModel entityNamed: 'Smalltalk::Class2') inModel:  antaresModel .
	
	meth := 	antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 2.
	self assert: (meth outgoingReferences contains: [:inh | inh to = (antaresModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingReferences contains: [:inh | inh to = (antaresModel entityNamed: 'Smalltalk::Class2')]).

]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveAttribute [

	| asS antaresModel att  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	att := antaresModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self deny: att isNil.
	self assert: att parentType equals: (antaresModel entityNamed: 'Smalltalk::Object').	

	att moveTo: (antaresModel entityNamed: 'Smalltalk::Class1') inModel: antaresModel.

	att := antaresModel entityNamed: 'Smalltalk::Object.DependentsFields'.	
	self assert: att isNil.
	
	att := antaresModel entityNamed: 'Smalltalk::Class1.DependentsFields'.	
	
	self deny: att isNil.
	self assert: att parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveClass [

	| asS antaresModel class |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (antaresModel entityNamed: 'Orion-TestModel-Constellation1').	

	class moveTo: (antaresModel entityNamed: 'Orion-TestModel-Constellation2') inModel: antaresModel .

	class := antaresModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (antaresModel entityNamed: 'Orion-TestModel-Constellation2').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testMoveMethod [

	| asS antaresModel meth |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	meth := antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (antaresModel entityNamed: 'Smalltalk::Class5').	

	meth moveTo: (antaresModel entityNamed: 'Smalltalk::Class1') inModel: antaresModel.

	meth := antaresModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self assert: meth isNil.
	
	meth := antaresModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1').
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameAttribute [

	| asS antaresModel  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.att1') notNil.

	(antaresModel entityNamed: 'Smalltalk::Class1.att1') renameAttribut: 'attributeTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.att1') notNil.
	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	"self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameClass [

	| asS antaresModel  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1') notNil.

	(antaresModel entityNamed: 'Smalltalk::Class1') renameClass: 'ClassTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Smalltalk::Class1') notNil.
	self deny: (antaresModel entityNamed: 'Smalltalk::ClassTest') isNil.
	"self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenameMethod [

	| asS antaresModel  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.

	(antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') renameMethod: 'methodTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.
	self deny: (antaresModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	"self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1')."
]

{ #category : #'as yet unclassified' }
OrionBrowserTest >> testRenamePackage [

	| asS antaresModel  |

	asS := self model system.
	antaresModel := (ASModel withParent: self model) name: 'AsM'.

	self assert: (antaresModel entityNamed: 'Orion-TestModel-Constellation1') notNil.

	(antaresModel entityNamed: 'Orion-TestModel-Constellation1') renamePackage: 'PackageTest' inModel: antaresModel .

	self deny: (antaresModel entityNamed: 'Orion-TestModel-Constellation1') notNil.
	self deny: (antaresModel entityNamed: 'PackageTest') isNil.
	"self assert: (antaresModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (antaresModel entityNamed: 'Smalltalk::Class1')."
]
