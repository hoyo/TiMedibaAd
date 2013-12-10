var MedibaAd = require('net.hoyohoyo.timedibaad');

var ad = MedibaAd.createView({
  bottom: 49,
  height: 50,
  sId: 'ea7ab6746abb4a15de2a82deee207d5f3582b275b8f80021',
  isIconAd: true,
  backgroundColor: '#aaa'
});

var win1 = Ti.UI.createWindow({title: 'Tab 1', backgroundColor: '#fff'});
var win2 = Ti.UI.createWindow({title: 'Tab 2', backgroundColor: '#fff'});
var tab1 = Ti.UI.createTab({title: 'Tab 1', window: win1});
var tab2 = Ti.UI.createTab({title: 'Tab 2', window: win2});
var tabGroup = Titanium.UI.createTabGroup();
tabGroup.addTab(tab1);
tabGroup.addTab(tab2);
tabGroup.add(ad);
tabGroup.open();
