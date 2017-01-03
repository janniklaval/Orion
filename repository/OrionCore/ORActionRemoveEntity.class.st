Class {
	#name : #ORActionRemoveEntity,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #printing }
ORActionRemoveEntity >> printWorkspace [

	^ super printWorkspace , self entity mooseName.
]
