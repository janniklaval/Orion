Extension { #name : #ORActionRemoveClass }

{ #category : #'*OrionFamixJava' }
ORActionRemoveClass >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
