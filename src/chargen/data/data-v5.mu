&list.bio [v(cdo)] =
    full name|
    template|
    concept|
    age|
    apparent age|
    ambition|
    desire

&list.bio_vampire [v(cdo)] =
    clan|
    sire|
    generation|
    predator type

&values.template [v(cdo)] =
    human|
    ghoul|
    vampire

&lock.template [v(cdo)] = orflags(%0,wWZ)
&trig.template [v(cdo)] = 
    @if eq(getstat(%0, template), vampire) = {
        [setstat(%0, hunger, 1)]
        [setstat(%0, humanity, 7)]
        [setstat(%0, blood potency, 1)]
    } 

&list.attributes [v(cdo)] =
    strength|
    dexterity|
    stamina|
    charisma|
    manipulation|
    composure|
    intelligence|
    wits|
    resolve

&default.attributes [v(cdo)] = 1
&values.attributes [v(cdo)] = 1|2|3|4|5|6|7|8|9|10
&trig.attributes [v(cdo)] = 
    [setstat(%0, health, add(3, getstat(%0, stamina)))]
    [setstat(%0, willpower, add(getstat(%0, composure), getstat(%0, resolve)))]

&list.skills [v(cdo)] =
    athletics|
    brawl|
    craft|
    drive|
    firearms|
    larceny|
    melee|
    stealth|
    survival|
    animal ken|
    etiquette|
    insight|
    intimidation|
    leadership|
    performance|
    persuasion|
    streetwise|
    subterfuge|
    academics|
    awareness|
    finance|
    investigation|
    medicine|
    occult|
    politics|
    science|
    technology

&default.skills [v(cdo)] = 0

&list.disciplines [v(cdo)] = 
	animalism|
    auspex|
    celerity|
    dominate|
    fortitude|
    obfuscate|
    potence|
    presence|
    protean|
    blood sorcery|
    rituals|
    thin-blood alchemy

&lock.disciplines [v(cdo)] = match(getstat(%0, template),vampire)
&values.disciplines [v(cdo)] = 1|2|3|4|5

&list.animalism [v(cdo)] =
	bond famulus|
    sense beast|
    feral whispers|
    animal succulence|
    quell the beast|
    unliving hive|
    subsume the spirit|
    animal dominion|
    drawing out the beast


&valaues.bond_famuslus [v(cdo)] = 1
&values.sense_beast [v(cdo)] = 1
&values.feral_whispers [v(cdo)] = 2
&values.animal_succulence [v(cdo)] = 3
&values.quell_the_beast [v(cdo)] = 3
  


&list.auspex [v(cdo)] = 
	heightened senses|
    sense the unseen|
    premonition|
    scry the soul|
    share the senses|
    spirit's touch|
    clairvoyance|
    posession|
    telepathy


&list.celerity [v(cdo)] =
    cat's grace|
    rapid reflexes|
    fleetness|
    blink|
    traversal|
    draught of elegance|
    unerring aim|
    lightning strike|
    split second


&list.dominate [v(cdo)] =
    cloud memory|
    compel|
    mesmerize|
    dementation|
    the forgetuful mind|
    submerged directive|
    rationalize|
    mass manipulation|
    terminal decree


&list.fortitude [v(cdo)] =
    resilience|
    unsayable mind|
    toughness|
    enduring beasts|
    defy bane|
    fortify the inner facade|
    draught of endurance|
    flesh of marble|
    prowesss from pain

&list.obfuscate [v(cdo)] =
    cloak of shadows|
    silence of death|
    unseen passage|
    ghost in the machine|
    mask if a thousand faces|
    concel|
    vanish|
    cloak of the gathering|
    imposter's curse

&list.potence [v(cdo)] =
    lethal body|
    soaring leap|
    prowess|
    brutal feed|
    spark of rage|
    uncanny grip|
    draught of might|
    earthshock|
    fist of cane 

&list.presence [v(cdo)] =
    awe|
    daunt|
    lingering kiss|
    dread gaze|
    entrancement|
    irresistible voice|
    summon|
    majesty|
    star magnetism

&list.protean [v(cdo)] =
    eyes of the beast|
    weight of the feather|
    feral weapons|
    earth meld|
    shapechange|
    metempophosis|
    mist form|
    the unfettered beast|

&list.blood_sorcery [v(cdo)] =
    corrosive vitae|
    a taste for blood|
    extinguish vitae|
    blood of potency|
    scorpion's touch|
    theft of vitae|
    baal's caress|
    cauldron of blood

&list.rituals [v(cdo)] = 
    blood walk|
    cling of the insect|
    craft bloodstone|
    walk with evening's freshness|
    ward against ghouls|
    eyes of babel|
    illuminate the trail of prey|
    truth of blood|
    ward against spirits|
    warding circle against ghouls|
    dragon's call|
    defelction of wooden doom|
    esscence of air|
    firewalker|
    ward against lupines|
    warding circle against spirits|
    defense of the sacred haven|
    eyes of the nighthawk|
    incorporeal passage|
    ward against canites|
    warding circle against lupines|
    escape to true sanctuary|
    heart of stone|
    shaft of belated dissolution|
    warding circle against canites


&list.flaws [v(cdo)] =
	Addiction|
    Archaic|
    Baby Teeth|
    Bestial Temper|
    Bond Junkie|
    Bondslave|
    Compromised|
    Creepy|
    Dead Flesh|
    Folkloric Bane|
    Folkloric Block|
    Haunted|
    Hopeless Addiction|
    Illiterate|
    Living in the Past|
    Long Bond|
    Methuselah's Thirst|
    No Haven|
    Organovore|
    Prey Exclusion|
    Repulsive|
    Stake Bait|
    Stigmata|
    Ugly|
    Despised|
    Disliked|
    Infamy|
    Dark Secret|
    Known Blankbody|
    Known Corpse
  
&instanced.Folkloric Bane [v(cdo)] = 1
&instanced.Folkloric Block [v(cdo)] = 1

&list.merits [v(cdo)] = 
	beautiful|
    stunning|
    bond resistance|
    short bond|
    unbondable|
    bloodhound|
    iron gullet|
    eat food|
    anarch comrades|
    camarilla contact|
    catenating blood|
    day drinker|
    discipline affinity|
    lifelike|
    thin-blood alchemist|
    vampiric resistance|
    zeroed|
    cobbler|
    mawla|
    status

&list.backgrounds [v(cdo)] = 
    Allies|
    Contacts|
    Fame|
    Haven|
    Herd|
    Influence|
    Mask|
    Mawla|
    Resources|
    Retainers|
    Status

&list.pools [v(cdo)]=
	health|
    willpower|
    hunger|
    humanity

&list.pools [v(cdo)] = 
    willpower|
    health

&lock.pools [v(cdo)] = orflags(%0,wWZ)

&list.pools_vampire [v(cdo)] = 
    hunger|
    humanity|
    blood potency

&lock.hunger [v(cdo)] = orflags(%0,wWZ)