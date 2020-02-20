Class {
	#name : #SendSite,
	#superclass : #Object,
	#instVars : [
		'#instructions',
		'#selector',
		'#cache',
		'#tally',
		'#format'
	],
	#classVars : [
		'#FormatFlags',
		'#Instances',
		'#LookupCount',
		'#MICs',
		'#MonomorphicStub',
		'#NextMIC',
		'#NextPIC',
		'#PICs',
		'#PolymorphicStub'
	],
	#category : #Kernel
}

{ #category : #initialization }
SendSite class >> allocateCaches: amount using: lookupInstructions [
	| mics pics array |
]

{ #category : #initialization }
SendSite class >> allocateInitialCachesUsing: lookupInstructions [
	self allocateCaches: 3000 using: lookupInstructions
]

{ #category : #initialization }
SendSite class >> allocateMoreCaches [
	self beeAllocateCaches: 140000 using: (Smalltalk at: #Lookup)
]

{ #category : #initialization }
SendSite class >> beeAllocateCaches: amount using: lookupInstructions [
	| mics pics array mic pic memory |
]

{ #category : #private }
SendSite class >> flush [
	Instances := nil
]

{ #category : #initialization }
SendSite class >> flush: selector [
	| sends |
]

{ #category : #private }
SendSite class >> initializeFormatFlags [
	"
]

{ #category : #initialization }
SendSite class >> instances [
	Instances ifNil: [
]

{ #category : #private }
SendSite class >> invoking: aCompiledMethod using: instructions [
	^self new beInvoke: aCompiledMethod using: instructions
]

{ #category : #accessing }
SendSite class >> lookupCount [
	^LookupCount
]

{ #category : #initialization }
SendSite class >> mics [
	^MICs
]

{ #category : #initialization }
SendSite class >> newPICUsing: lookupInstructions [
	| new |
]

{ #category : #private }
SendSite class >> sending: aSelector with: instructions [
	^self new selector: aSelector; instructions: instructions
]

{ #category : #initialization }
SendSite class >> startUp [
	self allocateMoreCaches.
]

{ #category : #'meta accessing' }
SendSite >> _dispatchDebuggableOn: anObject [
	| cm nativeCode invoked |
]

{ #category : #'meta accessing' }
SendSite >> _dispatchDebuggableOn: anObject startingAt: aBehavior [
	| cm nativeCode invoked |
]

{ #category : #'meta accessing' }
SendSite >> _dispatchOn: anObject [
	| cm nativeCode |
]

{ #category : #'meta accessing' }
SendSite >> _dispatchOn: anObject startingAt: aBehavior [
	| cm nativeCode code |
]

{ #category : #'meta accessing' }
SendSite >> _invokeOn: anObject [
	| cm code |
]

{ #category : #private }
SendSite >> beInvoke: aCompiledMethod using: invokeInstructions [
	instructions := invokeInstructions.
]

{ #category : #private }
SendSite >> bePolymorphic [
	format := format bitOr: IsPolymorphic
]

{ #category : #private }
SendSite >> beStaticSend [
	format := format bitOr: IsStaticSend
]

{ #category : #private }
SendSite >> beSuperSend [
	format := format bitOr: IsSuperSend
]

{ #category : #private }
SendSite >> cache [
	^cache
]

{ #category : #private }
SendSite >> flush [
	instructions := self isSuperSend
]

{ #category : #private }
SendSite >> flush: aSelector [
	aSelector == selector ifTrue: [self flush]
]

{ #category : #private }
SendSite >> hasBeenReset [
	^format isOnBit: HasBeenReset
]

{ #category : #initialization }
SendSite >> initialize [
	tally := 0.
]

{ #category : #private }
SendSite >> instructions [
	^instructions
]

{ #category : #private }
SendSite >> instructions: aByteArray [
	instructions := aByteArray
]

{ #category : #printing }
SendSite >> isFakeMegamorphic [
	^self isFakeMegamorphic: 3
]

{ #category : #printing }
SendSite >> isFakeMegamorphic: maxImplementations [
	| d |
]

{ #category : #private }
SendSite >> isMegamorphic [
	^self isPolymorphic and: [self hasBeenReset]
]

{ #category : #private }
SendSite >> isPolymorphic [
	^format isOnBit: IsPolymorphic
]

{ #category : #testing }
SendSite >> isStaticSelector [
	(#(#basicByteAt: #basicByteAt:put: #byteAtValid: #byteAtValid:put:
]

{ #category : #testing }
SendSite >> isStaticSend [
	^(format bitAnd: 1) == 1
]

{ #category : #testing }
SendSite >> isSuperSend [
	^(format bitAnd: 2) == 2
]

{ #category : #private }
SendSite >> maxSize [
	^14
]

{ #category : #private }
SendSite >> monomorphicMap: aBehavior to: code [
	instructions := self monomorphicStub.
]

{ #category : #private }
SendSite >> monomorphicStub [
	^MonomorphicStub code
]

{ #category : #private }
SendSite >> polymorphicMap: aBehavior to: code [
	cache _size == 2 ifTrue: [
]

{ #category : #private }
SendSite >> polymorphicStub [
	^PolymorphicStub code
]

{ #category : #printing }
SendSite >> printInvokeTypeOn: aStream [
	aStream nextPutAll: 'invoke '; print: cache
]

{ #category : #printing }
SendSite >> printMonomorphicTypeOn: aStream [
	aStream
]

{ #category : #printing }
SendSite >> printOn: aStream [
	aStream
]

{ #category : #printing }
SendSite >> printPolymorphicTypeOn: aStream [
	aStream nextPutAll: 'poly '.
]

{ #category : #printing }
SendSite >> printTypeOn: aStream [
	cache isCompiledMethod ifTrue: [^self printInvokeTypeOn: aStream].
]

{ #category : #services }
SendSite >> register [
	| sends |
]

{ #category : #private }
SendSite >> reset [
	tally := 0.
]

{ #category : #private }
SendSite >> selector [
	^selector
]

{ #category : #private }
SendSite >> selector: aSelector [
	selector := aSelector.
]

{ #category : #private }
SendSite >> sentSelector [
	^selector
]

{ #category : #private }
SendSite >> takeNextFreeMIC [
	| position |
]

{ #category : #private }
SendSite >> takeNextFreePIC [
	| position |
]

{ #category : #private }
SendSite >> unreset [
	format := format bitAnd: HasBeenReset bitInvert
]

{ #category : #private }
SendSite >> when: aBehavior use: code [
	cache == nil
]
