Class {
	#name : #ASActionPullUpMethod,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionPullUpMethod class >> description [
	^'pull up method'
]

{ #category : #'as yet unclassified' }
ASActionPullUpMethod class >> needs: anElement [
	^anElement parentType superInheritances collect:[:each | each superclass].
]

{ #category : #'as yet unclassified' }
ASActionPullUpMethod class >> scope [
	<ASActionFor: #ASMethod>
	^self
]

{ #category : #'method execution' }
ASActionPullUpMethod >> run [
	| asAction |
	super run.
	
	asAction := ASActionMoveMethod new
					parentAction: self ;
					antaresModel: self antaresModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
