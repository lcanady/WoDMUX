

/*
===============================================================================
===== nameformat ==============================================================

Format the name of the room.

===============================================================================
*/

@nameformat  [v(rp)] = 
    center(
        %cr%[%b%ch%cy[u(fn.displayname, %#, %l)]%cn%cr%b%]%cn,
        width(%#), 
        %cr=%cn
    )


/*
===============================================================================
===== descformat ==============================================================

Format the description of the room.

===============================================================================
*/

@descformat [v(rp)] = 
    [if(%0,%r%t%0, %rYou see nothing special.)]%r
    [if( 
        hasattr(%l, view-*), 
        %r[center(%cy<< +views available >>%cm,width(%#))]%r
    )]


/*
===============================================================================
===== conFormat ===============================================================

Format the contents of the room.

===============================================================================
*/

@conformat [v(rp)] = 
    [trim(
        [setq(0, sub(div(width(%#),3),3))]
        [setq(1, sub(sub(width(%#), %q0), 5)  )] // the width of the second col.
    )]
    [center(
        %cr%[%b%cy[Characters]%cr%b%]%cn, 
        width(%#), 
        %cr=%cn
    )]
    [iter(
        [lcon(%l, connect)], 
        %r%b[ljust(
            u(fn.displayname, %#, ##), 
            sub( div(sub(width(%#),2),3), strlen(singletime(idle(##))) ) 
        )]
        [idlecolor(idle(##))]%b%b
        [ljust( 
            edefault(##/short-desc, %ch%cxUse '%cn&short-desc me=<desc>%ch%cx' to set it.%cn),
            %q1
        )]
    )]
    [if(
        lcon(%l, object),
        [center(
            %cr%[%b%cy[Things]%cr%b%]%cn, 
            width(%#), 
            %cr=%cn
        )]%r
        [iter(
            [lcon(%l, object)], 
            %r%b[ljust(
                u(fn.displayname, %#, ##), 
                div(sub(width(%#),2),3) 
            )]%b%b
            [ljust( 
                edefault(##/short-desc,%b),
                %q1
            )]
        )]
    )]
    [if(
        not(lexits(%l)),
         %r[repeat(%cr=%cn, width(%#))]
    )]



/*
===============================================================================
===== exitformat ==============================================================

Format the exits of the room.

===============================================================================
*/
&filter.cansee #67= not(hasflag(%0, dark))
@exitformat [v(rp)] =
    [if( words(filter(filter.cansee, lexits(%l),,, %@)),
        [center(
            %cr%[%b%cy[Exits]%cr%b%]%cn, 
            width(%#), 
            %cr=%cn
        )]%r
        [table(
            iter( 
                filter(filter.cansee, lexits(%l),,, %@), %b[u(fn.exitname, ##)],,|),div(sub(width(%#),2),3),width(%#),|)]
    )]
    [repeat(%cr=%cn, width(%#))]
    


&fn.exitname [v(rp)] = <%ch%cy[ucstr(extract(fullname(%0),2,1,;))]%cn> [name(%0)]%cn
&fn.displayname [v(rp)] = [moniker(%1)][if(orflags(%0, wWZ),%([num(%1)][flags(%1)]%))]


/*
===============================================================================
===== conFormat ===============================================================

Format the contents of the room.

===============================================================================
*/
@conformat [v(rp)] = 
    [trim(
        [setq(0, sub(div(width(%#),3),3))]
        [setq(1, sub(sub(width(%#), %q0), 5)  )] // the width of the second col.
    )]
    [center(
        %cr%[%b%cy[Characters]%cr%b%]%cn, 
        width(%#), 
        %cr=%cn
    )]%r
    [iter(
        [lcon(%l, connect)], 
        %r%b[ljust(
            u(fn.displayname, %#, ##), 
            sub( div(sub(width(%#),2),3), strlen(singletime(idle(##))) ) 
        )]
        [idlecolor(idle(##))]%b%b
        [ljust( 
            edefault(##/short-desc, %ch%cxUse '&short-desc me=<desc>' to set it.%cn),
            sub(%q1,3)
        )]
    )]%r
    [if(
        lcon(%l, object),
        %r[center(
            %cr%[%b%cy[Things]%cr%b%]%cn, 
            width(%#), 
            %cr=%cn
        )]%r
        [iter(
            [lcon(%l, object)], 
            %r%b[ljust(
                u(fn.displayname, %#, ##), 
                div(sub(width(%#),2),3) 
            )]%b%b
            [ljust( 
                edefault(##/short-desc,%b),
                %q1
            )]
        )]%r
    )]
    [if(
        not(lexits(%l)),
         %r[repeat(%cr=%cn, width(%#))]
    )]

/*
===============================================================================
===== exitformat ==============================================================

Format the exits of the room.

===============================================================================
*/

@exitformat [v(rp)] =
     [center(
        %cr%[%b%cy[Exits]%cr%b%]%cn, 
        width(%#), 
        %cr=%cn
    )]%r
    [switch( get(room(%#)/zone),night,%r%t[tcol(*** Nightzone
        ***)]%r%r,day,%r%t[pcol(*** Dayzone 
        ***)]%r%r)]
        %r[table( 
            [iter(
                %0,
                [setq(0,before(name(##),;))]
                [exitname(
                    after(r(0),:),
                    before(r(0),:)
                )%B]%B,,|
            )],
        div(sub(width(%#),4),3), 
        width(%#),|
    )]%r%r
    [repeat(%cr=%cn, width(%#))]