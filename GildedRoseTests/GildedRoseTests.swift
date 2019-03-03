import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testAgedBrie() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()

        verifyItem(item: items[0], name: "Aged Brie", sellIn: -1, quality: 2)
    }
    
    func verifyItem(item: Item, name: String, sellIn: Int, quality: Int) {
        XCTAssertEqual(name, item.name)
        XCTAssertEqual(sellIn, item.sellIn)
        XCTAssertEqual(quality, item.quality)
    }

}
