+stock(S) : S == 0 <-
    refill;
    .print("[Technician] Already empty?! Oh Lawd").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }