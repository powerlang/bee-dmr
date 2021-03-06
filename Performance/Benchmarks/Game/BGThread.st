"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Class {
	#name : #BGThread,
	#superclass : #Object,
	#instVars : [
		'name',
		'nextThread',
		'token',
		'semaphore',
		'done'
	],
	#category : #Game
}

{ #category : #'instance creation' }
BGThread class >> named: anInteger next: aThread done: completionBlock [
   ^ self new 
			name: anInteger;
			nextThread: aThread;
			done: completionBlock;
			fork
]

{ #category : #'instance creation' }
BGThread class >> new [
   ^ self basicNew
			semaphore: Semaphore new
]

{ #category : #accessing }
BGThread >> done: completionBlock [
	done := completionBlock
]

{ #category : #thread }
BGThread >> fork [
	[self run] forkAt: Processor backgroundPriority
]

{ #category : #accessing }
BGThread >> name: anInteger [
   name := anInteger
]

{ #category : #accessing }
BGThread >> nextThread: aThread [
   nextThread := aThread
]

{ #category : #thread }
BGThread >> run [
   [ semaphore wait.
     token < 503 ] whileFalse: [
								nextThread takeToken: token - 1].
	
	token == 0 ifFalse: [ nextThread takeToken: token - 1 ]
					 ifTrue:  [ done value: name ]
					 
	
   
]

{ #category : #accessing }
BGThread >> semaphore: aSemaphore [
   semaphore := aSemaphore
]

{ #category : #accessing }
BGThread >> takeToken: x [
   token := x.
   semaphore signal
]

