class ItemFactory {
    func lookupItem(_ name: String) -> AnItem? {
        let lookup = ["Aged Brie": AgedBrie(),
                      "Backstage passes to a TAFKAL80ETC concert": BackstagePass(),
                      "Sulfuras, Hand of Ragnaros": Sulfuras()] as [String : AnItem]
        let anItem = lookup[name]
        if (anItem != nil) {
            return anItem
        }
        return NormalItem()
    }

}
