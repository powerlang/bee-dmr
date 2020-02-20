Class {
	#name : #CallbackStackLink,
	#superclass : #Object,
	#instVars : [
		'#base',
		'#top',
		'#next'
	],
	#category : #Kernel
}

{ #category : #queries }
CallbackStackLink class >> after: aCallbackStackLink [
	^self new next: aCallbackStackLink
]

{ #category : #accessing }
CallbackStackLink >> base [
	^base
]

{ #category : #accessing }
CallbackStackLink >> base: anInteger [
	base := anInteger
]

{ #category : #initialization }
CallbackStackLink >> forgetStackPointers [
	base := nil.
]

{ #category : #testing }
CallbackStackLink >> isInCallback [
	^next !== nil
]

{ #category : #accessing }
CallbackStackLink >> next [
	^next
]

{ #category : #accessing }
CallbackStackLink >> next: aCallbackStackLink [
	next := aCallbackStackLink
]

{ #category : #initialization }
CallbackStackLink >> recordStackPointers [
	| frame dropped |
]

{ #category : #accessing }
CallbackStackLink >> top [
	^top
]
