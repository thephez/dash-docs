{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/masternode.md" %}

##### Masternode
{% include helpers/subhead-links.md %}

{% assign summary_masternode="provides a set of commands for managing masternodes and displaying information about them." %}

<!-- __ -->

{% autocrossref %}

The `masternode` RPC {{summary_masternode}}

{% endautocrossref %}

###### Masternode<!--noref--> Count
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> count` RPC prints the number of all known masternodes.

*Parameter #1---mode*

{% itemplate ntpd1 %}
- n: "Mode"
  t: "string (hex)"
  p: "Deprecated"
  d: "Which masternodes to count:<br>`total` - Pre-0.12.3 default result,<br>`ps` - PrivateSend capable,<br>`enabled` - Enabled,<br>`all` - All,<br>`qualify` - Eligible for payment"

{% enditemplate %}

*Result---number of known masternodes*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Masternode count by mode"

- n: "→<br>`total`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Count of all masternodes"

- n: "→<br>`enabled`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Count of enabled masternodes"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet masternode count
{% endhighlight %}

Result:
{% highlight bash %}
{
  "total": 185,
  "enabled": 130
}
{% endhighlight %}


**Get summarized count of all masternodes**

*Result---summary of known masternodes*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Summary of masternodes in each state"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet masternode count all
{% endhighlight %}

Result:
{% highlight bash %}
Total: 185 (Enabled: 130)
{% endhighlight %}

**Get total count of all masternodes (default output of `masternode<!--noref--> count` pre-0.12.3)**

*Result---number of known masternodes in mode*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Number of masternodes"

{% enditemplate %}

*Example from Dash Core 0.12.3*

{% highlight bash %}
dash-cli -testnet masternode count total
{% endhighlight %}

Result:
{% highlight bash %}
142
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> Current
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> current` RPC prints info on current masternode winner to be paid the next block (calculated locally).

*Parameters: none*

*Result---current winning masternode info*

{% itemplate ntpd1 %}
- n: "Result"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Winning masternode info"

- n: "→<br>`height`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height"

- n: "→<br>`IP:port`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The IP address/port of the masternode"

- n: "→<br>`protocol`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The protocol version number used by this node.  See the [protocol versions section][section protocol versions] for more information"

- n: "→<br>`outpoint`"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "The masternode's outpoint"

- n: "→<br>`payee`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Payee address"

- n: "→<br>`lastseen`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The Unix epoch time when the masternode was last seen"

- n: "→<br>`activeseconds`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of seconds the masternode has been active"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet masternode current
{% endhighlight %}

Result:
{% highlight json %}
{
  "height": 37375,
  "IP:port": "108.61.192.47:19999",
  "protocol": 70208,
  "outpoint": "3df7fb192e21c34da99bdd10c34e58ecaf3f3c37d6b2289f0ffedba5050188cc-1",
  "payee": "ydGgePy4a3zza37Zm4D44B99czyo6TftU1",
  "lastseen": 1512482630,
  "activeseconds": 3170434
}
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> Outputs<!--noref-->
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> outputs` RPC prints masternode compatible outputs.

*Parameters: none*

*Result---masternode outputs*

{% itemplate ntpd1 %}
- n: "Result"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Masternode compatible outputs"

- n: "→<br>Output"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "Masternode compatible output (TXID:Index)"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet masternode outputs
{% endhighlight %}

Result:
{% highlight json %}
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f": "1"
}
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> Status
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> status` RPC prints masternode status information.

*Parameters: none*

*Result---masternode status info*

{% itemplate ntpd1 %}
- n: "Result"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Masternode status info"

- n: "→<br>`outpoint`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The masternode's outpoint"

- n: "→<br>`service`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The IP address/port of the masternode"

- n: "→<br>`proTxHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The masternode's ProRegTx hash"

- n: "→<br>`collateralHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The masternode's collateral hash"

- n: "→<br>`collateralIndex`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Index of the collateral"

- n: "→<br>`dmnState`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Deterministic Masternode State"

- n: "→<br>`service`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The IP address/port of the masternode"

- n: "→ →<br>`registeredHeight`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height at which the masternode was registered"

- n: "→ →<br>`lastPaidHeight`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height at which the masternode was last paid"

- n: "→ →<br>`PoSePenalty`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Current proof-of-service penalty"

- n: "→ →<br>`PoSeRevivedHeight`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height at which the masternode was last revived from a PoSe ban"

- n: "→ →<br>`PoSeBanHeight`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height at which the masternode was last PoSe banned"

- n: "→ →<br>`revocationReason`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Reason code for of masternode operator key revocation"

- n: "→ →<br>`ownerAddress`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The owner address"

- n: "→ →<br>`votingAddress`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The voting address"

- n: "→ →<br>`payoutAddress`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The payout address"

- n: "→ →<br>`pubKeyOperator`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The operator public key"

- n: "→ →<br>`operatorPayoutAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "The operator payout address"

- n: "→<br>`status`"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "The masternode's status"

{% enditemplate %}

*Example from Dash Core 0.13.2*

{% highlight bash %}
dash-cli -testnet masternode status
{% endhighlight %}

Result:
{% highlight json %}
{
  "outpoint": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357-0",
  "service": "45.32.237.76:19999",
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "collateralHash": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357",
  "collateralIndex": 0,
  "dmnState": {
    "service": "45.32.237.76:19999",
    "registeredHeight": 7402,
    "lastPaidHeight": 59721,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": 61915,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "yT8DDY5NkX4ZtBkUVz7y1RgzbakCnMPogh",
    "votingAddress": "yMLrhooXyJtpV3R2ncsxvkrh6wRennNPoG",
    "payoutAddress": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
    "pubKeyOperator": "02a2e2673109a5e204f8a82baf628bb5f09a8dfc671859e84d2661cae03e6c6e198a037e968253e94cd099d07b98e94e"
  },
  "state": "READY",
  "status": "Ready"
}
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> List
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> list` prints a list of all known masternodes.

This RPC uses the same parameters and returns the same data as
[masternodelist][rpc masternodelist]. Please reference it for full details.

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet masternode list \
	rank f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f
{% endhighlight %}

Result:
{% highlight json %}
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1": 11
}
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> Winner
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> winner` RPC prints info on the next masternode winner to vote for.

*Parameters: none*

*Result---next masternode winner info*

{% itemplate ntpd1 %}
- n: "Result"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Winning masternode info"

- n: "→<br>`height`"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Block height"

- n: "→<br>`IP:port`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The IP address/port of the masternode"

- n: "→<br>`protocol`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The protocol version number used by this node.  See the [protocol versions section][section protocol versions] for more information"

- n: "→<br>`outpoint`"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "The masternode's outpoint"

- n: "→<br>`payee`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Payee address"

- n: "→<br>`lastseen`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The Unix epoch time when the masternode was last seen"

- n: "→<br>`activeseconds`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of seconds the masternode has been active"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet masternode winner
{% endhighlight %}

Result:
{% highlight json %}
{
  "height": 37384,
  "IP:port": "145.239.235.17:29999",
  "protocol": 70208,
  "outpoint": "66eddd00e5927d0a03437d5b8a2f15367c978ef7951c80ae1608a45b1bf64318-1",
  "payee": "yY3q6wqRe1y7xzHbGE88YfRg4t97GU7BJ6",
  "lastseen": 1512482474,
  "activeseconds": 1180019
}
{% endhighlight %}

{% endautocrossref %}

###### Masternode<!--noref--> Winners
<!-- no subhead-links here -->

{% autocrossref %}

The `masternode<!--noref--> winners` RPC prints the list of masternode winners.

By default, the 10 previous block winners, the current block winner, and the
next 20 block winners are displayed. More past block winners can be requested
via the optional `count` parameter.

*Parameter #1---count*

{% itemplate ntpd1 %}
- n: "Count"
  t: "string (hex)"
  p: "Optional<br>(exactly 1)"
  d: "Number of previous block winners to display (default: 10)"

{% enditemplate %}

*Parameter #2---filter*

{% itemplate ntpd1 %}
- n: "Filter"
  t: "string"
  p: "Optional<br>(exactly 1)"
  d: "Payment address to filter by"

{% enditemplate %}

*Result---masternode winners*

{% itemplate ntpd1 %}
- n: "Result"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Winning masternode info"

- n: "→<br>Masternode Winner"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "Key: Block height<br>Value: payee address"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet masternode winners
{% endhighlight %}

Result (current block - 37458):
{% highlight json %}
{
  "37448": "ygSWwhyzU61FNEta8gDh8gfoH5EZZUvc5m:8",
  "37449": "yjGZLzSSoFfTFgLDJrgniXfYxu3xF9xKQg:5",
  "37450": "yRTo1wXWoNnPFWcQVepKGXuLsoypnPkGWj:7",
  "37451": "yYMFRAYZ25XspHZ1EXC39wUMx9FhoC5VT2:9",
  "37452": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v:7",
  "37453": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v:4",
  "37454": "yUamtYUFhqUxCMny3JTcZJTyttVt8SYFug:9",
  "37455": "yU35XcdGMnj8Exa2ZZqCg4ongiNqQwpeUZ:9",
  "37456": "yaJc6tADbEjxQBAC69ugWNoTFpzxqkcgWd:7",
  "37457": "yf4WpwRX17p7YRkHJPQpHMXTwzi5s2VDcR:7",
  "37458": "ydbfUYWfLm6xg7Y5aBLjy38DvksrvNcHEc:9",
  "37459": "yYp9k2iuDptT2MB7qVZtVy6ModHtLXFjio:6",
  "37460": "yP1UHNx26ShYLej56SbHiTiPAUv2QppbUv:6",
  "37461": "yaCtZRpiYnVFMyWELHZF74v9ayLKCLPcC9:8",
  "37462": "ygYFnLHoVRyhRoxd6fXQ9nmEafX4eLoWkB:6",
  "37463": "yM5kTThWi8MnAFtZqx98Zipp1BbyypUZGK:7",
  "37464": "yeDY39aiqbBHbJft5F6rokR23EaZca6UTU:9",
  "37465": "yMME1ns1xfpGS2XbFPktsNyp7Cjr1BoJxb:8",
  "37466": "ycn5RWc4Ruo35FTS8bJwugVyCEkfVcrw9a:6",
  "37467": "yUTDkKKhbvDrnwkiaoP8HvqxTNC6rNnUe2:6",
  "37468": "yTstes2nSaSpvu9nTapiCGnjCLvLD5fUqt:5",
  "37469": "Unknown",
  "37470": "Unknown",
  "37471": "Unknown",
  "37472": "Unknown",
  "37473": "Unknown",
  "37474": "Unknown",
  "37475": "Unknown",
  "37476": "Unknown",
  "37477": "Unknown"
}
{% endhighlight %}

Get a filtered list of masternode winners

{% highlight bash %}
dash-cli -testnet masternode winners 150 "yTZ99"
{% endhighlight %}

Result:
{% highlight json %}
{
  "37338": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:9",
  "37339": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:8",
  "37432": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:6",
  "37433": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:9"
}
{% endhighlight %}


**Deprecated RPCs**

![Warning icon](/img/icons/icon_warning.svg) The following RPCs were deprecated by Dash Core 0.14.0

**Masternode<!--noref--> Check**

Forces a check of all masternodes and removes invalid ones.


**Masternode<!--noref--> Genkey**

Generates a new masternodeprivkey.


**Masternode<!--noref--> Start-alias**

Starts a single remote masternode by assigned alias configured in masternode<!--noref-->.conf.


**Masternode<!--noref--> Start-mode**

Starts remote masternodes configured in masternode<!--noref-->.conf. Valid modes are: `all`, `missing`, or `disabled`.


**Masternode<!--noref--> List-conf**

Prints masternode.conf in JSON format.


*See also:*

* [MasternodeList][rpc masternodelist]: {{summary_masternodeList}}

{% endautocrossref %}
