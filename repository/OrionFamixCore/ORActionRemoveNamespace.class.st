"
A ORActionRemoveNamespace is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemoveNamespace,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveNamespace class >> description [
	^'remove namespace'
]

{ #category : #'as yet unclassified' }
ORActionRemoveNamespace class >> scope [
	<ORActionFor: #ORNamespace>
	^self
]

{ #category : #'method execution' }
ORActionRemoveNamespace >> run [
	| namespace |
	super run.
	entity parentPackage
		ifNotNil: [ | pack |
			pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentScope
		ifNotNil: [ namespace := self orionModel retrieveEntity: entity parentScope.
			namespace privateChildScopes: (namespace privateChildScopes orionCopy orionRemove: entity) ].
	entity types
		do: [ :each | 
			| class |
			class := self orionModel retrieveEntity: each.
			entity parentScope
				ifNotNil: [ class privateContainer: namespace.
					namespace privateTypes: (namespace privateTypes orionCopy unsafeAdd: class) ]
				ifNil: [ class privateContainer: nil ] ].
	entity comments do: [ :com | com deleteInAction: self ].
	entity functions do: [ :fun | fun deleteInAction: self ].
	entity globalVariables do: [ :com | com deleteInAction: self ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	entity childScopes
		do: [ :each | 
			| scope |
			scope := self orionModel retrieveEntity: each.
			entity parentScope
				ifNotNil: [ scope privateParentScope: namespace.
					namespace privateChildScopes: (namespace privateChildScopes orionCopy unsafeAdd: scope) ]
				ifNil: [ scope privateParentScope: nil ] ].
	self orionModel remove: entity
]
