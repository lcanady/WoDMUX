/*
=============================================================================
===== FN.ROLL ===============================================================
    This function rolls a number of dice and returns the results.

    %0 - The character to roll for.
    %1 - The stats to roll.
    %2 - The difficulty of the roll.
    %3 - Whether or not the roll is permanent.

    returns - The results of the roll.
=============================================================================
*/

&fn.roll [v(cfo)] = 
    trim(
        [setq(8, if(%2, trim(%2), 6))]
        [setq(0, edit( edit(%1, +, %b+%b), -, %b-%b))]
        [setq(1, 
            ladd(
                iter(
                    %q0, 
                    [if( isnum(##), ##, if(%3, getstat(%0, ##), gettempstat(%0, ##)))]
                )
            )
        )]
        [setq(2, revwords( sort(iter( lnum(%q1), die(1,10) ))))]
        [setq(
            3, 
            iter(%q2, 
                switch( 1,
                    gte(##, %q8), %ch%cg[##]%cn,
                    eq(##, 1),   %ch%cr[##]%cn,
                    %ch%cy[##]%cn
                )
            )    
        )]
        [setq(4, words(iter(%q2, if(gte(##,%q8), ##))))]
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
        [setq(7, sub(%q4, %q6))]
        
        %chROLL[if(%3,/PERM)]>>%cn [moniker(%#)] rolls %q5 vs %ch[%q8]%cn => 
        %(
            [switch(1,
                eq(%q7, 0), %ch%cy0%cn,
                lt(%q7, 0), %ch%cr%q7%cn,
                %ch%cg%q7%cn 
            )]
            
        %) 
            [switch(1,
                eq(%q7,1), success,
                gt(%q7,1), successes,
                eq(%q7,0), successes %(%ch%cyfailure%cn%),
                successes %(%ch%crbotch%cn%)
            )] %(%q3%)
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
    [setq(0, before(%2, vs))]
    [setq(1, after(%2, vs))];
    @pemit %#= ulocal(%vb/fn.roll, %#, %q0, %q1, %1);
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