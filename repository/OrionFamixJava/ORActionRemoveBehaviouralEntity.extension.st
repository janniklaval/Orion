Extension { #name : #ORActionRemoveBehaviouralEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveBehaviouralEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generatedMethod>
	entity definedAnnotationTypes do: [:each | each deleteInAction: self ].

]
