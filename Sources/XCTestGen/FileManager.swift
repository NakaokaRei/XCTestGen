import Foundation

public class FileManager {
     static func readTextFile(atPath path: String) throws -> String {
        let url = URL(fileURLWithPath: path)
        let text = try String(contentsOf: url, encoding: .utf8)
        return text
    }

    static func saveTextFile(text: String, atPath path: String) throws {
        let url = URL(fileURLWithPath: path)
        try text.write(to: url, atomically: true, encoding: .utf8)
    }
}