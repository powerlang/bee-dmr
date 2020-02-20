Class {
	#name : #ObjectGraph,
	#superclass : #Object,
	#instVars : [
		'#stack'
	],
	#category : #Kernel
}

{ #category : #accessing }
ObjectGraph >> follow: root [
	| index scanned limit |
]

{ #category : #accessing }
ObjectGraph >> haveToFollow: object [
	^object _isSmallInteger not and: [object _hasBeenSeen not]
]

{ #category : #initialization }
ObjectGraph >> initialize [
	stack := CriticalArray emptyReserving: 1000.
]

{ #category : #accessing }
ObjectGraph >> queue: anObject [
	(self haveToFollow: anObject) ifFalse: [^self].
]

{ #category : #accessing }
ObjectGraph >> queue: anObject from: index to: limit [
	stack
]

{ #category : #accessing }
ObjectGraph >> scanNativeCode: aNativeCode [
	| bytes |
]

{ #category : #accessing }
ObjectGraph >> updateAndFollow: root [
	ActiveProcess stack update.
]
