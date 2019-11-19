{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getchaintxstats.md" %}
<!--__-->

##### GetChainTxStats
{% include helpers/subhead-links.md %}

{% assign summary_getChainTxStats="compute statistics about the total number and rate of transactions in the chain." %}

{% autocrossref %}

The `getchaintxstats` RPC {{summary_getChainTxStats}}

*Parameter #1---nblocks*

{% itemplate ntpd1 %}
- n: "nblocks"
  t: "number (int)"
  p: "Optional"
  d: "Size of the window in number of blocks (default: one month)."

{% enditemplate %}

*Parameter #2---blockhash*

{% itemplate ntpd1 %}
- n: "blockhash"
  t: "string"
  p: "Optional"
  d: "The hash of the block that ends the window."

{% enditemplate %}

*Result--statistics about transactions*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Object containing transaction statistics"

- n: "→<br>`time`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The timestamp for the statistics in UNIX format"

- n: "→<br>`txcount`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The total number of transactions in the chain up to that point"

- n: "→<br>`txrate`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The average rate of transactions per second in the window"

{% enditemplate %}

*Example from Dash Core 0.15.0*

{% highlight bash %}
dash-cli -testnet getchaintxstats
{% endhighlight %}

Result:
{% highlight json %}
{
  "time": 1566416832,
  "txcount": 1353139,
  "txrate": 0.04107376448354556
}
{% endhighlight %}

*See also: none*

{% endautocrossref %}
