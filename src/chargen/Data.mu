
&list.bio [v(cdo)] =
    full name|
    template|
    concept|
    nature|
    demeanor|
    clan|
    generation|
    breed|
    auspice|
    tribe|
    age|
    apparent age

&values.breed [v(cdo)] = 
    homid|
    lupus|
    metis

&values.template [v(cdo)] = 
    garou|
    fera|
    vampire|
    mage


&lock.template [v(cdo)] = orflags(%0, wWZ)

&lock.clan [v(cdo)] = u(.is, %0, vampire)
&lock.generation [v(cdo)] = u(.is, %0, vampire)

&lock.breed [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, fera)
    )

&lock.homid [v(cdo)] = u(.is, %0, garou)
&lock.lupus [v(cdo)] = u(.is, %0, garou)
&lock.metis [v(cdo)] = u(.is, %0, garou)

&values.auspice [v(cdo)] =
    ragabash|
    theurge|
    philodox|
    galliard|
    ahroun

&lock.auspice [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, fera)
    )

&lock.ragabash [v(cdo)] = u(.is, %0, garou)
&lock.theurge [v(cdo)] = u(.is, %0, garou)
&lock.philodox [v(cdo)] = u(.is, %0, garou)
&lock.galliard [v(cdo)] = u(.is, %0, garou)
&lock.ahroun [v(cdo)] = u(.is, %0, garou)

&values.tribe [v(cdo)] =
    black furies|
    bone gnawers|
    children of gaia|
    fianna|
    get of fenris|
    glass walkers|
    red talons|
    shadow lords|
    silent striders|
    silver fangs|
    stargazers|
    uktena|
    wendigo

&lock.tribe [v(cdo)] = u(.is, %0, garou)

&list.attributes [v(cdo)] = 
    strength|
    dexterity|
    stamina|
    charisma|
    manipulation|
    appearance|
    perception|
    intelligence|
    wits

&default.attributes [v(cdo)] = 1
&values.attributes [v(cdo)] = 1|2|3|4|5

&LIST.talents [v(cdo)] = 
    alertness|
    athletics|
    brawl|
    empathy|
    expression|
    intimidation|
    leadership|
    primal urge|
    streetwise|
    subterfuge

&default.talents [v(cdo)] = 0
&values.talents [v(cdo)] = 1|2|3|4|5
&lock.primal_urge [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, fera)
    )


&LIST.skills [v(cdo)] =
    animal-ken|
    crafts|
    drive|
    etiquette|
    firearms|
    larceny|
    melee|
    performance|
    security|
    stealth|
    survival


&default.skills [v(cdo)] = 0
&values.skills [v(cdo)] = 1|2|3|4|5

&lock.security [v(cdo)] = 
    or(
        u(.is, %0, mortal),
        u(.is, %0, ghoul),
        u(.is, %0, vampire)
    )

&list.knowledges [v(cdo)] =
    academics|
    computer|
    enigmas|
    finance|
    investigation|
    law|
    medicine|
    occult|
    politics|
    science|
    technology

&default.knowledges [v(cdo)] = 0
&values.knowledges [v(cdo)] = 1|2|3|4|5
&lock.enigmas [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, kinfolk)
    )

&lock.finance [v(cdo)] = 
    or(
        u(.is, %0, mortal),
        u(.is, %0, ghoul),
        u(.is, %0, mage),
        u(.is, %0, vampire)
    )


&list.backgrounds [v(cdo)] =
    allies|
    ancestors|
    contacts|
    fate|
    fetish|
    kinfolk|
    mentor|
    pure breed|
    resources|
    rites|
    spiritual heritage|
    totem

&values.backgrounds [v(cdo)] = 1|2|3|4|5

&instanced.allies [v(cdo)] = 1
&instanced.contacts [v(cdo)] = 1
&instanced.fame [v(cdo)] = 1
&instanced.status [v(cdo)] = 1
&instanced.totem [v(cdo)] = 1

&lock.ancestors [v(cdo)] = u(.is, %0, garou)
&lock.mentor [v(cdo)] = u(.is, %0, garou)
&lock.fate [v(cdo)] = u(.is, %0, garou)
&lock.fetish [v(cdo)] = u(.is, %0, garou)
&lock.kinfolk [v(cdo)] = u(.is, %0, garou)
&lock.pure_breed [v(cdo)] = u(.is, %0, garou)
&lock.rites [v(cdo)] = u(.is, %0, garou)
&lock.spiritual_heritage [v(cdo)] = u(.is, %0, garou)
&locks.totem [v(cdo)] = u(.is, %0, garou)

