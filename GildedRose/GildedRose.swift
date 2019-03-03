
public class GildedRose {
    var items:[Item]
    let agedBrie = "Aged Brie"
    let passes = "Backstage passes to a TAFKAL80ETC concert"
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            if item.name == agedBrie {
                let agedBrie = AgedBrie()
                agedBrie.update(item)
            } else if item.name == passes {
                let passes = BackstagePass()
                passes.update(item)
            } else if item.name == sulfuras {
                let sulfuras = Sulfuras()
                sulfuras.update(item)
            } else {
                let normalItem = NormalItem()
                normalItem.update(item)
            }
        }
    }
}
