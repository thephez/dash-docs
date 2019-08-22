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

*Parameter #4---include_removed*

{% itemplate ntpd1 %}
- n: "include_removed"
  t: "bool"
  p: "Optional<br>Default=`true`"
  d: "Show transactions that were removed due to a reorg in the \"removed\" array (not guaranteed to work on pruned nodes)"

{% enditemplate %}

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
- n: "→<br>`removed`"
  t: "array"
  p: "Optional<br>(0 or 1)"
  d: "Structure is the same as `transactions`. Only present if `include_removed` is `true`.<br>_Note_: transactions that were re-added in the active chain will appear as-is in this array, and may thus have a positive confirmation count."

- n: "→<br>`lastblock`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The header hash of the block with the number of confirmations specified in the *target confirmations* parameter, encoded as hex in RPC byte order"

{% enditemplate %}

*Example from Dash Core 0.14.1*

Get all transactions since a particular block (including watch-only
transactions) and the header hash of the sixth most recent block.

{% highlight bash %}
dash-cli -testnet listsinceblock \
              0000000001fc119ea77e0c67783227fb9d55386125179ea5597109d311af2337 \
              6 true true
{% endhighlight %}

Result (edited to show only two payments):

{% highlight json %}
{
  "transactions": [
    {
      "account": "",
      "address": "yMaodAgCofB2gmHEtATAiV3w5NkzTpmkgS",
      "category": "send",
      "amount": -2365.65209808,
      "label": "Mining Consolidation",
      "vout": 0,
      "fee": -0.00031420,
      "confirmations": 5,
      "instantlock": true,
      "instantlock_internal": false,
      "chainlock": true,
      "blockhash": "00000000001c4e142c6deaa273206706d37a7aa792887d9bd81ae787d4259137",
      "blockindex": 1,
      "blocktime": 1566399553,
      "txid": "bb8a2789c3166181cc190e0fd7675770217b69c9aeafe0d8207baf1ebeb05845",
      "walletconflicts": [
      ],
      "time": 1566399271,
      "timereceived": 1566399271,
      "abandoned": false
    },
    {
      "account": "Mining Consolidation",
      "address": "yMaodAgCofB2gmHEtATAiV3w5NkzTpmkgS",
      "category": "receive",
      "amount": 2365.65209808,
      "label": "Mining Consolidation",
      "vout": 0,
      "confirmations": 5,
      "instantlock": true,
      "instantlock_internal": false,
      "chainlock": true,
      "blockhash": "00000000001c4e142c6deaa273206706d37a7aa792887d9bd81ae787d4259137",
      "blockindex": 1,
      "blocktime": 1566399553,
      "txid": "bb8a2789c3166181cc190e0fd7675770217b69c9aeafe0d8207baf1ebeb05845",
      "walletconflicts": [
      ],
      "time": 1566399271,
      "timereceived": 1566399271
    }
  ],
  "removed": [
  ],
  "lastblock": "000000000158ad1e4eab53044e18aaf76e605a27252862d4f1d78cfd373f1686"
}
{% endhighlight %}

*See also*

* [ListReceivedByAccount][rpc listreceivedbyaccount]: {{summary_listReceivedByAccount}}
* [ListReceivedByAddress][rpc listreceivedbyaddress]: {{summary_listReceivedByAddress}}

{% endautocrossref %}
