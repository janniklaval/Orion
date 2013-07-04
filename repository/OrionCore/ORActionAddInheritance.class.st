Class {
	#name : #ORActionAddInheritance,
	#superclass : #ORActionAddLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddInheritance class >> description [
	^'add inheritance'
]

{ #category : #'method execution' }
ORActionAddInheritance >> run [
	| newInheritance |
	super run.

	newInheritance := ORInheritance new.
	
	self orionModel add: newInheritance.
	
	from ifNotNil:[
		| theNewChild |
		theNewChild := (self orionModel retrieveEntity: from).
		newInheritance privateSubclass: theNewChild orionCopy.
		theNewChild privateSuperInheritances:  (theNewChild privateSuperInheritances orionCopy unsafeAdd: newInheritance)
	].

	to ifNotNil:[
		| theNewParent |
		theNewParent := (self orionModel retrieveEntity: to).
		newInheritance privateSuperclass: theNewParent orionCopy.
		theNewParent privateSubInheritances:  (theNewParent privateSubInheritances orionCopy unsafeAdd: newInheritance)
	].

	entity := newInheritance.
	^ entity
]
