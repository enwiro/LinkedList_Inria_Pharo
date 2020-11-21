"
LinkBis store a value that is a pointer to any kind of object and a another pointer to an other LinkBis.
"
Class {
	#name : #LinkBis,
	#superclass : #Object,
	#instVars : [
		'next',
		'value'
	],
	#category : #'List-Sequenced-Support'
}

{ #category : #'instance creation' }
LinkBis class >> withValue: anObject [
	^ self new setValue: anObject.
]

{ #category : #'instance creation' }
LinkBis class >> withValue: anObject withNext: aLink [
	^ self new setValue: anObject;
		setNext: aLink.
]

{ #category : #accessing }
LinkBis >> next [
	^ next
]

{ #category : #accessing }
LinkBis >> setNext: aLink [
	next := aLink.
]

{ #category : #accessing }
LinkBis >> setValue: anObject [
	value := anObject.
]

{ #category : #accessing }
LinkBis >> value [ 
	^ value
]
