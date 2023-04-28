@isTest
private class AverageCostCalculatorTest {
    @isTest
    static void testCalculate() {
        List<InventoryCost> inventoryCosts = new List<InventoryCost>{
            new InventoryCost('Memory 64Gb', 10, 10.00),
            new InventoryCost('Chipset RX2321', 20, 20.00),
            new InventoryCost('Memory 64Gb', 50, 15.00),
            new InventoryCost('Display DS21344', 100, 12.00),
            new InventoryCost('Chipset RX2321', 80, 25.00)
        };
        
        Map<String, Decimal> expectedAverageCosts = new Map<String, Decimal>{
            'Memory 64Gb' => 14.17,
            'Chipset RX2321' => 24.00,
            'Display DS21344' => 12.00
        };
        test.startTest();
        Map<String, Decimal> actualAverageCosts = AverageCostCalculator.calculate(inventoryCosts);
        test.stopTest();
        
        for (String item : expectedAverageCosts.keySet()) {
            System.assertEquals(expectedAverageCosts.get(item), actualAverageCosts.get(item),'Value dooes not match');
        }
    }
}
