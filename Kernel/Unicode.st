Class {
	#name : #Unicode,
	#superclass : #Object,
	#category : #Kernel
}

{ #category : #accessing }
Unicode class >> current [
	^current
]

{ #category : #services }
Unicode class >> decode: aByteArray [
	^self current decode: aByteArray
]

{ #category : #services }
Unicode class >> decodeBytes: aByteArray [
	| decoder stream |
]

{ #category : #services }
Unicode class >> decodeFromAddress: externalAddress length: anInteger [
	^self current
]

{ #category : #services }
Unicode class >> decoderFor: aStream [
	(aStream peekForAll: UTF32 prefix) ifTrue: [^UTF32].
]

{ #category : #initialization }
Unicode class >> initialize [
	self withAllSubclasses do: #initializeCurrent
]

{ #category : #initialization }
Unicode class >> initializeCurrent [
	current := self == Unicode ifFalse: [self new]
]

{ #category : #services }
Unicode >> characterIndexOf: aString at: anInteger [
	| index s |
]

{ #category : #private }
Unicode >> compareStringiW: aString1 with: aString2 [
	^UTF16 current compareStringiW: aString1 with: aString2
]

{ #category : #'encoding / decoding' }
Unicode >> decode: aByteArray [
	^self decodeStringFrom: aByteArray readStream
]

{ #category : #'encoding / decoding' }
Unicode >> decodeFrom: aStream [
	self subclassResponsibility
]

{ #category : #services }
Unicode >> decodeStringFrom: aStream [
	^self
]

{ #category : #services }
Unicode >> decodeStringFrom: aStream length: anInteger [
	| string |
]

{ #category : #services }
Unicode >> decodeStringFrom: aStream on: buffer [
	| bytes code string index n |
]

{ #category : #'encoding / decoding' }
Unicode >> encode: aString [
	^ByteArray
]

{ #category : #'encoding / decoding' }
Unicode >> encode: aCharacter on: aStream [
	self subclassResponsibility
]

{ #category : #services }
Unicode >> externalCopyOf: aString [
	| bytes |
]

{ #category : #services }
Unicode >> indexesOf: aString from: start to: end [
	"
]

{ #category : #services }
Unicode >> isString: s1 greaterThan: s2 [
	^(self compareStringiW: s1 with: s2) > 0
]

{ #category : #services }
Unicode >> isString: s1 greaterThanOrEqualTo: s2 [
	^(self compareStringiW: s1 with: s2) >= 0
]

{ #category : #services }
Unicode >> isString: s1 lessThan: s2 [
	^(self compareStringiW: s1 with: s2) < 0
]

{ #category : #services }
Unicode >> isString: s1 lessThanOrEqualTo: s2 [
	^(self compareStringiW: s1 with: s2) <= 0
]

{ #category : #services }
Unicode >> lowercaseOf: aString [
	^UTF16 current lowercaseOf: aString
]

{ #category : #private }
Unicode >> minBytesPerChar [
	^1
]

{ #category : #services }
Unicode >> sizeInBytesOf: aString [
	| size |
]

{ #category : #services }
Unicode >> uppercaseOf: aString [
	^UTF16 current uppercaseOf: aString
]
