Class {
	#name : #ASActionAddInheritance,
	#superclass : #ASActionAddLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionAddInheritance class >> description [
	^'add inheritance'
]

{ #category : #'method execution' }
ASActionAddInheritance >> run [
	| newInheritance |
	super run.

	newInheritance := ASInheritance new.
	
	self antaresModel add: newInheritance.
	
	from ifNotNil:[
		| theNewChild |
		theNewChild := (self antaresModel retrieveEntity: from).
		newInheritance privateSubclass: theNewChild antaresCopy.
		theNewChild privateSuperInheritances:  (theNewChild privateSuperInheritances antaresCopy unsafeAdd: newInheritance)
	].

	to ifNotNil:[
		| theNewParent |
		theNewParent := (self antaresModel retrieveEntity: to).
		newInheritance privateSuperclass: theNewParent antaresCopy.
		theNewParent privateSubInheritances:  (theNewParent privateSubInheritances antaresCopy unsafeAdd: newInheritance)
	].

	entity := newInheritance.
	^ entity
]
