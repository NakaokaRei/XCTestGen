# XCTestGen

<!-- # Short Description -->

CLI for automatic XCTest generation using OpenAI API.
If you want to use this CLI, please obtain an OpenAI API Key.

You can create at [here](https://platform.openai.com/account/api-keys)

<!-- # Badges -->

[![Github issues](https://img.shields.io/github/issues/NakaokaRei/XCTestGen)](https://github.com/NakaokaRei/XCTestGen/issues)
[![Github forks](https://img.shields.io/github/forks/NakaokaRei/XCTestGen)](https://github.com/NakaokaRei/XCTestGen/network/members)
[![Github stars](https://img.shields.io/github/stars/NakaokaRei/XCTestGen)](https://github.com/NakaokaRei/XCTestGen/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/NakaokaRei/XCTestGen)](https://github.com/NakaokaRei/XCTestGen/)
[![Github license](https://img.shields.io/github/license/NakaokaRei/XCTestGen)](https://github.com/NakaokaRei/XCTestGen/)

# Installation
Execute the following command from above.
```
$ git clone git@github.com:NakaokaRei/XCTestGen.git
$ cd XCTestGen
$ swift build -c release
$ cp .build/release/XCTestGen /usr/local/bin/XCTestGen
```

# Usage
Executing the command with the path of the input file and the path of the destination folder will save the unit test code in the destination folder.

```
$ XCTestGen $OPENAI_KEY "input file path" "output dir path"
```

e.g. If `Sample.swift` is input, `SampleTests.swift` will be created in the output destination.

```swift
// Sample.swift
class Sample {
    func sample1(x: Int) -> Int {
        return x + 1
    }

    func sample2(x: String) -> String {
        return x + "sample"
    }
}
```

```swift
// SampleTests.swift
import XCTest

class SampleTests: XCTestCase {

    func test_sample1() {
        // given
        let expectedResult = 11
        let sampleInput = 10
        let sut = Sample()

        // when
        let result = sut.sample1(x: sampleInput)

        // then
        XCTAssertEqual(result, expectedResult)
    }

    func test_sample2() {
        // given
        let expectedResult = "testsample"
        let sampleInput = "test"
        let sut = Sample()

        // when
        let result = sut.sample2(x: sampleInput)

        // then
        XCTAssertEqual(result, expectedResult)
    }
}
```


# Help
```
OVERVIEW: CLI to automatically generate XCTests using ChatGPT

USAGE: xc-test-gen <key> <input> <output> [--max-tokens <max-tokens>]

ARGUMENTS:
  <key>                   API Key
  <input>                 input file path
  <output>                output dir path. do not include the trailing slash.

OPTIONS:
  -m, --max-tokens <max-tokens>
                          Maximum tokens (default: 1000)
  --version               Show the version.
  -h, --help              Show help information.
```


# Contributors

- [NakaokaRei](https://github.com/NakaokaRei)

# License
MIT license. See the [LICENSE file](/LICENSE) for details.