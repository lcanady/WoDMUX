/*
=============================================================================
===== CMD.SET ===============================================================
    This command sets the value of a system stat on a character.

    USAGE:
        +stat[/<tem>] [<target>/]<stat> = [+|-]<value>
=============================================================================
*/

&cmd.set [v(cco)] = $[\+@]?stat[s]?(\/([\w\/]+))?\s+((.*)\/)?(.*)\s*=\s*(.*):

    // The target to set the stat on.
    [setq(0, if(words(%4),if( strmatch(lcstr(%4), me), %#, *%4), %# ))] 
    // Get the name and attribute string.
    [setq(1, statname(%q0, trim(before(%5,%())))]
    // The attribute string.
    [setq(2, extract(%q1, 2, 1, .))]
    // The stat name.
    [setq(3, extract(%q1, 3, 1, .))]
    [setq(4, 
        if( 
            not(get(%va/values.%q3)), 
            get(%va/values.%q2), 
            get(%va/values.%q3) 
        )
    )]  
    // The valid values for the stat.
    // The value to set the stat to.
    [setq(5, after( before(%5, %)), %()))]
    ;
    
    // is the target valid?
    @assert isdbref(num(%q0)) = {
        @pemit %#= That is not a valid target.;
    };
    
    // Check if the target is specified - and if they have permission to
    // edit the target.
    @assert 
        or(
            strmatch(%#, owner(%q0)), 
            orflags(%#, wWZ)
        ) = {
        @pemit %#= You do not have permission to set that target.
    };


    // does the target ahve a template?
    @assert hasattr(%q0, _bio.template) = {
        @pemit %#= [moniker(%q0)] does not have a template set.;
        @pemit %#= To set a template, use %ch+template <target>/<template>%cn;
    };

    //is it a specalty?
    @assert not(member(%2, specialty, /)) = {
        @trigger me/trig.specialty =  %q0, %q3, edit(%6,%b,_);
    };

    // If chargen is guided, do they have points set?
    @assert if(
        hasattr(%va,guided),
        gt(words(lattr(%q0/points*)), 1),
        1
    ) = {
        @pemit %#= You must set your points before you can set your stats.;
        @pemit %#= Use %ch+points%cn to set your points.;
        @pemit %#= See %ch+cghelp%cn for more information.;
    };
    
    // check if the target has access to the stat-type.
    @assert 
        if(
            hasattr(%va,lock.%q2),
            u(%va/lock.%q2, %q0),
            1
        ) = {
            @pemit %#= [u(%vb/fn.error, %q2)]
        };

    // check if the stat is locked.  If it is, and the setter is an admin, set
    // it anyways.
    @assert  
        if(
            hasattr(%va,lock.%q3),
            u(%va/lock.%q3, %#),
            1
        ) = {
            @pemit %#= [u(%vb/fn.error, %q3)]
        };

    @assert not(member(%2, force, /)) = {
         // if the switches includes force, force the stat onto the character.
        &_[edit(after(lcstr(%2),force/),%b,_)].[edit(%5,%b,_)] %q0 = %6;
        &_[edit(after(lcstr(%2),force/),%b,_)].[edit(%5,%b,_)].TEMP %q0 = %6;
        @pemit %#= [capstr(lcstr(%5))] set to %ch[%6]%cn on [moniker(%q0)].
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

    // does it have an instance and not need one?
    @assert 
       if(
            not(hasattr(%va,instanced.%q3)),
            not(words(%q5)),
            words(%q5)
       ) = {
        @pemit %#= That stat does not require an %(instance%) to be set.;
    };

    [setq(8, 
        if(
            or(
                strmatch(%6, +*),
                strmatch(%6, -*)
            ),
            add(getstat(%q0,  if(%q5, %q3%(%q5%), %q3)), %6),
            %6
        )
    )];

    // see if the value is valid.
    @assert or(
            orflags(%#, WZ),
            member(%q4, %q8, |),
            not(%q4),
            not(%6),
            
        ) = {
        @pemit %#= That is not a valid value for that stat.;
        @pemit %#= Valid values are: [itemize(iter(%q4, %ch[##]%cn, |, |),|)].;
    };
   

    [setq(7,
        if(%q5, %q3%(%q5%), %q3)
    )];

    // If guided chargen is enabled...
    @assert not(u(%va/guided)) = {
        @trig me = trig.guided = %#, %0,  
    };

    @if strmatch(lcstr(%2), temp) = {
        // just set the temp attribute if the setter is admin.
        @if orflags(%#, wWZ) = {
            @if not(%6) = {
                &_%q2.[edit(%q7,%b,_)].TEMP %q0 = [getstat(%q0, %q7)];
                @pemit %#= Temp [capstr(%q7)] cleared from [moniker(%q0)].
            }, {
                &_%q2.[edit(%q7,%b,_)].TEMP %q0 = %q8;
                @pemit %#= Temp [capstr(%q7)] set to %ch[%q8]%cn on [moniker(%q0)].
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
            &_%q2.[edit(%q7,%b,_)] %q0 = %q8;
            &_%q2.[edit(%q7,%b,_)].TEMP %q0 = %q8;
            @pemit %#= [capstr(%q7)] set to %ch[%q8]%cn on [moniker(%q0)].
        };
    };

    @wait 0= @trigger  %va/trig.%q2 = %q0, %q7, %q8;
    @wait 0= @trigger  %va/trig.[edit(%q7,%b,_)] = %q0, %q7, %q8;
    

@set [v(cco)]/cmd.set = reg

/*
=============================================================================
===== trig.specialty =========================================================
    This trigger sets a specialty on a character's ability.

    registers
    ---------
    %0 - The target to set the stat on.
    %1 - The stat name.
    %2 - The specialty to set.
=============================================================================
*/
&trig.specialty [v(cco)] = 
    @if isnum(getstat(%0, %1)),  = {
        &_[%1].[%2] %0 = 1;
        &_[%1].[%2].TEMP %0 = 1;
        @pemit %0= You have added a specialty to your %ch[capstr(edit(%2,_,%b))]%cn ability.;
    }, {
        @if and( isnum(getstat(%1, %2)), not(words(%3))) = {
            &_%1.%2 %0 =;
            &_%1.%2.TEMP %0 =;
            @pemit %0= You have removed the specialty from your %ch[capstr(edit(%2,_,%b))]%cn ability.;
        }, {
            @pemit %0= You musy have a value in that ability first.;
        };

    };

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

    @assert hasattr(%#, __accept) = {
        @pemit %#= You must accept the terms of service before you can set your template.;
    };

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
    @pemit %#= Template set to %ch[capstr(%3)]%cn on [moniker(%q0)].;
    @trigger %va/trig.template = %q0, %3;

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
        +reset/confirm <target>=1
=============================================================================
*/

&cmd.confirm [v(cco)] = $\+reset\/confirm\s*(.*)\s*=\s*1:
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

/*
=============================================================================
===== CMD.SHEET =============================================================
    This command displays a character's sheet.

    USAGE:
        +sheet [<target>]

    If no target is specified, the command defaults to the user.
=============================================================================
*/
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


&cmd.stats/list [v(cco)] = $[\+@]+stats\/list\s*((.*)\/)?(.*):
    [setq(0, )]