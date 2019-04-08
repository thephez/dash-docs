{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/listsinceblock.md" %}

##### ListSinceBlock
{% include helpers/subhead-links.md %}

{% assign summary_listSinceBlock="gets all transactions affecting the wallet which have occurred since a particular block, plus the header hash of a block at a particular depth." %}

<!-- __ -->

{% autocrossref %}

*Requires wallet support.*

The `listsinceblock` RPC {{summary_listSinceBlock}}

*Parameter #1---a block header hash*

{% itemplate ntpd1 %}
- n: "Header Hash"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of a block header encoded as hex in RPC byte order.  All transactions affecting the wallet which are not in that block or any earlier block will be returned, including unconfirmed transactions.  Default is the hash of the genesis block, so all transactions affecting the wallet are returned by default"

{% enditemplate %}

*Parameter #2---the target confirmations for the lastblock field*

{% itemplate ntpd1 %}
- n: "Target Confirmations"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "Sets the lastblock field of the results to the header hash of a block with this many confirmations.  This does not affect which transactions are returned.  Default is `1`, so the hash of the most recent block on the local best block chain is returned"

{% enditemplate %}

*Parameter #3---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

**Result**

{% assign DEPTH="→ → → " %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "An object containing an array of transactions and the lastblock field"

- n: "→<br>`transactions`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of objects each describing a particular **payment** to or from this wallet.  The objects in this array do not describe an actual transactions, so more than one object in this array may come from the same transaction.  This array may be empty"

- n: "→ →<br>Payment"
  t: "object"
  p: "Optional<br>(0 or more)"
  d: "An payment which did not appear in the specified block or an earlier block"

{{INCLUDE_F_LIST_TRANSACTIONS}}
{{INCLUDE_F_LIST_TRANSACTIONS_F_FULL}}
- n: "→<br>`lastblock`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The header hash of the block with the number of confirmations specified in the *target confirmations* parameter, encoded as hex in RPC byte order"

{% enditemplate %}

*Example from Dash Core 0.14.0*

Get all transactions since a particular block (including watch-only
transactions) and the header hash of the sixth most recent block.

{% highlight bash %}
dash-cli -testnet listsinceblock \
              00000000688633a503f69818a70eac281302e9189b1bb57a76a05c329fcda718 \
              6 true
{% endhighlight %}

Result (edited to show only two payments):

{% highlight json %}
{
  "transactions": [
    {
      "account": "",
      "address": "yLXe1NwXmhZbtM6drTXbWFvtEqpsJZkKd2",
      "category": "send",
      "amount": -1.00000000,
      "label": "Receiving",
      "vout": 0,
      "fee": -0.00000226,
      "confirmations": 0,
      "instantlock": true,
      "chainlock": false,
      "trusted": true,
      "txid": "cc2e6c49faae395d79cfc91d188881e479f544c220e4dfee016889cd53b32645",
      "walletconflicts": [
      ],
      "time": 1554734925,
      "timereceived": 1554734925,
      "abandoned": false
    },
    {
      "account": "",
      "address": "yLXe1NwXmhZbtM6drTXbWFvtEqpsJZkKd2",
      "category": "receive",
      "amount": 1.00000000,
      "label": "Receiving",
      "vout": 0,
      "confirmations": 0,
      "instantlock": true,
      "chainlock": false,
      "trusted": true,
      "txid": "cc2e6c49faae395d79cfc91d188881e479f544c220e4dfee016889cd53b32645",
      "walletconflicts": [
      ],
      "time": 1554734925,
      "timereceived": 1554734925
    }
  ],
  "lastblock": "0000000006be841cd8534b02733d833ad9dd7634ab0897a7e5cd92c574a529a3"
}
{% endhighlight %}

*See also*

* [ListReceivedByAccount][rpc listreceivedbyaccount]: {{summary_listReceivedByAccount}}
* [ListReceivedByAddress][rpc listreceivedbyaddress]: {{summary_listReceivedByAddress}}

{% endautocrossref %}
