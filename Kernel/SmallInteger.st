Class {
	#name : #SmallInteger,
	#superclass : #Integer,
	#classVars : [
		'#Maximum',
		'#Minimum'
	],
	#category : #Kernel
}

{ #category : #testing }
SmallInteger class >> canBeDeleted [
	^false
]

{ #category : #initialization }
SmallInteger class >> initialize [
	Maximum := (1 bitShift: WordSize * 8 - 2) - 1.
]

{ #category : #constants }
SmallInteger class >> maximum [
	^Maximum
]

{ #category : #constants }
SmallInteger class >> minimum [
	^Minimum
]

{ #category : #arithmetic }
SmallInteger >> - aNumber [
	^aNumber _isSmallInteger
]

{ #category : #comparing }
SmallInteger >> != aNumber [
	^self == aNumber ifTrue: [false] ifFalse: [true]
]

{ #category : #arithmetic }
SmallInteger >> % aNumber [
	^self \\ aNumber
]

{ #category : #bits }
SmallInteger >> & anInteger [
	^self bitAnd: anInteger
]

{ #category : #arithmetic }
SmallInteger >> * aNumber [
	| result size |
]

{ #category : #arithmetic }
SmallInteger >> // aNumber [
	| result quotient answer |
]

{ #category : #arithmetic }
SmallInteger >> \\ aNumber [
	aNumber == 0 ifTrue: [^self zeroDivisorOn: #'\\'].
]

{ #category : #underprimitives }
SmallInteger >> _isSmallInteger [
	^true
]

{ #category : #arithmetic }
SmallInteger >> | anInteger [
	^self bitOr: anInteger
]

{ #category : #comparing }
SmallInteger >> ~= aNumber [
	^aNumber ~= self
]

{ #category : #arithmetic }
SmallInteger >> + aNumber [
	^aNumber _isSmallInteger
]

{ #category : #arithmetic }
SmallInteger >> < aNumber [
	^aNumber > self
]

{ #category : #comparing }
SmallInteger >> <= aNumber [
	^aNumber >= self
]

{ #category : #comparing }
SmallInteger >> = aNumber [
	^aNumber = self
]

{ #category : #comparing }
SmallInteger >> > aNumber [
	^aNumber < self
]

{ #category : #comparing }
SmallInteger >> >= aNumber [
	^aNumber <= self
]

{ #category : #arithmetic }
SmallInteger >> asLargeInteger [
	| result |
]

{ #category : #converting }
SmallInteger >> asObject [
	^self _asObject
]

{ #category : #accessing }
SmallInteger >> at: index [
	index <= 0 ifTrue: [self error: 'non positive index'].
]

{ #category : #accessing }
SmallInteger >> at: index put: anObject [
	^self shouldNotImplement
]

{ #category : #private }
SmallInteger >> basicAt: index [
	index <= 0 ifTrue: [self error: 'non positive index'].
]

{ #category : #private }
SmallInteger >> basicHash [
	^self
]

{ #category : #'meta accessing' }
SmallInteger >> behavior: aBehavior [
	self shouldNotImplement
]

{ #category : #bits }
SmallInteger >> bitAnd: anInteger [
	| sum |
]

{ #category : #bits }
SmallInteger >> bitAt: anInteger [
	anInteger < 1 ifTrue: [self error: 'non positive index'].
]

{ #category : #bits }
SmallInteger >> bitOr: anInteger [
	^anInteger bitOr: self
]

{ #category : #bits }
SmallInteger >> bitShift: anInteger [
	anInteger = 0 ifTrue: [^self].
]

{ #category : #bits }
SmallInteger >> bitShiftLeft: anInteger [
	| result bits total bytes hi lo shift |
]

{ #category : #unclassified }
SmallInteger >> bitShiftRight: anInteger [
	^anInteger <= (WordSize * 8 - 2)
]

{ #category : #bits }
SmallInteger >> bitXor: anInteger [
	^anInteger bitXor: self
]

{ #category : #accessing }
SmallInteger >> byteAt: anInteger [
	^self at: anInteger
]

{ #category : #accessing }
SmallInteger >> byteAt: anInteger put: byte [
	^self at: anInteger put: byte
]

{ #category : #arithmetic }
SmallInteger >> gcd: anInteger [
	| n m |
]

{ #category : #comparing }
SmallInteger >> hash [
	^self
]

{ #category : #private }
SmallInteger >> hashMultiply [
	^self hashMultiply: 16r19660D
]

{ #category : #private }
SmallInteger >> hashMultiply: aNumber [
	| low14a high14a low14b high14b |
]

{ #category : #bits }
SmallInteger >> highBit [
	self < 0 ifTrue: [^self error: 'not valid for negative numbers'].
]

{ #category : #accessing }
SmallInteger >> highDigit [
	| n b |
]

{ #category : #accessing }
SmallInteger >> highWideDigit [
	| highest |
]

{ #category : #testing }
SmallInteger >> isFixedObject [
	^true
]

{ #category : #testing }
SmallInteger >> isSmallInteger [
	^true
]

{ #category : #'bit operations' }
SmallInteger >> low32 [
	^WordSize > 4 ifTrue: [self bitAnd: 0xFFFFFFFF] ifFalse: [self]
]

{ #category : #private }
SmallInteger >> marshalOn: aStream [
	aStream _nextNativePut: self
]

{ #category : #unclassified }
SmallInteger >> negated [
	self = Minimum ifTrue: [^Maximum + 1].
]

{ #category : #printing }
SmallInteger >> printOn: aStream [
	| abs divisor digit |
]

{ #category : #arithmetic }
SmallInteger >> quo: aNumber [
	| result |
]

{ #category : #arithmetic }
SmallInteger >> quoRem1: anInteger [
	^{self // anInteger. self \\ anInteger}
]

{ #category : #arithmetic }
SmallInteger >> rem: aNumber [
	^super rem: aNumber
]

{ #category : #finalization }
SmallInteger >> requireFinalization [
	^self
]

{ #category : #accessing }
SmallInteger >> sizeInBytes [
	^self = 0
]

{ #category : #private }
SmallInteger >> wideDigitAt: index [
	index <= 0 ifTrue: [self error: 'non positive index'].
]
