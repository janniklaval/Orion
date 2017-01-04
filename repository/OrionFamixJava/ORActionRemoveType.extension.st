Extension { #name : #ORActionRemoveType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
