Class {
	#name : #CriticalArray,
	#superclass : #SequenceableCollection,
	#instVars : [
		'#size',
		'#contents',
		'#space',
		'#writeBarrier'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
CriticalArray class >> emptyReserving: anInteger [
	^self on: Memory current reserving: anInteger
]

{ #category : #'instance creation' }
CriticalArray class >> on: anArray [
	^self new contents: anArray; yourself
]

{ #category : #'instance creation' }
CriticalArray class >> on: space reserving: anInteger [
	| array |
]

{ #category : #actions }
CriticalArray >> add: object [
	size = contents _size ifTrue: [self grow].
]

{ #category : #accessing }
CriticalArray >> at: index [
	^contents _basicAt: index
]

{ #category : #accessing }
CriticalArray >> at: index put: anObject [
	^writeBarrier
]

{ #category : #accessing }
CriticalArray >> contents [
	^contents
]

{ #category : #accessing }
CriticalArray >> contents: collection [
	contents := collection
]

{ #category : #enumerating }
CriticalArray >> do: aBlock [
	1 to: self size do: [:index | | element |
]

{ #category : #enumerating }
CriticalArray >> grow [
	self growToHold: contents _size * 2
]

{ #category : #private }
CriticalArray >> growToHold: n [
	"
]

{ #category : #accessing }
CriticalArray >> ignoreWriteBarrier [
	writeBarrier := false
]

{ #category : #testing }
CriticalArray >> includes: anObject [
	1 to: size do: [:i | anObject = (contents at: i) ifTrue: [^true]].
]

{ #category : #testing }
CriticalArray >> includesIdentical: anObject [
	1 to: size do: [:i | anObject == (contents at: i) ifTrue: [^true]].
]

{ #category : #testing }
CriticalArray >> initialize [
	super initialize.
]

{ #category : #testing }
CriticalArray >> isEmpty [
	^size = 0
]

{ #category : #accessing }
CriticalArray >> pop [
	| answer |
]

{ #category : #copying }
CriticalArray >> postCopy [
	super postCopy.
]

{ #category : #actions }
CriticalArray >> push: object [
	^self add: object
]

{ #category : #actions }
CriticalArray >> reset [
	1 to: self size do: [:i | contents _basicAt: i put: nil].
]

{ #category : #accessing }
CriticalArray >> size [
	^size
]

{ #category : #accessing }
CriticalArray >> size: anInteger [
	size := anInteger
]

{ #category : #accessing }
CriticalArray >> space: aSpace [
	space := aSpace
]

{ #category : #'adding / removing' }
CriticalArray >> unsafeAdd: anObject [
	size = contents _size ifTrue: [self grow].
]

{ #category : #accessing }
CriticalArray >> unsafeAt: index put: anObject [
	^contents _basicAt: index put: anObject
]
