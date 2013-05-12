var TiMedibaAd = require('net.hoyohoyo.timedibaad');
Ti.API.info('sdk version is => ' + TiMedibaAd.version);

var adView = TiMedibaAd.createView({
  bottom: 0,
  height: 50,
  sId: '9dc279bec0d0c4419582d58d1f8a11ca29bc24a4e39a3059'
});
adView.addEventListener('receive', function(e) {
  Ti.API.info('ad receive');
});
adView.addEventListener('error', function(e) {
  Ti.API.info('ad error');
});

var win = Ti.UI.createWindow({
  backgroundColor: 'white'
});
win.add(adView);
win.open();
