Class {
	#name : #ASActionRemoveInheritance,
	#superclass : #ASActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionRemoveInheritance class >> description [
	^'remove inheritance'
]

{ #category : #'as yet unclassified' }
ASActionRemoveInheritance class >> scope [
	<ASActionFor: #ASInheritance>
	^self
]

{ #category : #'method execution' }
ASActionRemoveInheritance >> run [
	| subEl superEl|
	super run.
	subEl := (self antaresModel retrieveEntity: entity subclass).
	superEl := (self antaresModel retrieveEntity: entity superclass).
	
	subEl privateSuperInheritances: (subEl privateSuperInheritances antaresCopy antaresRemove: entity).
	superEl privateSubInheritances: (superEl privateSubInheritances antaresCopy antaresRemove: entity).
	
	entity comments do: [ :com |
		ASActionRemoveComment new 
			parentAction: self ;
			antaresModel: self antaresModel; 
			entity: com; 
			run.
	].
	
	self antaresModel remove: entity.
	self postRun.
]
