import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {

    let agedBrie = "Aged Brie"
    let passes = "Backstage passes to a TAFKAL80ETC concert"
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    let normal = "A Normal item"
    
    func testAgedBrieInDate() {
        let items = [Item(name: agedBrie, sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        verifyItem(item: items[0], name: agedBrie, sellIn: 9, quality: 11)
    }
    
    func testAgedBrieInDateMaxQuality() {
        let items = [Item(name: agedBrie, sellIn: 10, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: agedBrie, sellIn: 9, quality: 50)
    }

    func testAgedBriePastExpiry() {
        let items = [Item(name: agedBrie, sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: agedBrie, sellIn: -1, quality: 2)
    }

    
    
    
    func testPassesInDateIncreaseBy2() {
        let items = [Item(name: passes, sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: passes, sellIn: 9, quality: 12)
    }

    func testPassesMaxQuality() {
        let items = [Item(name: passes, sellIn: 10, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: passes, sellIn: 9, quality: 50)
    }

    func testPassesBelow6Days() {
        let items = [Item(name: passes, sellIn: 5, quality: 9)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: passes, sellIn: 4, quality: 12)
    }

    
    func testPassesExpired() {
        let items = [Item(name: passes, sellIn: 0, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: passes, sellIn: -1, quality: 0)
    }

    
    
    func testSulfurasInDateDoesntChange() {
        let items = [Item(name: sulfuras, sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: sulfuras, sellIn: 10, quality: 10)
    }

    func testSulfurasExpired() {
        let items = [Item(name: sulfuras, sellIn: 0, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: sulfuras, sellIn: 0, quality: 50)
    }

    
    func testNormalItemInDate() {
        let items = [Item(name: normal, sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: normal, sellIn: 9, quality: 9)
    }

    func testNormalItemExpired() {
        let items = [Item(name: normal, sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: normal, sellIn: -1, quality: 8)
    }

    func testNormalItemPoorQuality() {
        let items = [Item(name: normal, sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        verifyItem(item: items[0], name: normal, sellIn: -1, quality: 0)
    }

    
    
    func verifyItem(item: Item, name: String, sellIn: Int, quality: Int) {
        XCTAssertEqual(name, item.name)
        XCTAssertEqual(sellIn, item.sellIn)
        XCTAssertEqual(quality, item.quality)
    }

}
