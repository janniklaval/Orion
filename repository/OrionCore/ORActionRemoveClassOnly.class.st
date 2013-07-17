Class {
	#name : #ORActionRemoveClassOnly,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'method execution' }
ORActionRemoveClassOnly >> run [
	super run.
	entity parentPackage ifNotNil:[
		| pack |
		pack := (self orionModel retrieveEntity:entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity container ifNotNil:[
		| namespace |
		namespace := (self orionModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes orionCopy orionRemove: entity).
	].

	self orionModel remove: entity.
	self postRun.
]
