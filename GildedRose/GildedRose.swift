public class GildedRose {
    var items:[Item]
    let factory = ItemFactory()

    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            let anItem = factory.lookupItem(item.name)
            anItem?.update(item)
        }
    }
}
