Extension { #name : #ORActionRemovePrimitiveType }

{ #category : #'*OrionFamixJava' }
ORActionRemovePrimitiveType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
