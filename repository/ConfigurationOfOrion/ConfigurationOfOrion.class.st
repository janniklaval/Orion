"
ConfigurationOfOrion loadBleedingEdge
"
Class {
	#name : #ConfigurationOfOrion,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #ConfigurationOfOrion
}

{ #category : #private }
ConfigurationOfOrion class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfOrion class >> ensureMetacello [
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://smalltalkhub.com/mc/dkh/metacello/main';
				package: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]
]

{ #category : #'metacello tool support' }
ConfigurationOfOrion class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #accessing }
ConfigurationOfOrion class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #accessing }
ConfigurationOfOrion class >> loadBleedingEdge [
	(self project version: #bleedingEdge) load.
]

{ #category : #accessing }
ConfigurationOfOrion class >> loadDevelopment [
	(self project version: #development) load.
]

{ #category : #accessing }
ConfigurationOfOrion class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline1: spec [ 
	<version: '1-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://ss3.gemstone.com/ss/Orion'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
						
	].
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline2: spec [ 
	<version: '2-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
		spec repository: 'http://smalltalkhub.com/mc/AnneEtien/FamixDiff/main'.
		spec 
			package: 'Famix-Diff-Orion'.
	].
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline3: spec [
	<version: '3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionFamixCore' with: [
				spec requires: #('OrionCore' 'OrionCore' ). ];
			package: 'OrionBrowser' with: [
				spec requires: #('OrionCore' 'OrionFamixCore' 'OrionCore' 'OrionFamixCore' ). ];
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2';
			package: 'OrionFamixJava' with: [
				spec requires: #('OrionFamixCore' ). ];
			package: 'Famix-Diff-Orion'.
		spec 
			group: 'default' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2');
			group: 'java' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2' 'OrionFamixJava' ). ].

]

{ #category : #baselines }
ConfigurationOfOrion >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'pharo2.x' version: '3-baseline'.	
	spec for: #'pharo3.x' version: '3-baseline'.
	spec for: #'common' version: '3-baseline'.
]

{ #category : #accessing }
ConfigurationOfOrion >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]
]
