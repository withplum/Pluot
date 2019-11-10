# Pluot

_Pluots /ˈpluːɒt/ are later generations of complex hybrid between the Japanese plum, Prunus salicina (providing the greater amount of parentage), and the apricot, Prunus armeniaca. The fruit's exterior has smooth skin closely resembling that of a plum. Pluots were developed in the late 20th century by Floyd Zaiger._ - Wikipedia

Pluot makes putting together `NSAttributedString`s silky smooth. 

## Requirements

- iOS 12.0+

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/withplum/Pluot", from: "1.0.0")
]
```

## Usage

```
// Define your styles
internal struct TestStyleSheet: StyleSheet
{
    static let `default` = Style()
        .font(.systemFont(ofSize: 24.0))
        .color(.red)
        .paragraph { (style) in
            style.alignment = .center
        }
    
    
    static let body = Style()
        .font(.systemFont(ofSize: 16.0))
        .color(.blue)
        .paragraph { (style) in
            style.alignment = .left
        }
}

// Build your string
let pluot: Pluot<TestStyleSheet> = "Hello, this is a \("test", TestStyleSheet.body). Nice to meet you"

// Set your string
let label = UILabel()
label.attributedString = pluot.attributedString
```

## License

MIT

Copyright 2019 Plum Fintech Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
