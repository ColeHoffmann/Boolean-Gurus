var url = window.location.href;
url = url.replace("~bond.213", "~mikebond");
var stateObj = { };
history.replaceState(stateObj, "", url);
