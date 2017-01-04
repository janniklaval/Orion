"
A ORActionMoveEnumValue is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveEnumValue,
	#superclass : #ORActionMove,
	#instVars : [
		'parentPackage'
	],
	#category : #'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveEnumValue >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveEnumValue >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveEnumValue >> run [
	<generated>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentPackage ifNotNil: [
		| theNewContainer |
		entity parentPackage
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentPackage.
				theOldContainer privateChildNamedEntities: (theOldContainer privateChildNamedEntities orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentPackage.
		theEntity privateParentPackage: theNewContainer.
		theNewContainer privateChildNamedEntities: (theNewContainer privateChildNamedEntities unsafeAdd: theEntity)
	].
	theEntity resetMooseName.
	^ theEntity
]
