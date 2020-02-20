Class {
	#name : #PoolDictionary,
	#superclass : #Dictionary,
	#instVars : [
		'#constant'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
PoolDictionary class >> newConstantPool [
	^self new beConstantPool
]

{ #category : #adding }
PoolDictionary >> add: anAssociation [
	anAssociation key isString
]

{ #category : #accessing }
PoolDictionary >> at: key [
	^super at: key asString reduced
]

{ #category : #accessing }
PoolDictionary >> at: key ifAbsent: aBlock [
	^super at: key asString reduced ifAbsent: aBlock
]

{ #category : #accessing }
PoolDictionary >> at: key put: value [
	^super at: key asString put: value
]

{ #category : #accessing }
PoolDictionary >> beConstantPool [
	constant := true
]

{ #category : #inquiries }
PoolDictionary >> includesKey: key [
	^super includesKey: key asString reduced
]

{ #category : #initialization }
PoolDictionary >> initialize: anInteger [
	super initialize: anInteger.
]

{ #category : #testing }
PoolDictionary >> isConstant [
	^constant
]

{ #category : #accessing }
PoolDictionary >> name [
	^Smalltalk nameOfGlobal: self
]

{ #category : #removing }
PoolDictionary >> removeKey: key ifAbsent: aBlock [
	super removeKey: key asString reduced ifAbsent: aBlock.
]
