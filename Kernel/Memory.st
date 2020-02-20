Class {
	#name : #Memory,
	#superclass : #Object,
	#instVars : [
		'#spaces',
		'#collectedSpaces',
		'#collector',
		'#pinnedSpace',
		'#fromSpace',
		'#toSpace',
		'#oldSpace',
		'#meter',
		'#edenSpace',
		'#youngBase',
		'#youngLimit',
		'#rememberedSet'
	],
	#classVars : [
		'#Current'
	],
	#category : #Kernel
}

{ #category : #errors }
Memory class >> allocateMemory: size near: address [
	| limit |
]

{ #category : #errors }
Memory class >> allocateMemory: size near: address limit: limit [
	^OS memory allocate: size near: address limit: limit.

{ #category : #accessing }
Memory class >> current [
	^Current
]

{ #category : #accessing }
Memory class >> current: current [
	Current := current
]

{ #category : #errors }
Memory class >> nativeAllocate: size [
	OS memory nativeAllocate: size
	

{ #category : #copying }
Memory class >> shallowCopy: anObject [
	^Current shallowCopy: anObject
]

{ #category : #'adding / removing' }
Memory >> addSpace: aSpace [
	spaces := spaces copyWith: aSpace
]

{ #category : #services }
Memory >> allDeadObjects [
	| collection tracer |
]

{ #category : #allocation }
Memory >> allInstancesOf: aSpecies [
	| searched instances |
]

{ #category : #allocation }
Memory >> allocate: size [
	| answer |
]

{ #category : #allocation }
Memory >> allocateAfterCollectingOldSpace: size [
	| answer |
]

{ #category : #allocation }
Memory >> allocateAfterGrowingOldSpace: size [
	| answer |
]

{ #category : #allocation }
Memory >> allocateAfterScavenge: size [
	| answer |
]

{ #category : #allocation }
Memory >> allocateInOldSpace: size [
	| answer |
]

{ #category : #allocation }
Memory >> allocateMemory: size [
	^OS memory allocate: size
]

{ #category : #services }
Memory >> assureFree: size [
	edenSpace softAvailable * 2 < size
]

{ #category : #accessing }
Memory >> available [
	^edenSpace availableBytes
]

{ #category : #accessing }
Memory >> baseAddress [
	^spaces first dataBase
]

{ #category : #services }
Memory >> collectAndCompactOldSpace [
	"
]

{ #category : #services }
Memory >> commitMoreSpace [
	oldSpace
]

{ #category : #private }
Memory >> createPinnedSpace [
	pinnedSpace := self newSpaceSized: 4096 + 64 * 1024.
]

{ #category : #private }
Memory >> createSpaces [
	| allocation eden |
]

{ #category : #private }
Memory >> critical: aBlock [
	^[| result |
]

{ #category : #private }
Memory >> dispenseReservedSpace [
	edenSpace dispenseReservedSpace
]

{ #category : #accessing }
Memory >> eden [
	^edenSpace
]

{ #category : #accessing }
Memory >> eden: aSpace [
	edenSpace := aSpace
]

{ #category : #system }
Memory >> edenCollector [
	^collector
]

{ #category : #accessing }
Memory >> from [
	^fromSpace
]

{ #category : #accessing }
Memory >> fromSpace: aSpace [
	fromSpace := aSpace
]

{ #category : #private }
Memory >> fullGC [
	self scavengeYoungObjects
]

{ #category : #system }
Memory >> garbageCollectTest2 [
	| space broken |
]

{ #category : #system }
Memory >> garbageCollectTest3 [
	| broken |
]

{ #category : #private }
Memory >> growIfTime [
	oldSpace percentageOfCommitedUsed > 90 ifTrue: [self commitMoreSpace]
]

{ #category : #inquiries }
Memory >> hasReferencesToSegment: anImageSegment [
	| tracer target searched |
]

{ #category : #statistics }
Memory >> histogram [
	| sizes |
]

{ #category : #services }
Memory >> holdReferenceToObject: oop [
	| object |
]

{ #category : #initialization }
Memory >> initialize [
	super initialize.
]

{ #category : #initialization }
Memory >> initializeCollector [
	| movable |
]

{ #category : #testing }
Memory >> isYoung: anObject [
	^false == anObject _isSmallInteger
]

{ #category : #testing }
Memory >> isYoungSafe: anObject [
	^anObject _asPointer between: youngBase and: youngLimit
]

{ #category : #accessing }
Memory >> kernelSpace [
	^spaces first
]

{ #category : #services }
Memory >> make: anObject become: anotherObject [
	vm := OS beeVM.
]

{ #category : #private }
Memory >> newSpaceAt: base limit: limit [
	^GCSpace newAt: base limit: limit
]

{ #category : #private }
Memory >> newSpaceAt: base sized: size [
	^self newSpaceAt: base limit: base * 2 + size // 2
]

{ #category : #services }
Memory >> newSpaceSized: anInteger [
	| memory |
]

{ #category : #inquiries }
Memory >> objectsReferencing: targetSpace [
	| collection tracer |
]

{ #category : #accessing }
Memory >> old [
	^oldSpace
]

{ #category : #accessing }
Memory >> oldSpace [
	^oldSpace
]

{ #category : #services }
Memory >> pinnedCopy: anObject [
	| copy |
]

{ #category : #private }
Memory >> pinRememberedSet [
	"
]

{ #category : #printing }
Memory >> printOn: stream [
	| reserved commited used |
]

{ #category : #allocation }
Memory >> referencesTo: anObject [
	| references |
]

{ #category : #services }
Memory >> remember: anObject [
	anObject _beRemembered.
]

{ #category : #services }
Memory >> rememberAfterBecome: anObject [
	"
]

{ #category : #accessing }
Memory >> rememberedSet [
	^rememberedSet
]

{ #category : #accessing }
Memory >> rememberedSet: aGCArray [
	rememberedSet := aGCArray.
]

{ #category : #system }
Memory >> rescuedEphemerons [
	^collector rescuedEphemerons
]

{ #category : #services }
Memory >> rescueEphemerons [
	collector rescuedEphemerons do: [:e | [e rescue] ifCurtailed: [e activate]]
]

{ #category : #private }
Memory >> reserveMemory: size [
	^OS memory reserve: size
]

{ #category : #private }
Memory >> reserveSpaceSized: size [
	^self reserveSpaceSized: size commiting: size
]

{ #category : #private }
Memory >> reserveSpaceSized: reserved commiting: commited [
	| space address |
]

{ #category : #inquiries }
Memory >> roots [
	^{ActiveProcess}
]

{ #category : #services }
Memory >> scavengeYoungObjects [
	CRITICAL ifTrue: [self stop].
]

{ #category : #copying }
Memory >> shallowCopy: object [
	| headerSize answer size allocation objectPointer |
]

{ #category : #copying }
Memory >> shallowCopy: array growingTo: newSize [
	| headerSize total buffer copy |
]

{ #category : #accessing }
Memory >> spaces [
	^spaces
]

{ #category : #initialization }
Memory >> startUp [
	self createSpaces; initializeCollector; createPinnedSpace
]

{ #category : #services }
Memory >> stop [
	self _halt
]

{ #category : #accessing }
Memory >> to [
	^toSpace
]

{ #category : #accessing }
Memory >> youngBase [
	^youngBase
]

{ #category : #accessing }
Memory >> youngLimit [
	^youngLimit
]
