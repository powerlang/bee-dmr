Class {
	#name : #OrderedCollection,
	#superclass : #SequenceableCollection,
	#instVars : [
		'#start',
		'#end',
		'#contents'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
OrderedCollection class >> from: anObject iterator: aSymbol [
	| new |
]

{ #category : #'instance creation' }
OrderedCollection class >> new [
	^self new: 10
]

{ #category : #'instance creation' }
OrderedCollection class >> new: anInteger [
	^self basicNew initialize: anInteger
]

{ #category : #'instance creation' }
OrderedCollection class >> new: size withAll: anObject [
	| instance |
]

{ #category : #'instance creation' }
OrderedCollection class >> withAll: aCollection [
	| collection |
]

{ #category : #operations }
OrderedCollection >> , aCollection [
	aCollection isCollection ifFalse: [super , aCollection].
]

{ #category : #errors }
OrderedCollection >> absentElement [
	^self error: 'element not found'
]

{ #category : #adding }
OrderedCollection >> add: anObject [
	^self basicAdd: anObject
]

{ #category : #adding }
OrderedCollection >> add: anObject after: anotherObject [
	| index |
]

{ #category : #adding }
OrderedCollection >> add: anObject afterIndex: anInteger [
	self makeRoomBehind: anInteger.
]

{ #category : #adding }
OrderedCollection >> add: anObject at: anInteger [
	self makeRoomBehind: anInteger - 1.
]

{ #category : #adding }
OrderedCollection >> add: anObject before: anotherObject [
	| index |
]

{ #category : #adding }
OrderedCollection >> add: anObject beforeIndex: anInteger [
	self makeRoomBehind: anInteger - 1.
]

{ #category : #adding }
OrderedCollection >> addAll: aCollection [
	^aCollection isSequenceableCollection
]

{ #category : #adding }
OrderedCollection >> addAllFirst: aCollection [
	| pending n |
]

{ #category : #adding }
OrderedCollection >> addAllLast: aCollection [
	| index m n |
]

{ #category : #adding }
OrderedCollection >> addFirst: anObject [
	start = 1 ifTrue: [self makeRoomBefore].
]

{ #category : #adding }
OrderedCollection >> addLast: anObject [
	^self basicAdd: anObject
]

{ #category : #copying }
OrderedCollection >> allButIndex: anInteger [
	^self copy removeIndex: anInteger
]

{ #category : #converting }
OrderedCollection >> asOrderedCollection [
	^self
]

{ #category : #accessing }
OrderedCollection >> at: anInteger [
	^self at: anInteger ifAbsent: [self outOfBoundsIndex: anInteger]
]

{ #category : #accessing }
OrderedCollection >> at: anInteger ifAbsent: aBlock [
	| index |
]

{ #category : #accessing }
OrderedCollection >> at: anInteger put: anObject [
	| index |
]

{ #category : #accessing }
OrderedCollection >> atAllPut: anObject [
	start to: end do: [:i | contents at: i put: anObject]
]

{ #category : #accessing }
OrderedCollection >> atValid: anInteger [
	^contents at: anInteger + start - 1
]

{ #category : #private }
OrderedCollection >> basicAdd: anObject [
	end = contents size ifTrue: [self makeRoomBehind].
]

{ #category : #accessing }
OrderedCollection >> collectionSize [
	^end - start + 1
]

{ #category : #private }
OrderedCollection >> compact [
	| size e |
]

{ #category : #copying }
OrderedCollection >> copyFrom: startIndex to: endIndex [
	| n copy |
]

{ #category : #copying }
OrderedCollection >> copyWith: anObject [
	^self copy add: anObject; yourself
]

{ #category : #enumerating }
OrderedCollection >> do: aBlock [
	start to: end do: [:i | aBlock evaluateWith: (contents at: i)]
]

{ #category : #private }
OrderedCollection >> grow [
	self growTo: contents size + self growSize
]

{ #category : #private }
OrderedCollection >> growTo: anInteger [
	| copy |
]

{ #category : #inquiries }
OrderedCollection >> includes: anObject [
	start to: end do: [:i | anObject = (contents at: i) ifTrue: [^true]].
]

{ #category : #private }
OrderedCollection >> initialize: anInteger [
	start := 1.
]

{ #category : #private }
OrderedCollection >> makeRoomBefore [
	| n s |
]

{ #category : #private }
OrderedCollection >> makeRoomBehind [
	| s n e |
]

{ #category : #private }
OrderedCollection >> makeRoomBehind: anInteger [
	(anInteger = 0 and: [start > 1]) ifTrue: [
]

{ #category : #copying }
OrderedCollection >> postCopy [
	contents := contents copy
]

{ #category : #removing }
OrderedCollection >> remove: anObject ifAbsent: aBlock [
	start to: end do: [:i | 
]

{ #category : #removing }
OrderedCollection >> removeAll [
	contents replaceFrom: start to: end withObject: nil.
]

{ #category : #'adding/removing' }
OrderedCollection >> removeAllSuchThat: aBlock [
	| n |
]

{ #category : #removing }
OrderedCollection >> removeFirst [
	| first |
]

{ #category : #removing }
OrderedCollection >> removeIndex: anInteger [
	| absolute |
]

{ #category : #removing }
OrderedCollection >> removeLast [
	| last |
]

{ #category : #unclassified }
OrderedCollection >> replaceBackwardFrom: first
	contents
]

{ #category : #unclassified }
OrderedCollection >> replaceForwardFrom: first
	contents
]

{ #category : #accessing }
OrderedCollection >> replaceFrom: firstIndex to: lastIndex with: aCollection [
	| m d n e |
]

{ #category : #accessing }
OrderedCollection >> size [
	^self collectionSize
]

{ #category : #sorting }
OrderedCollection >> sortBy: aBlock [
	contents sort: start to: end with: aBlock
]

{ #category : #accessing }
OrderedCollection >> stretchTo: n [
	n < end ifTrue: [self error: 'invalid argument'].
]

{ #category : #private }
OrderedCollection >> stretchToContents [
	start := 1.
]
