
@if not(v(cdo)) = {
        @create Chargen Data Object <CDO>;
        @fo me ={ &cdo me = [lastcreate(me, t)]};
       @wait .1 =  @set [v(cdo)] = safe;
    }


@if not(v(cfo)) = {
        @create Chargen Function Object <CFO>;
        @fo me ={ &cfo me = [lastcreate(me, t)]};
        @wait .1= @set [v(cfo)] = iherit safe;
    }


@if not(v(cco)) = {
        @create Chargen command Object <CCO>;
        @fo me ={ &cco me = [lastcreate(me, t)]};
        @wait .1= @set [v(cco)] = safe;
    }

// settings

@@ Uncomment this line for guilded characger generation.
@@ &guided [v(cdo)] = 1;
&header_color [v(cdo)] = %cr;
&header_border_right [v(cdo)] = %b%cr%[;
&header_border_left [v(cdo)] = %b%cr%];
&footer_color [v(cdo)] = %cr;
&stat_filler [v(cdo)] = %ch%cx.%cn;