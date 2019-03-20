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

*Mode Options (Default=json)*

Mode | Description
--- | --- | --- |
`activeseconds` | Print number of seconds masternode recognized by the network as enabled (since latest issued \"masternodestart/start-many/start-alias\")
`addr` | Print ip address associated with a masternode (can be additionally filtered, partial match)
`daemon` | Print daemon version of a masternode (can be additionally filtered, exact match)
`full` | Print info in format 'status protocol payee lastseen activeseconds lastpaidtime lastpaidblock IP' (can be additionally filtered, partial match)
`info` | Print info in format 'status protocol payee lastseen activeseconds sentinelversion sentinelstate IP' (can be additionally filtered, partial match)
`json` (Default) | Print info in JSON format (can be additionally filtered, partial match)
`lastpaidblock` | Print the last block height a node was paid on the network
`lastpaidtime` | Print the last time a node was paid on the network
`lastseen` | Print timestamp of when a masternode was last seen on the network
`payee` | Print Dash address associated with a masternode (can be additionally filtered, partial match)
`protocol` | Print protocol of a masternode (can be additionally filtered, exact match)
`keyid` | Print the masternode (not collateral) key id
`rank` | Print rank of a masternode based on current block
`sentinel` | Print sentinel version of a masternode (can be additionally filtered, exact match)
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

*Example from Dash Core 0.13.2*

Get unfiltered Masternode list in default mode

{% highlight bash %}
dash-cli -testnet masternodelist
{% endhighlight %}

Result:
{% highlight json %}
{
  "c568e386687bb317e52f4dcb402e83a93a13a43df6da029c95834ed2603c1f01-0": {
    "address": "173.61.30.231:19003",
    "payee": "yWc9sVgvRi6mB81KZLwchwUjjCNmF6ktaJ",
    "status": "ENABLED",
    "protocol": 70213,
    "daemonversion": "Unknown",
    "sentinelversion": "Unknown",
    "sentinelstate": "expired",
    "lastseen": 0,
    "activeseconds": -1553091168,
    "lastpaidtime": 1553077123,
    "lastpaidblock": 64693,
    "owneraddress": "yjW7bQrKBsMV8Wh19LgT8Z1uLkWY8P2EBd",
    "votingaddress": "yjW7bQrKBsMV8Wh19LgT8Z1uLkWY8P2EBd",
    "collateraladdress": "yVZjfAYphQeyFj3XKGJ7FE7n4A9Lok1X7y"
  },
  "bc3b58904a9f09b4641ffece61af28744826fffa00aabe45ef40af959a78690c-1": {
    "address": "52.42.213.147:19999",
    "payee": "yXsKagNKcHkE2eUKQe8Sf2Z32SKrmQ6XEJ",
    "status": "ENABLED",
    "protocol": 70213,
    "daemonversion": "Unknown",
    "sentinelversion": "Unknown",
    "sentinelstate": "expired",
    "lastseen": 0,
    "activeseconds": -1553091168,
    "lastpaidtime": 1553078267,
    "lastpaidblock": 64747,
    "owneraddress": "yeARCinqiurM9oni3VQ2Grm3Z6tXYxfKAR",
    "votingaddress": "yeARCinqiurM9oni3VQ2Grm3Z6tXYxfKAR",
    "collateraladdress": "yUq2J9YhZXSTQ76ifm9BHFvTtDMhWR8v6k"
  },
  "8b4a475fec02166c0d4a1dc6ede23e236a4cd07bb31d959fe5ed155fdc902b18-0": {
    "address": "95.183.53.17:10003",
    "payee": "yYdXDDtfzSkRKUBDLH8qW2AfvehD1M9gM8",
    "status": "ENABLED",
    "protocol": 70213,
    "daemonversion": "Unknown",
    "sentinelversion": "Unknown",
    "sentinelstate": "expired",
    "lastseen": 0,
    "activeseconds": -1553091168,
    "lastpaidtime": 1553078177,
    "lastpaidblock": 64743,
    "owneraddress": "yW9zeJrPv5yJf71qvNfyPrJg8Me9UdaDP3",
    "votingaddress": "yW9zeJrPv5yJf71qvNfyPrJg8Me9UdaDP3",
    "collateraladdress": "yX91ss7HuAH85TAv7tq5dVdMXJ68d4vJHT"
  },
  "d0a5d2bb6316a78e1e82569f625b56f68d7578eb2e22949f2a652bb1915f881b-1": {
    "address": "140.82.59.51:19999",
    "payee": "yYRfiUCoTjYAontZHqd7wAw7PhR2zru55V",
    "status": "ENABLED",
    "protocol": 70213,
    "daemonversion": "Unknown",
    "sentinelversion": "Unknown",
    "sentinelstate": "expired",
    "lastseen": 0,
    "activeseconds": -1553091168,
    "lastpaidtime": 1553077735,
    "lastpaidblock": 64724,
    "owneraddress": "yX2VYLpM9ybXZHTbTEmND581QZSNRHucWm",
    "votingaddress": "yX2VYLpM9ybXZHTbTEmND581QZSNRHucWm",
    "collateraladdress": "ygkUtF9AbUwmGVjq2vfCUp4Znd3X9QiEqv"
  }
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
