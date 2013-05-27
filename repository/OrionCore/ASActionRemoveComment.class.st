Class {
	#name : #ASActionRemoveComment,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveComment class >> description [
	^'remove comment'
]

{ #category : #'as yet unclassified' }
ASActionRemoveComment >> run [
	super run.
	entity container ifNotNil:[
		| namespace |
		namespace := (self antaresModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes antaresCopy antaresRemove: entity).
	].
	
	entity comments do:[:com |
		ASActionRemoveComment new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity:com; 
			run.
	].

	self antaresModel remove: entity.
	self postRun.
]
