"
A ORActionRemoveFAMIXAnnotationInstanceAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveAnnotationInstanceAttribute,
	#superclass : #ORActionRemove,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'method execution' }
ORActionRemoveAnnotationInstanceAttribute >> run [
	super run.
	entity annotationTypeAttribute
		ifNotNil: [ | annoType |
			annoType := self orionModel retrieveEntity: entity annotationTypeAttribute.
			annoType privateAnnotationTypeAttribute: (annoType privateAnnotationTypeAttribute orionCopy orionRemove: entity) ].
	entity parentAnnotationInstance
		ifNotNil: [ | annoType |
			annoType := self orionModel retrieveEntity: entity parentAnnotationInstance.
			annoType privateParentAnnotationInstance: (annoType privateParentAnnotationInstance orionCopy orionRemove: entity) ].
	self orionModel remove: entity
]
