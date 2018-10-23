{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getrawtransaction.md" %}

##### GetRawTransaction
{% include helpers/subhead-links.md %}

<!-- __ -->

{% assign summary_getRawTransaction="gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings." %}

{% autocrossref %}

The `getrawtransaction` RPC {{summary_getRawTransaction}}

Note: By default this function only works for mempool transactions. If the
`-txindex` option is enabled, it also works for blockchain transactions. For now,
it also works for transactions with unspent outputs although this feature is
deprecated.

{{reindexNote}}

*Parameter #1---the TXID of the transaction to get*

{% itemplate ntpd1 %}
- n: "TXID"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the transaction to get, encoded as hex in RPC byte order"

{% enditemplate %}

*Parameter #2---whether to get the serialized or decoded transaction*

{% itemplate ntpd1 %}
- n: "Format"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "*Updated in Dash Core 0.12.3 / Bitcoin Core 0.14.0*<br><br>Set to `false` (the default) to return the serialized transaction as hex.  Set to `true` to return a decoded transaction.  Before 0.12.3, use `0` and `1`, respectively"

{% enditemplate %}

*Result (if transaction not found)---`null`*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "null"
  p: "Required<br>(exactly 1)"
  d: "If the transaction wasn't found, the result will be JSON `null`.  This can occur because the transaction doesn't exist in the block chain or memory pool, or because it isn't part of the transaction index.  See the Dash Core `-help` entry for `-txindex`"

{% enditemplate %}

*Result (if verbose=`false`)---the serialized transaction*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "If the transaction was found, this will be the serialized transaction encoded as hex"

{% enditemplate %}

*Result (if verbose=`true`)---the decoded transaction*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "If the transaction was found, this will be an object describing it"

- n: "{{DEPTH}} →<br>`hex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The serialized, hex-encoded data for the provided `txid`"   
{{INCLUDE_DECODE_RAW_TRANSACTION}}
- n: "→<br>`blockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "If the transaction has been included in a block on the local best block chain, this is the hash of that block encoded as hex in RPC byte order"

- n: "→<br>`confirmations`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "If the transaction has been included in a block on the local best block chain, this is how many confirmations it has.  Otherwise, this is `0`"

- n: "→<br>`time`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "If the transaction has been included in a block on the local best block chain, this is the block header time of that block (may be in the future)"

- n: "→<br>`blocktime`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "This field is currently identical to the time field described above"

- n: "<br>`instantlock`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "If set to `true`, this transaction is locked"

{% enditemplate %}

*Examples from Dash Core 0.12.4*

A transaction in serialized transaction format:

{% highlight bash %}
dash-cli getrawtransaction \
  83f94090899fa63ea6ef913fe13cba851fd07c801bea7eedf73958c58936c19c
{% endhighlight %}

Result (wrapped):

{% highlight text %}
0200000001f28cab548af92fa2183e6615d133c4a0f0167de0a2acb6307335dc\
a57fd71855010000006b483045022100c3d0d9b01a6654f536fd0c5bbf919b16\
30d2e71807ba15a1f517b5c44ca35912022065825e727c8c916910a740434bc0\
c7b8cc609424ac3ad06193efba4133616ce401210267fae84ef6aa6ab3d877b4\
7932915a9b406566c873ea025986fc7e15a15fd2f2feffffff020f0b0c0a0000\
00001976a9149f55b3dd67f76dd5ae11a5703481eb2f279041eb88ac0065cd1d\
000000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acf5d1\
0300
{% endhighlight %}

Get the same transaction in JSON:

{% highlight bash %}
dash-cli getrawtransaction \
2f124cb550d9967b81914b544dea3783de23e85d67a9816f9bada665ecfe1cd5 \
1
{% endhighlight %}

Result:

{% highlight json %}
{
  "hex": "0200000001f28cab548af92fa2183e6615d133c4a0f0167de0a2acb6307335dca57fd71855010000006b483045022100c3d0d9b01a6654f536fd0c5bbf919b1630d2e71807ba15a1f517b5c44ca35912022065825e727c8c916910a740434bc0c7b8cc609424ac3ad06193efba4133616ce401210267fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f2feffffff020f0b0c0a000000001976a9149f55b3dd67f76dd5ae11a5703481eb2f279041eb88ac0065cd1d000000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acf5d10300",
  "txid": "83f94090899fa63ea6ef913fe13cba851fd07c801bea7eedf73958c58936c19c",
  "size": 226,
  "version": 2,
  "type": 0,
  "locktime": 250357,
  "vin": [
    {
      "txid": "5518d77fa5dc357330b6aca2e07d16f0a0c433d115663e18a22ff98a54ab8cf2",
      "vout": 1,
      "scriptSig": {
        "asm": "3045022100c3d0d9b01a6654f536fd0c5bbf919b1630d2e71807ba15a1f517b5c44ca35912022065825e727c8c916910a740434bc0c7b8cc609424ac3ad06193efba4133616ce4[ALL] 0267fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f2",
        "hex": "483045022100c3d0d9b01a6654f536fd0c5bbf919b1630d2e71807ba15a1f517b5c44ca35912022065825e727c8c916910a740434bc0c7b8cc609424ac3ad06193efba4133616ce401210267fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f2"
      },
      "sequence": 4294967294
    }
  ],
  "vout": [
    {
      "value": 1.68561423,
      "valueSat": 168561423,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 9f55b3dd67f76dd5ae11a5703481eb2f279041eb OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a9149f55b3dd67f76dd5ae11a5703481eb2f279041eb88ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "yaqvxRbjheVBuVcKRFV8JHuaNumR6NB9RC"
        ]
      }
    },
    {
      "value": 5.00000000,
      "valueSat": 500000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 485485425fa99504ec1638ac4213f3cfc9f32ef3 OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a914485485425fa99504ec1638ac4213f3cfc9f32ef388ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv"
        ]
      }
    }
  ],
  "blockhash": "0000000004acaea045b4ebe5b3663f8c235934149a72c8ab0c5a703fe594408e",
  "height": 250358,
  "confirmations": 1,
  "time": 1540323061,
  "blocktime": 1540323061,
  "instantlock": true
}
{% endhighlight %}

*See also*

* [GetTransaction][rpc gettransaction]: {{summary_getTransaction}}

{% endautocrossref %}
