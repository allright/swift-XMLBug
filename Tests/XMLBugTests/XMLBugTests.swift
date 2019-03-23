import XCTest
import class Foundation.Bundle


final class XMLBugTests: XCTestCase, XMLParserDelegate {
    func testExample() throws {

        let xmlString = "<element_name_part_1:element_name_part_2>"
        let xmlData = xmlString.data(using: .utf8)!
        let xmlParser = XMLParser(data: xmlData)
        xmlParser.delegate = self
        xmlParser.parse()

    }

    public func parser(_ parser: XMLParser,
                       didStartElement elementName: String,
                       namespaceURI: String?,
                       qualifiedName qName: String?,
                       attributes attributeDict: [String: String] = [:]) {
        print("didStartElement = \(elementName)")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
