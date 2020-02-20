Class {
	#name : #CompositeCollection,
	#superclass : #Collection,
	#instVars : [
		'#contents'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
CompositeCollection class >> withAll: collection [
	^self new withAll: collection
]

{ #category : #adding }
CompositeCollection >> & collection [
	collection class == self class
]

{ #category : #adding }
CompositeCollection >> && anObject [
	contents add: {anObject}
]

{ #category : #adding }
CompositeCollection >> add: anObject [
	anObject isEmpty ifFalse: [contents add: anObject]
]

{ #category : #adding }
CompositeCollection >> addAll: aCollection [
	self & aCollection
]

{ #category : #adding }
CompositeCollection >> addTo: aCompositeCollection [
	contents do: [:c | aCompositeCollection add: c]
]

{ #category : #converting }
CompositeCollection >> asOrderedCollection [
	| collection |
]

{ #category : #accessing }
CompositeCollection >> at: index [
	^self at: index ifAbsent: [self error: 'Invalid index']
]

{ #category : #accessing }
CompositeCollection >> at: index ifAbsent: aBlock [
	| s end |
]

{ #category : #accessing }
CompositeCollection >> contents [
	^contents
]

{ #category : #accessing }
CompositeCollection >> copyFrom: start to: stop [
	| size copy |
]

{ #category : #copying }
CompositeCollection >> copyWithout: anObject [
	| copy |
]

{ #category : #enumerating }
CompositeCollection >> do: aBlock [
	contents do: [:each | each do: aBlock]
]

{ #category : #accessing }
CompositeCollection >> findFirst: aBlock ifAbsent: errorBlock [
	self withIndexDo: [:ai :i | (aBlock evaluateWith: ai) ifTrue: [^i]].
]

{ #category : #accessing }
CompositeCollection >> first [
	^self at: 1
]

{ #category : #inquiries }
CompositeCollection >> indexOf: anObject [
	^self indexOf: anObject ifAbsent: 0
]

{ #category : #inquiries }
CompositeCollection >> indexOf: anObject ifAbsent: aBlock [
	self withIndexDo: [:o :i | o = anObject ifTrue: [^i]].
]

{ #category : #inquiries }
CompositeCollection >> indexOfIdentical: anObject [
	^self indexOfIdentical: anObject ifAbsent: 0
]

{ #category : #inquiries }
CompositeCollection >> indexOfIdentical: anObject ifAbsent: aBlock [
	self withIndexDo: [:o :i | o = anObject ifTrue: [^i]].
]

{ #category : #initialization }
CompositeCollection >> initialize [
	super initialize.
]

{ #category : #testing }
CompositeCollection >> isEmpty [
	contents isEmpty ifTrue: [^true].
]

{ #category : #testing }
CompositeCollection >> isSequenceableCollection [
	^contents conform: [:collection | collection isSequenceableCollection]
]

{ #category : #accessing }
CompositeCollection >> last [
	^(contents notEmpty and: [contents last notEmpty])
]

{ #category : #accessing }
CompositeCollection >> owningResource [
	^nil
]

{ #category : #copying }
CompositeCollection >> postCopy [
	super postCopy.
]

{ #category : #converting }
CompositeCollection >> readStream [
	^InternalReadStream on: self
]

{ #category : #removing }
CompositeCollection >> remove: anObject [
	| index |
]

{ #category : #enumerating }
CompositeCollection >> reverseDo: aBlock [
	contents reverseDo: [:each | each reverseDo: aBlock]
]

{ #category : #accessing }
CompositeCollection >> second [
	^self at: 2
]

{ #category : #accessing }
CompositeCollection >> size [
	^contents sum: [:c | c size] ifNone: [0]
]

{ #category : #organizing }
CompositeCollection >> sortBy: aBlock [
	^self asOrderedCollection sortBy: aBlock
]

{ #category : #private }
CompositeCollection >> species [
	^OrderedCollection
]

{ #category : #enumerating }
CompositeCollection >> with: aCollection do: aBlock [
	self
]

{ #category : #enumerating }
CompositeCollection >> with: aCollection withIndexDo: aBlock [
	self ASSERT: self isSequenceableCollection.
]

{ #category : #private }
CompositeCollection >> withAll: collection [
	contents := collection
]

{ #category : #enumerating }
CompositeCollection >> withIndexDo: aBlock [
	| i |
]
