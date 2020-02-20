Class {
	#name : #StarToken,
	#superclass : #Object,
	#category : #Kernel
}

{ #category : #accessing }
StarToken class >> current [
	^current
]

{ #category : #initialization }
StarToken class >> initialize [
	"
]

{ #category : #initialization }
StarToken class >> initializeCurrent [
	current := self new
]

{ #category : #'double dispatching' }
StarToken >> matchFirstAfterStartOn: aMatchAlgorithm [
	aMatchAlgorithm matchFirstStar
]

{ #category : #'double dispatching' }
StarToken >> matchFirstOn: aMatchAlgorithm [
	aMatchAlgorithm matchFirstStar
]

{ #category : #'double dispatching' }
StarToken >> matchLastOn: aMatchAlgorithm [
	"
]

{ #category : #printing }
StarToken >> printOn: aStream [
	aStream nextPut: $*
]
