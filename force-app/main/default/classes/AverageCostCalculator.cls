public class AverageCostCalculator {
    public static Map<String, Decimal> calculate(List<InventoryCost> inventoryCosts) {
        Map<String, Decimal> averageCosts = new Map<String, Decimal>();
        Map<String, List<Decimal>> itemCosts = new Map<String, List<Decimal>>();
        
        for (InventoryCost inventoryCost : inventoryCosts) {
            String item = inventoryCost.item;
            Decimal quantity = inventoryCost.quantity;
            Decimal cost = inventoryCost.cost;
            
            if (!itemCosts.containsKey(item)) {
                itemCosts.put(item, new List<Decimal>{0, 0});
            }
            List<Decimal> itemSums = itemCosts.get(item);
            itemSums[0] = itemSums[0] + quantity;
            itemSums[1] = itemSums[1] + quantity * cost;
        }
        
        for (String item : itemCosts.keySet()) {
            List<Decimal> itemSums = itemCosts.get(item);
            Decimal averageCost = itemSums[1] / itemSums[0];
            averageCosts.put(item, averageCost.setScale(2));
        }
        
        return averageCosts;
    }
}