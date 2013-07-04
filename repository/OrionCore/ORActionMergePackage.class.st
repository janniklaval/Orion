Class {
	#name : #ORActionMergePackage,
	#superclass : #ORActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionMergePackage class >> description [
	^'merge package with'
]

{ #category : #'as yet unclassified' }
ORActionMergePackage class >> scope [
	<ORActionFor: #ORPackage>
	^self
]

{ #category : #'method execution' }
ORActionMergePackage >> run [

	| thePackage theNewPackage|
	super run.
	thePackage := (self orionModel retrieveEntity: entity).
	theNewPackage := (self orionModel retrieveEntity: newContainer).
	theNewPackage name: theNewPackage name, thePackage name.
	thePackage allClasses do:[:aClass |
		|asAction|
		asAction := ORActionMoveClass new
			parentAction: self ;
			orionModel: self orionModel;
			entity: aClass;
			newContainer: theNewPackage.
		asAction run.
	].
	thePackage extensionMethods do:[:aMethod |
		|asAction|
		aMethod parentType parentPackage =  theNewPackage 
		ifTrue:[
			asAction := ORActionUnextendMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: aMethod] 
		ifFalse:[
			asAction := ORActionExtendMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: aMethod;
					newContainer: theNewPackage].
		asAction run.
	].
	self orionModel remove: thePackage.
	
]
