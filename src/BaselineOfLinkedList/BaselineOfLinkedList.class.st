Class {
	#name : #BaselineOfLinkedList,
	#superclass : #BaselineOf,
	#category : #BaselineOfLinkedList
}

{ #category : #baselines }
BaselineOfLinkedList >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'List-Sequenced' ]
]
