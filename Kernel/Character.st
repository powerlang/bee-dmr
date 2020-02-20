Class {
	#name : #Character,
	#superclass : #Magnitude,
	#instVars : [
		'#value'
	],
	#category : #Kernel
}

{ #category : #unclassified }
Character class >> allCharacters [
	^ByteCharacters
]

{ #category : #'named characters' }
Character class >> ampersand [
	^$&
]

{ #category : #private }
Character class >> ansiTable [
	^#(8364 0 8218 402 8222 8230 8224 8225
]

{ #category : #'named characters' }
Character class >> backspace [
	^self value: 8
]

{ #category : #'named characters' }
Character class >> backtick [
	^$`
]

{ #category : #'instance creation' }
Character class >> bee [
	^$🐝
]

{ #category : #'named characters' }
Character class >> belongs [
	^$∊
]

{ #category : #'named characters' }
Character class >> bullet [
	^Character value: 8226
]

{ #category : #'named characters' }
Character class >> comma [
	^$,
]

{ #category : #'named characters' }
Character class >> copyright [
	^$ⓒ
]

{ #category : #'named characters' }
Character class >> cr [
	^Cr
]

{ #category : #services }
Character class >> digitValue: anInteger [
	| n offset |
]

{ #category : #'named characters' }
Character class >> dollar [
	^$$
]

{ #category : #'named characters' }
Character class >> doubleQuote [
	^$"
]

{ #category : #'named characters' }
Character class >> downArrow [
	^self value: 8595
]

{ #category : #'named characters' }
Character class >> ellipsis [
	^$…
]

{ #category : #'named characters' }
Character class >> emdash [
	^Emdash
]

{ #category : #'named characters' }
Character class >> emspace [
	^Character value: 8195
]

{ #category : #'named characters' }
Character class >> endash [
	^Endash
]

{ #category : #'named characters' }
Character class >> enspace [
	^Character value: 8194
]

{ #category : #'named characters' }
Character class >> equal [
	^$=
]

{ #category : #'named characters' }
Character class >> escape [
	^self value: 27
]

{ #category : #'named characters' }
Character class >> exclamation [
	^$!
]

{ #category : #'named characters' }
Character class >> exists [
	^$∃
]

{ #category : #'named characters' }
Character class >> ff [
	^self value: 12
]

{ #category : #'named characters' }
Character class >> forAll [
	^$∀
]

{ #category : #'named characters' }
Character class >> ge [
	^self value: 16r2265
]

{ #category : #'named characters' }
Character class >> greaterThan [
	^$>
]

{ #category : #initialization }
Character class >> initializeCharacters [
	ByteCharacters := (0 to: 255) collect: [:i | self new setValue: i]
]

{ #category : #'named characters' }
Character class >> italicA [
	^Character value: 16r1D44E
]

{ #category : #'named characters' }
Character class >> ldblquote [
	^Character value: 8220
]

{ #category : #'named characters' }
Character class >> le [
	^self value: 16r2264
]

{ #category : #'named characters' }
Character class >> leftArrow [
	^self value: 16r2190
]

{ #category : #'named characters' }
Character class >> lessThan [
	^$<
]

{ #category : #'named characters' }
Character class >> lf [
	^self value: 10
]

{ #category : #'named characters' }
Character class >> lquote [
	^Character value: 8216
]

{ #category : #'named characters' }
Character class >> minus [
	^$-
]

{ #category : #'named characters' }
Character class >> muchGreater [
	^$≫
]

{ #category : #'instance creation' }
Character class >> new [
	^self shouldNotImplement
]

{ #category : #'named characters' }
Character class >> null [
	^self value: 0
]

{ #category : #'named characters' }
Character class >> oplus [
	"
]

{ #category : #'named characters' }
Character class >> period [
	^$.
]

{ #category : #'named characters' }
Character class >> qmspace [
	^Character value: 8197
]

{ #category : #'named characters' }
Character class >> rdblquote [
	^Character value: 8221
]

{ #category : #'named characters' }
Character class >> rightArrow [
	^self value: 16r2192
]

{ #category : #'named characters' }
Character class >> rquote [
	^Character value: 8217
]

{ #category : #'named characters' }
Character class >> semicolon [
	^$;
]

{ #category : #'named characters' }
Character class >> singleQuote [
	^$'
]

{ #category : #inquiries }
Character class >> sizeInBytes [
	^1
]

{ #category : #private }
Character class >> sortedAnsiTable [
	^#(338 339 352 353 376 381 382
]

{ #category : #'named characters' }
Character class >> space [
	^$ 
]

{ #category : #'named characters' }
Character class >> tab [
	^self value: 9
]

{ #category : #'named characters' }
Character class >> tensor [
	"
]

{ #category : #'named characters' }
Character class >> underscore [
	^$_
]

{ #category : #'named characters' }
Character class >> upArrow [
	^self value: 16r2191
]

{ #category : #'instance creation' }
Character class >> value: anInteger [
	^(anInteger >= 0 and: [anInteger + 1 <= ByteCharacters _size])
]

{ #category : #arithmetic }
Character >> - aMagnitude [
	| subtraction |
]

{ #category : #converting }
Character >> , characterOrString [
	^self asString , characterOrString asString
]

{ #category : #arithmetic }
Character >> + aMagnitude [
	| addend |
]

{ #category : #comparing }
Character >> < aCharacter [
	^ActiveLocale isCharacter: self lessThan: aCharacter
]

{ #category : #comparing }
Character >> <~ aMagnitude [
	^self <= aMagnitude
]

{ #category : #comparing }
Character >> <= aCharacter [
	^ActiveLocale isCharacter: self lessThanOrEqualTo: aCharacter
]

{ #category : #comparing }
Character >> = aCharacter [
	^self class == aCharacter class and: [value = aCharacter codePoint]
]

{ #category : #comparing }
Character >> > aCharacter [
	^ActiveLocale isCharacter: self greaterThan: aCharacter
]

{ #category : #comparing }
Character >> >= aCharacter [
	^ActiveLocale isCharacter: self greaterThanOrEqualTo: aCharacter
]

{ #category : #converting }
Character >> asAnsi [
	"
]

{ #category : #converting }
Character >> asCharacter [
	^self
]

{ #category : #converting }
Character >> asInteger [
	^value
]

{ #category : #operations }
Character >> asLowercase [
	^ActiveLocale lowercaseOf: self
]

{ #category : #converting }
Character >> asParameter [
	^self codePoint
]

{ #category : #converting }
Character >> asString [
	| class |
]

{ #category : #converting }
Character >> asUnicode [
	| code |
]

{ #category : #operations }
Character >> asUppercase [
	^ActiveLocale uppercaseOf: self
]

{ #category : #comparing }
Character >> between: min and: max [
	^min codePoint <= value and: [value <= max codePoint]
]

{ #category : #printing }
Character >> canBePrintedAsLiteral [
	^true
]

{ #category : #accessing }
Character >> codePoint [
	^value
]

{ #category : #copying }
Character >> deepCopy [
	^self
]

{ #category : #accessing }
Character >> digitValue [
	self isDigit ifTrue: [^value - 48].
]

{ #category : #comparing }
Character >> hash [
	^value hash
]

{ #category : #accessing }
Character >> highByte [
	^value bitShift: -8
]

{ #category : #testing }
Character >> isAlphanumeric [
	value < 256 ifTrue: [^self isLetter or: [self isDigit]].
]

{ #category : #testing }
Character >> isAlphaNumericOrUnderscore [
	^self isDigit or: [self isLetter] or: [self = $_]
]

{ #category : #testing }
Character >> isAnsi [
	^Ansi isAnsi: value
]

{ #category : #testing }
Character >> isAnsiCompliant [
	"
]

{ #category : #testing }
Character >> isAsterisk [
	^value = 42
]

{ #category : #testing }
Character >> isBackslash [
	^value = 92
]

{ #category : #testing }
Character >> isBacktick [
	^value = 96
]

{ #category : #testing }
Character >> isBlank [
	value <= 32 ifTrue: [^true].
]

{ #category : #testing }
Character >> isByteCharacter [
	^value < 256
]

{ #category : #testing }
Character >> isCharacter [
	^true
]

{ #category : #testing }
Character >> isCircumflex [
	^value = 94
]

{ #category : #testing }
Character >> isColon [
	^value = 58
]

{ #category : #testing }
Character >> isCr [
	^value = 13
]

{ #category : #testing }
Character >> isDigit [
	^value >= 48 and: [value <= 57]
]

{ #category : #testing }
Character >> isDollar [
	^value = 36
]

{ #category : #testing }
Character >> isDollarSign [
	^value = 36
]

{ #category : #testing }
Character >> isDot [
	^value = 46
]

{ #category : #testing }
Character >> isDoubleQuote [
	^value = 34
]

{ #category : #testing }
Character >> isEndOfLine [
	^value = 13 | (value = 10)
]

{ #category : #testing }
Character >> isEsc [
	^self = self class escape
]

{ #category : #testing }
Character >> isFixedObject [
	^value < 256
]

{ #category : #testing }
Character >> isGreaterThan [
	^value = 62
]

{ #category : #testing }
Character >> isHash [
	^value = 35
]

{ #category : #testing }
Character >> isIdentifierCharacter [
	('$:_' includes: self) ifTrue: [^true].
]

{ #category : #testing }
Character >> isLeftBracket [
	^value = 91
]

{ #category : #testing }
Character >> isLeftCurlyBracket [
	^value = 123
]

{ #category : #testing }
Character >> isLessThan [
	^value = 60
]

{ #category : #testing }
Character >> isLetter [
	^ActiveLocale isLetter: self
]

{ #category : #testing }
Character >> isLf [
	^value = 10
]

{ #category : #testing }
Character >> isLowercase [
	^ActiveLocale isLowercase: self
]

{ #category : #testing }
Character >> isMinus [
	^value = 45
]

{ #category : #testing }
Character >> isNull [
	^value = 0
]

{ #category : #testing }
Character >> isNumeric [
	^ActiveLocale isNumeric: self
]

{ #category : #testing }
Character >> isPipe [
	^value = 124
]

{ #category : #testing }
Character >> isPlus [
	^value = 43
]

{ #category : #testing }
Character >> isPunctuationMark [
	self = $. ifTrue: [^true].
]

{ #category : #testing }
Character >> isQuestionMark [
	^value = 63
]

{ #category : #testing }
Character >> isRightBracket [
	^value = 93
]

{ #category : #testing }
Character >> isRightCurlyBracket [
	^value = 125
]

{ #category : #testing }
Character >> isRightParenthesis [
	^value = 41
]

{ #category : #testing }
Character >> isSemiColon [
	^value = 59
]

{ #category : #testing }
Character >> isSeparator [
	self = Space ifTrue: [^true].
]

{ #category : #testing }
Character >> isSingleQuote [
	^value = 39
]

{ #category : #testing }
Character >> isSpace [
	^value = 32
]

{ #category : #testing }
Character >> isTab [
	^value = 9
]

{ #category : #testing }
Character >> isUnderscore [
	^value = 95
]

{ #category : #testing }
Character >> isUnicode [
	value < 128 ifTrue: [^false].
]

{ #category : #testing }
Character >> isUppercase [
	^ActiveLocale isUppercase: self
]

{ #category : #testing }
Character >> isVowel [
	^'aAeEiIoOuU' includes: self
]

{ #category : #accessing }
Character >> lowByte [
	^value bitAnd: 16rFF
]

{ #category : #accessing }
Character >> numericValue [
	self isDigit ifTrue: [^value - 48].
]

{ #category : #printing }
Character >> printOn: aStream [
	self isUnicode ifTrue: [aStream beUnicode].
]

{ #category : #converting }
Character >> reduced [
	self ASSERT: false.
]

{ #category : #private }
Character >> setValue: anInteger [
	value := anInteger
]

{ #category : #copying }
Character >> shallowCopy [
	^self
]

{ #category : #services }
Character >> split: aString [
	^aString substringsSplitBy: self
]

{ #category : #printing }
Character >> storeOn: aStream [
	self printOn: aStream
]

{ #category : #converting }
Character >> storeUTF8On: aStream [
	"
]

{ #category : #converting }
Character >> utf8 [
	"
]
