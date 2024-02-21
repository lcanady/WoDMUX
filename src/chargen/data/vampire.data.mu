&list.bio_vampire  [v(cdo)] = 
    clan|
    generation|
    sire|

&lock.bio_vampire  [v(cdo)] = u( .is, %0, vampire )
&values.clan [v(cdo)] = 
    Brujah|
    Gangrel|
    Malkavian|
    Nosferatu|
    Toreador|
    Tremere|
    Ventrue|
    Caitiff|
    Lasombra|
    Tzimisce|
    Assamite|
    Giovanni|
    Ravnos|
    Setite|
    Followers of Set


&list.vampire_disciplines  [v(cdo)] = 
    animalism|
    auspex|
    celerity|
    chimestry|
    daemention|
    dominate|
    fortitude|
    necromancy|
    obfuscate|
    obtenebration|
    potence|
    presence|
    protean|
    quietus|
    serpentis|
    thaumaturgy|
    vicissitude

&values.vampire_disciplines [v(cdo)] = 1|2|3|4|5|6
&lock.vampire_disciplines  [v(cdo)] = 
    or(
        u( .is, %0, vampire ),
        u( .is, %0, ghoul )
    )

