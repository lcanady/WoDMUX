/*
=============================================================================
===== FN.ROLL ===============================================================
    This function rolls a number of dice and returns the results.

    %0 - The character to roll for.
    %1 - The stats to roll.
    %2 - hunger dice.
    %3 - Whether or not the roll is permanent.

    %q0 - The edited stats
    %q1 - The sum of the stats.
    %q2 - The sorted dice results.
    %q3 - The colored dice results.
    %q4 - The successes.
    %q5 - The edited stat names.
    %q6 - The botches.

    returns - The results of the roll.
=============================================================================
*/

&fn.roll [v(cfo)] = 
    trim(
        
        [setq(0, edit( edit(%1, +, %b+), -, %b-))]
        [setq(1, 
            ladd(
                iter(
                    %q0, 
                    [if( isnum(##), ##, if(%3, getstat(%0, ##), gettempstat(%0, ##)))]
                )
            )
        )]
        // Subtract hunger dice
        [setq(2, revwords( sort(iter( lnum(sub(%q1, %2)), die(1,10) ))))]
        // roll  hunger dice
        [setq(8, 
            revwords( sort(
                iter( 
                    if(gte(%q1, %2), %2, %q1),
                    die(1, 10) 
                )
            ))
        )]
        [setq(
            3, 
            iter(%q2, 
                switch( 1,
                    gte(##, 6), %ch%cg[##]%cn,                    
                    %ch%cy[##]%cn
                )
            )    
        )]
        // color hunger dice
        [setq(h,
            iter( %q8, 
                switch( 1,
                    eq(##, 10), %ch%cr[##]%cn,
                    gte(##, 6), %ch%cg[##]%cn,
                     eq(##, 1), %cr[##]%cn,
                    %ch%cy[##]%cn
                )
            )    
        )]

        [setq(4, words(iter(%q2 %q8, if(gte(##,6), ##))))]
        [setq(5, 
            iter(%q0, 
                if(
                    words(setr(6,statname(%1, ##))), 
                    %ch[capstr(lcstr(last(%q6, .)))]%cn, 
                    if(isnum(##),%ch##%cn,##) 
                )
            )
        )]
        [setq(6, words(iter(%q2, if(eq(##,1), ##))))]
           
        // first we figure out the number of 10s (criticals). %c
        [setq(
            c,
            ladd(
                iter(
                    %q2 %q8, 
                    if(eq(##, 10), 1)
                )
            )
        )]

        // successes %qs minus criticals
        [setq(s, %q4)]
        [setq(e, div(%qc, 2))]
        // total.
        [setq(t, 
            if(
                %qe,
                add(%qs, mul(%qe, 2)),
                %qs
            )
        
        )]
        
        %crROLL[if(%3,/PERM)]>%cn [moniker(%#)] rolls [squish(edit(edit(%q5, -, %b-%b), +, %b+%b))]  => 
        %(
            [switch(1,
                eq(%qt, 0), %ch%cy0%cn,
                lt(%qt, 0), %ch%cr%qt%cn,
                %ch%cg%qt%cn 
            )]
            
        %) 
        [switch(1,
            eq(%qt,1), success,
            gt(%qt,1), successes,
            eq(%qt,0), successes %(%ch%cyfailure%cn%),
            successes %(%ch%crbotch%cn%) 
        )] %([sort(%q3 %qh)]%) 
    )

/*
=============================================================================
===== CMD.ROLL ==============================================================
    This command rolls a stat against a target number.

    USAGE:
        +roll[\perm] <stat or #>[[+\-]<stat or #>] [vs <difficulty>]

=============================================================================
*/

&cmd.roll [v(cco)] = $[\+@]?roll(\/perm)?\s+(.*):

    @assert hasattr(%#, __accept) = {
        @pemit %#=You must accept the terms of service before you can roll.
    };

    @remit loc(%#) = ulocal(%vb/fn.roll, %#, %2, getstat(%#, hunger), %1);
@set [v(cco)]/cmd.roll = reg


/*
=============================================================================
===== CMD.ROLL.JOB ==========================================================
    This command rolls a stat against a target number.

    USAGE:
        +roll/job[/<perm>]  <job#> = <dice> [vs <difficulty>]

=============================================================================
*/
&cmd.roll/job [v(cco)] = $[\+@]?roll\/job(\/perm)?\s+(.*)\s*=\s*(.*):
    [setq(0, before(%3, vs))]
    [setq(1, after(%3, vs))]
    [setq(2, ulocal(%vb/fn.roll, %#, %q0, %q1, %1))];
   
    @fo %# = {+job/add %2 = %r%q2;};

@set [v(cco)]/cmd.roll/job = reg