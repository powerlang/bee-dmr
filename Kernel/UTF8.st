Class {
	#name : #UTF8,
	#superclass : #Unicode,
	#category : #Kernel
}

{ #category : #testing }
UTF8 class >> accepts: aByteArray [
	^self current accepts: aByteArray
]

{ #category : #private }
UTF8 class >> decodeMemory: anExternalMemory length: anInteger [
	^OS utf8ToWide: anExternalMemory length: anInteger
]

{ #category : #private }
UTF8 class >> encodeMemory: anExternalMemory length: anInteger [
	"
]

{ #category : #accessing }
UTF8 class >> prefix [
	^#[16rEF 16rBB 16rBF]
]

{ #category : #testing }
UTF8 >> accepts: aByteArray [
	| stream |
]

{ #category : #'encoding / decoding' }
UTF8 >> decode: aByteArray [
	aByteArray isExternalMemory
]

{ #category : #'encoding / decoding' }
UTF8 >> decodeFrom: aStream [
	| b1 flags count bytes b2 b3 b4 |
]

{ #category : #'encoding / decoding' }
UTF8 >> encode: aString [
	aString class = String ifTrue: [
]

{ #category : #'encoding / decoding' }
UTF8 >> encode: aCharacter on: aStream [
	| code b1 b2 b3 b4 |
]

{ #category : #'encoding / decoding' }
UTF8 >> encodeCharacter: aCharacter [
	| code b1 b2 b3 b4 |
]

{ #category : #services }
UTF8 >> parameterFrom: aString [
	| strm |
]

{ #category : #'encoding / decoding' }
UTF8 >> sizeOfCharacter: aCharacter [
	| code |
]

{ #category : #'encoding / decoding' }
UTF8 >> sizeOfEncoding: code [
	code < 0x80 ifTrue: [^1].
]

{ #category : #private }
UTF8 >> trailing: byte [
	(byte bitAnd: 2r11100000) = 2r11000000 ifTrue: [^1].
]
