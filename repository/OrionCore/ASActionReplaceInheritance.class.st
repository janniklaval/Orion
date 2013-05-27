Class {
	#name : #ASActionReplaceInheritance,
	#superclass : #ASActionReplaceLink,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionReplaceInheritance class >> description [
	^'replace superclass'
]

{ #category : #accessing }
ASActionReplaceInheritance >> child [
	^from
]

{ #category : #accessing }
ASActionReplaceInheritance >> child: anObject [
	from := anObject
]

{ #category : #accessing }
ASActionReplaceInheritance >> parent [
	^ to
]

{ #category : #accessing }
ASActionReplaceInheritance >> parent: anObject [
	to := anObject
]

{ #category : #'method execution' }
ASActionReplaceInheritance >> run [
	"This is a replacement, so remove the existing inheritance if it exists
	If there are several, defaults to removing the frst one"

	super run.
	
	from superInheritances ifNotEmpty: [
		ASActionRemoveInheritance new 
			parentAction: self ;
			antaresModel: antaresModel; 
			entity: from superInheritances first; 
			run
		].

	"Add the new inheritance"
	^ ASActionAddInheritance new 
			parentAction: self ;
			antaresModel: antaresModel; 		
			from: (antaresModel retrieveEntity: self from) ;
			to: (antaresModel retrieveEntity: self to) ;
			run.

]
