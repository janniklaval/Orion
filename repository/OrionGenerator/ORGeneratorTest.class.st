Class {
	#name : #ORGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'aGenerator'
	],
	#category : #'OrionGenerator-Test'
}

{ #category : #running }
ORGeneratorTest >> setUp [
	
	aGenerator := ORGenerator new.
]

{ #category : #tests }
ORGeneratorTest >> testAddAccessorFrom [
	
	|  aTrait nbTraits nbSel nbProp |

	nbTraits := Smalltalk allTraits size.

	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	nbSel := aTrait selectors size.
	nbProp := (aGenerator getPropertiesOf: FAMIXTestClass) size.
	
	"check the creation of the trait"
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: Smalltalk allTraits size equals: (nbTraits + 1).
	self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity).
	
	aGenerator addAccessorFrom: FAMIXTestClass toTrait: aTrait. 
	self assert: aTrait selectors size equals:  (nbSel + (2*nbProp)).
	self assert: (aTrait selectors includes: #kind).
	self assert: (aTrait selectors includes: #kindOR:).
	"self assert: (aTrait selectors includes: #test).
	self assert: (aTrait selectors includes: #testAS:)."
	
	aTrait removeFromSystem.
	self assert: Smalltalk allTraits size equals: nbTraits.
	self deny: (Smalltalk allTraits includes: aTrait).
]

{ #category : #tests }
ORGeneratorTest >> testAddPrivateAccessorTo [
	
	| nbMeth |

	
	nbMeth := FAMIXTestClass methodDict size.
	
	"self halt."
	aGenerator addPrivateAccessorTo: FAMIXTestClass. 
	self assert: (FAMIXTestClass methodDict size >= nbMeth ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionCore-model'. 
	
	
]

{ #category : #tests }
ORGeneratorTest >> testAddThePrivateAccessorOf [
	
	| nbMeth |

	
	nbMeth := FAMIXTestClass methodDict size.
	
	
	aGenerator addThePrivateAccessorOf: (aGenerator getPropertiesOf: FAMIXTestClass) first To: FAMIXTestClass. 
	self assert: (FAMIXTestClass methodDict size =  (nbMeth + 2) or: [FAMIXTestClass methodDict size =  nbMeth] ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).

	"self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionCore-model'. 
	"
	
]

{ #category : #tests }
ORGeneratorTest >> testCodeForORSelector [

	self assert: (aGenerator codeForORSelector: (aGenerator getPropertiesOf: FAMIXTestClass) first) equals: 'kindOR: aVersion
	^ self privateKind versionIn: aVersion'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForPrivateGetter [

	self assert: (aGenerator codeForPrivateGetter: (aGenerator getPropertiesOf: FAMIXTestClass ) first) equals: 'privateKind
	^ kind'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForPrivateSetter [

	self assert: (aGenerator codeForPrivateSetter: (aGenerator getPropertiesOf: FAMIXTestClass ) first) equals: 'privateKind: aString
	 kind := aString'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForSelector [

	self assert: (aGenerator codeForSelector: (aGenerator getPropertiesOf: FAMIXTestClass ) first) equals: 'kind
	^ self kindOR: self currentContext'
]

{ #category : #tests }
ORGeneratorTest >> testCreateClassName [

	self assert: (aGenerator createClassName: FAMIXPackage ) equals: #ORPackage.
	
]

{ #category : #tests }
ORGeneratorTest >> testCreateClassNameNotFamix [

	self assert: (aGenerator createClassName: MooseEntity ) equals: #ORMooseEntity.
	
]

{ #category : #tests }
ORGeneratorTest >> testCreateTraitName [

	self assert: (aGenerator createTraitName: FAMIXPackage ) equals: #TFAMIXPackage.
	
]

{ #category : #tests }
ORGeneratorTest >> testCreateTraitNameNotFamix [

	self assert: (aGenerator createTraitName: MooseEntity ) equals: #TMooseEntity.
	
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORClass [
	
	|  anORClass nbClass |
	
	nbClass := Smalltalk allClasses size.
	
	anORClass := aGenerator ensureORClass: FAMIXTestClass.

	self assert: anORClass notNil.
	self assert: (anORClass name) equals: #ORTestClass.
	self assert: (anORClass traitComposition allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (anORClass superclass) equals: FAMIXTestClass.
	self assert: Smalltalk allClasses size equals: nbClass + 1.
	
	anORClass removeFromSystem.
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTrait [
	
	|   aTrait nbTraits |

	nbTraits := Smalltalk allTraits size.

	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: Smalltalk allTraits size equals: (nbTraits + 1).
	self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity).
	
	aTrait removeFromSystem.
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTraitExisting [
	
	|   aTrait nbMeth nbTraits |

	nbTraits := Trait allInstances size.
	nbMeth := TFAMIXClass selectors size.

	aTrait := aGenerator ensureORTrait: FAMIXClass .

	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXClass.
	self assert: Trait allInstances size equals: nbTraits.
	self assert: aTrait selectors size equals: nbMeth.
	
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTraitWithoutExistingTraits [
	
	|   aTrait nbTraits |

	nbTraits := Smalltalk allTraits size.

	aTrait := aGenerator ensureORTrait: Class1 .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TClass1.
	self assert: Smalltalk allTraits size = (nbTraits + 4).
	"self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity)."
	
	aTrait removeFromSystem.
	(Smalltalk globals at: #TFAMIXLocalVariable) removeFromSystem.
	(Smalltalk globals at: #TFAMIXLeafEntity) removeFromSystem.
	(Smalltalk globals at: #TFAMIXStructuralEntity) removeFromSystem.
	
	self assert: Smalltalk allTraits size = nbTraits 
]

{ #category : #tests }
ORGeneratorTest >> testGetPropertiesOf [

	self assert: (aGenerator getPropertiesOf: FAMIXTestClass ) size  equals: 1

]

{ #category : #tests }
ORGeneratorTest >> testGetPropertiesOfEmpty [

	self assert: (aGenerator getPropertiesOf: Object) size  equals: 0

]

{ #category : #tests }
ORGeneratorTest >> testMakeOR [

	|   nbTraits anORClass nbClass nbMeth |

	nbTraits := Smalltalk allTraits size.
	nbClass := Smalltalk allClasses size.
	nbMeth := FAMIXTestClass methodDict size.
	
	aGenerator makeOR: FAMIXTestClass .
	anORClass := Smalltalk classNamed: #ORTestClass.
	self assert: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: Smalltalk allTraits size equals: (nbTraits + 1).
	self assert: (Smalltalk allClasses contains: [:each | each name = #ASTestClass]).
	self assert: (anORClass traitComposition allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (anORClass superclass) equals: FAMIXTestClass.
	self assert: Smalltalk allClasses size equals: nbClass + 1.
	
	self assert: (FAMIXTestClass methodDict size >= nbMeth ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionCore-model'. 
	
	anORClass removeFromSystem.
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
]

{ #category : #tests }
ORGeneratorTest >> testMakeORForAllClasses [

	|   nbTraits nbClass nbMeth aColl |
	
	aColl := Smalltalk allClasses select: [ :c | (c category =#'Orion-TestModel-Constellation1')].	

	nbTraits := Smalltalk allTraits size.
	nbClass := Smalltalk allClasses size.
	nbMeth := FAMIXTestClass methodDict size.
	
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORTestClass]).
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORClass1]).
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORClass2]).

	self deny: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self deny: (Smalltalk allTraits contains: [:each | each name = #TClass1]).
	self deny: (Smalltalk allTraits contains: [:each | each name = #TClass2]).
	
	aGenerator makeORForAllClasses: aColl .
	
	"verification that the 3 traits have been created"
	self assert: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (Smalltalk allTraits contains: [:each | each name = #TClass1]).
	self assert: (Smalltalk allTraits contains: [:each | each name = #TClass2]).
	self assert: Smalltalk allTraits size equals: (nbTraits + 3+ aColl size). "+3 corresponds to the hierarchy of Traits added for TClass1"
	
	
	"Removing the traits and the classes created during the test"
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
	(Smalltalk globals at: #TClass1) removeFromSystem.
	(Smalltalk globals at: #TClass2) removeFromSystem.
	(Smalltalk globals at: #TFAMIXLocalVariable) removeFromSystem.
	(Smalltalk globals at: #TFAMIXLeafEntity) removeFromSystem.
	(Smalltalk globals at: #TFAMIXStructuralEntity) removeFromSystem.
	(Smalltalk globals at: #ORTestClass) removeFromSystem.
	(Smalltalk globals at: #ORClass1) removeFromSystem.
	(Smalltalk globals at: #ORClass2) removeFromSystem.
	
	self assert: Smalltalk allTraits size equals: nbTraits.
	self assert: Smalltalk allClasses size equals: nbClass .
]
