Class {
	#name : #NumberParser,
	#superclass : #Object,
	#instVars : [
		'#stream',
		'#error',
		'#return'
	],
	#category : #Kernel
}

{ #category : #private }
NumberParser >> checkNumberEnd: position [
	| char |
]

{ #category : #private }
NumberParser >> completeFloat: anInteger [
	| tenth |
]

{ #category : #private }
NumberParser >> completeNumber: anInteger after: aCharacter [
	aCharacter = $. ifTrue: [
]

{ #category : #private }
NumberParser >> completeNumber: anInteger at: start [
	| number |
]

{ #category : #private }
NumberParser >> digitFromChar: char base: radix [
	| c |
]

{ #category : #private }
NumberParser >> endToken [
	self error: 'end of stream' at: stream position
]

{ #category : #accessing }
NumberParser >> error [
	^error
]

{ #category : #private }
NumberParser >> error: aString at: position [
	error := aString -> position.
]

{ #category : #private }
NumberParser >> negativeNumber [
	| position |
]

{ #category : #private }
NumberParser >> next [
	| char |
]

{ #category : #private }
NumberParser >> nextChar [
	^stream skipWhitespace atEnd ifFalse: [stream next]
]

{ #category : #private }
NumberParser >> nextDigit: radix [
	| char digit |
]

{ #category : #private }
NumberParser >> nextExponent [
	| negated exp |
]

{ #category : #private }
NumberParser >> nextFloat: aNumber [
	| base digit e exp |
]

{ #category : #private }
NumberParser >> nextIntegerRadix: radix [
	| value valid digit |
]

{ #category : #private }
NumberParser >> nextNumber: aCharacter [
	| start number digit |
]

{ #category : #private }
NumberParser >> nextScaledFrom: aNumber fractionDigits: digits [
	| scale denominator sd |
]

{ #category : #services }
NumberParser >> nextValue [
	^self next ifNil: [0] ifNotNil: [:assoc | assoc key]
]

{ #category : #accessing }
NumberParser >> on: aString [
	stream := aString readStream.
]

{ #category : #private }
NumberParser >> positiveNumber [
	| position |
]

{ #category : #private }
NumberParser >> reset [
	stream reset.
]
