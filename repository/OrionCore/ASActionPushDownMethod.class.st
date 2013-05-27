Class {
	#name : #ASActionPushDownMethod,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionPushDownMethod class >> description [
	^'push down method'
]

{ #category : #'as yet unclassified' }
ASActionPushDownMethod class >> needs: anElement [
	^anElement parentType subInheritances collect:[:each | each subclass].
]

{ #category : #'as yet unclassified' }
ASActionPushDownMethod class >> scope [
	<ASActionFor: #ASMethod>
	^self
]

{ #category : #'method execution' }
ASActionPushDownMethod >> run [
	| asAction |
	super run.
	
	asAction := ASActionMoveMethod new
					parentAction: self ;
					antaresModel: self antaresModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
