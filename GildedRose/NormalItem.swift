class NormalItem : AnItem {
    func update(_ item: Item) {
        if item.quality > 0 {
            item.quality-=1
        }
        
        item.sellIn-=1
        
        if item.sellIn < 0 && item.quality > 0 {
            item.quality-=1
        }
    }
}
