Class {
	#name : #LinkedListBisTest,
	#superclass : #TestCase,
	#category : #'List-Sequenced-Tests'
}

{ #category : #tests }
LinkedListBisTest >> testAppendHead [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendHead: 1;
		yourself.
	self assert: linkedList numberOfLinks equals: 1
]

{ #category : #tests }
LinkedListBisTest >> testAppendTail [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendTail: 1;
		yourself.
	self assert: linkedList numberOfLinks equals: 1
]

{ #category : #tests }
LinkedListBisTest >> testInitialize [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		yourself.
	self assert: linkedList numberOfLinks equals: 0
]

{ #category : #tests }
LinkedListBisTest >> testInsertAt [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendHead: 1;
		appendTail: 3;
		insert: 2 at: 2;
		yourself.
	self assert: linkedList numberOfLinks equals: 3
]
