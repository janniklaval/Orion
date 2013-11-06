"
A ORActionRemoveClassOnly is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveClassOnly,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
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

]
