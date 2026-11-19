import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;

public class SeatCounter extends Artifact {

    void init(int total) {
        defineObsProperty("seats", total);
    }

    @OPERATION
    void take() {
        ObsProperty s = getObsProperty("seats");
        if (s.intValue() <= 0) {
            failed("no_seats");
        } else {
            s.updateValue(s.intValue() - 1);
        }
    }
}