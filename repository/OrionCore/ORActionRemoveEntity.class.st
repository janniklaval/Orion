Class {
	#name : #ORActionRemoveEntity,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveEntity >> printWorkspace [

	^ super printWorkspace , self entity mooseName.
]
