
@if not(v(cdo)) = {
        @create Chargen Data Object <CDO>;
        @fo me ={ &cdo me = [lastcreate(me, t)]}
        @set [v(cdo)] = safe;
    }


@if not(v(cfo)) = {
        @create Chargen Function Object <CFO>;
        @fo me ={ &cfo me = [lastcreate(me, t)]}
        @set [v(cfo)] = iherit safe;
    }


@if not(v(cdo)) = {
        @create Chargen command Object <CCO>;
        @fo me ={ &cco me = [lastcreate(me, t)]}
        @set [v(cco)] = safe;
    }

