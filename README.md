# KNCalc

A simple forces related to a climbing fall calculator.

KnCalc is a minimum viable project of an educational tool for understanding forces and fall factors in climbing.
It can be use with childrens or adults to demonstrate and play with differents variables such as the climber weight, the height of fall, the rope stretch rate, and others.

This app aims to be less visually numbers oriented, and more graphics usable to vary variables and understand their inner relations.

!! Dislcaimer : This app calculate theorical values, despite the fact that a lot of physical elements are related to real and subjectives context, we try
here to approach as close a possible a real value. But it can't be used to plan a real fall, it is for education purpose only.

If you want to participate and commit to this project feel free to email me at : jo@jolanberard.com


Formulas used :

Earth acceleration = 9.80665

Static force (in Kn) = body weight(Kg) * earth acceleration

Rope stretch distance (in m) = rope stretch value(%) * (rope height from ground(m) + height above last quickdraw(m) + slack(m))/100

Distance of slow (in m) = belayer dynamic catch(m) + rope stretch distance(m)

Falling distance (in m) = (height above last quickdraw * 2) + rope stretch value(%) * ((height above last quickdraw(m)*2)/100) + slack(m)

Force on fall(in N) = static force(Kn) * (falling distance(m)/distance of slow(m))

Force on fall(in Kn) = (static force(Kn) * (falling distance/distance of slow(m)))/1000

Fall factor = falling distance(m) / rope height from ground(m)

Pulley tension = force on fall in Kn * 1.60

References :

Wikipedia :
https://fr.wikipedia.org/wiki/Force_de_choc

Hard Is Easy youtube channel (formules simplifiées) :
https://www.youtube.com/watch?v=WyExE2qH4Fs&t=257s

Alpiniste.fr (formules de force de chute) :
https://www.alpiniste.fr/facteur-de-chute-calculateur/

Pierre Blanche escalade (facteur de chute et effet poulie) :
https://www.pierre-blanche-escalade.fr/conseils/fiche-s%C3%A9curit%C3%A9-n9-facteur-de-chute-et-force-de-choc
