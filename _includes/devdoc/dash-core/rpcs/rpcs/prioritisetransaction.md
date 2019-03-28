{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/prioritisetransaction.md" %}
<!--__-->

##### PrioritiseTransaction
{% include helpers/subhead-links.md %}

{% assign summary_prioritiseTransaction="adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)" %}

{% autocrossref %}

The `prioritisetransaction` RPC {{summary_prioritiseTransaction}}

*Parameter #1---the TXID of the transaction to modify*

{% itemplate ntpd1 %}
- n: "TXID"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the transaction whose virtual priority or fee you want to modify, encoded as hex in RPC byte order"

{% enditemplate %}

*Parameter #2---the change to make to the virtual fee*

{% itemplate ntpd1 %}
- n: "Fee"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "**Warning:** this value is in duffs, not Dash<br><br>If positive, the virtual fee to add to the actual fee paid by the transaction; if negative, the virtual fee to subtract from the actual fee paid by the transaction.  No change is made to the actual fee paid by the transaction"

{% enditemplate %}

*Result---`true` if the priority is changed*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "bool (true only)"
  p: "Required<br>(exactly 1)"
  d: "Always set to `true` if all three parameters are provided.  Will not return an error if the TXID is not in the memory pool.  If fewer or more than three arguments are provided, or if something goes wrong, will be set to `null`"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet prioritisetransaction \
    f86c74f27fdd9c7e618d69b3606eeae1710b3f02fabede6ae8c88dd7bb756942 \
    456789
{% endhighlight %}

Result:

{% highlight json %}
true
{% endhighlight %}

*See also*

* [GetRawMemPool][rpc getrawmempool]: {{summary_getRawMemPool}}
* [GetBlockTemplate][rpc getblocktemplate]: {{summary_getBlockTemplate}}

{% endautocrossref %}
