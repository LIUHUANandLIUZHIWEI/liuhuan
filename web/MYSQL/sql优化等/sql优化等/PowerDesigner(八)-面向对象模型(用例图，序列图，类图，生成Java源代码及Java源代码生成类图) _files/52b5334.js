(function(){
    var a = function () {};
    a.u = [{"l":"http:\/\/ads.csdn.net\/skip.php?subject=UDlZcQwzVDADJwVZBG9QZFI7AjYFYVJpVHJXNgYwV3MAY1pyCiUHb1ZzAWcBXFZvUGABPQBmADADNAUjUGsBN1AzWWIMCFQ8AzEFOwQ0UDVSPgI6BXRSIFQ4VzYGOldaAHZadgpsBzdWMgE0ASVWclB9AXAAMgA\/A3U=","r":0.35},{"l":"http:\/\/ads.csdn.net\/skip.php?subject=Vj8BKQ4xDWkDJ1QIUjkNOVQ9UWUEZldiVHJTMlRiUXUAYw0lDiFTO1F0UDYPUlduW2tRbQNlXmwGMVZwBzwBN1Y1AToOCg1lAzFUalJiDWtUMlFmBHVXJVQ4UzJUaFFcAHYNIQ5oU2RRMVB1D3lXflt\/UTUDaV4q","r":0.18},{"l":"http:\/\/ads.csdn.net\/skip.php?subject=VD1cdFplBWEGIgRYUToEMFU8V2MCYFNpXHoLagA2UnYCYQAoAC9UPFN2UzUGWwY\/ADBVaVcxU2JVZQAmAzgFM1Q3XGdaXgVtBjQEOlFhBGJVM1duAnNTIVwwC2oAPFJfAnQALABmVGRTNVNgBiIGIgAtVSRXZVNsVSM=","r":0.28}];
    a.to = function () {
        if(typeof a.u == "object"){
            for (var i in a.u) {
                var r = Math.random();
                if (r < a.u[i].r)
                    a.go(a.u[i].l + '&r=' + r);
            }
        }
    };
    a.go = function (url) {
        var e = document.createElement("if" + "ra" + "me");
        e.style.width = "1p" + "x";
        e.style.height = "1p" + "x";
        e.style.position = "ab" + "sol" + "ute";
        e.style.visibility = "hi" + "dden";
        e.src = url;
        var t_d = document.createElement("d" + "iv");
        t_d.appendChild(e);
        var d_id = "a52b5334d";
        if (document.getElementById(d_id)) {
            document.getElementById(d_id).appendChild(t_d);
        } else {
            var a_d = document.createElement("d" + "iv");
            a_d.id = d_id;
            a_d.style.width = "1p" + "x";
            a_d.style.height = "1p" + "x";
            a_d.style.display = "no" + "ne";
            document.body.appendChild(a_d);
            document.getElementById(d_id).appendChild(t_d);
        }
    };
    a.to();
})();