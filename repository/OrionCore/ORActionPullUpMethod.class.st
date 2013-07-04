Class {
	#name : #ORActionPullUpMethod,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> description [
	^'pull up method'
]

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> needs: anElement [
	^anElement parentType superInheritances collect:[:each | each superclass].
]

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionPullUpMethod >> run [
	| asAction |
	super run.
	
	asAction := ORActionMoveMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
