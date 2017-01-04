Extension { #name : #ORActionRemoveNamespace }

{ #category : #'*OrionFamixJava' }
ORActionRemoveNamespace >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
