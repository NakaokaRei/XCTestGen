@main
public struct XCTestGen {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(XCTestGen().text)
    }
}
