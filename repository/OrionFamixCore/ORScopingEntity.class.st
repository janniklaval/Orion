"
A ORScopingEntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #ORScopingEntity,
	#superclass : #FAMIXScopingEntity,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : #'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORScopingEntity class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORScopingEntity >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> childScopes [
	^ self childScopesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> childScopesOR: aVersion [
	^ self privateChildScopes versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORScopingEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
ORScopingEntity >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
ORScopingEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORScopingEntity >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
ORScopingEntity >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> globalVariables [
	^ self globalVariablesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> globalVariablesOR: aVersion [
	^ self privateGlobalVariables versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
ORScopingEntity >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORScopingEntity >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORScopingEntity >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORScopingEntity >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORScopingEntity >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORScopingEntity >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORScopingEntity >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORScopingEntity >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
ORScopingEntity >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORScopingEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORScopingEntity >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORScopingEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORScopingEntity >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORScopingEntity >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
ORScopingEntity >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
ORScopingEntity >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
