Class {
	#name : #InstructionPrefix,
	#superclass : #Object,
	#instVars : [
		'#name'
	],
	#classVars : [
		'#Prefixes'
	],
	#category : #Intel
}

{ #category : #private }
InstructionPrefix class >> classFor: aString [
	(aString beginsWith: 'REX') ifTrue: [^REXPrefix].
	(aString beginsWith: 'VEX') ifTrue: [^VEXPrefix].
	^LegacyPrefix
]

{ #category : #'instance creation' }
InstructionPrefix class >> fromString: aString [
	| reader prefixes rex |
	reader := aString readStream.
	prefixes := Prefixes
		select: [:p | reader peekForAll: p value hex]
		in: OrderedCollection new.
	(reader peek: 'REX' size) = 'REX' ifTrue: [
		rex := REXPrefix fromStream: reader.
		prefixes add: rex].
	(reader peek: 'VEX' size) = 'VEX' ifTrue: [
		rex := VEXPrefix fromStream: reader.
		prefixes add: rex].
	^prefixes
]

{ #category : #initialization }
InstructionPrefix class >> initialize [
	self initializePrefixes
]

{ #category : #initialization }
InstructionPrefix class >> initializePrefixes [
	Prefixes isNil ifTrue: [Prefixes := PoolDictionary new].
	self == InstructionPrefix ifTrue: [
		self allSubclasses do: #initializePrefixes.
		InstructionSpec initialize].
	self compileAll.
	self class compileAll
]

{ #category : #prefixes }
InstructionPrefix class >> operandSizeOverride [
	^{Operand-size override}
]

{ #category : #services }
InstructionPrefix class >> peekFrom: aStream [
	(aStream peekFor: LOCK value) ifTrue: [^LOCK].
	(aStream peekFor: REPNE value) ifTrue: [^REPNE].
	(aStream peekFor: REP value) ifTrue: [^REP].
	(aStream peekFor: {Operand-size override} value)
		ifTrue: [^{Operand-size override}].
	(aStream peekFor: {Address-size override} value)
		ifTrue: [^{Address-size override}].
	^nil
]

{ #category : #services }
InstructionPrefix class >> prefixes [
	^Prefixes
]

{ #category : #testing }
InstructionPrefix >> isLegacy [
	^false
]

{ #category : #testing }
InstructionPrefix >> isRex [
	^false
]

{ #category : #testing }
InstructionPrefix >> isSegment [
	^false
]

{ #category : #testing }
InstructionPrefix >> isVex [
	^false
]

{ #category : #accessing }
InstructionPrefix >> name [
	^name
]

{ #category : #accessing }
InstructionPrefix >> name: aString [
	name := aString
]

{ #category : #printing }
InstructionPrefix >> printOn: aStream [
	(name includes: Character space)
		ifTrue: [
			aStream
				nextPut: ${;
				nextPutAll: name;
				nextPut: $}]
		ifFalse: [aStream nextPutAll: name]
]

{ #category : #writing }
InstructionPrefix >> writeOn: anInstruction [
	self subclassResponsibility
]
