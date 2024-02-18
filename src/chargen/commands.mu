/*
=============================================================================
===== CMD.SET ===============================================================
    This command sets the value of a system stat on a character.

    USAGE:
        +stat[/<tem>] [<target>/]<stat> = [+|-]<value>
=============================================================================
*/

&cmd.set [v(cco)] = $[\+@]?stat(\/(.*))?\s+((.*)\/)?(.*)\s*=\s*(.*):

    [setq(0, if(words(%4),if( strmatch(lcstr(%4), me), %#, *%4), %# ))]   // The target to set the stat on.
    [setq(1, statname(%q0, before(%5,%()))]        // Get the name and attribute string.
    [setq(2, extract(%q1, 2, 1, .))]    // The attribute string.
    [setq(3, extract(%q1, 3, 1, .))]    // The stat name.
    [setq(4, 
        if( 
            not(get(%va/values.%q3)), 
            get(%va/values.%q2), 
            get(%va/values.%q3) 
        )
    )]  // The valid values for the stat.
    [setq(5, after( before(%5, %)), %()))]    // The value to set the stat to.
    ;
    
    // is the target valid?
    @assert isdbref(num(%q0)) = {
        @pemit %#= That is not a valid target.;
    };
    
    // Check if the target is specified - and if they have permission to
    // edit the target.
    @assert 
        or(
            strmatch(%#, owner(%q0)) 
            orflags(%#, wWZ)
        ) = {
        @pemit %#= You do not have permission to set that stat.
    };


    // does the target ahve a template?
    @assert hasattr(%q0, _bio.template) = {
        @pemit %#= [moniker(%q0)] does not have a template set.;
        @pemit %#= To set a template, use %ch+template <target>/<template>%cn;
    };

    // check if the target has access to the stat-type.
    @assert 
        if(
            hasattr(%va,lock.%q2),
            u(%va/lock.%q2, %q0),
            1
        ) = {
            @pemit %#= You do not have permission to set that stat.
        };

    // check if the stat is locked.  If it is, and the setter is an admin, set
    // it anyways.
    @assert  
        if(
            hasattr(%va,lock.%q3),
            u(%va/lock.%q3, %q0),
            1
        ) = {
            @pemit %#= You do not have permission to set that stat.
        };


    // is the stat even valid?
    @assert words(%q3) = {
        @pemit %# = That is not a valid stat.;
    };


    // is it an (instanced) stat?
   
    @assert 
        or(
            not(hasattr(%va,instanced.%q3)),
            words(%q5)
        ) = {
        @pemit %#= That stat requires an %(instance%) to be set.;
    };


    // see if the value is valid.
    @assert or(
            member(%q4, %6, |),
            not(%q4),
            not(%6),
            
        ) = {
        @pemit %#= That is not a valid value for that stat.;
        @pemit %#= Valid values are: [itemize(iter(%q4, %ch[##]%cn, |, |),|)].;
    };
   

    [setq(7,
        if(%q5, %q3%(%q5%), %q3)
    )];

    @if strmatch(lcstr(%2), temp) = {
        // just set the temp attribute if the setter is admin.
        @if orflags(%#, wWZ) = {
            @if not(%6) = {
                &_%q2.[edit(%q7,%b,_)].TEMP %q0 = [getstat(%q0, %q7)];
                @pemit %#= Temp [capstr(%q7)] cleared from [moniker(%q0)].
            }, {
                &_%q2.[edit(%q7,%b,_)].TEMP %q0 = %6;
                @pemit %#= Temp [capstr(%q7)] set to %ch[%6]%cn on [moniker(%q0)].
            }
        }, {
            @pemit %#= You do not have permission to set that stat.
        }
    }, {
        
        @if not(%6) = {
            // remove the attribute if the value is 0.
            &_%q2.[edit(%q7,%b,_)] %q0 =;
            &_%q2.[edit(%q7,%b,_)].TEMP %q0 =;
            @pemit %#= [capstr(%q7)] cleared from [moniker(%q0)].
        }, {
            // set the attribute & temp attribute.
            &_%q2.[edit(%q7,%b,_)] %q0 = %6;
            &_%q2.[edit(%q7,%b,_)].TEMP %q0 = %6;
            @pemit %#= [capstr(%q7)] set to %ch[%6]%cn on [moniker(%q0)].
        };
    };

    

@set [v(cco)]/cmd.set = reg


/*
=============================================================================
===== CMD.TEMPLATE ==========================================================
    This command sets the template of a character.  Must be an admin to 
    use this command on another character.

    USAGE:
        +template [<target>/]<template>
=============================================================================
*/

&cmd.template [v(cco)] = $[\+@]?temp[late]+\s+((.*)/)?(.*)?:

    [setq(0, if(%2, if( strmatch(lcstr(%2), me), %#, *%2), %#))];

    @assert not(hasattr(%q0, _bio.template)) = {
        @pemit %#= [moniker(%q0)]'s template is slready set.;
        @pemit %#= To start over, use %ch+reset%cn;
    };


    @assert words(grab(get(%va/values.template),%3,|)) = {
        @pemit %#= That is not a valid template. 
            Valid templates are: [itemize(iter(get(%va/values.template), %ch[capstr(##)]%cn, |, |),|)].;
    };

    &_bio.template %q0 = lcstr(%3);
    &_bio.template.temp %q0 = lcstr(%3);
    @pemit %#= Template set to %ch[capstr(%3)]%cn on [moniker(%q0)].

@set [v(cco)]/cmd.template = reg

/*
=============================================================================
===== CMD.RESET =============================================================
    This command resets a character's stats to their default values.

    USAGE:
        +reset [<target>]
=============================================================================
*/

&cmd.reset [v(cco)] = $[\+@]+reset\s*(.*)?:
    [setq(0, if(%1, if( strmatch(lcstr(%1), me), %#, *%1), %#))];
    
    @assert isdbref(num(%q0)) = {
        @pemit %#= That is not a valid target.;
    };
    
    @assert or(orflags(%#, wWZ), strmatch(%q0, owner(%q0))) = {
        @pemit %#= You do not have permission to reset that character.;
    };

    @pemit %#= Are you sure?  This will reset all of [moniker(%q0)]'s stats to their default values.;
    @pemit %#= If you are sure, use %ch+confirm <target>=1%cn.;


@set [v(cco)]/cmd.reset = reg

/*
=============================================================================
===== CMD.CONFIRM ===========================================================
    This command confirms a reset of a character's stats.

    USAGE:
        +confirm <target>=1
=============================================================================
*/

&cmd.confirm [v(cco)] = $\+confirm\s*(.*)\s*=\s*1:
    [setq(0, if(%1, if( strmatch(lcstr(%1), me), %#, *%1), %#))];

    @assert isdbref(num(%q0)) = {
        @pemit %#= That is not a valid target.;
    };

    @assert or(orflags(%#, wWZ), strmatch(%q0, owner(%q0))) = {
        @pemit %#= You do not have permission to reset that character.;
    };

    @dolist lattr(%q0/_*) = {&## %q0=;};
    @pemit %#= [moniker(%q0)]'s stats have been reset to their default values.;
    @pemit %q0= Your stats have been reset to their default values.;

@set [v(cco)]/cmd.confirm = reg


&cmd.sheet [v(cco)] = $[\+@]+sheet\s*(.*)?:
    [setq(0, if(%1, if( strmatch(lcstr(%1), me), %#, *%1), %#))];
    
    
    // is this a player?
    @assert isdbref(pmatch(%q0)) = {
        @pemit %#= That is not a valid target.;
    }

    // can they view this sheet?
    @assert or(
        orflags(%#, wWZ),
        strmatch(%# owner(%q0)),
    ) = {
        @pemit %#= You do not have permission to view that sheet.;
    };

    @assert isdbref(pmatch(%q0)) = {
        @pemit %#= That is not a valid target.;
    };

    @assert hasattr(%q0, _bio.template) = {
        @pemit %#= [moniker(%q0)] does not have a template. use %ch+template <target>/<template>%cn.
    };

    @pemit %# = u(%vb/fn.sheet, %q0)

@set [v(cco)]/cmd.sheet = reg
