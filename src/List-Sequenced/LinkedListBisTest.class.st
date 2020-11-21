"
This class contains tests

To facilitate the import via Git the classes are gathered in the same package. It is advisable to place the tests in a separate class.
"
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
	self assert: linkedList numberOfLinks equals: 1.
	self assert: linkedList getValueHead equals: 1.
]

{ #category : #tests }
LinkedListBisTest >> testAppendTail [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendTail: 1;
		yourself.
	self assert: linkedList numberOfLinks equals: 1.
	self assert: linkedList getValueTail equals: 1.
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
		
	self assert: linkedList numberOfLinks equals: 3.
	self assert: (linkedList getValueAt: 2) equals: 2.
	self should: [ linkedList insert: 2 at: 4 ] raise: SizeMismatch.
	self should: [ linkedList insert: 2 at: 0 ] raise: SizeMismatch.
]

{ #category : #tests }
LinkedListBisTest >> testRemoveAt [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendHead: 1;
		appendTail: 3;
		insert: 2 at: 2;
		removeAt: 2;
		yourself.
		
	self assert: linkedList numberOfLinks equals: 2.
	self assert: (linkedList getValueAt: 2) equals: 3.
	self should: [ linkedList removeAt: 4 ] raise: SizeMismatch.
	self should: [ linkedList removeAt: 0 ] raise: SizeMismatch.
]

{ #category : #tests }
LinkedListBisTest >> testRemoveHead [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendHead: 1;
		removeHead;
		yourself.
	self assert: linkedList numberOfLinks equals: 0.
	self assert: linkedList isEmpty.
	self should: [ linkedList removeHead ] raise: CollectionIsEmpty.
]

{ #category : #tests }
LinkedListBisTest >> testRemoveTail [
	| linkedList |
	linkedList := LinkedListBis new
		initialize;
		appendTail: 1;
		removeTail;
		yourself.
	self assert: linkedList numberOfLinks equals: 0.
	self assert: linkedList isEmpty.
	self should: [ linkedList removeHead ] raise: CollectionIsEmpty.
]
