Extension { #name : #ORActionRemoveMethod }

{ #category : #'*OrionFamixJava' }
ORActionRemoveMethod >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
