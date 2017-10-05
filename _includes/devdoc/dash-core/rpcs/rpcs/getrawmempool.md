{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getrawmempool.md" %}

##### GetRawMemPool
{% include helpers/subhead-links.md %}

{% assign summary_getRawMemPool="returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object." %}

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
  t: "number (bitcoins)"
  p: "Required<br>(exactly 1)"
  d: "The transaction fee paid by the transaction in decimal Dash"

- n: "→ →<br>`modifiedfee`"
  t: "number (bitcoins)"
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

- n: "→ →<br>`depends`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty"

- n: "→ → →<br>Depends TXID"
  t: "string"
  p: "Optional (0 or more)"
  d: "The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order"

{% enditemplate %}

*Changes from Bitcoin - Following items not present in Dash result*

{% itemplate ntpd1 %}
- n: "→ TXID→<br>`ancestorcount`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.13.0*<br><br>The number of in-mempool ancestor transactions (including this one)"

- n: "→ TXID→<br>`ancestorsize`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.13.0*<br><br>The size of in-mempool ancestors (including this one)"

- n: "→ TXID→<br>`ancestorfees`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.13.0*<br><br>The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)"
{% enditemplate %}

*Examples from Dash Core 0.12.2*

The default (`false`):

{% highlight bash %}
bitcoin-cli getrawmempool
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
  "9dc994e03e387ff2d2709fbe86edede9f3d7aaddea7f75694495e415561b22fe": {
    "size": 3471,
    "fee": 0.00080520,
    "modifiedfee": 0.00080520,
    "time": 1507217951,
    "height": 4660,
    "startingpriority": 553299903846.1538,
    "currentpriority": 553299903846.1538,
    "descendantcount": 1,
    "descendantsize": 3471,
    "descendantfees": 80520,
    "depends": [
    ]
  }
}
{% endhighlight %}

*See also*

* [GetMemPoolInfo][rpc getmempoolinfo]: {{summary_getMemPoolInfo}}
* [GetMemPoolEntry][rpc getmempoolentry]: {{summary_getMemPoolEntry}}
* [GetTxOutSetInfo][rpc gettxoutsetinfo]: {{summary_getTxOutSetInfo}}

{% endautocrossref %}
