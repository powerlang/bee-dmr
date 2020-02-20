Class {
	#name : #CompiledBlock,
	#superclass : #Object,
	#type : #variable,
	#instVars : [
		'#method',
		'#format',
		'#nativeCode'
	],
	#classVars : [
		'#Formats'
	],
	#category : #Kernel
}

{ #category : #initialization }
CompiledBlock class >> ensureFormatCorrectness [
	self
]

{ #category : #'instance creation' }
CompiledBlock class >> fromArray: anArray [
	| block |
]

{ #category : #initialization }
CompiledBlock class >> initialize [
	self initializeFormats; ensureFormatCorrectness
]

{ #category : #initialization }
CompiledBlock class >> initializeFormats [
	"
]

{ #category : #initialization }
CompiledBlock class >> maxArgCount [
	^(2 raisedTo: ArgCount length) - 1
]

{ #category : #initialization }
CompiledBlock class >> maxTempCount [
	^(2 raisedTo: TempCount length) - 1
]

{ #category : #accessing }
CompiledBlock >> argumentCount [
	^format bitsAt: ArgCount
]

{ #category : #accessing }
CompiledBlock >> argumentCount: anInteger [
	format := format bitsAt: ArgCount put: anInteger
]

{ #category : #accessing }
CompiledBlock >> arity [
	^self argumentCount
]

{ #category : #accessing }
CompiledBlock >> aspects [
	^#(#arity
]

{ #category : #comparing }
CompiledBlock >> basicPrintOn: aStream [
	method printOn: aStream.
]

{ #category : #accessing }
CompiledBlock >> bindMethod: aCompiledMethod [
	method := aCompiledMethod
]

{ #category : #accessing }
CompiledBlock >> blockCode [
	^nativeCode code
]

{ #category : #accessing }
CompiledBlock >> blockNumber [
	^format bitsAt: Id
]

{ #category : #accessing }
CompiledBlock >> blockNumber: anInteger [
	format := format bitsAt: Id put: anInteger
]

{ #category : #accessing }
CompiledBlock >> format [
	^format
]

{ #category : #testing }
CompiledBlock >> hasMethodEnvironment [
	^self size >= 2 and: [(self at: 2) notNil]
]

{ #category : #comparing }
CompiledBlock >> hasReceiver [
	| index |
]

{ #category : #accessing }
CompiledBlock >> initialize [
	super initialize.
]

{ #category : #accessing }
CompiledBlock >> invalidateNativeCode [
	nativeCode := nil
]

{ #category : #testing }
CompiledBlock >> isBlock [
	^true
]

{ #category : #testing }
CompiledBlock >> isCallback [
	^method isCallback
]

{ #category : #testing }
CompiledBlock >> isDebuggable [
	^method isDebuggable
]

{ #category : #comparing }
CompiledBlock >> loadFrom: anArray [
	method := anArray at: 1.
]

{ #category : #private }
CompiledBlock >> maxArity [
	^(1 bitShift: ArgCount length) - 1
]

{ #category : #private }
CompiledBlock >> maxBlockNumber [
	^(1 bitShift: Id length) - 1
]

{ #category : #accessing }
CompiledBlock >> method [
	^method
]

{ #category : #accessing }
CompiledBlock >> method: aCompiledMethod [
	method := aCompiledMethod
]

{ #category : #comparing }
CompiledBlock >> nativeCode [
	^nativeCode
]

{ #category : #comparing }
CompiledBlock >> nativeCode: code [
	nativeCode := code
]

{ #category : #comparing }
CompiledBlock >> printOn: aStream [
	self class printOn: aStream.
]

{ #category : #accessing }
CompiledBlock >> tempCount [
	^format bitsAt: TempCount
]

{ #category : #accessing }
CompiledBlock >> tempCount: anInteger [
	format := format bitsAt: TempCount put: anInteger
]

{ #category : #accessing }
CompiledBlock >> templateIndex [
	| n |
]

{ #category : #private }
CompiledBlock >> temporaryLimit [
	^(1 bitShift: TempCount length) - 1
]

{ #category : #isEvaluating }
CompiledBlock >> valueSelector [
	| arity |
]
