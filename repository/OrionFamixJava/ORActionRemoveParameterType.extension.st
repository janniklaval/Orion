Extension { #name : #ORActionRemoveParameterType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
