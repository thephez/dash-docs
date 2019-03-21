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
`addr` | Print IP address associated with a masternode (can be additionally filtered, partial match)
`full` | Print info in format 'status payee lastpaidtime lastpaidblock IP' (can be additionally filtered, partial match)
`info` | Print info in format 'status payee IP' (can be additionally filtered, partial match)
`json` (Default) | Print info in JSON format (can be additionally filtered, partial match)
`lastpaidblock` | Print the last block height a node was paid on the network
`lastpaidtime` | Print the last time a node was paid on the network
`owneraddress` | Print the masternode owner Dash address
`payee` | Print Dash address associated with a masternode (can be additionally filtered, partial match)
`pubKeyOperator` | Print the masternode operator public key
`status` | Print masternode status: ENABLED / POSE_BANNED (can be additionally filtered, partial match)
`votingaddress` | Print the masternode voting Dash address

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
  "64fbf05880cdbd35a0278ba01a5edf0c20a9c756d15f883d496f5df35b31b542-1": {
    "address": "167.99.164.60:19999",
    "payee": "ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX",
    "status": "ENABLED",
    "lastpaidtime": 1553155206,
    "lastpaidblock": 65121,
    "owneraddress": "yisedvAxYga44V9bTABzoQ7KoQMugyfU1E",
    "votingaddress": "yVpKfQgjkRkezFS5SpZvAEVFsbv9zJedf4",
    "collateraladdress": "yeXE94admJeH3oKiaB7UpwWnPZD6Q8srhT",
    "pubkeyoperator": "8072ac9a55d1cf5bf9c4262d49e2ef1ffcd716b8983ffdc62b940fec6cb4179d6275f8b68316f29c6c2ad540db329258"
  },
  "6ed4aa5fa90565c2331bcd22275f684ecdca5da8dd7f83ca943aadc6f44e6746-0": {
    "address": "3.209.222.37:19999",
    "payee": "yiVDR2HothEwH2Ss17GntqNp1rBUthnyje",
    "status": "ENABLED",
    "lastpaidtime": 1553156846,
    "lastpaidblock": 65140,
    "owneraddress": "ycAZ9adjpGfZ2WLEpyfyUWAjkF6sXdD5df",
    "votingaddress": "ycAZ9adjpGfZ2WLEpyfyUWAjkF6sXdD5df",
    "collateraladdress": "ya82BzRBhuFZAPhgXvhkzZgqiVsMdnfan7",
    "pubkeyoperator": "0a7fd01cfd502296cfd523d58ee9f4cff34243abb0dcc543ec237ff4d73938e69d187f0b6838bbaf9d54b89adc0d4c8e"
  },
  "4ee8c581255b643d805502e2997acb3c38deb57dc9483659d77332fd5a17de9d-6": {
    "address": "52.50.208.53:20005",
    "payee": "ybFPBD7hm9KVd2Dubj97K5mw2ymR8gWJre",
    "status": "ENABLED",
    "lastpaidtime": 1553168003,
    "lastpaidblock": 65194,
    "owneraddress": "yV97rchAqU7UGyXPZe392TNARfR93VKuU2",
    "votingaddress": "ygtDvoyioQ8Dc87A3moFgBrd97QxuiMiAR",
    "collateraladdress": "ySQwPov5nLCJ4qWAB31tPTyY8kDZVNZrXM",
    "pubkeyoperator": "8dfa69a96f23bd77e72c1a00984bb0df5ce93a76ca1d20694e8ad20b1dfea530cb6ee0b964b78ebb2bc8bfac22f61647"
  },
  "4758b97bbd20024e171767b8baf4290bec1475b254180869cdfe0db75d7faefb-0": {
    "address": "68.183.167.16:19999",
    "payee": "ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX",
    "status": "ENABLED",
    "lastpaidtime": 1553157194,
    "lastpaidblock": 65147,
    "owneraddress": "yPmESxMJhZYuKDLJ1oYdH6kpE8oADVAPUQ",
    "votingaddress": "yLvTNLDLHa3pDMbFDRBX5mVMjCshzrDD1X",
    "collateraladdress": "ydGCjUEVRHkQZK3ajCsGJGDE9sjrbbS56v",
    "pubkeyoperator": "18af4d035eed23d30eb02808af0c133d9879c0fb82c72329ab2ed208ebc1631641ca42bbf462239d151f4e84d8dcde7b"
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
  "64fbf05880cdbd35a0278ba01a5edf0c20a9c756d15f883d496f5df35b31b542-1": "           ENABLED ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX 1553155206  65121 167.99.164.60:19999",
  "809818107c1104bbba6d386567aa231a294219387e591542df599b7ae7d23339-1": "       POSE_BANNED yLriZkwBhftk8VBUqrSykhFhAi4PowZ2Rs 1547488185  24447 45.48.177.222:19999",
  "d9fd715b7d896f5426e90bd3383a67fd3e311e00c021750560c6e5c5f9cdac85-1": "           ENABLED yRbiW3dguCym4fzUGZCf2kWzKUgw97zEqE 1553155396  65122 109.235.71.56:19999",
  "0950cce784fadcc2df4febb19d3a21eab4836ba22ea996ce7e2dde32b6c31431-0": "           ENABLED ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX 1553154969  65119 165.227.63.223:19999",
  "08b493929f61a3205f09af9290af9034bec6a8355040a82ce4413f294c703e9a-0": "           ENABLED ybCE7m9oPjvCjm8MzPdbMBGgkF7p9wXsFq 1553153959  65110 34.207.45.58:19999",
  "b4f9de65ae676b63f84f2865317b8b512a12516c4459f2f59ca2626c71f7dda3-1": "       POSE_BANNED yYmromZERpc15GTDvgvjmjChPmgHbhWf1r          0      0 1.1.1.1:19999",
  "b7ec36db0c4ece8018183dcb90eed910e38e1c8d3641bbb4facced9a48a283a3-5": "           ENABLED ybFPBD7hm9KVd2Dubj97K5mw2ymR8gWJre 1553164088  65172 18.202.52.170:20028",
  "71fa05269adf3efc9ffa9a9ce33d27320de61c230cdf4a3835ba7f707bd7807a-1": "       POSE_BANNED yVxBZ8JeM5qRbLnUnswZ2APV3rgeZ7C9n9 1552466625  61158 167.99.110.59:19999"
}
{% endhighlight %}

*See also:*

* [Masternode][rpc masternode]: {{summary_masternode}}
* [MnSync][rpc mnsync]: {{summary_mnSync}}

{% endautocrossref %}
