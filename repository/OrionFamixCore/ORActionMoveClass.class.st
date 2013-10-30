"
A ORActionMoveClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMoveClass,
	#superclass : #ORActionMove,
	#category : #'OrionFamixCore-Action'
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
	| theClass theOldpackage |
	entity isAnonymousClass
		ifTrue: [ ^ self ].
	super run.
	theOldpackage := entity parentPackage.
	theClass := entity simplyMoveTo: newContainer inAction: self.
	theOldpackage := theOldpackage versionIn: self currentContext.
	(newContainer isKindOf: FAMIXPackage)
		ifTrue: [ 
			theClass methods
				do: [ :each | 
					(each parentPackage isNil or: [ each parentPackage = theOldpackage ])
						ifTrue: [ each updatePackage: theClass parentPackage inAnAction: self ].
					each parentPackage = theClass parentPackage
						ifTrue: [ 
							ORActionUnextendMethod new
								parentAction: self;
								orionModel: self orionModel;
								entity: each ] ] ].
	^ theClass
]
