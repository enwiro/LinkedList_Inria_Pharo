Class {
	#name : #LinkTest,
	#superclass : #TestCase,
	#category : #'List-Sequenced-Tests'
}

{ #category : #tests }
LinkTest >> testInitialize [
	| link |
	link := LinkBis new
		initialize;
		yourself.
	self assert: ((link next isNil) and: (link value isNil))
]

{ #category : #tests }
LinkTest >> testInitializeWithValue [
	| link |
	link := LinkBis withValue: 1.
	self assert: link value equals: 1
]

{ #category : #tests }
LinkTest >> testInitializeWithValueWithNext [
	| link1 link2 |
	link1 := LinkBis withValue: 1.
	link2 := LinkBis withValue: 2 withNext: link1.
	self assert: link2 next value equals: 1
]
