{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/masternodelist.md" %}

##### MasternodeList
{% include helpers/subhead-links.md %}

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
`status` | Print masternode status: PRE_ENABLED / ENABLED / EXPIRED / WATCHDOG_EXPIRED / NEW_START_REQUIRED / UPDATE_REQUIRED / POSE_BAN / OUTPOINT_SPENT (can be additionally filtered, partial match)

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

*Example from Dash Core 0.12.2*

Get unfiltered Masternode list in default mode

{% highlight bash %}
dash-cli -testnet masternodelist
{% endhighlight %}

Result:
{% highlight json %}
{
  "6125fc1da46cd2fdd013b1fbb02144367a95feffd379c08064f38de0e3deb80c-1": "NEW_START_REQUIRED",
  "a4676419793d232359dfd7240bf1b0635b56f2a16aac4cb57f7e9ba459d50116-1": "ENABLED",
  "2b5142cc7b5472cb34a28e7e1fdefe14f0b1ad4cc9fa9cdc68a169423c18c31d-1": "ENABLED",
  "4573c2ba5d9d3f8fd2f903cd0f448ee0ad0ff7e20d8f44a14cfce0bdc894c627-1": "ENABLED",
  "08c91dfff1f465b70377007426cd5edc37678991c9a864e39072409a5a0fd22a-1": "ENABLED",
  "e3a6b7878a7e9413898bb379b323c521676f9d460db17ec3bf42d9ac0c9a432f-1": "ENABLED",
  "866d66b88afed15ed1a936b680ace1a99e0ca14d0242bc2983c5fdd2c16c1637-1": "NEW_START_REQUIRED",
  "97034d0cfabef04388f3eb1c78a064607f8ed42013ed0fb821361d6592f03338-0": "ENABLED",
  "3003df6b886ed4b0cc84453d8034a546da03fc1052c2088b6b38fd84a4f6fa3f-1": "ENABLED",
  "61c4696947438861222d7e992a049bfd2ed87f71eb806d8a111c973215141b59-1": "ENABLED",
  "ea7e0a87aa823aa65d111ed767a4a02f55b3cd361cbd250908db00822e72fb59-1": "ENABLED",
  "f7851e7f670afa3e758d857c48d477b2f3e1ee37f22de2ca4a852f3885d32e6d-1": "EXPIRED",
  "f977fba1db0fd32708f0b9488be3806fed6f013a28630cff25ba06abd1f63d72-1": "ENABLED",
  "b418a47e8dfbdbb8eb88c1a153bef27dcbdb057eb136b2bb93b439fe74b8c174-1": "ENABLED",
  "7c17695bdccc617410164882bd8b5fb7bf4f5a3dceb0a7476800e161cba1c57f-1": "NEW_START_REQUIRED",
  "547a86612325ff23945b052a023537aaa68140920143bbf42bd10aec33348487-1": "ENABLED",
  "2c2cf299fdca7c07f820b1bc46bd786a1d57ac6c3d2e76ac24a5ba7641066488-0": "ENABLED",
  "75fdd0e1dea139333b71f06f3f2a7440629b3cd106e655ae50b56df7d9aa788b-1": "ENABLED",
  "320f83802b37f4bbf881cb565bb6e0884615d6b022a81a837cd3716f8dbcec93-0": "ENABLED",
  "049f30949af536b0a866f7d39d05447405565160399d12b4f0796936e8b9b9a7-1": "ENABLED",
  "0512f77ebceaf288386e9a050e3c80652c7bfb6e993659ded2dff43eae6904ac-1": "EXPIRED",
  "94ce1c802de83977fbed283806a1ebef2dcb5539ce9b6c5627c5ac1d844b48bb-1": "ENABLED",
  "b0320c1eff10ccb5e26086017a09e77dacb30fdcafccb3d98db3e5b610b9f1bd-1": "ENABLED",
  "2eab488e3a7b030303de0d18e357ce17a9fc6b8876705d61076bbe923b2e5fc8-1": "ENABLED",
  "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1": "ENABLED",
  "2fb6c98b37f1fce1c35b556e5f175dd77939f08c1687ad468d37fc677d297dd6-1": "ENABLED",
  "1e2502158eb22e53c07dbae483e89ebd7fb27e2c0412147d4d376b99df1d94db-1": "ENABLED",
  "cd0ee654eb517b8b5c36cfa09e1e5344d1766dc71406a112564636b7aef8c9db-1": "ENABLED",
  "4222505288507e0f1abc32f0323cce1d6c4d22c8e785adb0cf8075b70ae92ddf-1": "EXPIRED",
  "9f0cd683f88f79f757c6d68515dfb2b9fa5b65239b3c5f4487916aa233b9a4e0-1": "ENABLED",
  "2102df0dec504b4bd3a1e80b320c5205fe1a8b2fb1366be83c407f048fd62ce6-1": "ENABLED",
  "c6585f4ba88875eb2edc376b9ae24b74fd8c0ef89288923cf16a8fe2787b7ce8-1": "ENABLED",
  "b454dd0efc19657f8d56a750385b90ebfb53dce5182a21238b225d6cbb3307f0-1": "NEW_START_REQUIRED",
  "400f193988092f779104bab20eec042a2686a9903b1bbc84ece7539fd41103f3-1": "ENABLED",
  "a087bcb1c2f7fc71f081f2d8eeeeb4928ae21af2087c3d77ce5a5c4e88ec26f4-1": "ENABLED",
  "100a6ef1f9c660cfc6e47dab9905d7ca2a435f1870aba46847eae6503e2858fd-1": "ENABLED",
  "bbbe50330423337a13501e6273663884f7cb9b475f6d5cf090ba3dabc611d9fe-1": "ENABLED"
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
