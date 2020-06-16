Class {
	#name : #BaselineOfOrionConfigurator,
	#superclass : #BaselineOf,
	#category : #BaselineOfOrionConfigurator
}

{ #category : #baselines }
BaselineOfOrionConfigurator >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'OrionCore' with: [ spec requires: 'Moose' ].
		spec package: 'OrionGenerator' with: [ spec requires: #('OrionCore') ].
	].

]
