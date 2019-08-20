{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/gettxoutsetinfo.md" %}
<--__-->

##### GetTxOutSetInfo
{% include helpers/subhead-links.md %}

{% assign summary_getTxOutSetInfo="returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool." %}

{% autocrossref %}

The `gettxoutsetinfo` RPC {{summary_getTxOutSetInfo}}

*Parameters: none*

*Result---statistics about the UTXO set*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Information about the UTXO set"

- n: "→<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The height of the local best block chain.  A new node with only the hardcoded genesis block will have a height of 0"

- n: "→<br>`bestblock`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the header of the highest block on the local best block chain, encoded as hex in RPC byte order"

- n: "→<br>`transactions`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of transactions with unspent outputs"

- n: "→<br>`txouts`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of unspent transaction outputs"

- n: "→<br>`bogosize`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "A meaningless metric for UTXO set size"

- n: "→<br>`hash_serialized_2`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "A SHA256(SHA256()) hash of the serialized UTXO set; useful for comparing two nodes to see if they have the same set (they should, if they always used the same serialization format and currently have the same best block).  The hash is encoded as hex in RPC byte order"

- n: "→<br>`disk_size`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The estimated size of the chainstate on disk"

- n: "→<br>`total_amount`"
  t: "number (Dash)"
  p: "Required<br>(exactly 1)"
  d: "The total amount of Dash in the UTXO set"

{% enditemplate %}

*Example from Dash Core 0.14.1*

{% highlight bash %}
dash-cli -testnet gettxoutsetinfo
{% endhighlight %}

Result:

{% highlight json %}
{
  "height": 159358,
  "bestblock": "0000000000a705ef74a1fc134ea1eba49af8eead40b3df1fc4fb40f5940a0d60",
  "transactions": 187542,
  "txouts": 366996,
  "bogosize": 28344374,
  "hash_serialized_2": "d7326bdc2d9cb7d91580bfd47d6c2972ab1776c2c33c787873a5fd01986c9377",
  "disk_size": 21513509,
  "total_amount": 7517185.08574437
}
{% endhighlight %}

*See also*

* [GetBlockChainInfo][rpc getblockchaininfo]: {{summary_getBlockChainInfo}}
* [GetMemPoolInfo][rpc getmempoolinfo]: {{summary_getMemPoolInfo}}

{% endautocrossref %}
