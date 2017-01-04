Extension { #name : #ORActionRemoveEnum }

{ #category : #'*OrionFamixJava' }
ORActionRemoveEnum >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
