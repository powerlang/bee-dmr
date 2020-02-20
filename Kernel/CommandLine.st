Class {
	#name : #CommandLine,
	#superclass : #Object,
	#instVars : [
		'#input',
		'#rules',
		'#tokens',
		'#command',
		'#options'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
CommandLine class >> fromString: aString [
	^self new fromString: aString; process
]

{ #category : #'instance creation' }
CommandLine class >> on: aString [
	^self new on: aString
]

{ #category : #private }
CommandLine >> actionFor: option [
	^rules at: option ifAbsent: nil
]

{ #category : #accessing }
CommandLine >> addOption: option [
	^self addOption: option with: #()
]

{ #category : #accessing }
CommandLine >> addOption: option with: arguments [
	| op args |
]

{ #category : #accessing }
CommandLine >> argumentAt: option [
	| arguments |
]

{ #category : #accessing }
CommandLine >> argumentsAt: option [
	| op |
]

{ #category : #accessing }
CommandLine >> booleanAt: option [
	| arguments value |
]

{ #category : #private }
CommandLine >> canonize: option [
	^(((option trimPrefix: '--') trimPrefix: '-') trimTail: ':') trimTail: '='
]

{ #category : #accessing }
CommandLine >> command [
	^command
]

{ #category : #accessing }
CommandLine >> command: aString [
	command := aString
]

{ #category : #private }
CommandLine >> formatArgument: argument [
	^(argument includes: Space)
]

{ #category : #private }
CommandLine >> formatOption: option [
	| prefix string |
]

{ #category : #private }
CommandLine >> fromString: aString [
	self on: aString; parse
]

{ #category : #processing }
CommandLine >> getArguments: anInteger for: option [
	| args |
]

{ #category : #testing }
CommandLine >> includesOption: aString [
	| option |
]

{ #category : #initialization }
CommandLine >> initialize [
	super initialize.
]

{ #category : #processing }
CommandLine >> nextArgumentTokens [
	^tokens untilAnySatisfying: [:t | self seemsOption: t]
]

{ #category : #parsing }
CommandLine >> nextToken [
	^tokens next
]

{ #category : #parsing }
CommandLine >> nextTokens: anInteger [
	| max |
]

{ #category : #private }
CommandLine >> on: aString [
	input := aString
]

{ #category : #accessing }
CommandLine >> options [
	^options keys
]

{ #category : #accessing }
CommandLine >> parameters [
	^self options
]

{ #category : #parsing }
CommandLine >> parse [
	self tokenize
]

{ #category : #processing }
CommandLine >> process [
	tokens isNil ifTrue: [self parse].
]

{ #category : #processing }
CommandLine >> processOption: token [
	| action option |
]

{ #category : #processing }
CommandLine >> processOption: option action: action [
	| arguments |
]

{ #category : #private }
CommandLine >> readTokenFrom: aStream [
	^String streamContents: [:strm | | next end t |
]

{ #category : #private }
CommandLine >> reset [
	command := tokens := nil.
]

{ #category : #processing }
CommandLine >> seemsMultipleOption: token [
	| option |
]

{ #category : #testing }
CommandLine >> seemsOption: aString [
	^aString first = $-
]

{ #category : #parsing }
CommandLine >> tokenize [
	| stream |
]

{ #category : #accessing }
CommandLine >> withOption: aString do: aBlock [
	| option |
]

{ #category : #accessing }
CommandLine >> withOption: short or: long do: aBlock [
	| s l |
]
