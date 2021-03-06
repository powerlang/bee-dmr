"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Class {
	#name : #DBStrength,
	#superclass : #Object,
	#instVars : [
		'symbolicValue',
		'arithmeticValue'
	],
	#classVars : [
		'AbsoluteStrongest',
		'AbsoluteWeakest',
		'Required',
		'StrengthConstants',
		'StrengthTable'
	],
	#category : #SMDeltaBlue
}

{ #category : #constants }
DBStrength class >> absoluteStrongest [

	^AbsoluteStrongest
]

{ #category : #constants }
DBStrength class >> absoluteWeakest [

	^AbsoluteWeakest
]

{ #category : #initialize }
DBStrength class >> initialize [
	"Initialize the symbolic strength table. Fix the internally caches
	 values of all existing instances."
	"Strength initialize"

	StrengthTable := Dictionary new.
	StrengthTable at: #absoluteStrongest put: -10000.
	StrengthTable at: #required put: -800.
	StrengthTable at: #strongPreferred put: -600.
	StrengthTable at: #preferred put: -400.
	StrengthTable at: #strongDefault put: -200.
	StrengthTable at: #default put: 0.
	StrengthTable at: #weakDefault put: 500.
	StrengthTable at: #absoluteWeakest put: 10000.

	StrengthConstants := Dictionary new.
	StrengthTable keys do:
		[: strengthSymbol |
			StrengthConstants
				at: strengthSymbol
				put: ((super new) initializeWith: strengthSymbol)].

	AbsoluteStrongest := DBStrength of: #absoluteStrongest.
	AbsoluteWeakest := DBStrength of: #absoluteWeakest.
	Required := DBStrength of: #required.
]

{ #category : #'instance creation' }
DBStrength class >> of: aSymbol [
	"Answer an instance with the specified strength."

	^ StrengthConstants at: aSymbol
]

{ #category : #constants }
DBStrength class >> required [

	^Required
]

{ #category : #accessing }
DBStrength class >> strengthTable [
	^ StrengthTable
]

{ #category : #private }
DBStrength >> arithmeticValue [
	"Answer my arithmetic value. Used for comparisons. Note that
	 STRONGER constraints have SMALLER arithmetic values."

	^arithmeticValue
]

{ #category : #private }
DBStrength >> initializeWith: symVal [
	"Record my symbolic value and reset my arithmetic value."

	symbolicValue := symVal.
	arithmeticValue := DBStrength strengthTable at: symbolicValue.
]

{ #category : #printing }
DBStrength >> printOn: aStream [
	"Append a string which represents my strength onto aStream."

	aStream nextPutAll: '%', symbolicValue, '%'.
]

{ #category : #comparing }
DBStrength >> sameAs: aStrength [
	"Answer true if I am the same strength as the given Strength."

	^ arithmeticValue = aStrength arithmeticValue
]

{ #category : #comparing }
DBStrength >> stronger: aStrength [
	"Answer true if I am stronger than the given Strength."

	^ arithmeticValue < aStrength arithmeticValue
]

{ #category : #'max / min' }
DBStrength >> strongest: aStrength [
	"Answer the stronger of myself and aStrength."

	(aStrength stronger: self)
		ifTrue: [^aStrength]
		ifFalse: [^self]
]

{ #category : #comparing }
DBStrength >> weaker: aStrength [
	"Answer true if I am weaker than the given Strength."

	^ arithmeticValue > aStrength arithmeticValue
]

{ #category : #'max / min' }
DBStrength >> weakest: aStrength [
	"Answer the weaker of myself and aStrength."

	(aStrength weaker: self)
		ifTrue: [^aStrength]
		ifFalse: [^self].
]

