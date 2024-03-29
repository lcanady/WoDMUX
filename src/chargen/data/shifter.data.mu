&list.bio_garou [v(cdo)] = 
    auspice|
    breed|
    tribe

&lock.bio_garou [v(cdo)] = u(.is, %0, garou)

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


&list.talents_garou [v(cdo)] =
    leadership|
    primal urge

&lock.talents_garou [v(cdo)] = u(.is, %0, garou)
&default.talents_garou [v(cdo)] = 0
&values.talents_garou [v(cdo)] = 1|2|3|4|5

&list.KNOWLEDGES_garou [v(cdo)] =
    academics


&lock.KNOWLEDGES_garou [v(cdo)] = u(.is, %0, garou)
&default.KNOWLEDGES_garou [v(cdo)] = 0
&values.KNOWLEDGES_garou [v(cdo)] = 1|2|3|4|5


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
    part the veil|
    create element|
    primal anger|
    rat head|
    sense wyrm|
    shed|
    burrow|
    curse of hatred|
    form mastery|
    sense silver|
    chameleon|
    eyes of the cat|
    mental speech|
    shell|
    gift of the porcupine|
    lash of rage|
    rattler's bite|
    wither limb|
    maddness|
    protean form|
    totem gift|
    hare's leap|
    heightened senses|
    sense prey|
    predator's arsenal|
    prey mind|
    axis mundi|
    eye of the eagle|
    name the spirit|
    scent of sight|
    catfeet|
    monkey tail|
    sense the unnatural|
    silent the weaver|
    strength of gaia|
    beast life|
    gnaw|
    scream of gaia|
    terror of the dire wolf|
    elemental gift|
    song of the great beast|
    blur of the milky eye|
    infectious laughter|
    liar's face|
    open seal|
    scent of running water|
    blissful ignorance|
    puple of the prey|
    spider's song|
    taking the forgotten|
    gremlins|
    liar's craft|
    monkey trail|
    open moon bridge|
    pathfinder|
    luna's blessing|
    umbral dodge|
    whelp body|
    thieving talons of the magpie|
    thousand forms|
    firebringer|
    mother's touch|
    spirit snare|
    spirit speech|
    umbral tether|
    battle mandala|
    command spirit|
    sight from the beyond|
    exorcism|
    pulse of the invisible|
    umbral camouflage|
    web walker|
    blurring the mirror|
    grasp the beyond|
    spirit drain|
    feral lobotomy|
    malleable spirit|
    ultimate argument of logic|
    as in the beginning|
    fangs of judgement|
    resist pain|
    scent of the true form|
    truth of gaia|
    call to duty|
    command the gathering|
    king of the beasts|
    strength of purpose|
    scent of the oathbreaker|
    sense balance|
    weak arm|
    wisdom of the ancient ways|
    roll over|
    scent of beyond|
    take the true form|
    geas|
    wall of granite|
    break the bonds|
    beast speech|
    call of the wyld|
    mindspeak|
    perfect recall|
    call of the wrym|
    distractions|
    dreamspeak|
    howls in the night|
    eye of the cobra|
    song of heroes|
    song of rage|
    song of the siren|
    bridge walker|
    gift of dreams|
    shadows by the firelight|
    fabric of the mind|
    head games|
    falling touch|
    inspiration|
    pack tactics|
    razor claws|
    spur claws|
    shield of rage|
    spirit of the fray|
    true fear|
    combat healing|
    heart of fury|
    silver claws|
    wind claws|
    clenched jaw|
    full moon's light|
    stoking fury's furnace|
    kiss of helios|
    strength of will|
    unstoppable warrior|
    breath of the wyld|
    man's skin|
    wyld resurgence|
    curse of aeolus|
    kali's tongue|
    kneel|
    coup de crace|
    heart claw|
    visceral agony|
    wings of pegasus|
    body wrack|
    wasp talons|
    gorgon's gaze|
    wyld warp|
    cooking|
    desperate strength|
    resist toxin|
    sweet scent of honey|
    trash is treasure|
    between the cracks|
    cornered rat ferocity|
    guise of the hand|
    odious_aroma|
    call the rust|
    gift of the skunk|
    gift of the termite|
    laugh of the hyena|
    attunement|
    blink|
    infest|
    riot|
    survivor|
    brother's scent|
    jam weapon|
    mercy|
    calm|
    grandmother's touch|
    luna's armor|
    para bellum|
    unicorn's arsenal|
    dazzle|
    lover's touch|
    spirit friend|
    serenity|
    strike the air|
    uncaught since the primal morn|
    halo of the sun|
    the living wood|
    faerie light|
    two tongues|
    glib tongue|
    flame dance|
    howl of the banshee|
    howl of the unseen|
    faerie kin|
    fair fortune|
    ley lines|
    balon's gaze|
    phantasm|
    call the hunt|
    fog on the moor|
    gift of the spriggan|
    lightening reflexes|
    visage of fenris|
    fangs of the north|
    halt the coward's flight|
    snarl of the predator|
    troll skin|
    might of thor|
    redirect pain|
    venom blood|
    heart of the mountain|
    hero's stand|
    endurance_of_heimdall|
    horde of valhalla|
    fenris' bite|
    call great fenris|
    control simple machine|
    diagnostics|
    plug and play|
    trick shot|
    cybersenses|
    sheng-cong's eyes|
    fu xi's honor|
    yao's commands|
    yu's endurance|
    huang di's sacrifice|
    hands full of thunder|
    power surge|
    steel fur|
    control complex machine|
    intrusion|
    electroshock|
    elemental favor|
    doppelganger|
    signal rider|
    tech speak|
    chaos machanics|
    summon net-spider|
    eye of the hunter|
    hidden killer|
    wolf at the door|
    beastmind|
    shadows of the impergium|
    elemental favor|
    render down|
    feed the pack|
    predator's many eyes|
    crocodile pact|
    territory|
    trackless waste|
    gorge|
    howl of death|
    quicksand|
    curse of lycaon|
    gaia's vengence|
    scabwalker curse|
    shield of gaia|
    aura of confidence|
    fatal flaw|
    seizing the edge|
    shadow weaving|
    whisper catching|
    clap of thunder|
    cold voice of reason|
    dream of a thousand cranes|
    fair path|
    storm winds slash|
    dark of night|
    living treasure|
    divine wind|
    song of the earth mother|
    direct the storm|
    icy chill of despair|
    paralyzing stare|
    shadow cutting|
    under the gun|
    open wounds|
    durance|
    strength of the dominator|
    obedience|
    shadow pack|
    heaven's guidence|
    silence|
    speed of thought|
    visions of duat|
    messenger's fortitude|
    tread sebek's back|
    adaptation|
    great leap|
    mark of the death-wolf|
    black mark:
    dam the heartflood|
    speed beyond thought|
    gate of the moon|
    reach the umbra|
    eye of the falcon|
    falcon's grasp|
    lambent flame|
    empathy|
    hand blade|
    unity of the pack|
    burning blade|
    talons of the falcon|
    warth of gaia|
    mastery|
    mindblock|
    sidestep death|
    luna's avenger|
    paws of the newborn cub|
    renew the cycle|
    balance|
    channeling|
    iron resolve|
    inner light|
    inner strength|
    resist temptation|
    surface attunement|
    wuxing|
    clarity|
    merciful blow|
    wind's returning favor|
    preternatural awareness|
    circular attack|
    harmonious unity of the emerald mother|
    wisdom of the seer|
    sense magic|
    shroud|
    spirit of the lizard|
    coils of the serpent|
    fetish fetch|
    shadows at dawn|
    spirit of the bird|
    spirit of the fish|
    banish totem|
    chains of the mist|
    invisibility|
    rending the craft|
    scrying|
    call elemental|
    hand of the earth lords|
    fetish doll|
    beat of the heart-drum|
    call the breeze|
    camouflage|
    ice echo|
    cutting wing|
    salmon swim|
    speak with wing spirits|
    blood of the north|
    bloody feast|
    sky running|
    call of the cannibal spirit|
    chill of the early frost|
    invoke the spirits of the storm|

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
&values.create_element [v(cdo)] = 1
&values.primal_anger [v(cdo)] = 1
&values.rat_head [v(cdo)] = 1
&values.sense_wyrm [v(cdo)] = 1
&values.shed [v(cdo)] = 1
&values.burrow [v(cdo)] = 2
&values.curse_of_hatred [v(cdo)] = 2
&values.form_mastery [v(cdo)] = 2
&values.sense_silver [v(cdo)] = 2
&values.chameleon [v(cdo)] = 3
&values.eyes_of_the_cat [v(cdo)] = 3
&values.chameleon [v(cdo)] = 3
&values.mental_speech [v(cdo)] = 3
&values.shell [v(cdo)] = 3
&values.gift_of_the_porcupine [v(cdo)] = 4
&values.lash_of_rage [v(cdo)] = 4
&values.rattler's_bite [v(cdo)] = 4
&values.wither_limb [v(cdo)] = 4
&values.maddness [v(cdo)] = 5
&values.protean_form [v(cdo)] = 5
&values.totem_gift [v(cdo)] = 5
&values.hare's_leap [v(cdo)] = 1
&values.heightened_senses [v(cdo)] = 1
&values.sense_prey [v(cdo)] = 1
&values.predator's_arsenal [v(cdo)] = 1
&values.prey_mind [v(cdo)] = 1
&values.axis_mundi [v(cdo)] = 2
&values.eye_of_the_eagle [v(cdo)] = 2
&values.name_the_spirit [v(cdo)] = 2
&values.scent_of_sight [v(cdo)] = 2
&values.catfeet [v(cdo)] = 3
&values.monkey_tail [v(cdo)] = 3
&values.sense_the_unnatural [v(cdo)] = 3
&values.silence_the_weaver [v(cdo)] = 3
&values.strength_of_gaia [v(cdo)] = 3
&values.beast_life [v(cdo)] = 4
&values.gnaw [v(cdo)] = 4
&values.scream_of_gaia [v(cdo)] = 4
&values.terror_of_the_dire [v(cdo)] = 4
&values.elemental_gift [v(cdo)] = 5
&values.song_of_the_great_beast [v(cdo)] = 5
&values.blur_of_the_milky_eye [v(cdo)] = 1
&values.infectious_laughter [v(cdo)] = 1
&values.liar's_face [v(cdo)] = 1
&values.open_seal [v(cdo)] = 1
&values.scent_of_running_water [v(cdo)] = 1
&values.blissful_ignorance [v(cdo)] = 2
&values.pulse_of_the_prey [v(cdo)] = 2
&values.spider's_song [v(cdo)] = 2
&values.taking_the_forgotten [v(cdo)] = 2
&values.gremlins [v(cdo)] = 3
&values.liar's_craft [v(cdo)] = 3
&values.monkey_tail [v(cdo)] = 3
&values.open_moon_bridge [v(cdo)] = 3
&values.pathfinder [v(cdo)] = 3
&values.luna's_blessing [v(cdo)] = 4
&values.umbral_dodge [v(cdo)] = 4
&values.whelp_body [v(cdo)] = 4
&values.thieving_talons_of_the_magpie [v(cdo)] = 5
&values.thousand_forms [v(cdo)] = 5
&values.firebringer [v(cdo)] = 6
&values.mother's_touch [v(cdo)] = 1
&values.spirit_snare [v(cdo)] = 1
&values.spirit_speech [v(cdo)] = 1
&values.umbral_tether [v(cdo)] = 1
&values.battle_mandala [v(cdo)] = 2
&values.command_spirit [v(cdo)] = 2
&values.sight_from_the_beyond [v(cdo)] = 2
&values.exorcism [v(cdo)] = 3
&values.pulse_of_the_invisible [v(cdo)] = 3
&values.umbral_camouflage [v(cdo)] = 3
&values.blurring_the_mirror [v(cdo)] = 4
&values.grasp_the_beyond [v(cdo)] = 4
&values.spirit_drain [v(cdo)] = 4
&values.feral_lobotomy [v(cdo)] = 5
&values.malleable_spirit [v(cdo)] = 5
&values.ultimate_argument_of_logic [v(cdo)] = 5
&values.as_in_the_beginning [v(cdo)] = 6
&values.fangs_of_judgement [v(cdo)] = 1
&values.resist_pain [v(cdo)] = 1
&values.scent_of_the_true_form [v(cdo)] = 1
&values.truth_of_gaia [v(cdo)] = 1
&values.call_to_duty [v(cdo)] = 2
&values.command_the_gathering [v(cdo)] = 2
&values.king_of_the_beasts [v(cdo)] =2
&values.strength_of_purpose [v(cdo)] = 2
&values.scent_of_the_oathbreaker [v(cdo)] = 3
&values.sense_balance [v(cdo)] = 3
&values.weak_arm [v(cdo)] = 3
&values.wisdom_of_the_ancient_ways [v(cdo)] = 3
&values.roll_over [v(cdo)] = 4
&values.scent_of_beyond [v(cdo)] = 4
&values.take_the_true_form [v(cdo)] = 4
&values.geas [v(cdo)] = 5
&values.wall_of_granite [v(cdo)] = 5
&values.break_the_bonds [v(cdo)] = 6
&values.beast_speech [v(cdo)] = 1
&values.call_of_the_wyld [v(cdo)] = 1
&values.mindspeak [v(cdo)] = 1
&values.perfect_recall [v(cdo)] = 1
&values.call_of_the_wrym [v(cdo)] = 2
&values.distractions [v(cdo)] = 2
&values.dreamspeak [v(cdo)] = 2
&values.howls_in_the_night [v(cdo)] = 2
&values.eye_of_the_cobra [v(cdo)] = 3
&values.song_of_heros [v(cdo)] = 3
&values.song_of_rage [v(cdo)] = 3
&values.song_of_the_siren [v(cdo)] = 3
&values.bridge_walker [v(cdo)] = 4
&values.gift_of_dreams [v(cdo)] = 4
&values.shadows_by_the_firelight [v(cdo)] = 4
&values.fabric_of_the_mind [v(cdo)]= 5
&values.head_games [v(cdo)] = 5
&values.falling_touch [v(cdo)] = 1
&values.inspiration [v(cdo)] = 1
&values.pack_tactics [v(cdo)] = 1
&values.razor_claws [v(cdo)] = 1
&values.spur_claws [v(cdo)] = 1
&values.shield_of_rage [v(cdo)] = 2
&values.spirit_of_the_fray [v(cdo)]= 2
&values.true_fear [v(cdo)] = 2
&values.combat_healing [v(cdo)] = 3
&values.heart_of_fury [v(cdo)] = 3
&values.silver_claws [v(cdo)] = 3
&values.wind_claws [v(cdo)] = 3
&values.clenched_jaw [v(cdo)] = 4
&values.full_moon's_light [v(cdo)] = 4
&values.stoking_fury's_furnace [v(cdo)] = 4
&values.kiss_of_helios [v(cdo)] = 5
&values.strength_of_will [v(cdo)] = 5
&values.unstoppable_warrior [v(cdo)] = 6
&values.breath_of_the_wyld [v(cdo)] = 1
&values.man's_skin [v(cdo)] = 1
&values.wyld_resurgence [v(cdo)] = 1
&values.curse_of_aeolus [v(cdo)] = 2
&values.kali's_tongue [v(cdo)] = 2
&values.kneel [v(cdo)] = 2
&values.coup_de_grace [v(cdo)] = 3
&values.heart_claw [v(cdo)] = 3
&values.visceral_agony [v(cdo)] = 3
&values.wings_of_pegasus [v(cdo)] = 3
&values.body_wrack [v(cdo)] = 4
&values.wasp_talons [v(cdo)] = 4
&values.gorgon's_gaze [v(cdo)] = 5
&values.wyld_warp [v(cdo)] = 5
&values.cooking [v(cdo)] = 1
&values.desperate_strength [v(cdo)] = 1
&values.resist_toxin [v(cdo)] = 1
&values.scent_of_sweet_honey [v(cdo)] = 1
&values.trash_is_treasure [v(cdo)] =1
&values.between_the_cracks [v(cdo)] = 2
&values.cornered_rat's_ferocity [v(cdo)] = 2
&values.guise_of_the_hound [v(cdo)] = 2
&values.odious_aroma [v(cdo)] = 2
&values.call_the_rust [v(cdo)] = 3
&values.gift_of_the_skunk [v(cdo)] = 3
&values.gift_of_the_termine [v(cdo)] = 3
&values.laugh_of_the_hyena [v(cdo)] = 3
&values.attunement [v(cdo)] = 4
&values.blink [v(cdo)] = 4
&values.infest [v(cdo)] = 4
&values.riot [v(cdo)] = 5
&values.survivor [v(cdo)] = 5
&values.brother's_scent [v(cdo)] = 1
&values.jam_weapon [v(cdo)] = 1
&values.mercy [v(cdo)] = 1
&values.calm [v(cdo)] =2
&values.grandmother's_touch [v(cdo)] = 2
&values.luna's_armor [v(cdo)] = 2
&values.para_bellum [v(cdo)] = 2
&values.unicorn's arsenal [v(cdo)] = 2
&values.dazzle [v(cdo)] = 3
&values.lover's_touch [v(cdo)] = 3
&values.spirit_friend [v(cdo)]  = 3
&values.serenity [v(cdo)] = 4
&values.strike_the_air [v(cdo)] = 4
&values.uncaught_since_the_primal_morn [v(cdo)] = 4
&values.halo_of_the_sun [v(cdo)] = 5
&values.the_living_wood [v(cdo)] = 5
&values.faerie_light [v(cdo)] = 1
&values.two_tongues [v(cdo)] = 1
&values.glib_tongue [v(cdo)] = 2
&values.flame_dance [v(cdo)] = 2
&values.howl_of_the_banshee [v(cdo)] = 2
&values.howl_of_the_unseen [v(cdo)] = 2
&values.faerie_kin [v(cdo)] = 3
&values.fair_fortune [v(cdo)] = 3
&values.ley_lines [v(cdo)] = 3
&values.balor's_gaze [v(cdo)] = 4
&values.phantasm [v(cdo)] = 4
&values.call_the_hunt [v(cdo)] = 5
&values.fog_on_the_moor [v(cdo)] = 5
&values.gift_of_the_spriggan [v(cdo)] = 5
&values.lightening_reflexes [v(cdo)] = 1
&values.visage_of_fenris [v(cdo)] = 1
&values.fangs_of_the_north [v(cdo)] = 2
&values.halt_the_coward's_flight [v(cdo)] = 2
&values.snarl_of_the_predator [v(cdo)] = 2
&values.troll_skin [v(cdo)] = 2
&values.might_of_thor [v(cdo)] = 3
&values.redirect_pain [v(cdo)] = 3
&values.venom_blood [v(cdo)] = 3
&values.heart_of_the_mountain [v(cdo)] = 4
&values.hero's_stand [v(cdo)] = 4
&values.endurance_of_heimdall [v(cdo)] = 5
&values.horde_of_valhalla [v(cdo)] = 5
&values.fenris'_bite [v(cdo)] = 5
&values.call_great_fenris [v(cdo)] = 6
&values.control_simple_machine [v(cdo)] = 1
&values.diagnostics [v(cdo)] = 1
&values.plug_and_play [v(cdo)] = 1
&values.trick_shot [v(cdo)] = 1
&values.cybersenses [v(cdo)] - 2
&values.sheng-cong's_eyes [v(cdo)] = 1
&values.fu_xi's_honor [v(cdo)] = 2
&values.yao's_commands [v(cdo)] = 3
&values.yu's_endurance [v(cdo)] = 4
&values.huang_di's_sacrifice [v(cdo)] = 5
&values.hands_full_of_thunder [v(cdo)] = 2 
&values.power_surge [v(cdo)] = 2
&values.steel_fur [v(cdo)] = 2
&values.control_complex_machine [v(cdo)] = 3
&values.intrusion [v(cdo)]= 3
&values.electroshock [v(cdo)] = 3
&values.elemental_favor [v(cdo)] = 3
&values.doppelganger [v(cdo)] = 4
&values.signal_rider [v(cdo)]= 4
&values.tech_speak [v(cdo)] = 4
&values.chaos_mechanics [v(cdo)] = 5
&values.summon_net-spider [v(cdo)] = 5
&values.eye_of_the_hunter [v(cdo)] = 1
&values.hidden_killer [v(cdo)] = 1
&values.wolf_at_the_door [v(cdo)] = 1
&values.beastmind [v(cdo)] = 2
&values.shadows_of_the_impergium [v(cdo)] = 2
&values.elemental_favor [v(cdo)] = 3
&values.render_down [v(cdo)] = 3
&values.feed_the_pack [v(cdo)] = 2
&values.predator's_many_eyes [v(cdo)] = 3
&values.crocodile_pact [v(cdo)] = 5
&values.territory [v(cdo)] = 3
&values.trackless_waste [v(cdo)] = 3
&values.gorge [v(cdo)] = 4
&values.howl_of_death [v(cdo)] = 4
&values.quicksand [v(cdo)] = 4
&values.curse_of_lycaon [v(cdo)] = 5
&values.scabwalker_curse [v(cdo)] = 5
&values.shield_of_gaia [v(cdo)] = 6
&values.aura_of_confidence [v(cdo)] = 1
&values.fatal_flaw [v(cdo)] = 1
&values.seizing_the_edge [v(cdo)] = 1
&values.shadow_weaving [v(cdo)] = 1
&values.whisper_catching [v(cdo)] = 1
&values.clap_of_thunder [v(cdo)] = 2
&values.cold_voice_of_reason [v(cdo)]= 2
&values.dreams_of_a_thousand_cranes [v(cdo)] = 1
&values.fair_path [v(cdo)] = 1
&values.storm_winds_slash [v(cdo)] = 2
&values.dark_of_the_night [v(cdo)] = 3
&values.living_treasure [v(cdo)] = 4
&values.divine_winds [v(cdo)] = 5
&values.song_of_the_earth [v(cdo)] = 2
&values.direct_the_storm [v(cdo)] = 3
&values.icy_chill_of_despair [v(cdo)] = 3
&values.paralyzing_stare [v(cdo)] = 3
&values.shadow_cutting [v(cdo)] = 3
&values.under_the_gun [v(cdo)] = 3
&values.open_wounds [v(cdo)] = 4
&values.durance [v(cdo)] = 4
&values.strength_of_the_dominator [v(cdo)] = 4
&values.obedience [v(cdo)] = 5
&values.shadow_pack [v(cdo)] = 5
&values.heavens'_guidance [v(cdo)] = 1
&values.silence [v(cdo)] = 1
&values.speed_of_thought [v(cdo)] = 1
&Values.visions_of_duat [v(cdo)] = 1
&values.messenger's_fortitude [v(cdo)] = 2
&values.tread_sebek's_back [v(cdo)] = 2
&values.adaptation [v(cdo)] = 3
&values.great_leap [v(cdo)] = 3
&values.mark_of_the_Death-wolf [v(cdo)] = 3
&values.black_mark [v(cdo)] = 4
&values.damn_the_heartflood [v(cdo)] = 4
&values.speed_beyond_thought [v(cdo)] = 4
&values.gate_of_the_moon [v(cdo)] = 5
&values.reach_the_umbra [v(cdo)] = 5
&values.eye_of_the_falcon [v(cdo)] = 1
&values.falcon'sgrasp [v(cdo)] = 1
&values.lambent_flame [v(cdo)] = 1
&values.empathy [v(cdo)] = 2
&values.hand_blade [v(cdo)] = 2
&values.unity_of_the_pack [v(cdo)] = 2
&values.burning_blade [v(cdo)] = 3
&values.talons_of_the_falcon [v(cdo)] = 3
&values.wrath_of_gaia [v(cdo)] = 3
&values.mastery [v(cdo)] = 4
&values.mindblock [v(cdo)] = 4
&values.sidestep_death [v(cdo)] = 4
&values.luna's_avenger [v(cdo)] = 5
&values.paws_of_the_newborn_cub [v(cdo)] = 5
&values.renew_the_cycle [v(cdo)] = 6
&values.balance [v(cdo)] = 1
&values.channeling [v(cdo)] = 1
&values.iron_resolve [v(cdo)] = 1
&values.inner_light [v(cdo)] = 2
&values.inner_strength [v(cdo)] = 2
&values.resist_temptation [v(cdo)] = 2
&values.surface_attunement [v(cdo)] = 2
&values.wuxing [v(cdo)] = 2
&values.clarity [v(cdo)]= 3
&values.merciful_blow [v(cdo)] = 3
&values.wind's_returning_favor [v(cdo)] = 3
&values.preternatural_awareness [v(cdo)] = 4
&values.circular_attack [v(cdo)] = 5
&values.harmonious_unity_of_the_emerald_mother [v(cdo)] = 5
&values.wisdom_of_the_seer [v(cdo)] = 5
&values.sense_magic [v(cdo)] = 1
&values.shroud [v(cdo)] =1
&values.sprit_of_the_lizard [v(cdo)] = 1
&values.coils_of_the_serpent [v(cdo)] = 2
&values.fetish_fetch [v(cdo)] = 2
&values.shadows_at_dawn [v(cdo)] = 1
&values.spirit_of_the_bird [v(cdo)] = 2
&values.spirit_of_the_fish [v(cdo)] = 2
&values.banish_totem [v(cdo)] = 3
&values.chains_of_the_mist [v(cdo)] = 3
&values.invisibility [v(cdo)] = 3
&values.rending_the_Craft [v(cdo)] = 3
&values.scrying [v(cdo)] = 3
&values.call_elemental [v(cdo)] = 4
&values.hand_of_the_earth [v(cdo)] = 4
&values.fetish_doll [v(cdo)] = 5
&values.beat_of_the_heart-drum [v(cdo)] = 1
&values.call_the_breeze [v(cdo)] = 1
&values.camouflage [v(cdo)] = 1
&values.ice_each [v(cdo)] = 1
&values.cutting_wind [v(cdo)] = 2
&values.salmon_swim [v(cdo)] = 2
&values.speak_with_wind_spirits [v(cdo)] = 2
&values.blood_of_the_north [v(cdo)] = 3
&values.bloody_feast [v(cdo)] = 3
&values.sky_running [v(cdo)] = 3
&values.call_of_the_cannibal_spirit [v(cdo)] = 4
&values.chill_of_early_frost [v(cdo)] = 4
&values.invoke_the_spirts_of_the_storm [v(cdo)] = 5

