
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
            if (item.name != agedBrie && item.name != passes) {
                if (item.name != sulfuras) {
                    if (item.quality > 0) {
                        item.quality-=1
                    }
                }
            } else {
                if (item.quality < 50) {
                    item.quality+=1
                    
                    if (item.name == passes) {
                        
                        
                        if (item.sellIn < 11 && item.quality < 50) {
                            item.quality+=1
                        }
                        
                        if (item.sellIn < 6 && item.quality < 50) {
                            item.quality+=1
                        }
                        
                        
                        
                    }
                }
                
                
            }
            
            if (item.name != sulfuras) {
                item.sellIn-=1
            }
            
            
                
            if (item.name != agedBrie) {
                
                
                if (item.name == passes || item.name == sulfuras) {
                    if (item.sellIn < 0) {
                        item.quality = 0
                    }
                } else {
                    if (item.sellIn < 0) {
                        if (item.quality > 0) {
                            item.quality-=1
                        }
                    }
                }
                
                
                
            } else {
                if (item.sellIn < 0) {
                    if (item.quality < 50) {
                        item.quality+=1
                    }
                }
            }
                
                
            
        }
    }
}
