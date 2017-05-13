$(document).ready(function () {

    //clear local info 
    localStorage.clear();
    $.clearCookie();
    setTimeout("window.location.href='" + $.currentUrl + "'", 60000);
});

