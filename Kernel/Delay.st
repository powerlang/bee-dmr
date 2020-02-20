Class {
	#name : #Delay,
	#superclass : #Object,
	#instVars : [
		'#milliseconds',
		'#wait',
		'#timer'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
Delay class >> forMilliseconds: n [
	"
]

{ #category : #'instance creation' }
Delay class >> forSeconds: n [
	"
]

{ #category : #'instance creation' }
Delay class >> wait: milliseconds [
	(Delay forMilliseconds: milliseconds) wait
]

{ #category : #'instance creation' }
Delay class >> waitSeconds: seconds [
	(Delay forSeconds: seconds) wait
]

{ #category : #delaying }
Delay >> cancel [
	timer notNil ifTrue: [timer stop].
]

{ #category : #delaying }
Delay >> initTimer [
	timer notNil ifTrue: [timer stop].
]

{ #category : #testing }
Delay >> isWaiting [
	wait isNil ifTrue: [^false].
]

{ #category : #accessing }
Delay >> milliseconds: n [
	milliseconds := n
]

{ #category : #printing }
Delay >> printOn: aStream [
	'Delay of ' printOn: aStream.
]

{ #category : #delaying }
Delay >> resume [
	wait notNil ifTrue: [wait signal]
]

{ #category : #accessing }
Delay >> seconds: n [
	milliseconds := n * 1000
]

{ #category : #delaying }
Delay >> wait [
	ActiveProcess canBeSuspended
]
