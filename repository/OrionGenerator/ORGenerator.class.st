"
An ORGenerator is tool to easily create the ORXXX classes and associated traits.

You can use it by providing a collection of OREntities: 
	ORGenerator new  
	makeORForAllClasses: { MyOREntityClass1 . MyOREntityClass2 }

Instance Variables

"
Class {
	#name : #ORGenerator,
	#superclass : #Object,
	#category : #OrionGenerator
}

{ #category : #'creating method' }
ORGenerator >> addAccessorFrom: aFamixClass toTrait: aOrionTrait [
	"add accessors corresponding to the non heritated properties and relations of the Famix Class to the Orion trait "
	
	(self getPropertiesOf: aFamixClass) do: [ :prop | 
		aOrionTrait compile: (self codeForSelector: prop) classified: 'accessing'.
		aOrionTrait compile: (self codeForORSelector: prop) classified: 'accessing'.
		]
	
]

{ #category : #'creating method' }
ORGenerator >> addPrivateAccessorTo: aFamixClass [
	"add private accessors corresponding to the non heritated properties and relations of the Famix Class to it "
	(self getPropertiesOf: aFamixClass) do: [ :prop | 
		self addThePrivateAccessorOf: prop To: aFamixClass
		]
	
	
]

{ #category : #'creating method' }
ORGenerator >> addThePrivateAccessorOf: aProp To: aFamixClass [
	"add private accessors corresponding to the property to the Famix Class if it does not already exist "

	| aMethName |
	aMethName := 'private' , aProp name capitalized.
	(aFamixClass methodDict includesKey: aMethName asSymbol)
		ifFalse: [ 
			aFamixClass compile: (self codeForPrivateGetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass).
			aFamixClass compile: (self codeForPrivateSetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass) ]
]

{ #category : #'creating method' }
ORGenerator >> codeForORSelector: aProperty [
	^((aProperty name), 'OR: aVersion
	^ self private' , (aProperty name) capitalized , ' versionIn: aVersion')
	
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateGetter: aProperty [
	^('private', (aProperty name) capitalized, '
	^ ' ,  (aProperty name))
	
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateSetter: aProperty [
	| type|
	type := ((aProperty type name) asString ) capitalized.
	^('private', (aProperty name) capitalized, ': a' , type , '
	 ' ,  (aProperty name), ' := a' ,  type)
	
]

{ #category : #'creating method' }
ORGenerator >> codeForSelector: aProperty [
	^((aProperty name), '
	^ self ' , (aProperty name), 'OR: self currentContext')
	
]

{ #category : #'creating class and trait' }
ORGenerator >> createClassCategoryName: aFamixClass [
	^ 'OrionClass-', aFamixClass category 
]

{ #category : #'creating class and trait' }
ORGenerator >> createClassName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	| name |

	name := aFamixClass name asString.
	name := (name beginsWith: 'FAMIX') ifTrue:  [name copyAfter: $X]
					ifFalse: [name].
	^ ('OR' , name ) asSymbol 
]

{ #category : #'creating class and trait' }
ORGenerator >> createCommentToAClass: anORClass [
	anORClass
		classComment:
			(String
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'A ';
						nextPutAll: anORClass name;
						nextPutAll:
								' is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. ' ])
]

{ #category : #'creating class and trait' }
ORGenerator >> createCommentToATrait: anORTrait [
	anORTrait
		comment:
			(String
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'A ';
						nextPutAll: anORTrait name;
						nextPutAll:
								' is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. ' ])
]

{ #category : #'creating class and trait' }
ORGenerator >> createTraitCategoryName: aFamixClass [
	^ 'OrionTrait-' , aFamixClass category
]

{ #category : #'creating class and trait' }
ORGenerator >> createTraitName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	| name |

	name := aFamixClass name asString.
	^ ('T' , name ) asSymbol 
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureInheritFromMooseEntity: aFamixClass [
	^ aFamixClass inheritsFrom: MooseEntity 
]

{ #category : #'creating class and trait' }
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
		category: (self createClassCategoryName: aFamixClass)]
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureORTrait: aFamixClass [
	"Create a trait corresponding to the FamixClass "

	^(self ensureInheritFromMooseEntity: aFamixClass)
		ifTrue: [ 
			| name |
			name := self createTraitName: aFamixClass.
			Smalltalk globals
				at: name
				ifPresent: [:trait | trait]
				ifAbsent: [ 
					| aTrait |
					aTrait := Trait
						named: name
						uses: (self ensureORTrait: aFamixClass superclass)
						category: (self createTraitCategoryName: aFamixClass).
					self createCommentToATrait: aTrait.
					aTrait ] ]
		ifFalse: [  TMooseEntity ]
]

{ #category : #'creating method' }
ORGenerator >> getPropertiesOf: aFamixClass [

	| metaDesc |
	metaDesc := MooseModel meta elements detect: [ :md | (md class = FM3MetaDescription  ) and: [md implementingClass = aFamixClass  ] ] ifNone: [ nil ].
	
	^ (metaDesc notNil)
	ifTrue: [ metaDesc attributes select: [:a | "a isDerived not and: ["aFamixClass allInstVarNames includes: (a name) ]] "]" ifFalse: [ OrderedCollection new ]
]

{ #category : #generator }
ORGenerator >> makeOR: aFamixClass [
	"Create the ASClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	| anORClass |
	self addAccessorFrom: aFamixClass toTrait: (self ensureORTrait: aFamixClass).
	anORClass := self ensureORClass: aFamixClass.
	self createCommentToAClass: anORClass. 
	self addPrivateAccessorTo: aFamixClass
]

{ #category : #generator }
ORGenerator >> makeORForAllClasses: aColl [
	"For all the class of the collection, Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	aColl select: [ :aClass | aClass inheritsFrom: FAMIXEntity ] thenDo: [ :c | self makeOR: c ]
]
