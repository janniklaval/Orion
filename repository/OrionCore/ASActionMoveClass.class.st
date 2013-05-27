Class {
	#name : #ASActionMoveClass,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMoveClass class >> description [
	^'move class'
]

{ #category : #'as yet unclassified' }
ASActionMoveClass class >> needs: anElement [
	^anElement currentContext allModelPackages reject:[:ea | ea = anElement parentPackage]
]

{ #category : #'as yet unclassified' }
ASActionMoveClass class >> scope [
	<AntaresActionFor: #ASClass>
	^self
]

{ #category : #'method execution' }
ASActionMoveClass >> run [
	| theClass theOldpackage|
	super run.
	theOldpackage := entity parentPackage.
	theClass := ASActionSimplyMoveClass new 
			parentAction: self ;
			antaresModel: self antaresModel ;
			entity: entity;
			newContainer: newContainer;
			run.
	theOldpackage :=  theOldpackage versionIn: self currentContext.
	
	(newContainer isKindOf: FAMIXPackage) ifTrue:[
		theClass methods do:[:each |
			(each parentPackage isNil or:[each parentPackage = theOldpackage ]) ifTrue:[
			ASActionMoveMethodInPackage new 
				parentAction: self ;
				antaresModel: self antaresModel; 
				entity: each; 
				newContainer: theClass parentPackage; 
				run.
			].
			each parentPackage = theClass parentPackage ifTrue:[
			ASActionUnextendMethod new
				parentAction: self ;
				antaresModel: self antaresModel;
				entity: each
			].
	]].
	^theClass
]
