import java.util.concurrent.ThreadLocalRandom;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;

public class CoffeeMachine extends Artifact {

    private int maxCapacity;

    void init(int initialStock, int maxCapacity) {
        this.maxCapacity = maxCapacity;
        int validInitialStock = Math.min(initialStock, maxCapacity);
        defineObsProperty("stock", validInitialStock);
    }
    @OPERATION 
    void takeCoffee(){
        ObsProperty property= getObsProperty("stock");
        int current= property.intValue();

        if (current>0){
            property.updateValue(current-1);
        }
        else{
            failed("Empty Machine");
        }
    }
    
    @OPERATION
    void refill() {
        ObsProperty property = getObsProperty("stock");
        int current = property.intValue();
        int minRefill = Math.min(current + 1, maxCapacity);
        int newStock = ThreadLocalRandom.current().nextInt(minRefill, maxCapacity + 1);
        property.updateValue(newStock);
    }
}