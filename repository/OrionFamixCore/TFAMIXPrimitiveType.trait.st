"
A TFAMIXPrimitiveType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXPrimitiveType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXPrimitiveType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
TFAMIXPrimitiveType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXPrimitiveType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXPrimitiveType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXPrimitiveType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXPrimitiveType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXPrimitiveType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXPrimitiveType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXPrimitiveType >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXPrimitiveType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXPrimitiveType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXPrimitiveType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXPrimitiveType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXPrimitiveType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXPrimitiveType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXPrimitiveType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXPrimitiveType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXPrimitiveType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPrimitiveType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXPrimitiveType >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
