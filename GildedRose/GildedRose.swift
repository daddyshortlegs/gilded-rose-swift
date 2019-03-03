
public class GildedRose {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            let anItem = lookupItem(item.name)
            anItem?.update(item)
        }
    }
    
    fileprivate func lookupItem(_ name: String) -> AnItem? {
        let agedBrie = "Aged Brie"
        let passes = "Backstage passes to a TAFKAL80ETC concert"
        let sulfuras = "Sulfuras, Hand of Ragnaros"

        let lookup = [agedBrie: AgedBrie(), passes: BackstagePass(), sulfuras: Sulfuras()] as [String : AnItem]
        let anItem = lookup[name]

        if (anItem != nil) {
            return anItem
        }
        return NormalItem()
    }
}
