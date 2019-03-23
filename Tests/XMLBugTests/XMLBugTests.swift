import XCTest
import class Foundation.Bundle


private let originalElementName = "part_1:part_2"


final class XMLBugTests: XCTestCase, XMLParserDelegate {
    func testElementName() throws {
        let xmlString = "<\(originalElementName)>"
        let xmlData = xmlString.data(using: .utf8)!
        let xmlParser = XMLParser(data: xmlData)
        xmlParser.delegate = self
        XCTAssertTrue(xmlParser.parse())
    }

    public func parser(_ parser: XMLParser,
                       didStartElement elementName: String,
                       namespaceURI: String?,
                       qualifiedName qName: String?,
                       attributes attributeDict: [String: String] = [:]) {
        XCTAssertEqual(originalElementName, elementName)
    }


    static var allTests = [
        ("testExample", testElementName),
    ]
}