&list.renown [v(cdo)] = 
    glory|
    honor|
    wisdom

&default.renown [v(cdo)] = 0
&values.renown [v(cdo)] = 1|2|3|4|5|6|7|8|9|10
&lock.renown [v(cdo)] = u(.is, %0, garou)


&list.merits [v(cdo)] =
    acute sense|
    alchohol tollerence|
    ambidexterous|
    double-jointed|
    mixed-morph|
    perfect-balance|
    wolf-sight|
    bad taste|
    fair glabro|
    lack of scent|
    physically impressive|
    daredevil|
    long-distance runner



&values.acute_sense [v(cdo)] = 1
&instanced.acute_sense [v(cdo)] = 1
&values.alchohol_tollerence [v(cdo)] = 1
&values.ambidexterous [v(cdo)] = 1
&values.double-jointed [v(cdo)] = 1

&values.mixed-morph [v(cdo)] = 1|5
&lock.mixed-morph [v(cdo)] = u(.is, %0, garou)
&values.perfect-balance [v(cdo)] = 1

&values.wolf-sight [v(cdo)] = 1
&lock.wolf-sight [v(cdo)] = u(.is, %0, garou)

&values.bad-taste [v(cdo)] = 2
&lock.bad-taste [v(cdo)] = u(.is, %0, garou)
&values.fair-glabro [v(cdo)] = 2
&lock.fair-glabro [v(cdo)] = u(.is, %0, garou)
&values.lack_of_scent [v(cdo)] = 2
&values.physically_impressive [v(cdo)] = 2
&values.daredevil [v(cdo)] = 3
&values.long-distance_runner [v(cdo)] = 3


&list.gifts [v(cdo)] =
    apecraft's blessing|
    city running|
    master of fire|
    persuasion|
    smell of man|
    jam technology|
    mark of the wolf|
    speech of the world|
    staredown|
    calm the savage beast|
    cowing the bullet|
    disquiet|
    reshapev object|
    body shift|
    bury the wolf|
    cocoon|
    spirit ward|
    assimilation|
    beyond human|
    part the veil

&lock.gifts [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, fera)
    )


&values.apecrafts_blessing [v(cdo)] = 1
&values.city_running [v(cdo)] = 1
&values.master_of_fire [v(cdo)] = 1
&values.persuasion [v(cdo)] = 1
&values.smell_of_man [v(cdo)] = 1
&values.jam_technology [v(cdo)] = 2
&values.mark_of_the_wolf [v(cdo)] = 2
&values.speech_of_the_world [v(cdo)] = 2
&values.staredown [v(cdo)] = 2
&values.calm_the_savage_beast [v(cdo)] = 3
&values.cowing_the_bullet [v(cdo)] = 3
&values.disquiet [v(cdo)] = 3
&values.reshape_object [v(cdo)] = 3
&values.body_shift [v(cdo)] = 4
&values.bury_the_wolf [v(cdo)] = 4
&values.cocoon [v(cdo)] = 4
&values.spirit_ward [v(cdo)] = 4
&values.assimilation [v(cdo)] = 5
&values.beyond_human [v(cdo)] = 5
&values.part_the_veil [v(cdo)] = 5


&list.rites [v(cdo)] =
    rite of cleansing|
    rite of contrition|
    rite of renunciation

&lock.rites [v(cdo)] = u(.is, %0, garou)
&values.rite_of_cleansing [v(cdo)] = 1
&values.rite_of_contrition [v(cdo)] = 1
&values.rite_of_renunciaition [v(cdo)] = 1


&list.pools [v(cdo)] =
    gnosis|
    willpower|
    blood|
    rage

&values.pools [v(cdo)] = 1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30
&lock.gnosis [v(cdo)] = 
    or(
        u(.is, %0, garou),
        u(.is, %0, fera),
        u(.is, %0, mage)
    )

&lock.rage [v(cdo)] = u(.is, %0, garou)





/*
##########################################################################
##### UTILITY FUNCTIONS ##################################################
*/
                    
&.is [v(cdo)] =         gt(words(grab(getstat(%0,template),lcstr(%1),/)),0)
&.isnt [v(cdo)] =       not(gt(words(grab(getstat(%0,template),lcstr(%1),/)),0))
&.has [v(cdo)] =        gte(words(getstat(%0, %1)),0)
&.not-have [v(cdo)] =   not(gte(words(getstat(%0, %1)),0))

