
public class GildedRose {
    var items:[Item]
    let agedBrie = "Aged Brie"
    let passes = "Backstage passes to a TAFKAL80ETC concert"
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        
        for i in 0..<items.count {
            if (items[i].name != agedBrie && items[i].name != passes) {
                if (items[i].quality > 0) {
                    if (items[i].name != sulfuras) {
                        items[i].quality-=1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality+=1
                    
                    if (items[i].name == passes) {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality+=1
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality+=1
                            }
                        }
                    }
                }
            }
            
            if (items[i].name != sulfuras) {
                items[i].sellIn-=1
            }
            
            if (items[i].sellIn < 0) {
                if (items[i].name != agedBrie) {
                    if (items[i].name != passes) {
                        if (items[i].quality > 0) {
                            if (items[i].name != sulfuras) {
                                items[i].quality-=1
                            }
                        }
                    } else {
                        items[i].quality = 0
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality+=1
                    }
                }
            }
        }
    }
}
