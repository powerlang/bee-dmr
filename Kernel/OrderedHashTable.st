Class {
	#name : #OrderedHashTable,
	#superclass : #OpenHashTable,
	#type : #variable,
	#instVars : [
		'#values'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
OrderedHashTable class >> new: anInteger [
	^(super new: anInteger) initialize
]

{ #category : #accessing }
OrderedHashTable >> at: index [
	| i |
]

{ #category : #accessing }
OrderedHashTable >> at: index put: anObject [
	| i element |
]

{ #category : #services }
OrderedHashTable >> at: index tally: tally [
	| n i count vi |
]

{ #category : #removing }
OrderedHashTable >> clearSlot: anInteger with: emptySlot [
	| i |
]

{ #category : #services }
OrderedHashTable >> compressTo: tally [
	| relocations compressed |
]

{ #category : #enumerating }
OrderedHashTable >> elementAt: index [
	^values at: index
]

{ #category : #enumerating }
OrderedHashTable >> elementsDo: aBlock [
	values
]

{ #category : #enumerating }
OrderedHashTable >> elementsDo: aBlock count: n [
	| i |
]

{ #category : #accessing }
OrderedHashTable >> first [
	values do: [:v | v notNil ifTrue: [^v]].
]

{ #category : #private }
OrderedHashTable >> indexAtKey: key [
	| index |
]

{ #category : #accessing }
OrderedHashTable >> indexOfElement: anObject [
	| i |
]

{ #category : #initialization }
OrderedHashTable >> initialize [
	super initialize.
]

{ #category : #enumerating }
OrderedHashTable >> keysAndValuesDo: aBlock [
	self elementsDo: [:assoc | aBlock value: assoc key value: assoc value]
]

{ #category : #accessing }
OrderedHashTable >> last [
	values reverseDo: [:v | v notNil ifTrue: [^v]].
]

{ #category : #private }
OrderedHashTable >> move: anAssociation to: anInteger [
	| a min max |
]

{ #category : #private }
OrderedHashTable >> moveLastTo: anInteger [
	| last |
]

{ #category : #copying }
OrderedHashTable >> postCopy [
	super postCopy.
]

{ #category : #enumerating }
OrderedHashTable >> privateDo: aBlock [
	values do: [:value | aBlock evaluateWith: value]
]

{ #category : #removing }
OrderedHashTable >> removeAll [
	super removeAll.
]

{ #category : #removing }
OrderedHashTable >> removeObject: anObject ifAbsent: aBlock [
	| association |
]

{ #category : #accessing }
OrderedHashTable >> totalSize [
	^values size
]

{ #category : #accessing }
OrderedHashTable >> valueAt: index ifAbsent: aBlock [
	| i value |
]

{ #category : #enumerating }
OrderedHashTable >> valuesReverseDo: aBlock [
	values reverseDo: [:assoc | 
]
