@Startup [v(cfo)]=
    @dolist lattr( %!/ufunc.* )=
        @function/preserve [rest( ##, . )]=%!/##;
    @dolist lattr( %!/ufunc/privileged.* )=
        @function/preserve/privileged [rest( ##, . )]=%!/##

/*
=============================================================================
===== FN.SETSTAT ============================================================

    This function sets the value of a system stst on a character.

    %0 - The character to set the stat on.
    %1 - The stat to set.
    %2 - The value to set the stat to.

    returns - The value of the stat.
=============================================================================
*/

&fn.setstat [v(cfo)] = [set(%0. [statname(%0, %1)]: %2 )]
&ufunc.setstat [v(cfo)] = ulocal(#16/fn.setstat, %0, %1, %2)
    
/*
=============================================================================
===== FN.GETSTAT ============================================================

    This function returns the value of a system stst on a character.

    %0 - The character to get the stat from.
    %1 - The stat to get.

    returns - The value of the stat.
=============================================================================
*/
&fn.getstat [v(cfo)] = 
    trim(
        [setq(0, statname(%0, %1))] // Get the name and attribute string.
        [setq(1, extract(%q0, 2, 1, .))] // The attribute string.
        [setq(2, extract(%q0, 3, 1, .))] // The stat name.
        [setq(3, first(filter( filter.temp, lattr(%0/*[edit(%1,%b,_)]*) )))]
        [setq(4, 
            if(
                hasattr(%va, default.%q1), 
                get(%va/default.%q1),
                if(
                    hasattr(%va, default.%q2),
                    get(%va/default.%q2)         
                )
            )
        )]
        [if(
        get(%0/%q3),
            get(%0/%q3),
            %q4
        )]
        
    )

&ufunc.getstat [v(cfo)] = ulocal(#16/fn.getstat, %0, %1)


/*
=============================================================================
===== FN.GETTEMPSTAT ========================================================

    This function returns the value of a system stst on a character.

    %0 - The character to get the stat from.
    %1 - The stat to get.

    returns - The value of the stat.
=============================================================================
*/

&fn.gettempstat [v(cfo)] = 
    trim(
        [setq(0, statname(%0, %1))] // Get the name and attribute string.
        [setq(1, extract(%q0, 2, 1, .))] // The attribute string.
        [setq(2, extract(%q0, 3, 1, .))] // The stat name.
        [setq(3, first(filter( filter.not-temp, lattr(%0/*[edit(%1,%b,_)]*) )))]
        [setq(4, 
            if(
                hasattr(%va, default.%q1), 
                get(%va/default.%q1),
                if(
                    hasattr(%va, default.%q2),
                    get(%va/default.%q2)         
                )
            )
        )]

        [if(
        get(%0/%q3),
            get(%0/%q3),
            %q4
        )]
    )

&ufunc.gettempstat [v(cfo)] = ulocal(#16/fn.gettempstat, %0, %1)


/*
=============================================================================
===== FN.STATNAME ===========================================================

    This function returns the name of a stat based on the input.

    %0 - the dbref of the character.
    %1 - the name of the stat.

    returns - <stat_attr_string>~<stat_name>
    
    example u(fn.statname, *kumakun, str) - "LIST.ATTRIBUTES~strength"

=============================================================================
*/

&fn.statname [v(cfo)] = 
    first(
        iter(
            lattr(%va/LIST.* ),
            if( 
                words(
                    setr( 0, 
                        grab(   
                            
                            get(%va/list.[after(##,.)]) , %1*, |
                        )
                    )
                ),
                ##.[edit(%q0,%b,_)]
            )
        )
    )
    

// tutn it into a golbal.
&ufunc.statname [v(cfo)] = ulocal(#16/fn.statname, %0, %1)

/*
=============================================================================
===== FN.LOCK ===============================================================

    This function checks to see if a character has a lock on a stat.

    %0 - The character to check.
    %1 - The stat to check.

    returns - 1 if the character has the lock, 0 if not.
=============================================================================
*/

&fn.lock [v(cfo)] =
    if(
        hasattr(%va, lock.%0),
        u(%va/lock.%0, %1),
         1
    )
/*
##########################################################################
##### FILTERS ############################################################
*/

&fn.filter.lock [v(cfo)] = filter( me/filter.lock, %1, |, |, %0 )
&filter.lock [v(cfo)] = u(fn.lock, %0, %1)

&filter.temp [v(cfo)] = u(fn.temp, %0 )
&filter.not-temp [v(cfo)] = u(fn.not-temp, %0 )

&fn.temp [v(cfo)] = not(strmatch(%0, *.TEMP))
&fn.not-temp [v(cfo)] = strmatch(%0, *.TEMP)

&fn.exists [v(cfo)] = gt(words(%0),0)
&filter.exists [v(cfo)] = u(fn.exists, %0)  


&fn.header [v(cfo)] = [center( %0, if(%1, %1,width(%#)), if(%2, %2, =))]
&ufunc.header [v(cfo)] = u(#16/fn.header, %0, %1, %2)


&filter.success [v(cfo)] = gte(%0, %1)


/*
=============================================================================
===== FN.FORMAT =============================================================

    This function formats three lists into columns.

    %0 - The character to get the stats from.
    %1 - The first list of stats.
    %2 - The second list of stats.
    %3 - The third list of stats.
    %4 - The column headers. (optional)

    returns - The formatted string.
=============================================================================
*/

&fn.3cols [v(cfo)] = 
    [trim(
        [setq(0, sub(div(width(%#),3),3))] // the width tof the first and third cols.
        // (width - (col * 2)) - 4
        [setq(1, sub(sub(width(%#), mul(%q0,2)), 6)  )] // the width of the second col.
        
    )]
    [if(
        %4,
        %b[header(%b%cy[extract(%4,1,1,|)]%cn%b, %q0, %cr-%cn)]%b
        %b[header(%b%cy[extract(%4,2,1,|)]%cn%b, %q1, %cr-%cn)]%b
        %b[header(%b%cy[extract(%4,3,1,|)]%cn%b, %q0, %cr-%cn)]%b
    )]


    // check each tp see if there are any sub-stats that need to be added to the list.
    [setq( 3,
        iter( %1,
            ##[iter(
                filter( filter.temp, lattr(%0/_[edit(##,%b,_)].*)),
                 |[itext(0)],,|
            )], |, |
        )
    )]
    [setq( 4,
        iter( %2,
            ##[iter(
                filter( filter.temp, lattr(%0/_[edit(##,%b,_)].*)),
                 |[itext(0)],,|
            )], |, |
        )
    )]
    [setq( 5,
        iter( %3,
            ##[iter(
                filter( filter.temp, lattr(%0/_[edit(##,%b,_)].*)),
                 |[itext(0)],,|
            )], |, |
        )
    )]


    [setq(2, max(words(%q3,|), words(%2,|), words(%3,|)))]

    [iter(
        lnum(1, %q2),
        %r[if(
            words(extract(%q3, ##, 1, |)),
            %b[u(fn.format, %0, extract(%q3, ##, 1, |),%q0)]%b,
            %b[space(%q0)]%b
        )]
        [if(
            words(extract(%q4, ##, 1, |)),
            %b[u(fn.format, %0, extract(%q4, ##, 1, |),%q1)]%b,
            %b[space(%q1)]%b
        )]
        [if(
            words(extract(%q5, ##, 1, |)),
            %b[u(fn.format, %0, extract(%q5, ##, 1, |),%q0)],
            %b[space(%q0)]%b
        )]
    )]



/*
=============================================================================
===== FN.SHEET.BIO ==========================================================

    This function returns the bio of a character.

    %0 - The character to get the bio from.

    returns - A string of the bio.
=============================================================================
*/

&fn.format [v(cfo)] = 
     [ljust(

        // captialize the first letter of  each word
        [iter(%1, 
            if(
                strmatch(##, _*),
                [space(5)][capstr(lcstr(after(##,.)))],
                if(getstat(%0, %1),
                    %ch[capstr(edit(##,_,%b))]%cn,
                    ansi(hx,[capstr(edit(##,_,%b))])
                )
            )
        )],
        // was a width provided?
        sub(if(%2, %2, 26), strlen(u(fn.getfullstat,%0,edit(%1,_,%b)))), 
        // filler     
        if(%3, %3, %ch%cx.%cn)
    )]
    [if(
        getstat(%0, %1),
        [u(fn.getfullstat, %0, edit(%1,_,%b))],
        ansi(hx,[u(fn.getfullstat, %0, edit(%1,_,%b))])
    )]


/*
=============================================================================
===== FN.GETFULLSTAT ========================================================

    This function returns the full stat string for a character.

    %0 - The character to get the stat from.
    %1 - The stat to get.

    returns - The full stat string.
=============================================================================
*/
&fn.getfullstat [v(cfo)] =
        [if( 
           or(
                eq( 
                    getstat(%0, %1), 
                    gettempstat(%0, %1)
                ),
                strmatch( 
                    getstat(%0, %1), 
                    gettempstat(%0, %1)
                )
           ),
            iter(getstat(%0, %1), capstr(##)),
            [getstat(%0, %1)]%([gettempstat(%0, %1)]%)
        )]


/*
=============================================================================
===== FN.SHEET.BIO ==========================================================

    This function returns the bio of a character.

    %0 - The character to get the bio from.

    returns - A string of the bio.
=============================================================================
*/

&fn.sheet.bio [v(cfo)] = 
    [trim(
        [setq(z,)]
        [iter( lattr(%va/list.bio*),setq(z, setunion(%qz,[get(%va/##)],|,|) ))]
    )]
   
    [[header(%cr%[%b%cyBio%cn%cr%b%]%cn,,%cr=%cn)]]%r
    [table(
            [iter(
            [ulocal(fn.filter.lock, %0,  [trim(%qz,,|)] )] ,
            %b[ulocal(fn.format, %0, ##, sub(div(width(%#),2),2) )]%b,|,|
        )], sub(div(width(%#),2),1), width(%#), |
    )]

/*
=============================================================================
===== FN.SHEET.ATTRIBUTES ===================================================

    This function returns the attributes of a character.

    %0 - The character to get the attributes from.

    returns - A string of the attributes.
=============================================================================
*/
&fn.sheet.attributes [v(cfo)] = 
    [[header(%cr%[%b%cyAttributes%cn%cr%b%]%cn,,%cr=%cn)]]%r
    [u(  fn.3cols, 
        %0,
        strength|dexterity|stamina,
        charisma|manipulation|appearance,
        perception|intelligence|wits,
        Pyhsical|Social|Mental 
    )]

/*
=============================================================================
===== FN.SHEET.ABILITIES ====================================================

    This function returns the abilities of a character.

    %0 - The character to get the abilities from.

    returns - A string of the abilities.
=============================================================================
*/

&fn.sheet.abilities [v(cfo)] = 
    [trim(
        [setq(0, sub(div(width(%#),3),3))] // the width tof the first and third cols.
        // (width - (col * 2)) - 4
        [setq(1, sub(sub(width(%#), mul(%q0,2)), 6)   )] // the width of the second col.
        [setq(2, max(words(%1,|), words(%2,|), words(%3,|)))]
    )]
    
    // make the TALEMTS list.  First filter out any talents that don't apply.
    [setq(
        3,
        filter(filter.exists, iter(
            u(fn.combine, lattr(%va/LIST.TALENTS)),
            [u(fn.filter.lock, %0, edit(##,%b,_))],|,|
        ),|,|)
    )]
    [setq(
        4,
        filter( filter.exists, iter(
            get(%va/LIST.SKILLS),
            [u(fn.filter.lock, %0, edit(##,%b,_))],|,|
        ),|,|)
    )]
    [setq(
        5,
        filter( filter.exists, iter(
            get(%va/LIST.KNOWLEDGES),
            [u(fn.filter.lock, %0, edit(##,%b,_))],|,|
        ), |, |)
    )]

    [header(%cr%[%b%cyAbilities%cn%cr%b%]%cn,,%cr=%cn)]%r
    [u( fn.3cols, 
        %0,
        %q3,%q4,%q5,
        Talents|Skills|Knowledges
    )]


&fn.combine [v(cfo)] = trim(sort(squish(trim(iter(%0, [trim([get(%va/##)])]|,,)|)),,|),,|)


/*
=============================================================================
===== FN.SHEET.ADVANTAGES ===================================================

    This function returns the advantages of a character.

    %0 - The character to get the advantages from.

    returns - A string of the advantages.
=============================================================================
*/
&fn.sheet.advantages [v(cfo)] =  
    [setq(0,
        iter(
             filter( filter.temp, lattr(%0/_BACKGROUNDS*)),
            after(lcstr(##),.),,|
        )
    )]
    [setq(1,
        iter(
             filter( filter.temp, lattr(%0/_MERITS*)),
            after(lcstr(##),.),,|
        )
    )]
    [setq(2,
        iter(
             filter( filter.temp, lattr(%0/_FLAWS*)),
            after(lcstr(##),.),,|
        )
    )]
    [header(%cr%[%b%cyAdvantages%cn%cr%b%]%cn,,%cr=%cn)]%r
    
    [u( fn.3cols, 
        %0,
        %q0, %q1,%q2,
        Backgrounds|Merits|Flaws
    )]

/*
=============================================================================
===== FN.SHEET.POWERS.WEREWOLF ==============================================

    This function returns the werewolf powers of a character.

    %0 - The character to get the powers from.

    returns - A string of the powers.
=============================================================================
*/

&fn.sheet.powers.werewolf [v(cfo)] = 
    [setq(0,
        iter(
             filter( filter.temp, lattr(%0/_GIFTS.*)),
            after(lcstr(##),.),,|
        )
    )]
    [setq(1,
        iter(
             filter( filter.temp, lattr(%0/_RITES.*)),
            after(lcstr(##),.),,|
        )
    )]
    [header(%cr%[%b%cyPowers%cn%cr%b%]%cn,,%cr=%cn)]%r
    [u( fn.3cols, 
        %0,
        %q0, %q1,glory|honor|wisdom,
        Gifts|Rites|Renown
    )]

/*
=============================================================================
===== FN.SHEET.POOLS ========================================================

    This function returns the pools of a character.

    %0 - The character to get the pools from.

    returns - A string of the pools.
=============================================================================
*/

&fn.sheet.pools [v(cfo)] =
    [setq(0,
        iter(
             filter( filter.temp, lattr(%0/_POOLS.*)),
            after(lcstr(##),.),,|
        )
    )]
    [header(%cr%[%b%cyPools%cn%cr%b%]%cn,,%cr=%cn)]
    [u( fn.3cols, 
        %0,
        ,%q0,
    )]

/*
=============================================================================
===== FN.SHEET ==============================================================
    This function returns the character sheet for a character.

    %0 - The character to get the sheet for.

    returns - A string of the character sheet.
=============================================================================
*/

&fn.sheet [v(cfo)] = 
    header(%cr%[%b%cyCharacter Sheet for %cn[moniker(%0)]%cr%b%]%cn,,%cr=%cn)%r
    [ulocal(fn.sheet.bio, %0)]%r
    [ulocal(fn.sheet.attributes, %0)]%r
    [ulocal(fn.sheet.abilities, %0)]%r
    [if( or( words(lattr(%0/_BACKGROUNDS*)), words(lattr(%0/_MERITS*)),words(lattr(%0/_FLAWS*))), [ulocal(fn.sheet.advantages, %0)]%r,)]
    [if( or(words(lattr(%0/_GIFTS*)),words(lattr(%0/_RITES*)), getstat(%0, glory), getstat(%0, honor), getstat(%o, wisdom)), [ulocal(fn.sheet.powers.werewolf, %0)]%r,)]
    [u(fn.sheet.pools, %0)]%r
    [repeat(%cr=%cn, width(%#))]
    [if(
        not( hasattr(%0, _approved) ),
        %r[center(%cr%[%b%cyThis sheet has not been approved yet.%cn%cr%b%]%cn, width(%#), %cr=%cn)]%r
        [repeat(%cr=%cn, width(%#))]

    )]

/*
=============================================================================
===== FN.IDLECOLOR ==========================================================

    This function returns the idle color for a character.

    %0 - The seconds to colorize.

    returns - The idle in color.
=============================================================================
*/

&fn.idlecolor [v(cfo)] = 
    switch(1,
        lte(%0, 60), %ch%cg[singletime(%0)]%cn,
        lte(%0 , 120), %ch%cg[singletime(%0)]%cn,
        lte(%0, 300), %ch%cy[singletime(%0)]%cn,
        lte(%0, 900), %cr[singletime(%0)]%cn,
        lte(%0, 1200), %cr[singletime(%0)]%cn,
        %ch%cx[singletime(%0)]%cn
    )

&ufunc/privileged.idlecolor [v(cfo)] = u(#16/fn.idlecolor, %0)
