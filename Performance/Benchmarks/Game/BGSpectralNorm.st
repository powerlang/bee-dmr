"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Class {
	#name : #BGSpectralNorm,
	#superclass : #Object,
	#instVars : [
		'arrayFactory'
	],
	#category : #Game
}

{ #category : #defaults }
BGSpectralNorm class >> defaultProblemSize [
	^ 100
]

{ #category : #'instance creation' }
BGSpectralNorm class >> new [
	^self basicNew initialize
]

{ #category : #'initialize-release' }
BGSpectralNorm >> initialize [
	arrayFactory := Array
]

{ #category : #helper }
BGSpectralNorm >> matrixA: a and: b [
	^1.0 / (b + a - 2 * (b + a - 1) / 2 + b)
]

{ #category : #helper }
BGSpectralNorm >> multiplyAtAv: arr [
	^ self multiplyAtv: (self multiplyAv: arr)
]

{ #category : #helper }
BGSpectralNorm >> multiplyAtv: arr [
	| n atv sum |
	n := arr size.
	atv := arrayFactory new: n.
	1 to: n do: [:i | 
		sum := 0.0.
		1 to: n do: [:j | sum := sum + ((self matrixA: i and: j) * (arr at: j))].
		atv at: i put: sum].
	^atv
]

{ #category : #helper }
BGSpectralNorm >> multiplyAv: arr [
	| n av sum |
	n := arr size.
	av := arrayFactory new: n.
	1 to: n do: [:i | 
		sum := 0.0.
		1 to: n do: [:j | sum := sum + ((self matrixA: j and: i) * (arr at: j))].
		av at: i put: sum].
	^av
]

{ #category : #benchmark }
BGSpectralNorm >> spectralnorm: n [
	| u v vBv vv |
	u := arrayFactory new: n withAll: 1.0.
	10 timesRepeat: [
		v := self multiplyAtAv: u.
		u := self multiplyAtAv: v].
	vBv := 0.0.
	vv := 0.0.
	1 to: n do: [:i | 
		vBv := vBv + ((u at: i) * (v at: i)).
		vv := vv + ((v at: i) * (v at: i))].
	^(vBv / vv) sqrt
]

