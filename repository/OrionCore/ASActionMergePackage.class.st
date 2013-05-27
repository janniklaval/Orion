Class {
	#name : #ASActionMergePackage,
	#superclass : #ASActionMove,
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ASActionMergePackage class >> description [
	^'merge package with'
]

{ #category : #'as yet unclassified' }
ASActionMergePackage class >> scope [
	<ASActionFor: #ASPackage>
	^self
]

{ #category : #'method execution' }
ASActionMergePackage >> run [

	| thePackage theNewPackage|
	super run.
	thePackage := (self antaresModel retrieveEntity: entity).
	theNewPackage := (self antaresModel retrieveEntity: newContainer).
	theNewPackage name: theNewPackage name, thePackage name.
	thePackage allClasses do:[:aClass |
		|asAction|
		asAction := ASActionMoveClass new
			parentAction: self ;
			antaresModel: self antaresModel;
			entity: aClass;
			newContainer: theNewPackage.
		asAction run.
	].
	thePackage extensionMethods do:[:aMethod |
		|asAction|
		aMethod parentType parentPackage =  theNewPackage 
		ifTrue:[
			asAction := ASActionUnextendMethod new
					parentAction: self ;
					antaresModel: self antaresModel;
					entity: aMethod] 
		ifFalse:[
			asAction := ASActionExtendMethod new
					parentAction: self ;
					antaresModel: self antaresModel;
					entity: aMethod;
					newContainer: theNewPackage].
		asAction run.
	].
	self antaresModel remove: thePackage.
	
]
