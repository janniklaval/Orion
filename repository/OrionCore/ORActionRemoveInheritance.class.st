Class {
	#name : #ORActionRemoveInheritance,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveInheritance class >> description [
	^'remove inheritance'
]

{ #category : #'as yet unclassified' }
ORActionRemoveInheritance class >> scope [
	<ORActionFor: #ORInheritance>
	^self
]

{ #category : #'method execution' }
ORActionRemoveInheritance >> run [
	| subEl superEl|
	super run.

	subEl := (self orionModel retrieveEntity: entity subclass).
	superEl := (self orionModel retrieveEntity: entity superclass).

	subEl privateSuperInheritances: (subEl privateSuperInheritances orionCopy orionRemove: entity).
	superEl privateSubInheritances: (superEl privateSubInheritances orionCopy orionRemove: entity).
	
	entity comments do: [ :com |
		ORActionRemoveComment new 
			parentAction: self ;
			orionModel: self orionModel; 
			entity: com; 
			run.
	].
	
	self orionModel remove: entity.
	self postRun.
]
