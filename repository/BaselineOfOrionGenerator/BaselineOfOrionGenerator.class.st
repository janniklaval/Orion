Class {
	#name : #BaselineOfOrionGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfOrionGenerator
}

{ #category : #baselines }
BaselineOfOrionGenerator >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'OrionCore' with: [ spec requires: 'Moose' ].
		spec package: 'OrionGenerator' with: [ spec requires: #('OrionCore') ].
	].

]
