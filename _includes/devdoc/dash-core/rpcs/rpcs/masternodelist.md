{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/masternodelist.md" %}

##### MasternodeList
{% include helpers/subhead-links.md %}

<!-- __ -->

{% assign summary_masternodeList="returns a list of masternodes in different modes." %}

{% autocrossref %}

The `masternodelist` RPC {{summary_masternodeList}}

*Parameter #1---List mode*

{% itemplate ntpd1 %}
- n: "`mode`"
  t: "string"
  p: "Optional (exactly 1);<br>Required to use `filter`"
  d: "The mode to run list in"

{% enditemplate %}

*Mode Options*

Mode | Description
--- | --- | --- |
`activeseconds` | Print number of seconds masternode recognized by the network as enabled (since latest issued \"masternodestart/start-many/start-alias\")
`addr` | Print ip address associated with a masternode (can be additionally filtered, partial match)
`full` | Print info in format 'status protocol payee lastseen activeseconds lastpaidtime lastpaidblock IP' (can be additionally filtered, partial match)
`info` | Print info in format 'status protocol payee lastseen activeseconds sentinelversion sentinelstate IP' (can be additionally filtered, partial match)
`lastpaidblock` | Print the last block height a node was paid on the network
`lastpaidtime` | Print the last time a node was paid on the network
`lastseen` | Print timestamp of when a masternode was last seen on the network
`payee` | Print Dash address associated with a masternode (can be additionally filtered, partial match)
`protocol` | Print protocol of a masternode (can be additionally filtered, exact match)
`pubkey` | Print the masternode (not collateral) public key
`rank` | Print rank of a masternode based on current block
`status` | Print masternode status: PRE_ENABLED / ENABLED / EXPIRED / SENTINEL_PING_EXPIRED / NEW_START_REQUIRED / UPDATE_REQUIRED / POSE_BAN / OUTPOINT_SPENT (can be additionally filtered, partial match)

*Parameter #2---List filter*

{% itemplate ntpd1 %}
- n: "`filter`"
  t: "string"
  p: "Optional<br>(exactly 1)"
  d: "Filter results. Partial match by outpoint by default in all modes, additional matches in some modes are also available."

{% enditemplate %}

*Result---the masternode list*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object/null"
  p: "Required<br>(exactly 1)"
  d: "Information about the masternode sync status"

- n: "→<br>Masternode Info"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "The requested masternode info. Output varies based on selected `mode` and `filter` parameters"

{% enditemplate %}

*Example from Dash Core 0.12.3*

Get unfiltered Masternode list in default mode

{% highlight bash %}
dash-cli -testnet masternodelist
{% endhighlight %}

Result:
{% highlight json %}
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1": "ENABLED",
  "2ff986f401bfc16ea42b0a402bff3a30cd5b1a3c14dc65c59612c20b6323e010-1": "ENABLED",
  "54754314335419cc04ef09295ff7765c8062a6123486aed55fd7e9b04f300b13-0": "NEW_START_REQUIRED",
  "a4676419793d232359dfd7240bf1b0635b56f2a16aac4cb57f7e9ba459d50116-1": "SENTINEL_PING_EXPIRED",
  "f36420fff251df194de0251b70491df663e3dbed0c678f366a038b549c928c17-1": "NEW_START_REQUIRED",
  "66eddd00e5927d0a03437d5b8a2f15367c978ef7951c80ae1608a45b1bf64318-1": "ENABLED",
  "488cae91a9322ea3bb94ac783cce0d151d51529ec90a17e1c75bff381cdc671c-1": "ENABLED",
  "c33926bb3115a6b6bbcc13989837743d9f2e36dc47886b687e3b8309361b8c2d-1": "NEW_START_REQUIRED",
  "04390dd7fb4112bd4c2ab70906d8347749a30749fb18e80ba83c37500c02d12d-1": "ENABLED",
  "e3a6b7878a7e9413898bb379b323c521676f9d460db17ec3bf42d9ac0c9a432f-1": "SENTINEL_PING_EXPIRED",
  "7d5cc1fb5146d9a53b53c36107f46a6d2b7b110aa146628feeb1b5c2874c0a31-1": "ENABLED",
  "9c3d7033d670f3e4c0275069c835ab4670b0670cae23b509f509698dee4c0f34-1": "ENABLED",
  "866d66b88afed15ed1a936b680ace1a99e0ca14d0242bc2983c5fdd2c16c1637-1": "ENABLED",
  "1165254749f75622800ccca026e7d1a47c2bcf3b9b9a4fa7fbe0bfcb56fa2237-1": "ENABLED",
  "037735d68b6097a6ebd1e507a1bc39582cf4d0dcc96d4df0ee4f7c31c2fe2d37-1": "ENABLED",
  "6ba3614f2832800b9cbe01b90c7d50d10eca94d91a5ce839597954ff5db39038-1": "ENABLED",
  "7b6cfdafbc5f13e269e07310974de97e06d5fb0ee8125926eab500e0f2b9263c-1": "ENABLED",
  "34c3b5e1b891a17009cc9d7f207c1d6cb818ed6a303520f55917821c5ed1a63f-1": "ENABLED",
  "a7cada7173593b82b0b3b4c3ce4b316a1a3afbf94e7f218d476833fe2d022546-1": "ENABLED",
  "386ac02fae1ac02c57253dddce93a2f492266e9d685ab69521c5807ae381b947-1": "ENABLED",
  "3d64bd65cb84b935278420de3673cba33470a1e1996c4debfccb5d722254404c-1": "ENABLED",
  "8e5b1a4ca31b136c2ac523a488799b11e3b78e1794e9e88055ead3c6ff6cad4d-1": "NEW_START_REQUIRED",
  "9731e9da039780fd8c195e5cef87649bcd31e50cf0d2573e15ae57e948bff74d-1": "NEW_START_REQUIRED",
  "c41fe473ee643b95f0583c3a2839fe4492dda7fc3b8de6fac00b206204cfa04f-1": "NEW_START_REQUIRED",
  "a175efa6adce750f620e0e2b65c5336bc777668c21ab61c6d25d9f3492101551-1": "NEW_START_REQUIRED",
  "4489b5a53933f2525db033bdb7bd0fa6d4db7c4b7e6a2bfaf61c16a5073b9f51-1": "ENABLED",
  "aab5986b470495c1843f32ed7c2dce24eae5fc38899f594364cfbde1622b3d52-0": "NEW_START_REQUIRED",
  "f45e6b24faa0ab68cd8e32936481be744851f5223dfe914fa5615779f9919c54-0": "SENTINEL_PING_EXPIRED",
  "61c4696947438861222d7e992a049bfd2ed87f71eb806d8a111c973215141b59-1": "NEW_START_REQUIRED",
  "ea7e0a87aa823aa65d111ed767a4a02f55b3cd361cbd250908db00822e72fb59-1": "SENTINEL_PING_EXPIRED",
  "e2275d72303d0a78f1be2cd622f264ae52f66384f3bf75bac5d2d997a761235e-1": "ENABLED",
  "fa77ae59f7c973da2d0fea1c96b24d2ceb0dc3054e4baabc0475d9c6404a625e-1": "ENABLED",
  "3dadf953a250899164f0e75050d2cad2ae159c521d902168f4cead9243c79661-0": "NEW_START_REQUIRED",
  "1466e0a5b65428465ae00bc476ff4955a6d2f292b900f720a67ea10d90f90462-1": "SENTINEL_PING_EXPIRED",
  "66ab709c4132623279994a86af13e033b198e8a5b76290b288f314da94d80168-0": "NEW_START_REQUIRED",
  "6bd4437d523e7440fd3578be22b3e5d2bdabb89ae70f2161bdc1a2e8dbff656b-1": "ENABLED",
  "1b8a9b5f723e6fa1c3cb72f7d0160f3401886186cf972b3e44d3ad7bc995e370-1": "ENABLED",

}
{% endhighlight %}

Get a filtered Masternode list

{% highlight bash %}
dash-cli -testnet masternodelist full "NEW"
{% endhighlight %}

Result:
{% highlight json %}
{
  "6125fc1da46cd2fdd013b1fbb02144367a95feffd379c08064f38de0e3deb80c-1": "NEW_START_REQUIRED 70208 yh7RGWjZN8yDAAzPpYFUJZAj41jG7G43c8 1507401630        0 1507409411   5874 1.1.1.1:19999",
  "866d66b88afed15ed1a936b680ace1a99e0ca14d0242bc2983c5fdd2c16c1637-1": "NEW_START_REQUIRED 70208 yQHJ4muL7FyhUj1x8iBr2Ws9E4cJ68DKin 1507626190   138962 1507620650   7215 178.62.203.249:19999",
  "7c17695bdccc617410164882bd8b5fb7bf4f5a3dceb0a7476800e161cba1c57f-1": "NEW_START_REQUIRED 70208 yjWGCrz6iJnDsrog5FX6ag3iQUNor9UFj5 1507636178        0          0      0 83.1.99.1:19999",
  "0512f77ebceaf288386e9a050e3c80652c7bfb6e993659ded2dff43eae6904ac-1": "NEW_START_REQUIRED 70208 ydahSbZKWUjBi6jHeWjLgr7navPoZVCgwH 1507646277    32460 1507649163   7397 172.104.45.115:19999",
  "4222505288507e0f1abc32f0323cce1d6c4d22c8e785adb0cf8075b70ae92ddf-1": "NEW_START_REQUIRED 70208 yUznkRL396PewekhtCpUJkfJcxt8fhDyoX 1507646174     9996 1507642757   7355 83.1.99.2:19999",
  "b454dd0efc19657f8d56a750385b90ebfb53dce5182a21238b225d6cbb3307f0-1": "NEW_START_REQUIRED 70208 yYR5dcULfpnbPSixorzMkQ9SGwzPPsXcuC 1507401632        0 1507408648   5868 2.2.2.2:19999"
}
{% endhighlight %}

*See also:*

* [Masternode][rpc masternode]: {{summary_masternode}}
* [MasternodeBroadcast][rpc masternodebroadcast]: {{summary_masternodeBroadcast}}
* [MnSync][rpc mnsync]: {{summary_mnSync}}

{% endautocrossref %}
