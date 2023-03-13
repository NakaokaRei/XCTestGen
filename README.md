# XCTestGen

<!-- # Short Description -->

CLI for automatic XCTest generation using ChatGPT

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

e.g. If `SampleProcessor.swift` is input, `SampleProcessorTests.swift` will be created in the output destination.
```
$ XCTestGen $OPENAI_KEY "input file path" "output dir path"
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