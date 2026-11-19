import cartago.AgentId;
import cartago.Artifact;
import cartago.OPERATION;

public class CinemaTotem extends Artifact {
    private int id;
    private AgentId currentUser = null;

    void init(int id) {
        this.id = id;
        defineObsProperty("occupied", false);
    }

    @OPERATION
    void acquire() {
        if (currentUser != null) {
            failed("totem_occupied");
        } else {
            currentUser = getCurrentOpAgentId();
            getObsProperty("occupied").updateValue(true);
        }
    }

    @OPERATION
    void release() {
        if (currentUser == null || !currentUser.equals(getCurrentOpAgentId())) {
            failed("not_owner");
        } else {
            currentUser = null;
            getObsProperty("occupied").updateValue(false);
        }
    }
}