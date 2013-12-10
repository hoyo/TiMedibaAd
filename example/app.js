var MedibaAd = require('net.hoyohoyo.timedibaad');

var ad = MedibaAd.createView({
  bottom: 0,
  height: 50,
  sId: '9dc279bec0d0c4419582d58d1f8a11ca29bc24a4e39a3059'
});
ad.addEventListener('receive', function(e) {
  Ti.API.info('ad receive');
});
ad.addEventListener('error', function(e) {
  Ti.API.info('ad error');
});

var win = Ti.UI.createWindow({backgroundColor: '#fcc'});
win.add(ad);
win.open();
