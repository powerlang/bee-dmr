Class {
	#name : #MatchAlgorithm,
	#superclass : #Object,
	#instVars : [
		'#string',
		'#pattern',
		'#start',
		'#stop',
		'#tokens',
		'#failure',
		'#ranges'
	],
	#category : #Kernel
}

{ #category : #private }
MatchAlgorithm >> failBecause: aString [
	failure := aString
]

{ #category : #outputs }
MatchAlgorithm >> failure [
	^failure
]

{ #category : #outputs }
MatchAlgorithm >> hasMatched [
	^failure isNil and: [tokens isEmpty]
]

{ #category : #testing }
MatchAlgorithm >> hasTokens [
	^failure isNil and: [tokens notEmpty]
]

{ #category : #inputs }
MatchAlgorithm >> index: anInteger [
	start := anInteger
]

{ #category : #initialization }
MatchAlgorithm >> initialize [
	super initialize.
]

{ #category : #computing }
MatchAlgorithm >> matchFirstStar [
	| range |
]

{ #category : #computing }
MatchAlgorithm >> matchFirstToken [
	| token min match save |
]

{ #category : #computing }
MatchAlgorithm >> matchFirstTokenAfterStar [
	| token i |
]

{ #category : #computing }
MatchAlgorithm >> matchLastToken [
	tokens size = 1
]

{ #category : #computing }
MatchAlgorithm >> matchNextToken [
	tokens first matchFirstOn: self
]

{ #category : #outputs }
MatchAlgorithm >> matchRange [
	| sorted |
]

{ #category : #inputs }
MatchAlgorithm >> pattern: aStringPattern [
	pattern := aStringPattern
]

{ #category : #computing }
MatchAlgorithm >> privateMatchLastToken [
	| token min match |
]

{ #category : #private }
MatchAlgorithm >> reset [
	| end |
]

{ #category : #computing }
MatchAlgorithm >> run [
	self reset.
]

{ #category : #inputs }
MatchAlgorithm >> string: aString [
	string := MatchToken on: aString from: 1 to: aString size
]
