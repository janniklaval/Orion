Extension { #name : #ORActionRemoveParameterizedType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterizedType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
