"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Extension { #name : #Integer }

{ #category : '*Tiny' }
Integer class >> tinyBenchmarks [
	"
	Report the results of running the two tiny Squeak benchmarks.
	ar 9/10/1999: Adjusted to run at least 1 sec to get more stable results
	0 tinyBenchmarks
	On a 292 MHz G3 Mac: 22727272 bytecodes/sec; 984169 sends/sec
	On a 400 MHz PII/Win98:  18028169 bytecodes/sec; 1081272 sends/sec
	"
	| t1 t2 r n1 n2 |
	n1 := 1.
	[
		t1 := Time millisecondsToRun: [n1 bytecodeIntensiveBenchmark].
		t1 < 1000]
		whileTrue: [n1 := n1 * 2].
	"Note: #benchmark's runtime is about O(n)"

	n2 := 28.
	[
		t2 := Time millisecondsToRun: [r := n2 fibonacchi].
		t2 < 1000]
		whileTrue: [n2 := n2 + 1].
	"Note: #benchFib's runtime is about O(n^2)."

	^(n1 * 500000 * 1000 // t1) printString , ' bytecodes/sec; '
		, (r * 1000 // t2) printString
		, ' sends/sec'
]

{ #category : '*Tiny' }
Integer >> bytecodeIntensiveBenchmark [
	"
	(500000 // time to run) = approx bytecodes per second
	5000000 // (Time millisecondsToRun: [10 benchmark]) * 1000
	3059000 on a Mac 8100/100
	"
	| size flags prime k count |
	size := 8190.
	1 to: self do: [:iter | 
		count := 0.
		flags := (Array new: size) atAllPut: true.
		1 to: size do: [:i | 
			(flags at: i) ifTrue: [
				prime := i + 1.
				k := i + prime.
				[k <= size] whileTrue: [
					flags at: k put: false.
					k := k + prime].
				count := count + 1]]].
	^count
]

{ #category : '*Tiny' }
Integer >> fibonacchi [
	"
	Handy send-heavy benchmark
	(result // seconds to run) = approx calls per second
	| r t |
	t := Time millisecondsToRun: [r := 26 benchFib].
	(r * 1000) // t
	138000 on a Mac 8100/100
	"
	^self < 2
		ifTrue: [1]
		ifFalse: [(self - 1) fibonacchi + (self - 2) fibonacchi + 1]
]

{ #category : '*Tiny' }
Integer >> tinyBenchmarks [
	^self class tinyBenchmarks
]

