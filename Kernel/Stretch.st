Class {
	#name : #Stretch,
	#superclass : #Object,
	#instVars : [
		'#start',
		'#end'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
Stretch class >> from: start thru: end [
	^self new start: start; end: end
]

{ #category : #arithmetic }
Stretch >> - delta [
	^self + delta negated
]

{ #category : #arithmetic }
Stretch >> // anInteger [
	^start // anInteger thru: end // anInteger
]

{ #category : #arithmetic }
Stretch >> + delta [
	delta isInteger ifTrue: [^start + delta thru: end + delta].
]

{ #category : #comparing }
Stretch >> = aStretch [
	self class == aStretch class ifFalse: [^false].
]

{ #category : #arithmetic }
Stretch >> center [
	^start + end // 2
]

{ #category : #arithmetic }
Stretch >> down: anInteger [
	^start thru: end + anInteger
]

{ #category : #accessing }
Stretch >> end [
	^end
]

{ #category : #accessing }
Stretch >> end: anInteger [
	end := anInteger
]

{ #category : #comparing }
Stretch >> hash [
	^start hashWith: end
]

{ #category : #testing }
Stretch >> includes: anInteger [
	^anInteger between: start and: end
]

{ #category : #testing }
Stretch >> intersects: aStretch [
	self isEmpty ifTrue: [^false].
]

{ #category : #testing }
Stretch >> isEmpty [
	^end < start
]

{ #category : #arithmetic }
Stretch >> length [
	^end - start + 1
]

{ #category : #arithmetic }
Stretch >> max [
	^start max: end
]

{ #category : #arithmetic }
Stretch >> min [
	^start min: end
]

{ #category : #arithmetic }
Stretch >> negated [
	^start negated thru: end negated
]

{ #category : #testing }
Stretch >> notEmpty [
	^start <= end
]

{ #category : #printing }
Stretch >> printOn: aStream [
	aStream
]

{ #category : #accessing }
Stretch >> start [
	^start
]

{ #category : #accessing }
Stretch >> start: anInteger [
	start := anInteger
]
