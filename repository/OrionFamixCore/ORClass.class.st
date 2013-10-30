"
A ORClass is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORClass,
	#superclass : #FAMIXClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORClass class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORClass >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORClass >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORClass >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
ORClass >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
ORClass >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORClass >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORClass >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORClass >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORClass >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
ORClass >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
ORClass >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORClass >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORClass >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORClass >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORClass >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORClass >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORClass >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORClass >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORClass >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORClass >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORClass >> isInterface [
	^ self isInterfaceOR: self currentContext
]

{ #category : #testing }
ORClass >> isInterfaceOR: aVersion [
	^ self privateIsInterface versionIn: aVersion
]

{ #category : #testing }
ORClass >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORClass >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORClass >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORClass >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORClass >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORClass >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORClass >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORClass >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
ORClass >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
ORClass >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORClass >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORClass >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORClass >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORClass >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORClass >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORClass >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORClass >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORClass >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORClass >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORClass >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORClass >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORClass >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORClass >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORClass >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORClass >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORClass >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORClass >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
ORClass >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
ORClass >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
ORClass >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
ORClass >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
ORClass >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
ORClass >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORClass >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORClass >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
