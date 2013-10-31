"
A ORActionRemovePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemovePackage,
	#superclass : #ORActionRemoveEntity,
	#category : #'OrionFamixCore-Action'
}

{ #category : #'initialize-release' }
ORActionRemovePackage class >> description [
	^'remove package and its content'
]

{ #category : #'initialize-release' }
ORActionRemovePackage class >> scope [
	<ORActionFor: #ORPackage>
	^self
]

{ #category : #'method execution' }
ORActionRemovePackage >> run [


	entity childScopes do: [:each |
		each deleteInAction: self.
	].

	entity childNamedEntities do: [:each |
		((each isKindOf: ORClass) "or: [each isKindOf: ORMethod]") ifTrue: [
			each deleteInAction: self.
		]
	].

	entity childNamedEntities do: [:each |
		(each isKindOf: ORMethod) ifTrue: [
			each deleteInAction: self.
		]
	].
	
	entity types do:[:each |
		(each isKindOf: ORClass) ifTrue: [
			each deleteInAction: self.
		].
	].

	entity outgoingReferences do: [:each |
		each deleteInAction: self.
	].

	entity incomingReferences do: [:each |
		each deleteInAction: self.
	].

	entity comments do: [:com |
		com deleteInAction: self.
	].
	entity functions do: [:com |
		com deleteInAction: self.
	].
	entity globalVariables do: [:com |
		com deleteInAction: self.
	].
	entity receivingInvocations do: [:com |
		com deleteInAction: self.
	].

	self entity deleteInAction: self.

	self postRun.
]