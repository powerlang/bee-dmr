Class {
	#name : #ActionSequence,
	#superclass : #Array,
	#type : #variable,
	#category : #Kernel
}

{ #category : #operations }
ActionSequence >> & anActionSequence [
	^anActionSequence notNil ifTrue: [self , anActionSequence] ifFalse: [self]
]

{ #category : #operations }
ActionSequence >> && anObject [
	^anObject notNil ifTrue: [self copyWith: anObject]
]

{ #category : #converting }
ActionSequence >> asActionSequence [
	^self
]

{ #category : #converting }
ActionSequence >> asArray [
	| array |
]

{ #category : #accessing }
ActionSequence >> compressed [
	^self isEmpty ifFalse: [self size = 1 ifTrue: [self first] ifFalse: [self]]
]

{ #category : #evaluating }
ActionSequence >> evaluate [
	| value |
]

{ #category : #evaluating }
ActionSequence >> evaluateWithArguments: anArray [
	| value |
]

{ #category : #printing }
ActionSequence >> printOn: aStream [
	aStream nextPutAll: self class name; space.
]
