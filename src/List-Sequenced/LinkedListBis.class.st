"
A LinkedListBis is a sequenced list where adjecent objects are linked, one by one, by LinkBis.

Description
-------------------
It can store any object.
It uses LinkBis class to store theses objects.

Public API and Key Messages
-------------------
- #initialize initializes the list to the empty list
- #appendTail:anObject / #appendHead:anObject / #insert: anObject At: anInteger allow to add elements
- #removeTail / #removeHead / #removeAt: anInteger allow to remove elements

Example 
-------------------
	linkedListBis := LinkedListBis new.
	linkedListBis
		appendHead: 1;
		appendTail: 3;
		insert: 2 at: 2;
		insert: 2 at: 2;
		removeAt: 2.
	linkedList.		""returns: a LinkedListBis(1 2 3)""

Internal Representation and Key Implementation Points.
-------------------
Instance Variables
	headLink: <LinkBis>
	tailLink: <LinkBis>
	numberOfLinks: <Integer>
"
Class {
	#name : #LinkedListBis,
	#superclass : #Object,
	#instVars : [
		'headLink',
		'tailLink',
		'numberOfLinks'
	],
	#category : #'List-Sequenced-Util'
}

{ #category : #inserting }
LinkedListBis >> appendHead: anObject [ 
	| link_tmp |
	link_tmp := LinkBis withValue: anObject  withNext: (self getLinkHead).
	" On peut réaliser une cascade"
	self isEmpty ifTrue: [ self setLinkTail: link_tmp ].
	self setLinkHead: link_tmp.
	self increaseNbOfLinks.
]

{ #category : #inserting }
LinkedListBis >> appendTail: anObject [  
	| link_tmp |
	link_tmp := LinkBis withValue: anObject.
	self isEmpty 
		ifTrue: [ headLink := link_tmp ]
		ifFalse: [ tailLink setNext: link_tmp ].
	tailLink := link_tmp.
	self increaseNbOfLinks.
]

{ #category : #modifying }
LinkedListBis >> decreaseNbOfLinks [
	numberOfLinks := numberOfLinks - 1.
]

{ #category : #private }
LinkedListBis >> emptyCheck [
	self isEmpty ifTrue: [self errorEmptyCollection]
]

{ #category : #private }
LinkedListBis >> errorEmptyCollection [
	"Signal a CollectionIsEmpty exception"
	CollectionIsEmpty signalWith: self
]

{ #category : #private }
LinkedListBis >> errorSizeMismatch [
	"Signal a SizeMismatch exception"
	SizeMismatch signal
]

{ #category : #accessing }
LinkedListBis >> getLinkAt: anInteger [ 
	| link_tmp |
	self sizeMismatchCheck: anInteger.
	link_tmp := self getLinkHead.
	(anInteger - 1) timesRepeat: [ link_tmp := link_tmp next ].
	^ link_tmp
]

{ #category : #accessing }
LinkedListBis >> getLinkAtNoCheck: anInteger [ 
	| link_tmp |
	link_tmp := self getLinkHead.
	(anInteger - 1) timesRepeat: [ link_tmp := link_tmp next ].
	^ link_tmp
]

{ #category : #accessing }
LinkedListBis >> getLinkHead [
	^ headLink 
]

{ #category : #accessing }
LinkedListBis >> getLinkTail [
	^ tailLink
]

{ #category : #accessing }
LinkedListBis >> getValueAt: anInteger [ 
	self sizeMismatchCheck: anInteger.
	^ (self getLinkAt: anInteger ) value.
]

{ #category : #accessing }
LinkedListBis >> getValueHead [
	^ (self getLinkHead) value.
]

{ #category : #accessing }
LinkedListBis >> getValueTail [
	^ (self getLinkTail) value.
]

{ #category : #modifying }
LinkedListBis >> increaseNbOfLinks [
	numberOfLinks := numberOfLinks + 1
]

{ #category : #initialization }
LinkedListBis >> initialize [ 
	super initialize.
	"headLink := nil.
	tailLink := nil."
	numberOfLinks := 0.
]

{ #category : #inserting }
LinkedListBis >> insert: anObject  at: anInteger [
	self sizeMismatchCheck: anInteger.
	(anInteger = (self numberOfLinks + 1)) ifTrue: [ ^ self appendTail: anObject ].
	(anInteger = 1) ifTrue: [ ^ self appendHead: anObject  ].
	(self getLinkAt: (anInteger - 1)) setNext: (LinkBis withValue: anObject  withNext: (self getLinkAt: anInteger )).
	self increaseNbOfLinks.
]

{ #category : #inserting }
LinkedListBis >> isEmpty [
	^ headLink isNil.
]

{ #category : #accessing }
LinkedListBis >> numberOfLinks [
	^ numberOfLinks
]

{ #category : #removing }
LinkedListBis >> removeAt: anInteger [ 
	self emptyCheck.
	self sizeMismatchCheck: anInteger.
	(anInteger = self numberOfLinks) ifTrue: [ ^ self removeTail ].
	(anInteger = 1) ifTrue: [ ^ self removeHead ].
	(self getLinkAt: anInteger - 1) setNext: (self getLinkAt: anInteger + 1).
	self decreaseNbOfLinks.
]

{ #category : #removing }
LinkedListBis >> removeHead [
	self emptyCheck.
	(numberOfLinks = 0)
		ifTrue: [ self reset ]
		ifFalse: [ self setLinkHead: (self getLinkAtNoCheck: 2).].
	self decreaseNbOfLinks.
]

{ #category : #removing }
LinkedListBis >> removeTail [
	| link_tmp |
	self emptyCheck.
	self decreaseNbOfLinks.
	link_tmp := self getLinkAtNoCheck: (self numberOfLinks).
	(numberOfLinks = 0)
		ifTrue: [ self reset ]
		ifFalse: [ self setLinkTail: link_tmp. link_tmp setNext: nil. ]
]

{ #category : #reseting }
LinkedListBis >> reset [
	self initialize.
	tailLink := nil.
	headLink := nil.
]

{ #category : #setting }
LinkedListBis >> setLinkHead: aLinkBis [ 
	headLink := aLinkBis 
]

{ #category : #setting }
LinkedListBis >> setLinkTail: aLinkBis [
	tailLink := aLinkBis 
]

{ #category : #private }
LinkedListBis >> sizeMismatchCheck: anInteger [ 
	(anInteger between: 1 and: (self numberOfLinks)) ifFalse: [self errorSizeMismatch]
]
