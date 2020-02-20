Class {
	#name : #Interval,
	#superclass : #ArrayedCollection,
	#instVars : [
		'#start',
		'#end',
		'#step'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
Interval class >> from: beginningInteger to: endInteger [
	^self from: beginningInteger to: endInteger by: 1
]

{ #category : #'instance creation' }
Interval class >> from: beginningInteger to: endInteger by: incrementInteger [
	^self basicNew from: beginningInteger to: endInteger step: incrementInteger
]

{ #category : #arithmetic }
Interval >> - delta [
	^start - delta to: end - delta by: step
]

{ #category : #arithmetic }
Interval >> + delta [
	^start + delta to: end + delta by: step
]

{ #category : #converting }
Interval >> asStretch [
	^start thru: end
]

{ #category : #accessing }
Interval >> at: anInteger [
	| answer |
]

{ #category : #accessing }
Interval >> at: anInteger put: aNumber [
	^self shouldNotImplement
]

{ #category : #accessing }
Interval >> atValid: anInteger [
	| answer |
]

{ #category : #accessing }
Interval >> end [
	^end
]

{ #category : #private }
Interval >> from: startInteger to: endInteger step: stepInteger [
	start := startInteger.
]

{ #category : #operations }
Interval >> intersection: aCollection [
	| s e |
]

{ #category : #private }
Interval >> printOn: aStream [
	aStream
]

{ #category : #services }
Interval >> reversed [
	^self class from: end to: start by: step negated
]

{ #category : #accessing }
Interval >> size [
	| size x |
]

{ #category : #private }
Interval >> species [
	^Array
]

{ #category : #accessing }
Interval >> start [
	^start
]

{ #category : #accessing }
Interval >> step [
	^step
]
