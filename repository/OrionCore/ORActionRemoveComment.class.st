Class {
	#name : #ORActionRemoveComment,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveComment class >> description [
	^'remove comment'
]

{ #category : #'as yet unclassified' }
ORActionRemoveComment >> run [
	super run.
	"entity container ifNotNil:[
		| namespace |
		namespace := (self orionModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes orionCopy orionRemove: entity).
	]."
	
	entity comments do:[:com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].

	self orionModel remove: entity.
	self postRun.
]
