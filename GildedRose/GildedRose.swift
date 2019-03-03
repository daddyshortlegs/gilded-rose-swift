
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
                sulfurasUpdate(item)
            } else {
                normalItemUpdate(item)
            }
        }
    }
    
    

    fileprivate func sulfurasUpdate(_ item: Item) {
    }

    fileprivate func normalItemUpdate(_ item: Item) {
        if item.quality > 0 {
            item.quality-=1
        }
        
        item.sellIn-=1
        
        if item.sellIn < 0 && item.quality > 0 {
            item.quality-=1
        }
    }


}
