{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/listunspent.md" %}

##### ListUnspent
{% include helpers/subhead-links.md %}

{% assign summary_listUnspent="returns an array of unspent transaction outputs belonging to this wallet." %}

<!-- __ -->

{% autocrossref %}

*Requires wallet support.*

The `listunspent` RPC {{summary_listUnspent}} **Note:** as of Bitcoin
Core 0.10.0, outputs affecting watch-only addresses will be returned; see
the *spendable* field in the results described below.

*Parameter #1---the minimum number of confirmations an output must have*

{% itemplate ntpd1 %}
- n: "Minimum Confirmations"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The minimum number of confirmations the transaction containing an output must have in order to be returned.  Use `0` to return outputs from unconfirmed transactions. Default is `1`"

{% enditemplate %}

*Parameter #2---the maximum number of confirmations an output may have*

{% itemplate ntpd1 %}
- n: "Maximum Confirmations"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The maximum number of confirmations the transaction containing an output may have in order to be returned.  Default is `9999999` (~10 million)"

{% enditemplate %}

*Parameter #3---the addresses an output must pay*

{% itemplate ntpd1 %}
- n: "Addresses"
  t: "array"
  p: "Optional<br>(0 or 1)"
  d: "If present, only outputs which pay an address in this array will be returned"

- n: "→<br>Address"
  t: "string (base58)"
  p: "Required<br>(1 or more)"
  d: "A P2PKH or P2SH address"

{% enditemplate %}

*Parameter #4---include unsafe outputs*

{% itemplate ntpd1 %}
- n: "Include Unsafe"
  t: "bool"
  p: "Optional<br>(false or true)"
  d: "Include outputs that are not safe to spend . See description of `safe` attribute below.  Default is `true`"

{% enditemplate %}

*Parameter #5---query options*

{% itemplate ntpd1 %}
- n: "Query Options"
  t: "json"
  p: "Optional"
  d: "JSON with query options. Available options:<br> - `minimumAmount`: Minimum value of each UTXO in DASH<br> - `maximumAmount`: Maximum value of each UTXO in DASH<br> - `maximumCount`: Maximum number of UTXOs<br> - `minimumSumAmount`: Minimum sum value of all UTXOs in DASH"

{% enditemplate %}

*Result---the list of unspent outputs*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of objects each describing an unspent output.  May be empty"

- n: "→<br>Unspent Output"
  t: "object"
  p: "Optional<br>(0 or more)"
  d: "An object describing a particular unspent output belonging to this wallet"

- n: "→ →<br>`txid`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the transaction containing the output, encoded as hex in RPC byte order"

- n: "→ →<br>`vout`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The output index number (vout) of the output within its containing transaction"

- n: "→ →<br>`address`"
  t: "string (base58)"
  p: "Optional<br>(0 or 1)"
  d: "The P2PKH or P2SH address the output paid.  Only returned for P2PKH or P2SH output scripts"

- n: "→ →<br>`account`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "*Deprecated: will be removed in a later version of Dash Core*<br><br>If the address returned belongs to an account, this is the account.  Otherwise not returned"

- n: "→ →<br>`scriptPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The output script paid, encoded as hex"

- n: "→ →<br>`redeemScript`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "If the output is a P2SH whose script belongs to this wallet, this is the redeem script"

- n: "→ →<br>`amount`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The amount paid to the output in dash"

- n: "→ →<br>`confirmations`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of confirmations received for the transaction containing this output"

- n: "→ →<br>`spendable`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "Set to `true` if the private key or keys needed to spend this output are part of the wallet.  Set to `false` if not (such as for watch-only addresses)"

- n: "→ →<br>`solvable`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.13.0*<br><br>Set to `true` if the wallet knows how to spend this output.  Set to `false` if the wallet does not know how to spend the output.  It is ignored if the private keys are available "

- n: "→ →<br>`ps_rounds`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of PrivateSend rounds"

- n: "→ →<br>`safe`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.15.0*<br><br>Whether this output is considered safe to spend. Unconfirmed transactions from outside keys are considered unsafe and are not eligible for spending by `fundrawtransaction` and `sendtoaddress`."

{% enditemplate %}

*Example from Dash Core 0.15.0*

Get all outputs confirmed at least 6 times for a particular
address:

{% highlight bash %}
dash-cli -testnet listunspent 6 99999999 '''
  [
    "yLki4jbxX28JB3TThm1DTgRfbKVhhiMx3d"
  ]
'''
{% endhighlight %}

Result:

{% highlight json %}
[
  {
    "txid": "534fe12e360773dddf8aa125a4027d2d8c0073e13ff2f04fd733202b85dbdcf1",
    "vout": 0,
    "address": "yLki4jbxX28JB3TThm1DTgRfbKVhhiMx3d",
    "scriptPubKey": "76a91404c719ccf48d39d3e6253ac98edaf2b5d24f0c0588ac",
    "amount": 1.00001000,
    "confirmations": 85,
    "spendable": true,
    "solvable": true,
    "safe": true,
    "ps_rounds": 13
  }
]
{% endhighlight %}

Get all outputs for a particular address that have at least 1 confirmation and a maximum value of 10:

{% highlight bash %}
listunspent 1 9999999 "[\"yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD\"]" true "{\"maximumAmount\":\"10\"}"

dash-cli -testnet listunspent 1 9999999 '''
  [
    "yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD"
  ]
  ''' true '''
  {
    "maximumAmount": "10"
  }
  '''
{% endhighlight %}

Result:

{% highlight json %}
[
  {
    "txid": "42cd5150fd1179b5a194e034685d524e6d5d38703ac794d236495923a29addc5",
    "vout": 1,
    "address": "yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD",
    "account": "",
    "scriptPubKey": "76a914318d6d7e26e07a142a425a32ea917a30147d6c9788ac",
    "amount": 5.00000000,
    "confirmations": 100,
    "spendable": true,
    "solvable": true,
    "safe": true,
    "ps_rounds": -2
  }
]
{% endhighlight %}

*See also*

* [ListTransactions][rpc listtransactions]: {{summary_listTransactions}}
* [LockUnspent][rpc lockunspent]: {{summary_lockUnspent}}

{% endautocrossref %}
