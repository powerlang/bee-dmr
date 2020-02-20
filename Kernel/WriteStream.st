Class {
	#name : #WriteStream,
	#superclass : #Stream,
	#category : #Kernel
}

{ #category : #unclassified }
WriteStream >> << anObject [
	| string |
]

{ #category : #writing }
WriteStream >> alignTo: boundary [
	| null |
]

{ #category : #private }
WriteStream >> collectorOfSize: anInteger [
	self subclassResponsibility
]

{ #category : #writing }
WriteStream >> cr [
	self nextPutAll: self eol
]

{ #category : #writing }
WriteStream >> crlf [
	self nextPutAll: String crlf
]

{ #category : #writing }
WriteStream >> crtab [
	self crtab: 1
]

{ #category : #writing }
WriteStream >> crtab: n [
	self cr; tab: n
]

{ #category : #writing }
WriteStream >> flush [
	
]

{ #category : #testing }
WriteStream >> isBinary [
	^false
]

{ #category : #testing }
WriteStream >> isOpen [
	^true
]

{ #category : #writing }
WriteStream >> next: anInteger put: anObject [
	anInteger timesRepeat: [self nextPut: anObject].
]

{ #category : #marshalling }
WriteStream >> nextBytePut: byte [
	| token |
]

{ #category : #marshalling }
WriteStream >> nextBytesPut: aByteArray [
	| token |
]

{ #category : #'chunk format' }
WriteStream >> nextChunkPut: aString [
	aString printChunkOn: self
]

{ #category : #marshalling }
WriteStream >> nextFloatPut: aFloat [
	^self nextPutAll: aFloat asByteArray
]

{ #category : #marshalling }
WriteStream >> nextLongPut: anInteger [
	| bytes |
]

{ #category : #writing }
WriteStream >> nextPut: anObject [
	self subclassResponsibility
]

{ #category : #writing }
WriteStream >> nextPutAll: aCollection [
	aCollection do: [:element | self nextPut: element]
]

{ #category : #marshalling }
WriteStream >> nextStringPut: aString [
	self nextULongPut: aString size; nextPutAll: aString
]

{ #category : #marshalling }
WriteStream >> nextULargePut: anInteger [
	self isBinary
]

{ #category : #marshalling }
WriteStream >> nextULongPut: anInteger [
	self isBinary
]

{ #category : #marshalling }
WriteStream >> nextUShortPut: anInteger [
	| bytes |
]

{ #category : #writing }
WriteStream >> nextUTF8Put: aString [
	aString do: [:ch | ch storeUTF8On: self]
]

{ #category : #services }
WriteStream >> print: anObject [
	anObject isString ifTrue: [^self nextPutAll: anObject].
]

{ #category : #writing }
WriteStream >> putBytesFrom: aByteArray [
	self putBytesFrom: aByteArray from: 1 to: aByteArray sizeInBytes
]

{ #category : #writing }
WriteStream >> putBytesFrom: aByteArray from: start to: stop [
	self subclassResponsibility
]

{ #category : #marshalling }
WriteStream >> putInteger: anInteger [
	anInteger < 128
]

{ #category : #writing }
WriteStream >> show: aString [
	self nextPutAll: aString
]

{ #category : #writing }
WriteStream >> space [
	self nextPut: Space
]

{ #category : #writing }
WriteStream >> tab [
	self nextPut: Tab
]

{ #category : #writing }
WriteStream >> tab: n [
	n timesRepeat: [self tab]
]
