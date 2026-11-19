!start.

+!start
    <-  W = math.floor(math.random * 300);
        .wait(W);
        !useTotem(totem1).

+!useTotem(T)
    <-  acquire[artifact_name(T), wsp(cinema)];
        take[artifact_name(seats), wsp(cinema)];
        W = math.random * 4000;
        .wait(W);
        .print("[cinefile]: Got my Ticket from ", T);
        release[artifact_name(T), wsp(cinema)].

-!useTotem(T)[error_msg("no_seats")]
    <-  release[artifact_name(T), wsp(cinema)];
        .print("[cinefile]: Another Time Lads...").

-!useTotem(totem1)[error_msg("totem_occupied")]
    <-  !useTotem(totem2).

-!useTotem(totem2)[error_msg("totem_occupied")]
    <-  .wait(occupied(false));
        W = math.floor(math.random * 300);
        .wait(W);
        !useTotem(totem1).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }