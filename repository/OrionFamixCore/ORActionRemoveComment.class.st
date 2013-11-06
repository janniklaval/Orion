"
A ORActionRemoveComment is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveComment,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveComment class >> description [
	^'remove comment'
]

{ #category : #'method execution' }
ORActionRemoveComment >> run [
	super run.
	"entity container ifNotNil:[
		| namespace |
		namespace := (self orionModel retrieveEntity:entity container).
		namespace privateTypes:  (namespace privateTypes orionCopy orionRemove: entity).
	]."
	
	entity comments do:[:com |
		self class new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity:com; 
			run.
	].

	self orionModel remove: entity.

]
