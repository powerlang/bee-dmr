Class {
	#name : #Behavior,
	#superclass : #Object,
	#instVars : [
		'#class',
		'#methods',
		'#next'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
Behavior class >> fromClass: aClass [
	^self new fromClass: aClass
]

{ #category : #'instance creation' }
Behavior class >> new [
	^super new basicHash; yourself
]

{ #category : #'instance creation' }
Behavior class >> with: md [
	^self new methods: md
]

{ #category : #'instance creation' }
Behavior class >> with: md1 with: md2 [
	^self new
]

{ #category : #'instance creation' }
Behavior class >> with: md withAll: behavior [
	^self new methods: md; next: behavior
]

{ #category : #comparing }
Behavior >> = aBehavior [
	self class = aBehavior class ifFalse: [^false].
	class = aBehavior classBinding ifFalse: [^false].
]

{ #category : #converting }
Behavior >> asArray [
	^(OrderedCollection from: self iterator: #do:) asArray
]

{ #category : #accessing }
Behavior >> classBinding [
	^class

{ #category : #copying }
Behavior >> copyWithout: behavior [
	| b |
]

{ #category : #enumerating }
Behavior >> do: aBlock [
	aBlock evaluateWith: methods.
]

{ #category : #services }
Behavior >> enhancedWith: aMethodDictionary [
	^self class with: aMethodDictionary withAll: self
]

{ #category : #inquiries }
Behavior >> findMethodFor: aSymbol [
	self do: [:md | | cm |
]

{ #category : #inquiries }
Behavior >> findMethodFor: aSymbol in: aClass [
	self do: [:md | | cm |
]

{ #category : #accessing }
Behavior >> fromClass: aClass [
	class := aClass.
	methods := aClass instanceBehavior methods.
]

{ #category : #comparing }
Behavior >> hash [
	^methods hashWith: next
]

{ #category : #testing }
Behavior >> hasInstanceBehavior [
	^class instanceBehavior !== self
]

{ #category : #inquiries }
Behavior >> implements: aSymbol [
	| method |
]

{ #category : #testing }
Behavior >> includes: behavior [
	self == behavior ifTrue: [^true].
]

{ #category : #accessing }
Behavior >> instanceBehavior [
	^self hasInstanceBehavior ifTrue: [methods]
]

{ #category : #accessing }
Behavior >> methods [
	^methods
]

{ #category : #accessing }
Behavior >> methods: aMethodDictionary [
	methods := aMethodDictionary
]

{ #category : #accessing }
Behavior >> next [
	^next
]

{ #category : #accessing }
Behavior >> next: aBehavior [
	next := aBehavior
]

{ #category : #testing }
Behavior >> replace: aBehavior with: newBehavior [
	next == aBehavior
]
