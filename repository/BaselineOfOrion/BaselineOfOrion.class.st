Class {
	#name : #BaselineOfOrion,
	#superclass : #BaselineOf,
	#category : #BaselineOfOrion
}

{ #category : #baselines }
BaselineOfOrion >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'OrionCore' with: [ spec requires: 'Moose' ].
		spec package: 'OrionFamixCore' with: [ spec requires: #('OrionCore') ].
		spec package: 'OrionBrowser' with: [ spec requires: #('OrionCore' 'OrionFamixCore') ].
		spec package: 'OrionTest' with: [ spec requires: 'OrionCore' ].
		spec package: 'Orion-TestModel-Constellation1' with: [ spec requires: 'OrionCore' ].
		spec package: 'Orion-TestModel-Constellation2' with: [ spec requires: 'OrionCore' ].
		spec package: 'OrionFamixJava' with: [ spec requires: 'OrionFamixCore' ].
		"spec package: 'Famix-Diff-Orion' with: [ spec requires: #('OrionCore') ]."
		
	spec baseline: 'Moose' 
                            with: [ spec
                                className: 'BaselineOfMoose';
                                repository: "'github://moosetechnology/Moose:development/src' "'github://moosetechnology/Moose:v7.0.2/src'.
                                ].
	].

]
