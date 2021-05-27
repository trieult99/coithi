// SETTING GLOBAL VAR FOR DOMAIN
var protocol = 'https://';
var base_domain = 'spkt.com';
var domain = 'spkt.com';
var main_http_server = protocol + domain + '/';
var root_http_server = protocol + domain + '/';
var file_server = protocol + domain + '/fileserver/';
var image_server = protocol + domain + '/fileserver/';

//--------------------------------------------------------
// LAZY LOAD IMAGES
//--------------------------------------------------------
function loadLazy() {
    var lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));
    if ("IntersectionObserver" in window) {
        var lazyImageObserver = new IntersectionObserver(function (entries,
                                                                   observer) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    setTimeout(() => {
                        var lazyImage = entry.target;
                        if (lazyImage.dataset.srcset) {
                            lazyImage.srcset = lazyImage.dataset.srcset;
                        }
                        lazyImage.src = lazyImage.dataset.src;
                        lazyImage.classList.remove("lazy");
                        lazyImageObserver.unobserve(lazyImage);
                    }, 0);
                }
            });
        });
        lazyImages.forEach(function (lazyImage) {
            lazyImageObserver.observe(lazyImage);
        });
    } else {
        var active = false;

        lazyLoad = function () {
            if (active === false) {
                active = true;

                lazyImages.forEach(function (lazyImage) {
                    if (
                        lazyImage.getBoundingClientRect().top <= window.innerHeight &&
                        lazyImage.getBoundingClientRect().bottom >= 0 &&
                        getComputedStyle(lazyImage).display !== "none"
                    ) {
                        setTimeout(() => {
                            if (lazyImage.dataset.srcset) {
                                lazyImage.srcset = lazyImage.dataset.srcset;
                            }
                            lazyImage.src = lazyImage.dataset.src;
                            lazyImage.classList.remove("lazy");
                            lazyImages = lazyImages.filter(function (image) {
                                return image !== lazyImage;
                            });

                            if (lazyImages.length === 0) {
                                document.removeEventListener("scroll", lazyLoad);
                                window.removeEventListener("resize", lazyLoad);
                                window.removeEventListener("orientationchange", lazyLoad);
                            }
                        }, 0);
                    }
                });

                active = false;
            }
        };

        document.addEventListener("scroll", lazyLoad);
        window.addEventListener("resize", lazyLoad);
        window.addEventListener("orientationchange", lazyLoad);
    }
}
setTimeout(() => {
    loadLazy();
}, 0);

/**********COOKIES***************/
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    //d.setTime(d.getTime() + 30 * 1000);
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
/**********END COOKIES***************/

Array.prototype.remove = function () {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};

/**SCROLL TO CUSTOM**/
function animate(elem, style, unit, from, to, time, prop) {
    if (!elem) {
        return;
    }

    var start = new Date().getTime(),
        timer = setInterval(function () {
            var step = Math.min(1, (new Date().getTime() - start) / time);
            if (prop) {
                elem[style] = (from + step * (to - from)) + unit;
            } else {
                elem.style[style] = (from + step * (to - from)) + unit;
            }
            if (step === 1) {
                clearInterval(timer);
            }
        }, 5);
    if (prop) {
        elem[style] = from + unit;
    } else {
        elem.style[style] = from + unit;
    }
}
/**SCROLL TO CUSTOM END***/

/*********NAV MOBILE**********/
function openNav() {
    var header__menu = document.getElementById("header__menu__content");
    if(header__menu != null) {
        header__menu.style.width = "100%";
    }
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    var header__menu = document.getElementById("header__menu__content");
    if(header__menu != null) {
        header__menu.style.width = "0%";
    }
}

window.addEventListener("click", function(event) {
    if ((!event.target.closest(".header__overlay__content")) && (!event.target.closest(".header__menu"))) {
        closeNav();
    }
});

var headermenu_closebtn = document.querySelector("#header__overlay__closebtn");
if(headermenu_closebtn != null) {
    headermenu_closebtn.addEventListener("click", function() {
        closeNav();
    });
}
/*********END NAV MOBILE**********/
/***XHR*****/
//post, get
function xhr(url = null, param = null, callback = null, method = 'post') {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        //endloading();
        if (this.readyState == 4 && this.status == 200) {
            callback(this.responseText);
        }
    };
    xhttp.open(method, url, true);
    xhttp.setRequestHeader('Cache-Control','no-store');
    //param.append('csrfp_token', getCookie('csrfp_token'));
    xhttp.send(param);
}

/***XHR END*****/
function isString(x) {
    return Object.prototype.toString.call(x) === '[object String]';
}

function numberWithDot(x) {
    if(!isString(x)) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    } else {
        return x.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    }
}

function numberWithComma(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}

String.prototype.replaceAll = function(str1, str2, ignore)
{
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
};

//Collapse
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {

        this.classList.toggle("active");
        var content = this.nextElementSibling;
        var contentWrapperChildren = this.closest(".children");
        //console.log(contentWrapperChildren);
        if (content.style.maxHeight){
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";

            if(contentWrapperChildren != null) {
                contentWrapperChildren.style.maxHeight = contentWrapperChildren.offsetWidth + "px";
            }
        }
    });
}

/********LOADING************/
//document.querySelector("body").innerHTML += '<div class="modalLoading"><!--Loading--></div>';
function showLoading() {
    document.querySelector("body").classList.add("loading");
}

function endLoading() {
    document.querySelector("body").classList.remove("loading");
}


/********* DETECT MOBILE *********/
var isMobile = false; //initiate as false
// device detection
if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) {
    isMobile = true;
}

const userAgent = navigator.userAgent.toLowerCase();
const isTablet = /(ipad|tablet|(android(?!.*mobile))|(windows(?!.*phone)(.*touch))|kindle|playbook|silk|(puffin(?!.*(IP|AP|WP))))/.test(userAgent);

