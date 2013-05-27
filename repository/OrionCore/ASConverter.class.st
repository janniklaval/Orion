Class {
	#name : #ASConverter,
	#superclass : #Object,
	#classVars : [
		'association'
	],
	#category : #OrionCore
}

{ #category : #'initialize-release' }
ASConverter class >> buildFromMooseModel: aMooseModel [
	"make all necessary to convert a model"
	|model system|
	
	model := ASConverter convertFromMooseModel: aMooseModel.
	system := ASSystem new.
	system sourceModel: model.
	model system: system.
	system name: 'Antares ', model name.

	ASSystem add: system.
	
	MooseModel root remove: aMooseModel.
	^model
]

{ #category : #'initialize-release' }
ASConverter class >> convertFromMooseModel: aMooseModel [
	"take a MooseModel and convert it in a ASModel"
	|model state |
	model := ASModel new.

	model name: aMooseModel name.
	model sourceLanguage: aMooseModel sourceLanguage.
	
	 aMooseModel entities do:[:anEntity |
		|myNewClass newAtt|
		myNewClass := self mapping at: anEntity class ifAbsent:[nil].
		myNewClass ifNotNil:[
			anEntity primitiveChangeClassTo: myNewClass new.
			state := anEntity privateState.
			state primitiveChangeClassTo: anEntity defaultStateClass new.
			newAtt := SmallDictionary new.
			state privateAttributes do:[:attr |
				newAtt at: attr key put: attr value.
			].
			state privateAttributes: newAtt. 
			anEntity privateState: state.
		].
		model add: anEntity.
	].
	^model
]

{ #category : #'initialize-release' }
ASConverter class >> initConverter [

		association := SmallDictionary new.
		association at: FAMIXClass put: ASClass.
		association at: FAMIXInvocation put: ASInvocation.
		association at: FAMIXMethod put: ASMethod.
		association at: FAMIXNamespace put: ASNamespace.
		association at: FAMIXPackage put: ASPackage.
		association at: FAMIXReference put: ASReference.
		association at: FAMIXInheritance put: ASInheritance.
		association at: FAMIXAccess put: ASAccess.
		association at: FAMIXAttribute put: ASAttribute.
		association at: FAMIXComment put: ASComment.
		association at: FAMIXFunction put: ASFunction.
		association at: FAMIXGlobalVariable put: ASGlobalVariable.
		association at: FAMIXImplicitVariable put: ASImplicitVariable.
		association at: FAMIXLocalVariable put: ASLocalVariable.
		association at: FAMIXParameter put: ASParameter.
		association at: FAMIXPrimitiveType put: ASPrimitiveType.
		association at: FAMIXUnknownVariable put: ASUnknownVariable.
		association at: FAMIXAnnotationInstance put: ASAnnotationInstance.
		association at: FAMIXAnnotationType put: ASAnnotationType.
		association at: FAMIXCaughtException put: ASCaughtException.
		association at: FAMIXDeclaredException put: ASDeclaredException.
		association at: FAMIXFile put: ASFile.
		association at: FAMIXFolder put: ASFolder.
		association at: FAMIXThrownException put: ASThrownException.
		^association
]

{ #category : #'initialize-release' }
ASConverter class >> mapping [

	^association ifNil:[
		self initConverter
	]
]
