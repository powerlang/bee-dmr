Class {
	#name : #ReadStream,
	#superclass : #Stream,
	#category : #Kernel
}

{ #category : #writing }
ReadStream >> alignTo: boundary [
	| n |
]

{ #category : #testing }
ReadStream >> atBeginning [
	^self position = 0
]

{ #category : #parsing }
ReadStream >> back [
	self skip: -1
]

{ #category : #parsing }
ReadStream >> backToAny: aCollection [
	"
]

{ #category : #parsing }
ReadStream >> backToOpen: open [
	"
]

{ #category : #parsing }
ReadStream >> backToOpen: close with: open [
	"
]

{ #category : #parsing }
ReadStream >> basicNextChunk [
	| token bulk |
]

{ #category : #converting }
ReadStream >> binaryReadStream [
	self isBinary ifTrue: [^self].
]

{ #category : #reading }
ReadStream >> collectionTailOf: anInteger [
	| start tail first |
]

{ #category : #private }
ReadStream >> collectorOfSize: anInteger [
	^self subclassResponsibility
]

{ #category : #reading }
ReadStream >> copyFrom: start to: stop [
	| pos result |
]

{ #category : #parsing }
ReadStream >> countBlanks [
	| count tab space |
]

{ #category : #reading }
ReadStream >> getBytesFor: aByteArray [
	self readInto: aByteArray from: 1 to: aByteArray sizeInBytes
]

{ #category : #marshalling }
ReadStream >> getInteger [
	| byte |
]

{ #category : #testing }
ReadStream >> isBinary [
	^false
]

{ #category : #testing }
ReadStream >> isEmpty [
	^self size = 0
]

{ #category : #private }
ReadStream >> newCollector [
	^self collectorOfSize: 0
]

{ #category : #reading }
ReadStream >> next [
	self subclassResponsibility
]

{ #category : #reading }
ReadStream >> next: anInteger [
	self subclassResponsibility
]

{ #category : #reading }
ReadStream >> nextByte [
	^self next asInteger
]

{ #category : #parsing }
ReadStream >> nextChunk [
	| bulk index n m bytes cr chunk |
]

{ #category : #reading }
ReadStream >> nextFloat [
	| float |
]

{ #category : #marshalling }
ReadStream >> nextInteger [
	^Integer readFrom: self
]

{ #category : #parsing }
ReadStream >> nextLine [
	| delimiter line |
]

{ #category : #reading }
ReadStream >> nextLong [
	| bytes |
]

{ #category : #reading }
ReadStream >> nextNoFail: anInteger [
	| n |
]

{ #category : #services }
ReadStream >> nextString [
	| size |
]

{ #category : #parsing }
ReadStream >> nextSubstring [
	| start |
]

{ #category : #parsing }
ReadStream >> nextSubstringOrNumber [
	| c numeric token writer |
]

{ #category : #marshalling }
ReadStream >> nextULong [
	| a0 a1 a2 a3 |
]

{ #category : #marshalling }
ReadStream >> nextUShort [
	| a0 a1 |
]

{ #category : #reading }
ReadStream >> nextUTF8 [
	^Character value: self nextUTF8Code
]

{ #category : #reading }
ReadStream >> nextUTF8Code [
	^UTF8 current decodeFrom: self
]

{ #category : #parsing }
ReadStream >> nextUTF8Line [
	self position = 0 ifTrue: [self peekForAll: UTF8 prefix asString].
]

{ #category : #parsing }
ReadStream >> nextWhile: aBlock [
	| write |
]

{ #category : #testing }
ReadStream >> notEmpty [
	^self isEmpty not
]

{ #category : #peeking }
ReadStream >> peek [
	self shouldNotImplement
]

{ #category : #peeking }
ReadStream >> peek: n [
	| pos safe data |
]

{ #category : #peeking }
ReadStream >> peekFor: token [
	^self peek = token ifTrue: [self skip]; yourself
]

{ #category : #peeking }
ReadStream >> peekForAll: aCollection [
	| n |
]

{ #category : #'reverse reading' }
ReadStream >> prev [
	^self position > 0
]

{ #category : #'reverse reading' }
ReadStream >> prevChunk [
	| bulk token index n m bytes chunk |
]

{ #category : #errors }
ReadStream >> readingError [
	EndOfStream signal
]

{ #category : #reading }
ReadStream >> readInto: aByteArray from: start to: stop [
	| data |
]

{ #category : #converting }
ReadStream >> readStream [
	^self
]

{ #category : #'reverse reading' }
ReadStream >> reversePeekFor: token [
	| prev |
]

{ #category : #'reverse reading' }
ReadStream >> reverseSkipTo: token [
	[self atBeginning] whileFalse: [self prev = token ifTrue: [^true]].
]

{ #category : #'reverse reading' }
ReadStream >> reverseUpTo: token [
	| offset pos found |
]

{ #category : #parsing }
ReadStream >> skipLine [
	| delimiter found |
]

{ #category : #parsing }
ReadStream >> skipSeparators [
	[self atEnd] whileFalse: [
]

{ #category : #positioning }
ReadStream >> skipTo: token [
	[self atEnd] whileFalse: [self next = token ifTrue: [^true]].
]

{ #category : #wb }
ReadStream >> skipWhitespace [
	[self atEnd orNot: [self peek isBlank]] whileFalse: [self next]
]

{ #category : #parsing }
ReadStream >> throughAll: aCollection [
	"
]

{ #category : #parsing }
ReadStream >> untilAnySatisfying: aBlock [
	| write |
]

{ #category : #parsing }
ReadStream >> upTo: token [
	| write c |
]

{ #category : #parsing }
ReadStream >> upToAll: aCollection [
	"
]

{ #category : #parsing }
ReadStream >> upToAny: aCollection [
	| write c |
]

{ #category : #parsing }
ReadStream >> upToAnySatisfying: aBlock [
	| write c |
]

{ #category : #parsing }
ReadStream >> upToClosing: open [
	"
]

{ #category : #parsing }
ReadStream >> upToClosing: open with: close [
	"
]

{ #category : #reading }
ReadStream >> upToEnd [
	^self next: self sizeToEnd
]

{ #category : #parsing }
ReadStream >> upToLast: token [
	"
]

{ #category : #parsing }
ReadStream >> upToWhitespace [
	^self upToAnySatisfying: [:c | c isBlank]
]

{ #category : #reading }
ReadStream >> utf8Trailing: byte [
	(byte bitAnd: 2r11100000) = 2r11000000 ifTrue: [^1].
]
