Class {
	#name : #ByteArraySegment,
	#superclass : #ArrayedCollection,
	#instVars : [
		'#contents',
		'#offset',
		'#size'
	],
	#category : #Kernel
}

{ #category : #private }
ByteArraySegment class >> on: aByteArray from: start size: size [
	^self on: aByteArray from: start to: start + size - 1
]

{ #category : #private }
ByteArraySegment class >> on: aByteArray from: start to: stop [
	^self new on: aByteArray from: start to: stop
]

{ #category : #comparing }
ByteArraySegment >> = aCollection [
	| index |
]

{ #category : #converting }
ByteArraySegment >> asByteArray [
	^self copyFrom: 1 to: size
]

{ #category : #converting }
ByteArraySegment >> asInteger [
	^self inject: 0 into: [:sum :each | (sum bitShift: 8) + each]
]

{ #category : #converting }
ByteArraySegment >> asParameter [
	^self asByteArray asParameter
]

{ #category : #converting }
ByteArraySegment >> asString [
	| string n |
]

{ #category : #accessing }
ByteArraySegment >> at: anInteger [
	^self byteAt: anInteger
]

{ #category : #accessing }
ByteArraySegment >> at: anInteger put: byte [
	^self byteAt: anInteger put: byte
]

{ #category : #accessing }
ByteArraySegment >> byteAt: index [
	self validateIndex: index.
]

{ #category : #accessing }
ByteArraySegment >> byteAt: index put: byte [
	self validateIndex: index.
]

{ #category : #accessing }
ByteArraySegment >> byteAtOffset: anInteger [
	^self byteAt: anInteger + 1
]

{ #category : #accessing }
ByteArraySegment >> byteAtOffset: anInteger put: byte [
	^self byteAt: anInteger + 1 put: byte
]

{ #category : #accessing }
ByteArraySegment >> bytesAtOffset: anInteger put: aByteArray [
	self
]

{ #category : #accessing }
ByteArraySegment >> copyFrom: start to: end [
	| s |
]

{ #category : #accessing }
ByteArraySegment >> copyToGlobalMemory [
	^GlobalMemory fromByteArray: self
]

{ #category : #accessing }
ByteArraySegment >> endOffset [
	^offset + size
]

{ #category : #accessing }
ByteArraySegment >> externalCopy [
	^ExternalMemory fromByteArray: self asByteArray
]

{ #category : #comparing }
ByteArraySegment >> hash [
	| hash |
]

{ #category : #accessing }
ByteArraySegment >> longAtOffset: anInteger [
	self validateIndex: anInteger + 1 toIndex: anInteger + 4.
]

{ #category : #accessing }
ByteArraySegment >> longAtOffset: anInteger put: long [
	self validateIndex: anInteger + 1 toIndex: anInteger + 4.
]

{ #category : #accessing }
ByteArraySegment >> offset [
	^offset
]

{ #category : #accessing }
ByteArraySegment >> offset: anInteger [
	offset := anInteger
]

{ #category : #private }
ByteArraySegment >> on: aByteArray from: start to: stop [
	contents := aByteArray.
]

{ #category : #accessing }
ByteArraySegment >> replaceBytesUpTo: count with: aCollection [
	count > size ifTrue: [self validateIndex: count].
]

{ #category : #accessing }
ByteArraySegment >> replaceFrom: start to: end with: another [
	^self replaceFrom: start to: end with: another startingAt: 1
]

{ #category : #accessing }
ByteArraySegment >> replaceFrom: start
	self validateIndex: start toIndex: end.
]

{ #category : #accessing }
ByteArraySegment >> segmentFrom: index size: anInteger [
	^ByteArraySegment on: self from: index size: anInteger
]

{ #category : #accessing }
ByteArraySegment >> size [
	^size
]

{ #category : #accessing }
ByteArraySegment >> sizeInBytes [
	^size
]

{ #category : #accessing }
ByteArraySegment >> uLargeAtOffset: anInteger [
	self validateIndex: anInteger + 1 toIndex: anInteger + 8.
]

{ #category : #accessing }
ByteArraySegment >> uLargeAtOffset: anInteger put: ularge [
	self validateIndex: anInteger + 1 toIndex: anInteger + 8.
]

{ #category : #accessing }
ByteArraySegment >> uLongAtOffset: anInteger [
	self validateIndex: anInteger + 1 toIndex: anInteger + 4.
]

{ #category : #accessing }
ByteArraySegment >> uLongAtOffset: anInteger put: long [
	self validateIndex: anInteger + 1 toIndex: anInteger + 4.
]

{ #category : #accessing }
ByteArraySegment >> uShortAtOffset: anInteger [
	self validateIndex: anInteger + 1 toIndex: anInteger + 2.
]

{ #category : #accessing }
ByteArraySegment >> uShortAtOffset: anInteger put: long [
	self validateIndex: anInteger + 1 toIndex: anInteger + 2.
]

{ #category : #accessing }
ByteArraySegment >> utf16 [
	^UTF16 current decode: self asByteArray
]

{ #category : #accessing }
ByteArraySegment >> validateIndex: index [
	(index between: 1 and: size) ifFalse: [self outOfBoundsIndex: index]
]

{ #category : #accessing }
ByteArraySegment >> validateIndex: start toIndex: end [
	1 <= start ifFalse: [self outOfBoundsIndex: start].
]
