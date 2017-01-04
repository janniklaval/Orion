Extension { #name : #ORActionRemovePrimitiveType }

{ #category : #'*OrionFamixJava' }
ORActionRemovePrimitiveType >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
