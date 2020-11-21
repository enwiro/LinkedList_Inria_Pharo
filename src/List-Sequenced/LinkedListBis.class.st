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

{ #category : #modi }
LinkedListBis >> appendHead: anObject [ 
	" On peut réaliser une cascade"
	self setLinkHead: (LinkBis withValue: anObject  withNext: (self getLinkHead)).
	self increaseNbOfLinks.
]

{ #category : #inserting }
LinkedListBis >> appendTail: anObject [  
	| link_tmp |
	link_tmp := LinkBis withValue: anObject.
	"On peut aussi le faire en cascade"
	self getLinkTail setNext: link_tmp.
	self setLinkTail: link_tmp.
	self increaseNbOfLinks.
]

{ #category : #accesing }
LinkedListBis >> getLinkAt: anInteger [ 
	| link_tmp |
	link_tmp := self getLinkHead.
	(anInteger - 1) timesRepeat: [ link_tmp := link_tmp next ].
	^ link_tmp
]

{ #category : #accessing }
LinkedListBis >> getLinkHead [
	^ headLink 
]

{ #category : #accesing }
LinkedListBis >> getLinkTail [
	^ tailLink
]

{ #category : #modifying }
LinkedListBis >> increaseNbOfLinks [
	numberOfLinks := numberOfLinks + 1
]

{ #category : #initialization }
LinkedListBis >> initialize [ 
	super initialize.
	headLink := LinkBisNil new.
	tailLink := LinkBisNil new.
	numberOfLinks := 0.
]

{ #category : #inserting }
LinkedListBis >> insert: anObject  at: anInteger [
	" Possibilité de faire une cascade "
	(self getLinkAt: (anInteger - 1)) setNext: (LinkBis withValue: anObject  withNext: (self getLinkAt: anInteger )).
	self increaseNbOfLinks.
]

{ #category : #accessing }
LinkedListBis >> numberOfLinks [
	^ numberOfLinks
]

{ #category : #'change set' }
LinkedListBis >> setLinkHead: aLinkBis [ 
	headLink := aLinkBis 
]

{ #category : #setting }
LinkedListBis >> setLinkTail: aLinkBis [
	tailLink := aLinkBis 
]
