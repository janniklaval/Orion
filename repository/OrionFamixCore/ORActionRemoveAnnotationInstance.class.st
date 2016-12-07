"
A ORActionRemoveFAMIXAnnotationInstance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAnnotationInstance,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveAnnotationInstance >> run [
	super run.
	entity annotationType
		ifNotNil: [ | annoType |
			annoType := self orionModel retrieveEntity: entity annotationType.
			annoType privateInstances: (annoType privateInstances orionCopy orionRemove: entity) ].
	entity annotatedEntity
		ifNotNil: [ | annoType |
			annoType := self orionModel retrieveEntity: entity annotatedEntity.
			annoType
				privateAnnotationInstances: (annoType privateAnnotationInstances orionCopy orionRemove: entity) ].
	self orionModel remove: entity
]
