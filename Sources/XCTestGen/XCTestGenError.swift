import Foundation

enum XCTestGenError: Error {
    case readCodeError
    case saveFileError
    case chatgptResultError
}

extension XCTestGenError {
    var description: String {
        switch self {
        case .readCodeError:
            return "Read Code Error"
        case .saveFileError:
            return "Save File Error"
        case .chatgptResultError:
            return "ChatGPT's result was not exist"
        }
    }
}