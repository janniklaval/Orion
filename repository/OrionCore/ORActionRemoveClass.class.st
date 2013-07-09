Class {
	#name : #ORActionRemoveClass,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveClass class >> description [
	^'remove class'
]

{ #category : #'as yet unclassified' }
ORActionRemoveClass class >> scope [
	<OrionActionFor: #ORClass>
	^self
]

{ #category : #'method execution' }
ORActionRemoveClass >> run [
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
	entity outgoingReferences do:[:each |
		each deleteInAction: self.
	].
	entity types do:[:each |
		each deleteInAction: self.
	].
	entity incomingReferences do:[:each |
		each deleteInAction: self.
	].

	entity subInheritances do:[:each |
		ORActionAddInheritance new 
			parentAction: self ;
			orionModel: self orionModel; 
			from: each subclass; 
			to: (entity superInheritances first superclass); 
			run.
		each deleteInAction: self.
	].

	entity superInheritances do:[:each |
		each deleteInAction: self
	].
	entity methods do:[:each |
		each deleteInAction: self.
	].


	entity attributes do:[:com |
		com deleteInAction: self.
	].
	entity comments do:[:each |
		each deleteInAction: self.
	].
	entity receivingInvocations do:[:each |
		each deleteInAction: self.
	].

	self orionModel remove: entity.
	self postRun.
]
