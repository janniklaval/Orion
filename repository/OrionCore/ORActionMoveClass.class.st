Class {
	#name : #ORActionMoveClass,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> description [
	^'move class'
]

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> needs: anElement [
	^anElement currentContext allModelPackages reject:[:ea | ea = anElement parentPackage]
]

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> scope [
	<OrionActionFor: #ORClass>
	^self
]

{ #category : #'method execution' }
ORActionMoveClass >> run [
	| theClass theOldpackage|
	super run.
	theOldpackage := entity parentPackage.
	theClass := ORActionSimplyMoveClass new 
			parentAction: self ;
			orionModel: self orionModel ;
			entity: entity;
			newContainer: newContainer;
			run.
	theOldpackage :=  theOldpackage versionIn: self currentContext.
	
	(newContainer isKindOf: FAMIXPackage) ifTrue:[
		theClass methods do:[:each |
			(each parentPackage isNil or:[each parentPackage = theOldpackage ]) ifTrue:[
			ORActionMoveMethodInPackage new 
				parentAction: self ;
				orionModel: self orionModel; 
				entity: each; 
				newContainer: theClass parentPackage; 
				run.
			].
			each parentPackage = theClass parentPackage ifTrue:[
			ORActionUnextendMethod new
				parentAction: self ;
				orionModel: self orionModel;
				entity: each
			].
	]].
	^theClass
]
