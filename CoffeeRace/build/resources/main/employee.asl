!start.

+!start : true <-
    .random(R);
    .wait(R*20);
    !drinkCoffee.


+!drinkCoffee : true <-
    takeCoffee;
    print("Thank You, Machine").

-!drinkCoffee : true <-
    +waitingCoffee;
    print("How long does it takes?").

+stock(S) : S>0 & waitingCoffee <-
    -waitingCoffee;
    !drinkCoffee;
    print("Finally").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }