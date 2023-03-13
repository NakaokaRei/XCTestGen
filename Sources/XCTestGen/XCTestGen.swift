import Foundation
import ArgumentParser
import OpenAISwift

@main
struct XCTestGen: AsyncParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "CLI to automatically generate XCTests using ChatGPT",
        version: "0.1.0"
    )

    @Argument(help: "API Key")
    var key: String

    @Argument(help: "input file path")
    var input: String

    @Argument(help: "output dir path. do not include the trailing slash.")
    var output: String

    @Option(name: .shortAndLong, help: "Maximum tokens")
    var maxTokens: Int = 1000

    func outputTestsPath() -> String {
        let fileName = URL(fileURLWithPath: input).lastPathComponent
        let fileNameWithoutExtension = (fileName as NSString).deletingPathExtension
        let fileExtension = (fileName as NSString).pathExtension
        let newFileName = fileNameWithoutExtension + "Tests." + fileExtension
        return output + "/" + newFileName
    }

    func generateXCTest() async throws {
        let order = "Please write a unit test (XCTest) of the following Swift code. No explanatory text is required as we would like to save your output as source code as is."
        let code: String

        do {
            code = try FileManager.readTextFile(atPath: input)
        } catch {
            throw XCTestGenError.readCodeError
        }

        let prompt = order + "\n\n" + code

        let openAI = OpenAISwift(authToken: key)
        let result = try await openAI.sendCompletion(with: prompt, maxTokens: maxTokens)

        guard let testCode = result.choices.first?.text else {
            throw XCTestGenError.chatgptResultError
        }

        do {
            try FileManager.saveTextFile(text: testCode, atPath: outputTestsPath())
        } catch {
            throw XCTestGenError.saveFileError
        }
    }

    mutating func run() async throws {
        do {
            try await generateXCTest()
            print("Generated to " + outputTestsPath())
        } catch {
            if let xcTestError = error as? XCTestGenError {
                print(xcTestError.description)
            } else {
                print("Error")
            }
        }
    }
}
