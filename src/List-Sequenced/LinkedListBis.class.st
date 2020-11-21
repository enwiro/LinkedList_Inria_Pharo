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
