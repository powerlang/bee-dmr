Class {
	#name : #LargePositiveInteger,
	#superclass : #LargeInteger,
	#type : #bytes,
	#category : #Kernel
}

{ #category : #arithmetic }
LargePositiveInteger >> abs [
	^self
]

{ #category : #accessing }
LargePositiveInteger >> at: index [
	(index _isSmallInteger and: [index >= 1])
]

{ #category : #bits }
LargePositiveInteger >> bitAnd: anInteger [
	(anInteger isSmallInteger and: [anInteger > 0])
]

{ #category : #bits }
LargePositiveInteger >> bitInvert [
	| n integer mask |
]

{ #category : #private }
LargePositiveInteger >> computeQuoRem: divisor [
	| u v n m shift quo qhat a0 b a2 j k t aux qr |
]

{ #category : #private }
LargePositiveInteger >> copyOfSize: n [
	| copy |
]

{ #category : #private }
LargePositiveInteger >> fastQuoRem: divisor [
	| quo u j qr aux |
]

{ #category : #comparing }
LargePositiveInteger >> hash [
	self <= 16r20000000000000 ifTrue: [^self asFloat hash].
]

{ #category : #bits }
LargePositiveInteger >> highBit [
	"
]

{ #category : #private }
LargePositiveInteger >> mult: aNumber [
	| m integer n result |
]

{ #category : #testing }
LargePositiveInteger >> negative [
	^false
]

{ #category : #testing }
LargePositiveInteger >> positive [
	^true
]

{ #category : #printing }
LargePositiveInteger >> printOn: aStream [
	| digits index quotient |
]

{ #category : #arithmetic }
LargePositiveInteger >> quo: divisor [
	| data quo rem |
]

{ #category : #private }
LargePositiveInteger >> quoRem: divisor [
	| data quo rem s |
]

{ #category : #private }
LargePositiveInteger >> reduced [
	| n result integer |
]

{ #category : #private }
LargePositiveInteger >> reducedTo: n [
	| hi result integer |
]

{ #category : #accessing }
LargePositiveInteger >> sign [
	^1
]

{ #category : #testing }
LargePositiveInteger >> strictlyPositive [
	^true
]

{ #category : #enumerating }
LargePositiveInteger >> timesRepeat: aBlock [
	| max n |
]

{ #category : #private }
LargePositiveInteger >> twoDigitDivisionBits [
	true ifTrue: [^2].
]

{ #category : #private }
LargePositiveInteger >> twoDigitsQuoRem: d on: array [
	| k a d1 s c q1 b rem |
]

{ #category : #private }
LargePositiveInteger >> wideDigitAt: index [
	^(super wideDigitAt: index) ifNil: 0
]
