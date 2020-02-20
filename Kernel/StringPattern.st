Class {
	#name : #StringPattern,
	#superclass : #Object,
	#instVars : [
		'#stream',
		'#tokens'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
StringPattern class >> on: aString [
	^self new on: aString
]

{ #category : #scanning }
StringPattern >> addStar [
	stream atEnd ifTrue: [^self].
]

{ #category : #scanning }
StringPattern >> addToken [
	| star pos end token |
]

{ #category : #accessing }
StringPattern >> input [
	^stream contents
]

{ #category : #inquiries }
StringPattern >> match: aString [
	^self match: aString index: 1
]

{ #category : #inquiries }
StringPattern >> match: aString ifAbsent: aBlock [
	^self match: aString index: 1 ifAbsent: aBlock
]

{ #category : #inquiries }
StringPattern >> match: aString index: anInteger [
	^self match: aString index: anInteger ifAbsent: nil
]

{ #category : #inquiries }
StringPattern >> match: aString index: anInteger ifAbsent: aBlock [
	| algorithm |
]

{ #category : #inquiries }
StringPattern >> matches: aString [
	| range |
]

{ #category : #accessing }
StringPattern >> on: aString [
	stream := aString readStream.
]

{ #category : #printing }
StringPattern >> printOn: aStream [
	tokens do: [:t | t printOn: aStream]
]

{ #category : #scanning }
StringPattern >> scan [
	[stream atEnd] whileFalse: [self addToken; addStar]
]

{ #category : #accessing }
StringPattern >> tokens [
	^tokens copy
]
