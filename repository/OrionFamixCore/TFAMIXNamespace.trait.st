"
A TFAMIXNamespace is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXNamespace,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : #'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXNamespace classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXNamespace >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> childScopes [
	^ self childScopesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> childScopesOR: aVersion [
	^ self privateChildScopes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #private }
TFAMIXNamespace >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXNamespace >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXNamespace >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> globalVariables [
	^ self globalVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> globalVariablesOR: aVersion [
	^ self privateGlobalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXNamespace >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXNamespace >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXNamespace >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXNamespace >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXNamespace >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXNamespace >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXNamespace >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXNamespace >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXNamespace >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXNamespace >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXNamespace >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXNamespace >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXNamespace >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXNamespace >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXNamespace >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXNamespace >> versionIn: anOrionModel [

	|upEntity|
	
	upEntity := anOrionModel entityStorage atID: self mooseID ifAbsent:[^nil].
	upEntity currentContext: anOrionModel.
	^upEntity
]
