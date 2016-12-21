"
Abstract class for orion generator
"
Class {
	#name : #ORAbstractGenerator,
	#superclass : #Object,
	#category : #OrionGenerator
}

{ #category : #'creating method' }
ORAbstractGenerator >> getExtendedPropertiesOf: aCollectionOfProperties [
	^ (aCollectionOfProperties reject: [ :a | a mmClass implementingClass allInstVarNames includes: a name ])
		select: [ :e | 
			(e type isPrimitive and: [ e isDerived not ])
				or: [ (e type isPrimitive not and: [ e hasOpposite ]) and: [ e isMultivalued or: [ e opposite isMultivalued ] ] ] ]
]

{ #category : #'creating method' }
ORAbstractGenerator >> getPropertiesOf: aCollectionOfProperties [
	^ aCollectionOfProperties select: [ :a | a mmClass implementingClass allInstVarNames includes: a name ]
]
