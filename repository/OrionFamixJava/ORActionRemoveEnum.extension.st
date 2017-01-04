Extension { #name : #ORActionRemoveEnum }

{ #category : #'*OrionFamixJava' }
ORActionRemoveEnum >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
