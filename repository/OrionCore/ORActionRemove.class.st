"
An ORActionRemove is an Orion abstract class for remove actions

"
Class {
	#name : #ORActionRemove,
	#superclass : #ORAction,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemove class >> description [
	^'remove'
]

{ #category : #testing }
ORActionRemove class >> isRemoval [
	^ true
]

{ #category : #'as yet unclassified' }
ORActionRemove class >> needs: anElement [
	^nil
]

{ #category : #testing }
ORActionRemove >> belongsToParentModel [
	^ true
]

{ #category : #'method execution' }
ORActionRemove >> manualRun [
	[ super manualRun ]
		on: OREntityNotFoundInCurrentModel
		do: [ :e | ('OREntity' , e object printString , ' not found') asLog info; addExtensions: {(#context -> e)}; emit ]
]

{ #category : #'method execution' }
ORActionRemove >> run [
	| oldEntity |
	oldEntity := entity.
	super run.
	entity ifNil: [ OREntityNotFoundInCurrentModel signal: oldEntity model: self orionModel ]
]
