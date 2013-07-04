Class {
	#name : #ORGenerator,
	#superclass : #Object,
	#category : #OrionGenerator
}

{ #category : #'as yet unclassified' }
ORGenerator >> addAccessorFrom: aFamixClass toTrait: aOrionTrait [
	"add accessors corresponding to the non heritated properties and relations of the Famix Class to the Orion trait "
	
	(self getPropertiesOf: aFamixClass) do: [ :prop | 
		aOrionTrait compile: (self codeForSelector: prop).
		aOrionTrait compile: (self codeForORSelector: prop).
		]
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> addPrivateAccessorTo: aFamixClass [
	"add private accessors corresponding to the non heritated properties and relations of the Famix Class to it "
	(self getPropertiesOf: aFamixClass) do: [ :prop | 
		self addThePrivateAccessorOf: prop To: aFamixClass
		]
	
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> addThePrivateAccessorOf: aProp To: aFamixClass [ 
	"add private accessors corresponding to the property to the Famix Class if it does not already exist "
	 	| aMethName |
		aMethName := 'private', (aProp name) capitalized.
		(aFamixClass methodDict includesKey: (aMethName asSymbol)) ifFalse: 
			[aFamixClass compile: (self codeForPrivateGetter: aProp) classified: '*OrionCore-model'.
			aFamixClass compile: (self codeForPrivateSetter: aProp) classified: '*OrionCore-model'.]
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> codeForORSelector: aProperty [
	^((aProperty name), 'OR: aVersion
	^ self private' , (aProperty name) capitalized , ' versionIn: aVersion')
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> codeForPrivateGetter: aProperty [
	^('private', (aProperty name) capitalized, '
	^ ' ,  (aProperty name))
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> codeForPrivateSetter: aProperty [
	| type|
	type := ((aProperty type name) asString ) capitalized.
	^('private', (aProperty name) capitalized, ': a' , type , '
	 ' ,  (aProperty name), ' := a' ,  type)
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> codeForSelector: aProperty [
	^((aProperty name), '
	^ self ' , (aProperty name), 'OR: self currentContext')
	
]

{ #category : #'as yet unclassified' }
ORGenerator >> createClassName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	| name |

	name := aFamixClass name asString.
	name := (name beginsWith: 'FAMIX') ifTrue:  [name copyAfter: $X]
					ifFalse: [name].
	^ ('OR' , name ) asSymbol 
]

{ #category : #'as yet unclassified' }
ORGenerator >> createTraitName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	| name |

	name := aFamixClass name asString.
	^ ('T' , name ) asSymbol 
]

{ #category : #'as yet unclassified' }
ORGenerator >> ensureORClass: aFamixClass [
	"Create an Orion Class corresponding to the FamixClass and inheriting from it"

	| name |
	name := self createClassName: aFamixClass .
	
	^Smalltalk globals at: name ifAbsent: [
		aFamixClass  subclass: name
		uses: (self ensureORTrait: aFamixClass)
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'OrionCore-model']
]

{ #category : #'as yet unclassified' }
ORGenerator >> ensureORTrait: aFamixClass [
	"Create a trait corresponding to the FamixClass "

	^ aFamixClass name = #MooseEntity
		ifFalse: [ 
			| name |
			name := self createTraitName: aFamixClass.
			Smalltalk globals
				at: name
				ifAbsent: [ Trait
								named: name
								uses: (self ensureORTrait: aFamixClass superclass)
								category: 'OrionCore-model-trait' ] ]
		ifTrue: [ TMooseEntity ]
]

{ #category : #'as yet unclassified' }
ORGenerator >> getPropertiesOf: aFamixClass [

	| metaDesc |
	metaDesc := MooseModel meta elements detect: [ :md | (md class = FM3MetaDescription  ) and: [md implementingClass = aFamixClass  ] ] ifNone: [ nil ].
	
	^ (metaDesc notNil)
	ifTrue: [ metaDesc attributes select: [:a | "a isDerived not and: ["aFamixClass allInstVarNames includes: (a name) ]] "]" ifFalse: [ OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
ORGenerator >> makeOR: aFamixClass [
	"Create the ASClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	self addAccessorFrom: aFamixClass toTrait: (self ensureORTrait: aFamixClass).
	self ensureORClass: aFamixClass.
	self addPrivateAccessorTo: aFamixClass
]

{ #category : #'as yet unclassified' }
ORGenerator >> makeORForAllClasses: aColl [
	"For all the class of the collection, Create the ASClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	aColl do: [ :c | self makeOR: c ]
]
