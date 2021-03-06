"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Class {
	#name : #RichHandlerTaskDataRecord,
	#superclass : #RichObject,
	#instVars : [
		'workIn',
		'deviceIn'
	],
	#category : #SMRichards
}

{ #category : #'instance creation' }
RichHandlerTaskDataRecord class >> create [
	^ super basicNew create
]

{ #category : #converting }
RichHandlerTaskDataRecord >> asString [
	^ 'HandlerTaskDataRecord(', workIn asString, ', ', deviceIn asString, ')'
]

{ #category : #'instance creation' }
RichHandlerTaskDataRecord >> create [
	workIn := deviceIn := RichObject NoWork
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> deviceIn [
	^ deviceIn
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> deviceIn: aPacket [
	deviceIn := aPacket
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> deviceInAdd: packet [
    deviceIn := self append: packet head: deviceIn
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> workIn [
	^ workIn
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> workIn: aWorkQueue [
	workIn := aWorkQueue
]

{ #category : #accessing }
RichHandlerTaskDataRecord >> workInAdd: packet [
    workIn := self append: packet head: workIn
]

