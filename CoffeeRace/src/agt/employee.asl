!start.

+!start : true <-
    .random(R);
    .wait(R * 20);
    !drinkCoffee.

+!drinkCoffee : true <-
    takeCoffee;
    .print("[Employee] Thank You, Machine!").

-!drinkCoffee : true <-
    +waitingCoffee;
    .print("[Employee] How long does it take?").

+stock(S) : S > 0 & waitingCoffee <-
    -waitingCoffee;
    !drinkCoffee;
    .print("[Employee] Finally!").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }