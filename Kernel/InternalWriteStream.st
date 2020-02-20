Class {
	#name : #InternalWriteStream,
	#superclass : #WriteStream,
	#instVars : [
		'#contents',
		'#position',
		'#limit',
		'#eol',
		'#size'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
InternalWriteStream class >> with: aCollection [
	^self new with: aCollection
]

{ #category : #services }
InternalWriteStream >> _nextNativePut: anObject [
	| object |
]

{ #category : #writing }
InternalWriteStream >> alignTo: boundary [
	| null |
]

{ #category : #testing }
InternalWriteStream >> atEnd [
	^limit <= position
]

{ #category : #configuration }
InternalWriteStream >> beUnicode [
	self isUnicode ifTrue: [^self].
]

{ #category : #accessing }
InternalWriteStream >> characterSize [
	^contents isString ifTrue: [contents characterSize] ifFalse: [1]
]

{ #category : #accessing }
InternalWriteStream >> collection [
	^contents
]

{ #category : #accessing }
InternalWriteStream >> collectorClass [
	^contents class
]

{ #category : #private }
InternalWriteStream >> collectorOfSize: anInteger [
	| collector |
]

{ #category : #accessing }
InternalWriteStream >> contents [
	^contents copyFrom: 1 to: size
]

{ #category : #private }
InternalWriteStream >> eol [
	eol notNil ifTrue: [^eol].
]

{ #category : #accessing }
InternalWriteStream >> eol: aString [
	eol := aString
]

{ #category : #private }
InternalWriteStream >> grow [
	| min max |
]

{ #category : #private }
InternalWriteStream >> grow: extra [
	| collection |
]

{ #category : #private }
InternalWriteStream >> growAtLeast: extra [
	self grow: (contents size * 2 max: extra) + 10
]

{ #category : #initialization }
InternalWriteStream >> initialize [
	super initialize.
]

{ #category : #testing }
InternalWriteStream >> isBinary [
	^contents isByteArray
]

{ #category : #testing }
InternalWriteStream >> isEmpty [
	^self size = 0
]

{ #category : #testing }
InternalWriteStream >> isUnicode [
	^contents isString and: [contents isUnicode]
]

{ #category : #accessing }
InternalWriteStream >> lineDelimiter [
	^eol first
]

{ #category : #accessing }
InternalWriteStream >> lineDelimiter: aCharacter [
	eol := (aCharacter isCharacter and: [aCharacter isCr])
]

{ #category : #accessing }
InternalWriteStream >> lineDelimiters: aString [
	self lineDelimiter: aString
]

{ #category : #marshalling }
InternalWriteStream >> nextBytePut: byte [
	| b |
]

{ #category : #writing }
InternalWriteStream >> nextPut: token [
	| index |
]

{ #category : #writing }
InternalWriteStream >> nextPutAll: aCollection [
	| n stop extra |
]

{ #category : #writing }
InternalWriteStream >> nextPutChar: aCharacter [
	(self isUnicode not andNot: [aCharacter isAnsi]) ifTrue: [self beUnicode].
]

{ #category : #writing }
InternalWriteStream >> nextPutString: aString [
	self isUnicode ifTrue: [^self nextPutAll: aString asWideString].
]

{ #category : #private }
InternalWriteStream >> on: aCollection [
	contents := aCollection.
]

{ #category : #accessing }
InternalWriteStream >> peek [
	^self atEnd ifFalse: [contents at: position + 1]
]

{ #category : #accessing }
InternalWriteStream >> peek: anInteger [
	| end |
]

{ #category : #accessing }
InternalWriteStream >> position [
	^position
]

{ #category : #positioning }
InternalWriteStream >> position: anInteger [
	(0 <= anInteger and: [anInteger <= limit])
]

{ #category : #services }
InternalWriteStream >> putBytesFrom: aByteArray from: start to: stop [
	| length end s e w |
]

{ #category : #services }
InternalWriteStream >> readStream [
	| reader |
]

{ #category : #private }
InternalWriteStream >> reserve: amount [
	| extra |
]

{ #category : #positioning }
InternalWriteStream >> reset [
	super reset.
]

{ #category : #positioning }
InternalWriteStream >> setToEnd [
	position := size
]

{ #category : #accessing }
InternalWriteStream >> size [
	^size
]

{ #category : #accessing }
InternalWriteStream >> sizeToEnd [
	^limit - position
]

{ #category : #positioning }
InternalWriteStream >> skip: anInteger [
	| end |
]

{ #category : #accessing }
InternalWriteStream >> truncate [
	self truncateTo: position
]

{ #category : #accessing }
InternalWriteStream >> truncateTo: anInteger [
	size := anInteger
]

{ #category : #accessing }
InternalWriteStream >> useCr [
	eol := String with: Cr
]

{ #category : #accessing }
InternalWriteStream >> useCrLf [
	eol := String with: Cr with: Lf
]

{ #category : #private }
InternalWriteStream >> with: aCollection [
	self on: aCollection.
]

{ #category : #accessing }
InternalWriteStream >> writeLimit: anInteger [
	limit := anInteger
]
