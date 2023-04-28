public class InventoryCost {
    public String item;
    public Decimal quantity;
    public Decimal cost;

    public InventoryCost(String item, Decimal quantity, Decimal cost) {
        this.item = item;
        this.quantity = quantity;
        this.cost = cost;
    }
}
