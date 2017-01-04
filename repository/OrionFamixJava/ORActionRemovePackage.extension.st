Extension { #name : #ORActionRemovePackage }

{ #category : #'*OrionFamixJava' }
ORActionRemovePackage >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
