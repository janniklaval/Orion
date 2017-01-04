Extension { #name : #ORActionRemoveNamespace }

{ #category : #'*OrionFamixJava' }
ORActionRemoveNamespace >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