&list.rites [v(cdo)] =
    rite of cleansing|
    rite of contrition|
    rite of renunciation|
    rite of the loyal pack|
    enchant the forest|
    rite of the opened sky|
    moot rite|
    rite of the opened caern|
    rite of the glorious past|
    the badger's burrow|
    rite of the opened bridge|
    rite of the shrouded glen|
    rite of the caern building|
    gathering for the departed|
    last blessing|
    rite of the winter wolf|
    baptism of fire|
    rite of binding|
    rite of growth|
    rite of heritage|
    rite of the cardboard palace|
    rite of the questing stone|
    rite of talisman dedication|
    rite of becoming|
    rite of spirit awakening|
    rite of summoning|
    rite of sacred rebirth|
    descent into the underworld|
    rite of the fetish|
    rite of the totem|
    rite of the jackdaw|
    rite of ostracism|
    stone of scorn|
    voice of the jackal|
    the hunt|
    rite of the omega wolf|
    satire rite|
    the rending of the veil|
    gaia's vengeful teeth|
    rite of boasting|
    rite of wounding|
    rite of accomplishment|
    rite of passage|
    rite of praise|
    rite of the winter winds|
    rite of reawakening|
    the great hunt|
    the long vigil|
    bone rhythms|
    breath of gaia|
    greet the moon|
    greet the sun|
    hunting prayer|
    prayer for the prey|

