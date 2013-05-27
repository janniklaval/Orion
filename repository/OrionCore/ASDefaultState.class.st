Class {
	#name : #ASDefaultState,
	#superclass : #MooseDefaultState,
	#category : #OrionCore
}

{ #category : #accessing }
ASDefaultState >> allProperties [ 
	 
	^self allPropertiesAS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> allPropertiesAS: aVersion [
	 
	^propertyCache values collect:[:e | e versionIn: aVersion]
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name ifAbsent: aBlock [ 
	 
	^ self attributeAt: name ifAbsent: aBlock AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name ifAbsent: aBlock AS: aVersion [
	 
	^ (attributes at: name ifAbsent: [aBlock value])  versionIn: aVersion.
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name ifAbsentPut: aBlock [ 
	 
	^self attributeAt: name ifAbsentPut: aBlock AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name ifAbsentPut: aBlock AS: aVersion [
	 
	^( attributes  at: name ifAbsentPut: ((aBlock value) versionIn: aVersion))
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name put: value [ 
	 
	^ self attributeAt: name put: value AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> attributeAt: name put: value AS: aVersion [
	 
	^ attributes at: name put: (value versionIn: aVersion).
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name ifAbsent: aBlock [ 
	 
	^ self cacheAt: name ifAbsent: aBlock AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name ifAbsent: aBlock AS: aVersion [
	 
	"^ (queryCache at: name->aVersion ifAbsent: [aBlock value]) versionIn: aVersion."
	^aBlock value versionIn: aVersion.
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name ifAbsentPut: aBlock [ 

	^ self cacheAt: name ifAbsentPut: aBlock AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name ifAbsentPut: aBlock AS: aVersion [

	"^ (queryCache at: name->aVersion ifAbsentPut: aBlock) versionIn: aVersion."
	^aBlock value versionIn: aVersion.
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name put: value [ 
	 
	^ self cacheAt: name put: value AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> cacheAt: name put: value AS: aVersion [
	 
	^ queryCache at: name->aVersion put: (value versionIn: aVersion).
]

{ #category : #accessing }
ASDefaultState >> currentContext [ 

	^( attributes  at: #currentContext "ifAbsentPut: ASContext currentModel")
]

{ #category : #accessing }
ASDefaultState >> currentContext: aVersion [ 
	 
	^ attributes at: #currentContext
		put: aVersion
]

{ #category : #accessing }
ASDefaultState >> entityCache [ 
	 
	^self entityCacheAS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> entityCacheAS: aVersion [
	 
	^queryCache versionIn: aVersion
]

{ #category : #accessing }
ASDefaultState >> flushAttributes [
	 
	attributes initialize
]

{ #category : #accessing }
ASDefaultState >> flushGroups [ 
	 
	queryCache initialize
]

{ #category : #accessing }
ASDefaultState >> flushProperties [ 
	 
	propertyCache initialize
]

{ #category : #accessing }
ASDefaultState >> includesKey: selector [ 
	 
	^propertyCache includesKey: selector
]

{ #category : #accessing }
ASDefaultState >> initialize: anASEntity [ 
	 
	attributes := SmallDictionary new. 
	propertyCache := SmallDictionary new. 
	queryCache := SmallDictionary new.
	entity := anASEntity
]

{ #category : #accessing }
ASDefaultState >> model [ 
	 
	^attributes at: #privateModel 
		ifAbsent: [MooseModel ownerOf: self entity]
]

{ #category : #accessing }
ASDefaultState >> model: anObject [ 
	 
	^attributes at: #privateModel put: anObject
]

{ #category : #accessing }
ASDefaultState >> printString [
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."

	^ 'TODO'
]

{ #category : #accessing }
ASDefaultState >> privateAttributes [

	^ attributes
]

{ #category : #accessing }
ASDefaultState >> privateAttributes: aDictionnary [

	attributes := aDictionnary.
]

{ #category : #accessing }
ASDefaultState >> propertyAt: name ifAbsent: aBlock [ 
	 
	^ self propertyAt: name ifAbsent: aBlock AS: self currentContext

]

{ #category : #accessing }
ASDefaultState >> propertyAt: name ifAbsent: aBlock AS: aVersion [
	 
	^ (propertyCache  at: name ifAbsent: [aBlock value]) versionIn: aVersion.

]

{ #category : #accessing }
ASDefaultState >> propertyAt: name ifAbsentPut: aBlock [ 
	 
	^ self propertyAt: name ifAbsentPut: aBlock AS: self currentContext

]

{ #category : #accessing }
ASDefaultState >> propertyAt: name ifAbsentPut: aBlock AS: aVersion [
	 
	^ (propertyCache  at: name ifAbsentPut: aBlock)versionIn: aVersion.

]

{ #category : #accessing }
ASDefaultState >> propertyAt: name put: value [ 
	 
	^ self propertyAt: name put: value AS: self currentContext
]

{ #category : #accessing }
ASDefaultState >> propertyAt: name put: value AS: aVersion [
	 
	^ propertyCache  at: name put: (value versionIn: aVersion).

]

{ #category : #accessing }
ASDefaultState >> queryCache [
	^self entityCache
]
