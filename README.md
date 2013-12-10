TiMedibaAd
====

株式会社medibaの提供するアドネットワーク広告「mediba ad」をTitanium製アプリに組み込むためのiOSネイティブモジュールです。

使い方
----

通常サイズのバナー広告を配置するサンプル。

```javascript
var MedibaAd = require('net.hoyohoyo.timedibaad');

var ad = MedibaAd.createView({
  bottom: 0,
  height: 50,
  sId: '9dc279bec0d0c4419582d58d1f8a11ca29bc24a4e39a3059'
});

var win = Ti.UI.createWindow({backgroundColor: '#fcc'});
win.add(ad);
win.open();
```

アイコンアドをTabGroupと併用して配置するサンプル。

```javascript
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
```

利用上の注意
----

本モジュールはKDDI株式会社および株式会社medibaの公式見解とは一切関係ございません。また、本モジュールを利用したことで何らかの損害が生じた場合にも、一切責任を負いません。あらかじめご了承ください。

アプリへの組み込みにあたっては、mediba adの開発者向けページから最新版SDKを取得し、プライバシーポリシーへの追記など所定の方法に則ってご利用されることを推奨いたします。
