Class {
	#name : #SequenceableCollection,
	#superclass : #Collection,
	#category : #Kernel
}

{ #category : #'instance creation' }
SequenceableCollection class >> new: size withAll: value [
	| collection |
]

{ #category : #'instance creation' }
SequenceableCollection class >> streamContents: aBlock [
	| stream |
]

{ #category : #'instance creation' }
SequenceableCollection class >> withAll: aCollection [
	| new idx |
]

{ #category : #operations }
SequenceableCollection >> , aSequenceableCollection [
	| size n |
]

{ #category : #comparing }
SequenceableCollection >> = aCollection [
	| size |
]

{ #category : #queries }
SequenceableCollection >> after: anObject [
	^self after: anObject ifAbsent: [self errorNotFound]
]

{ #category : #queries }
SequenceableCollection >> after: anObject ifAbsent: absentBlock [
	| i |
]

{ #category : #copying }
SequenceableCollection >> allButFirst [
	^self allButFirst: 1
]

{ #category : #copying }
SequenceableCollection >> allButFirst: n [
	^self copyFrom: n + 1
]

{ #category : #copying }
SequenceableCollection >> allButIndex: anInteger [
	| m copy |
]

{ #category : #copying }
SequenceableCollection >> allButLast [
	^self allButLast: 1
]

{ #category : #copying }
SequenceableCollection >> allButLast: n [
	^self copyFrom: 1 to: self size - n
]

{ #category : #converting }
SequenceableCollection >> asStream [
	^ReadWriteStream on: self
]

{ #category : #accessing }
SequenceableCollection >> at: anInteger ifAbsent: aBlock [
	^(anInteger between: 1 and: self size)
]

{ #category : #accessing }
SequenceableCollection >> atAll: aCollection put: anObject [
	aCollection do: [:i | self at: i put: anObject]
]

{ #category : #accessing }
SequenceableCollection >> atAllPut: anObject [
	self size > 0
]

{ #category : #queries }
SequenceableCollection >> before: anObject [
	^self before: anObject ifAbsent: [self errorNotFound]
]

{ #category : #queries }
SequenceableCollection >> before: anObject ifAbsent: absentBlock [
	| index |
]

{ #category : #inquiries }
SequenceableCollection >> beginsWith: aCollection [
	self size < aCollection size ifTrue: [^false].
]

{ #category : #validation }
SequenceableCollection >> checkIndex: anInteger [
	anInteger isInteger ifFalse: [^self error: 'Non integer index'].
]

{ #category : #copying }
SequenceableCollection >> copyFrom: start [
	^self copyFrom: start to: self size
]

{ #category : #copying }
SequenceableCollection >> copyFrom: start to: stop [
	| size copy |
]

{ #category : #copying }
SequenceableCollection >> copyReplaceFrom: start to: stop with: aCollection [
	| n m |
]

{ #category : #copying }
SequenceableCollection >> copyTo: end [
	^self copyFrom: 1 to: end
]

{ #category : #copying }
SequenceableCollection >> copyWith: anObject [
	| size |
]

{ #category : #copying }
SequenceableCollection >> copyWithout: anObject [
	| n i1 copy j |
]

{ #category : #enumerating }
SequenceableCollection >> do: aBlock [
	1 to: self size do: [:i | | element |
]

{ #category : #inquiries }
SequenceableCollection >> endsWith: aCollection [
	| m n |
]

{ #category : #queries }
SequenceableCollection >> findFirst: aBlock [
	^self findFirst: aBlock ifAbsent: [self errorNotFound]
]

{ #category : #queries }
SequenceableCollection >> findFirst: aBlock ifAbsent: absentBlock [
	^self findFirst: aBlock startingAt: 1 ifAbsent: absentBlock
]

{ #category : #queries }
SequenceableCollection >> findFirst: aBlock startingAt: index ifAbsent: absentBlock [
	| size i |
]

{ #category : #queries }
SequenceableCollection >> findLast: aBlock [
	^self findLast: aBlock ifAbsent: [self errorNotFound]
]

{ #category : #queries }
SequenceableCollection >> findLast: aBlock ifAbsent: absentBlock [
	self size
]

{ #category : #accessing }
SequenceableCollection >> first [
	^self at: 1
]

{ #category : #enumerating }
SequenceableCollection >> fold: aBlock [
	"
]

{ #category : #accessing }
SequenceableCollection >> fourth [
	^self at: 4
]

{ #category : #enumerating }
SequenceableCollection >> from: start
	start to: stop do: [:i | | found item |
]

{ #category : #private }
SequenceableCollection >> growSize [
	| min |
]

{ #category : #comparing }
SequenceableCollection >> hash [
	^self size
]

{ #category : #testing }
SequenceableCollection >> hasIndexedSlots [
	^true
]

{ #category : #sorting }
SequenceableCollection >> hybridSort [
	self hybridSort: self
]

{ #category : #sorting }
SequenceableCollection >> hybridSort: aBlock [
	self
]

{ #category : #sorting }
SequenceableCollection >> hybridSortFrom: start
	"
]

{ #category : #inquiries }
SequenceableCollection >> includes: anObject [
	| i |
]

{ #category : #inquiries }
SequenceableCollection >> increasingIncludes: anObject [
	| stop start |
]

{ #category : #inquiries }
SequenceableCollection >> indexOf: anObject [
	^self indexOf: anObject ifAbsent: 0
]

{ #category : #inquiries }
SequenceableCollection >> indexOf: anObject
	start to: end do: [:i | (self at: i) = anObject ifTrue: [^i]].
]

{ #category : #inquiries }
SequenceableCollection >> indexOf: anObject ifAbsent: aBlock [
	^self indexOf: anObject startingAt: 1 ifAbsent: aBlock
]

{ #category : #inquiries }
SequenceableCollection >> indexOf: anObject startingAt: start ifAbsent: aBlock [
	^self
]

{ #category : #inquiries }
SequenceableCollection >> indexOfIdentical: anObject [
	^self indexOfIdentical: anObject ifAbsent: 0
]

{ #category : #inquiries }
SequenceableCollection >> indexOfIdentical: anObject ifAbsent: aBlock [
	1 to: self size do: [:i | (self at: i) == anObject ifTrue: [^i]].
]

{ #category : #inquiries }
SequenceableCollection >> indexOfSubcollection: aCollection [
	^self indexOfSubcollection: aCollection startingAt: 1
]

{ #category : #inquiries }
SequenceableCollection >> indexOfSubcollection: aCollection
	| m k |
]

{ #category : #inquiries }
SequenceableCollection >> indexOfSubcollection: aCollection startingAt: anInteger [
	| m n i first |
]

{ #category : #sorting }
SequenceableCollection >> insertSortFrom: start
	"
]

{ #category : #testing }
SequenceableCollection >> isSequenceableCollection [
	^true
]

{ #category : #accessing }
SequenceableCollection >> last [
	^self at: self size
]

{ #category : #inquiries }
SequenceableCollection >> occurrencesOf: anObject [
	| count |
]

{ #category : #errors }
SequenceableCollection >> outOfBoundsIndex: anInteger [
	^self
]

{ #category : #printing }
SequenceableCollection >> printElementText: element on: rtf position: i [
	rtf nextPutAll: i asString; tab; tab.
]

{ #category : #converting }
SequenceableCollection >> readStream [
	^InternalReadStream on: self
]

{ #category : #replacing }
SequenceableCollection >> replaceBackwardFrom: stop
	| i j |
]

{ #category : #replacing }
SequenceableCollection >> replaceForwardFrom: start
	| i j |
]

{ #category : #replacing }
SequenceableCollection >> replaceFrom: start to: stop with: aCollection [
	stop - start + 1 <= aCollection size
]

{ #category : #replacing }
SequenceableCollection >> replaceFrom: start
	| end |
]

{ #category : #replacing }
SequenceableCollection >> replaceFrom: start to: stop withObject: anObject [
	start to: stop do: [:i | self at: i put: anObject].
]

{ #category : #accessing }
SequenceableCollection >> reverse [
	^self reversed
]

{ #category : #accessing }
SequenceableCollection >> reversed [
	| copy n |
]

{ #category : #enumerating }
SequenceableCollection >> reverseDetect: aBlock [
	^self reverseDetect: aBlock ifNone: [self errorNotFound]
]

{ #category : #enumerating }
SequenceableCollection >> reverseDetect: aBlock ifNone: exceptionBlock [
	self reverseDo: [:e | (aBlock evaluateWith: e) ifTrue: [^e]].
]

{ #category : #enumerating }
SequenceableCollection >> reverseDo: aBlock [
	self size to: 1 by: -1 do: [:i | aBlock evaluateWith: (self atValid: i)]
]

{ #category : #accessing }
SequenceableCollection >> second [
	^self at: 2
]

{ #category : #accessing }
SequenceableCollection >> size [
	^self subclassResponsibility
]

{ #category : #sorting }
SequenceableCollection >> sort [
	self sortBy: self
]

{ #category : #sorting }
SequenceableCollection >> sort: start to: stop with: block [
	| i0 i1 |
]

{ #category : #sorting }
SequenceableCollection >> sortBy: aBlock [
	self sort: 1 to: self size with: aBlock
]

{ #category : #accessing }
SequenceableCollection >> swap: index1 with: index2 [
	| temp |
]

{ #category : #private }
SequenceableCollection >> td1 [
	| m td1 |
]

{ #category : #accessing }
SequenceableCollection >> third [
	^self at: 3
]

{ #category : #evaluating }
SequenceableCollection >> value: object1 value: object2 [
	^[object1 <= object2] on: Error do: [object2 >= object1]
]

{ #category : #enumerating }
SequenceableCollection >> with: aCollection collect: aBlock in: rCollection [
	| n |
]

{ #category : #enumerating }
SequenceableCollection >> with: aCollection do: aBlock [
	self size = aCollection size
]

{ #category : #enumerating }
SequenceableCollection >> with: aCollection withIndexDo: aBlock [
	aCollection size = self size
]

{ #category : #enumerating }
SequenceableCollection >> withIndexCollect: aBlock [
	^self withIndexCollect: aBlock in: (self class new: self size)
]

{ #category : #enumerating }
SequenceableCollection >> withIndexCollect: aBlock in: aCollection [
	| size |
]

{ #category : #enumerating }
SequenceableCollection >> withIndexDo: aBlock [
	1 to: self size do: [:i | aBlock value: (self atValid: i) value: i]
]

{ #category : #enumerating }
SequenceableCollection >> withIndexSelect: aBlock [
	| i |
]

{ #category : #converting }
SequenceableCollection >> writeStream [
	^InternalWriteStream on: self
]
