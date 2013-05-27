Class {
	#name : #ASActionRemove,
	#superclass : #ASAction,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemove class >> description [
	^'remove'
]

{ #category : #'as yet unclassified' }
ASActionRemove class >> needs: anElement [
	^nil
]

{ #category : #'method execution' }
ASActionRemove >> postRun [
	"self antaresModel removed at: entity mooseID put: entity"
]
