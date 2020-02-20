Class {
	#name : #Array,
	#superclass : #ArrayedCollection,
	#type : #variable,
	#category : #Kernel
}

{ #category : #converting }
Array >> asArray [
	^self
]

{ #category : #converting }
Array >> asByteArray [
	^ByteArray withAll: self
]

{ #category : #printing }
Array >> canBePrintedAsLiteral [
	^Recursion
]

{ #category : #unclassified }
Array >> crash [
	| t |
]

{ #category : #testing }
Array >> isArray [
	^true
]
