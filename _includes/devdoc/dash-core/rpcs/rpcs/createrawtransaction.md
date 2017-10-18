{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/createrawtransaction.md" %}

##### CreateRawTransaction
{% include helpers/subhead-links.md %}

{% assign summary_createRawTransaction="creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network." %}

{% autocrossref %}

The `createrawtransaction` RPC {{summary_createRawTransaction}}

*Parameter #1---Inputs*

{% itemplate ntpd1 %}
- n: "Transactions"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of objects, each one to be used as an input to the transaction"

- n: "→ Input"
  t: "object"
  p: "Required<br>(1 or more)"
  d: "An object describing a particular input"

- n: "→ →<br>`txid`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the outpoint to be spent encoded as hex in RPC byte order"

- n: "→ →<br>`vout`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The output index number (vout) of the outpoint to be spent; the first output in a transaction is index `0`"

- n: "→ →<br>`Sequence`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "NOT IMPLEMENTED IN DASH.<br><br>The sequence number to use for the input"

{% enditemplate %}

*Parameter #2---P2PKH or P2SH addresses and amounts*

{% itemplate ntpd1 %}
- n: "Outputs"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "The addresses and amounts to pay"

- n: "→<br>Address/Amount"
  t: "string : number (Dash)"
  p: "Required<br>(1 or more)"
  d: "A key/value pair with the address to pay as a string (key) and the amount to pay that address (value) in Dash"

{% enditemplate %}

*Parameter #3---locktime*

{% itemplate ntpd1 %}
- n: "Locktime"
  t: "numeric (int)"
  p: "Optional<br>(0 or 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>Indicates the earliest time a transaction can be added to the block chain"

{% enditemplate %}

*Result---the unsigned raw transaction in hex*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string"
  p: "Required<br>(Exactly 1)"
  d: "The resulting unsigned raw transaction in serialized transaction format encoded as hex.  If the transaction couldn't be generated, this will be set to JSON `null` and the JSON-RPC error field may contain an error message"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet createrawtransaction '''
  [
    {
      "txid": "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f",
      "vout" : 0
    }
  ]''' \
  '{"ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 800, "yY6AmGopsZS31wy1JLHR9P6AC6owFaXwuh":77.78}' '1024'

{% endhighlight %}

Result (wrapped):

{% highlight text %}
01000000010fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c48778a4fa6bd93fc8f6\
0000000000ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3\
cfc9f32ef388ac80dc9acf010000001976a914811eacc14db8ebb5b64486dc43400c0226b4\
28a488ac00040000
{% endhighlight %}

*See also*

* [DecodeRawTransaction][rpc decoderawtransaction]: {{summary_decodeRawTransaction}}
* [SignRawTransaction][rpc signrawtransaction]: {{summary_signRawTransaction}}
* [SendRawTransaction][rpc sendrawtransaction]: {{summary_sendRawTransaction}}
* [Serialized Transaction Format][raw transaction format]

{% endautocrossref %}
