{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/gettransaction.md" %}

##### GetTransaction
{% include helpers/subhead-links.md %}

{% assign summary_getTransaction="gets detailed information about an in-wallet transaction." %}

<!-- __ -->

{% autocrossref %}

*Requires wallet support.*

The `gettransaction` RPC {{summary_getTransaction}}

*Parameter #1---a transaction identifier (TXID)*

{% itemplate ntpd1 %}
- n: "TXID"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the transaction to get details about.  The TXID must be encoded as hex in RPC byte order"

{% enditemplate %}

*Parameter #2---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---a description of the transaction*

{% assign DEPTH="→ " %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "An object describing how the transaction affects the wallet"

- n: "→<br>`amount`"
  t: "number (dash)"
  p: "Required<br>(exactly 1)"
  d: "A positive number of dash if this transaction increased the total wallet balance; a negative number of dash if this transaction decreased the total wallet balance, or `0` if the transaction had no net effect on wallet balance"

- n: "→<br>`fee`"
  t: "number (dash)"
  p: "Optional<br>(0 or 1)"
  d: "If an outgoing transaction, this is the fee paid by the transaction reported as negative dash"

{{INCLUDE_F_LIST_TRANSACTIONS_F_FULL}}

- n: "→<br>`DS`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Set to 1 if a PrivateSend transaction"

- n: "→<br>`details`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array containing one object for each input or output in the transaction which affected the wallet"

- n: "→ → <br>`involvesWatchonly`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Set to `true` if the input or output involves a watch-only address.  Otherwise not returned"

- n: "→ →<br>`account`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The account which the payment was credited to or debited from.  May be an empty string (\"\") for the default account"

- n: "→ →<br>`address`"
  t: "string (base58)"
  p: "Optional<br>(0 or 1)"
  d: "If an output, the address paid (may be someone else's address not belonging to this wallet).  If an input, the address paid in the previous output.  May be empty if the address is unknown, such as when paying to a non-standard pubkey script"

- n: "→ →<br>`category`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Set to one of the following values:<br>• `send` if sending payment normally<br>• `privatesend` if sending PrivateSend payment<br>• `receive` if this wallet received payment in a regular transaction<br>• `generate` if a matured and spendable coinbase<br>• `immature` if a coinbase that is not spendable yet<br>• `orphan` if a coinbase from a block that's not in the local best block chain"

- n: "→ →<br>`amount`"
  t: "number (dash)"
  p: "Required<br>(exactly 1)"
  d: "A negative dash amount if sending payment; a positive dash amount if receiving payment (including coinbases)"

- n: "→ →<br>`label`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "An optional comment for the address/transaction"

- n: "→ →<br>`vout`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "For an output, the output index (vout) for this output in this transaction.  For an input, the output index for the output being spent in its transaction.  Because inputs list the output indexes from previous transactions, more than one entry in the details array may have the same output index"

- n: "→ →<br>`fee`"
  t: "number (dash)"
  p: "Optional<br>(0 or 1)"
  d: "If sending payment, the fee paid as a negative dash value.  May be `0`.  Not returned if receiving payment"

- n: "→ →<br>`abandoned`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "*Added in Bitcoin Core 0.12.1*<br><br>Indicates if a transaction is was abandoned:<br>• `true` if it was abandoned (inputs are respendable)<br>• `false`  if it was not abandoned<br>Only returned by *send* category payments"

- n: "→<br>`hex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The transaction in serialized transaction format"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet gettransaction \
  c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc
{% endhighlight %}

Result:
{% highlight json %}
{
  "amount": -50.00000000,
  "fee": -0.00030000,
  "confirmations": 3064,
  "instantlock": false,
  "instantlock_internal": false,
  "chainlock": false,
  "blockhash": "00000a01007be2912c3123085534b58d341cb5e5980b967e8dcc021089487a1e",
  "blockindex": 1,
  "blocktime": 1553290594,
  "trusted": true,
  "txid": "c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc",
  "walletconflicts": [
  ],
  "time": 1553290584,
  "timereceived": 1553290584,
  "details": [
    {
      "account": "",
      "address": "ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe",
      "category": "send",
      "amount": -50.00000000,
      "label": "Electrum",
      "vout": 1,
      "fee": -0.00030000,
      "abandoned": false
    }
  ],
  "hex": "0200000003aac865dba0e98fe32533df6bc3eaac160d04bb02966584fb61fc8d7788e09537010000006a47304402202d537257f23ab42b3e14f2ab533f39bb4586aa1b29a1f833f718a59493c8a601022019c6c156c20e66ef256519592b3c977b64d417c94aea4dca20cf18522a138993012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffff47833a270d2e2bac47bc5dc0df576c3a68b01bedbc89692060ac4113a6f9cb67010000006a4730440220442c19a913b10edc533bf63310f5294d6d91eec0eb9c510a3c6b0f33333f27320220501d5093ecdf603b8af9734e21d5de4710c8500309bfa4acdda243a294442b2c012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffffdcfd2d0fb30d79ffeadab8832e65be2310b67043ff3d74deac9a9cb825acda67000000006b483045022100cae8c025d3bec82903f356a5ec38d78a141447b6562e3aceac901f5fcc6f8567022076407835937514d6690c81c0c3b97f92d2b0ae9749249affaf539ead825692f4012102d6be44ab930ff67f084fbaf47a38b539b8d5da65c010952a972c9e524b6009dffeffffff0204fe2b00000000001976a914e3b0093477c2f629430d0a7b5813fe8b0153b0fd88ac00f2052a010000001976a914ae4365dedb1836ba215b9149602e0787a23376d288ac42010100"
}
{% endhighlight %}

*See also*

* [GetRawTransaction][rpc getrawtransaction]: {{summary_getRawTransaction}}

{% endautocrossref %}
