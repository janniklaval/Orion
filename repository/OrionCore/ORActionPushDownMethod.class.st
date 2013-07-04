Class {
	#name : #ORActionPushDownMethod,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> description [
	^'push down method'
]

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> needs: anElement [
	^anElement parentType subInheritances collect:[:each | each subclass].
]

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionPushDownMethod >> run [
	| asAction |
	super run.
	
	asAction := ORActionMoveMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
