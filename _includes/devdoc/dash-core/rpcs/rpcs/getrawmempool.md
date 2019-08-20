{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getrawmempool.md" %}

##### GetRawMemPool
{% include helpers/subhead-links.md %}

{% assign summary_getRawMemPool="returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object." %}

<!-- __ -->

{% autocrossref %}

The `getrawmempool` RPC {{summary_getRawMemPool}}

*Parameter---desired output format*

{% itemplate ntpd1 %}
- n: "Format"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Set to `true` to get verbose output describing each transaction in the memory pool; set to `false` (the default) to only get an array of TXIDs for transactions in the memory pool"

{% enditemplate %}

*Result (format `false`)---an array of TXIDs*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of TXIDs belonging to transactions in the memory pool.  The array may be empty if there are no transactions in the memory pool"

- n: "→<br>TXID"
  t: "string"
  p: "Optional<br>(0 or more)"
  d: "The TXID of a transaction in the memory pool, encoded as hex in RPC byte order"

{% enditemplate %}

*Result (format: `true`)---a JSON object describing each transaction*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "A object containing transactions currently in the memory pool.  May be empty"

- n: "→<br>TXID"
  t: "string : object"
  p: "Optional<br>(0 or more)"
  d: "The TXID of a transaction in the memory pool, encoded as hex in RPC byte order"

- n: "→ →<br>`size`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The size of the serialized transaction in bytes"

- n: "→ →<br>`fee`"
  t: "amount (Dash)"
  p: "Required<br>(exactly 1)"
  d: "The transaction fee paid by the transaction in decimal Dash"

- n: "→ →<br>`modifiedfee`"
  t: "amount (Dash)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The transaction fee with fee deltas used for mining priority in decimal Dash"

- n: "→ →<br>`time`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The time the transaction entered the memory pool, Unix epoch time format"

- n: "→ →<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The block height when the transaction entered the memory pool"

- n: "→ →<br>`startingpriority`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The priority of the transaction when it first entered the memory pool"

- n: "→ →<br>`currentpriority`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The current priority of the transaction"

- n: "→ →<br>`descendantcount`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The number of in-mempool descendant transactions (including this one)"

- n: "→ →<br>`descendantsize`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The size of in-mempool descendants (including this one)"

- n: "→ →<br>`descendantfees`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The modified fees (see `modifiedfee` above) of in-mempool descendants (including this one)"

- n: "→ →<br>`ancestorcount`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The number of in-mempool ancestor transactions (including this one)"

- n: "→ →<br>`ancestorsize`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The size of in-mempool ancestors (including this one)"

- n: "→ →<br>`ancestorfees`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)"

- n: "→ →<br>`depends`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty"

- n: "→ → →<br>Depends TXID"
  t: "string"
  p: "Optional (0 or more)"
  d: "The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order"

- n: "→ →<br>`instantlock`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.12.3*<br><br>Set to `true` for locked InstantSend transactions (masternode quorum has locked the transaction inputs via `txlvote` messages). Set to `false` if the masternodes have not approved the InstantSend transaction"

{% enditemplate %}

*Examples from Dash Core 0.12.3*

The default (`false`):

{% highlight bash %}
dash-cli getrawmempool
{% endhighlight %}

Result:

{% highlight json %}
[
  "9dc994e03e387ff2d2709fbe86edede9f3d7aaddea7f75694495e415561b22fe"
]
{% endhighlight %}

Verbose output (`true`):

{% highlight bash %}
dash-cli getrawmempool true
{% endhighlight %}

Result:

{% highlight json %}
{
  "3bf4985183ddebcb6b1d58fa04dae9728a8f2bf20be298d81e38a8bd2f50ea47": {
    "size": 225,
    "fee": 0.00000226,
    "modifiedfee": 0.00000226,
    "time": 1566315512,
    "height": 159318,
    "descendantcount": 1,
    "descendantsize": 225,
    "descendantfees": 226,
    "ancestorcount": 2,
    "ancestorsize": 5760,
    "ancestorfees": 5780,
    "depends": [
      "1b8fdb3ce371c1274ee60df807d631320e7efaf30e7867584eb44b8ec4c19d12"
    ],
    "instantlock": true
  },
  "1b8fdb3ce371c1274ee60df807d631320e7efaf30e7867584eb44b8ec4c19d12": {
    "size": 5535,
    "fee": 0.00005554,
    "modifiedfee": 0.00005554,
    "time": 1566315441,
    "height": 159318,
    "descendantcount": 2,
    "descendantsize": 5760,
    "descendantfees": 5780,
    "ancestorcount": 1,
    "ancestorsize": 5535,
    "ancestorfees": 5554,
    "depends": [
    ],
    "instantlock": true
  }
}
{% endhighlight %}

*See also*

* [GetMemPoolInfo][rpc getmempoolinfo]: {{summary_getMemPoolInfo}}
* [GetMemPoolEntry][rpc getmempoolentry]: {{summary_getMemPoolEntry}}
* [GetTxOutSetInfo][rpc gettxoutsetinfo]: {{summary_getTxOutSetInfo}}

{% endautocrossref %}