&lock.rites [v(cdo)] = u(.is, %0, garou)
&values.rite_of_cleansing [v(cdo)] = 1
&values.rite_of_contrition [v(cdo)] = 1
&values.rite_of_renunciaition [v(cdo)] = 1
&values.rite_of_the_loyal_pack [v(cdo)] = 3
&values.enchant_the_forest [v(cdo)] = 4
&values.rite_of_the_opened_sky [v(cdo)] = 4
&values.moot_rite [v(cdo)] = 1
&values.rite_of_the_opened_caern [v(cdo)] = 1
&values.rite_of_the_glorious_past [v(cdo)] = 3
&values.the_badger's_burrow [v(cdo)] = 4
&values.rite_of_the_opened_bridge [v(cdo)] = 4
&values.rite_of_the_shrouded_glen [v(cdo)] = 4
&values.rite_of_the_caern_building [v(cdo)] = 5
&values.gathering_for_the_departed [v(cdo)] = 1
&values.last_blessing [v(cdo)] = 1
&values.rite_of_the_winter_wolf [v(cdo)] = 3
&values.baptism_of_fire [v(cdo)] = 1
&values.rite_of_binding [v(cdo)] = 1
&values.rite_of_growth [v(cdo)] = 1
&values.rite_of_heritage [v(cdo)] = 1
&values.rite_of_the_cardboard_palace [v(cdo)] = 1
&values.rite_of_the_questing_stone [v(cdo)] = 1
&values.rite_of_talisman_dedication [v(cdo)] = 1
&values.rite_of_becoming [v(cdo)] = 2
&values.rite_of_spirit_awakening [v(cdo)] = 2
&values.rite_of_summoning [v(cdo)] = 2
&values.rite_of_rebirth [v(cdo)] = 5
&values.descent_into_the_underworld [v(cdo)] = 3
&values.rite_of_the_fetish [v(cdo)] = 3
&values.rite_of_the_totem [v(cdo)] = 3
&values.rite_of_the_jackdaw [v(cdo)] = 1
&values.rite_of_ostracism [v(cdo)] = 2
&values.stone_of_scorn [v(cdo)] = 2
&values.voice_of_the_jackal [v(cdo)] = 2
&values.the_hunt [v(cdo)] = 3
&values.rite_of_the_omega_wolf [v(cdo)] = 3
&values.satire_rite [v(cdo)] = 3
&values.the_rending_of_the_veil [v(cdo)] = 4
&values.gaia's_vengeful_teeth [v(cdo)] = 5
&values.rite_of_boasting [v(cdo)] = 1
&values.rite_of_wounding [v(cdo)] = 1
&values.rite_of_accomplishment [v(cdo)] = 2
&values.rite_of_passage [v(cdo)] = 2
&values.rite_of_praise [v(cdo)] = 2
&values.rite_of_the_winter_winds [v(cdo)] = 2
&values.rite_of_reawakening [v(cdo)] = 2
&values.the_great_hunt [v(cdo)] = 2
&values.the_long_vigil [v(cdo)] = 3
&values.bone_rhythms [v(cdo)] = 1
&values.breath_of_gaia [v(cdo)] = 1
&values.greet_the_moon [v(cdo)] = 1
&values.greet_the_sun [v(cdo)] = 1
&values.hunting_prayer [v(cdo)] = 1
&values.prayer_for_the_prey [v(cdo)] = 1
