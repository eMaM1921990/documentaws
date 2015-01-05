/*!
 * CMDScript - Fullscreen and overlay class functions
 * from Scolerov scoolerov@gmail.com
 * Suppost keyboard shortcuts
 * 8: 'backspace',
 * 9: 'tab',
 * 13: 'enter',
 * 16: 'shift',
 * 17: 'ctrl',
 * 18: 'alt',
 * 20: 'capslock',
 * 27: 'esc',
 * 32: 'space',
 * 33: 'pageup',
 * 34: 'pagedown',
 * 35: 'end',
 * 36: 'home',
 * 37: 'left',
 * 38: 'up',
 * 39: 'right',
 * 40: 'down',
 * 45: 'ins',
 * 46: 'del',
 * 91: 'meta',
 * 93: 'meta',
 * 224: 'meta'
 * 106: '*',
 * 107: '+',
 * 109: '-',
 * 110: '.',
 * 111 : '/',
 * 186: ';',
 * 187: '=',
 * 188: ',',
 * 189: '-',
 * 190: '.',
 * 191: '/',
 * 192: '`',
 * 219: '[',
 * 220: '\\',
 * 221: ']',
 * 222: '\''
 * '~': '`',
 * '!': '1',
 * '@': '2',
 * '#': '3',
 * '$': '4',
 * '%': '5',
 * '^': '6',
 * '&': '7',
 * '*': '8',
 * '(': '9',
 * ')': '0',
 * '_': '-',
 * '+': '=',
 * ':': ';',
 * '\"': '\'',
 * '<': ',',
 * '>': '.',
 * '?': '/',
 * '|': '\\'
 * 'option': 'alt',
 * 'command': 'meta',
 * 'return': 'enter',
 * 'escape': 'esc'
 */

$(document).ready(function() {

    var FScreen = document.querySelector('div.overlay');

    // Change main overlay keyboard close shortcut	

    Mousetrap.bind('esc', function(e) {
        classie.remove(FScreen, 'open')
    }
    ),
            // Change main overlay keyboard open shortcut

            Mousetrap.bind('m', function(e) {
                classie.add(FScreen, 'open')
            }
            )

    var FFScreen = document.querySelector('div.foverlay');

    // Change main overlay keyboard close shortcut	

    Mousetrap.bind('esc', function(e) {
        classie.remove(FFScreen, 'open')
    }
    ),
            // Change main overlay keyboard open shortcut

            Mousetrap.bind('m', function(e) {
                classie.add(FFScreen, 'open')
            }
            )
});


(function() {
    var TBtn = document.getElementById('trigger-overlay'), FScreen = document.querySelector('div.overlay'), CBtn = FScreen.querySelector('button.overlay-close');
    TNames = {'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'oTransitionEnd', 'msTransition': 'MSTransitionEnd', 'transition': 'transitionend'}, EName = TNames[ Modernizr.prefixed('transition') ], support = {transitions: Modernizr.csstransitions};
    function toggleFScreen() {
        if (classie.has(FScreen, 'open')) {
            classie.remove(FScreen, 'open');
            classie.add(FScreen, 'close');
            var onEndTransitionFn = function(ev) {
                if (support.transitions) {
                    if (ev.propertyName !== 'visibility')
                        return;
                    this.removeEventListener(EName, onEndTransitionFn);
                }
                classie.remove(FScreen, 'close');
            };
            if (support.transitions) {
                FScreen.addEventListener(EName, onEndTransitionFn);
            } else {
                onEndTransitionFn();
            }
        } else if (!classie.has(FScreen, 'close')) {
            classie.add(FScreen, 'open');
        }
    }
    TBtn.addEventListener('click', toggleFScreen);
    CBtn.addEventListener('click', toggleFScreen);
})();
(function() {
    var FTBtn = $('.abbas');
    FFScreen = document.querySelector('div.foverlay'),
            FCBtn = FFScreen.querySelector('button.foverlay-close');
    FTNames = {
        'WebkitTransition': 'webkitTransitionEnd',
        'MozTransition': 'transitionend',
        'OTransition': 'oTransitionEnd',
        'msTransition': 'MSTransitionEnd',
        'transition': 'transitionend'
    }, FEName = FTNames[Modernizr.prefixed('transition')], Fsupport = {
        transitions: Modernizr.csstransitions
    };

    function toggleFScreen() {
        if (classie.has(FFScreen, 'open')) {
            classie.remove(FFScreen, 'open');
            classie.add(FFScreen, 'close');
            var onEndTransitionFn = function(ev) {
                if (Fsupport.transitions) {
                    if (ev.propertyName !== 'visibility')
                        return;
                    this.removeEventListener(FEName, onEndTransitionFn);
                }
                classie.remove(FFScreen, 'close');
            };
            if (support.transitions) {
                FFScreen.addEventListener(FEName, onEndTransitionFn);
            } else {
                onEndTransitionFn();
            }
        } else if (!classie.has(FFScreen, 'close')) {
            classie.add(FFScreen, 'open');
        }
    }
    $('.info01').on('click', toggleFScreen);
    FCBtn.addEventListener('click', toggleFScreen);
    
    $('#info01menu').on('click', toggleFScreen);
    
    FCBtn.addEventListener('click', toggleFScreen);
    
    $('#actionsButton').on('click', toggleFScreen);
    FCBtn.addEventListener('click', toggleFScreen);


})();

var fileid;
var filename;
function data(id,name) {
    fileid = id;
    filename=name;
    
    access();
  
}



var xmlHttpdownload;

function download() {
    if (typeof XMLHttpRequest !== "undefined") {
        xmlHttpdownload = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttpdownload = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttpdownload === null) {
        alert("Browser does not support XMLHTTP Request");
        return;
    }
    var url = "getDownloadLink";
    
    url += "?id=" + encodeURI(fileid);
    xmlHttpdownload.onreadystatechange = returnedlink;
    xmlHttpdownload.open("GET", url, true);
    xmlHttpdownload.send(null);
}
function returnedlink() {
    if (xmlHttpdownload.readyState === 4 || xmlHttpdownload.readyState === "complete") {
       window.open(xmlHttpdownload.responseText,"_self");
        
    }
}



var xmlHttp;

function preview() {
    if (typeof XMLHttpRequest !== "undefined") {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp === null) {
        alert("Browser does not support XMLHTTP Request");
        return;
    }
     
    var url = "getReview";
    
    url += "?id=" + encodeURI(fileid)+"&name="+encodeURI(filename);
    xmlHttp.onreadystatechange = returnedpreview;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function returnedpreview() {
    if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
       
       document.getElementById("review").innerHTML=xmlHttp.responseText;
       
    }
}




var xmlHttpmeta;

function access() {
    if (typeof XMLHttpRequest !== "undefined") {
        xmlHttpmeta = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttpmeta = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttpmeta === null) {
        alert("Browser does not support XMLHTTP Request");
        return;
    }
    
    
    var a=document.getElementById("prop");
    a.href="info.jsp?id="+encodeURI(fileid)+"&name="+encodeURI(filename);
    
}






var xmlHttp;

function workflow() {
    if (typeof XMLHttpRequest !== "undefined") {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp === null) {
        alert("Browser does not support XMLHTTP Request");
        return;
    }
      
    var url = "getWorkFlow";
    
    url += "?id=" + encodeURI(fileid)+"&name="+encodeURI(filename);
    xmlHttp.onreadystatechange = returnedworkflow;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function returnedworkflow() {
    if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
       
       document.getElementById("workflow").innerHTML=xmlHttp.responseText;
        
    }
}