window.fbAsyncInit = function() {
  FB.init({
    appId            : _FACEBOOK_ID,
    autoLogAppEvents : false,
    xfbml            : true,
    version          : 'v2.12'
  });
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
