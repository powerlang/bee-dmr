Class {
	#name : #Point,
	#superclass : #Object,
	#instVars : [
		'#x',
		'#y'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
Point class >> fromString: aString [
	^self readFrom: aString readStream
]

{ #category : #'instance creation' }
Point class >> readFrom: aStream [
	"
]

{ #category : #'instance creation' }
Point class >> x: x y: y [
	^self new x: x; y: y
]

{ #category : #arithmetic }
Point >> - operand [
	| point |
]

{ #category : #arithmetic }
Point >> * operand [
	| point |
]

{ #category : #arithmetic }
Point >> / operand [
	| point |
]

{ #category : #arithmetic }
Point >> // operand [
	| point |
]

{ #category : #arithmetic }
Point >> \\ operand [
	| point |
]

{ #category : #arithmetic }
Point >> + operand [
	| point |
]

{ #category : #comparing }
Point >> < aPoint [
	^x < aPoint x and: [y < aPoint y]
]

{ #category : #comparing }
Point >> <= aPoint [
	^x <= aPoint x and: [y <= aPoint y]
]

{ #category : #comparing }
Point >> = aPoint [
	^aPoint isPoint and: [x = aPoint x] and: [y = aPoint y]
]

{ #category : #comparing }
Point >> > aPoint [
	^x > aPoint x and: [self y > aPoint y]
]

{ #category : #comparing }
Point >> >= aPoint [
	^x >= aPoint x and: [y >= aPoint y]
]

{ #category : #arithmetic }
Point >> abs [
	^x abs @ y abs
]

{ #category : #comparing }
Point >> asPoint [
	^self
]

{ #category : #comparing }
Point >> between: aPoint and: anotherPoint [
	^aPoint <= self and: [self <= anotherPoint]
]

{ #category : #geometry }
Point >> corner: aPoint [
	^Rectangle origin: self corner: aPoint
]

{ #category : #geometry }
Point >> down: aNumber [
	^x @ (y + aNumber)
]

{ #category : #geometry }
Point >> extent: aPoint [
	^Rectangle origin: self extent: aPoint
]

{ #category : #comparing }
Point >> hash [
	^x hashWith: y
]

{ #category : #'geometry - testing' }
Point >> isBefore: aPoint [
	^y < aPoint y or: [aPoint y = y and: [x < aPoint x]]
]

{ #category : #testing }
Point >> isPoint [
	^true
]

{ #category : #accessing }
Point >> left: aNumber [
	^x - aNumber @ y
]

{ #category : #geometry }
Point >> leftAndDown: delta [
	| point |
]

{ #category : #geometry }
Point >> leftAndUp: delta [
	| point |
]

{ #category : #comparing }
Point >> max: aPoint [
	^(x max: aPoint x) @ (y max: aPoint y)
]

{ #category : #comparing }
Point >> min: aPoint [
	| max |
]

{ #category : #arithmetic }
Point >> moveBy: aPoint [
	x := x + aPoint x.
]

{ #category : #arithmetic }
Point >> negated [
	^x negated @ y negated
]

{ #category : #printing }
Point >> printOn: aStream [
	x isFraction
]

{ #category : #geometry }
Point >> right: aNumber [
	^x + aNumber @ y
]

{ #category : #geometry }
Point >> rightAndUp: delta [
	| point |
]

{ #category : #geometry }
Point >> rightBottom: aPoint [
	^self corner: aPoint
]

{ #category : #geometry }
Point >> rightTop: aPoint [
	^Rectangle leftBottom: self rightTop: aPoint
]

{ #category : #arithmetic }
Point >> rounded [
	^x rounded @ y rounded
]

{ #category : #geometry }
Point >> translatedBy: delta [
	^self + delta
]

{ #category : #geometry }
Point >> transpose [
	^y @ x
]

{ #category : #arithmetic }
Point >> truncated [
	^x truncated @ y truncated
]

{ #category : #arithmetic }
Point >> truncateTo: factor [
	^(self x truncateTo: factor) @ (self y truncateTo: factor)
]

{ #category : #geometry }
Point >> up: aNumber [
	^x @ (y - aNumber)
]

{ #category : #accessing }
Point >> x [
	^x
]

{ #category : #accessing }
Point >> x: aNumber [
	x := aNumber
]

{ #category : #accessing }
Point >> x: abscissa y: ordinate [
	x := abscissa.
]

{ #category : #accessing }
Point >> y [
	^y
]

{ #category : #accessing }
Point >> y: aNumber [
	y := aNumber
]
