{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/listtransactions.md" %}

##### ListTransactions
{% include helpers/subhead-links.md %}

{% assign summary_listTransactions="returns the most recent transactions that affect the wallet." %}

<!-- __ -->

{% autocrossref %}

*Requires wallet support.*

The `listtransactions` RPC {{summary_listTransactions}}

*Parameter #1---an account name to get transactions from*

{% itemplate ntpd1 %}
- n: "Account"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "*Deprecated: will be removed in a later version of Dash Core*<br><br>The name of an account to get transactions from.  Use an empty string (\"\") to get transactions for the default account.  Default is `*` to get transactions for all accounts."

{% enditemplate %}

*Parameter #2---the number of transactions to get*

{% itemplate ntpd1 %}
- n: "Count"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The number of the most recent transactions to list.  Default is `10`"

{% enditemplate %}

*Parameter #3---the number of transactions to skip*

{% itemplate ntpd1 %}
- n: "Skip"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The number of the most recent transactions which should not be returned.  Allows for pagination of results.  Default is `0`"

{% enditemplate %}

*Parameter #4---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---payment details*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array containing objects, with each object describing a **payment** or internal accounting entry (not a transaction).  More than one object in this array may come from a single transaction.  Array may be empty"

- n: "→<br>Payment"
  t: "object"
  p: "Optional<br>(0 or more)"
  d: "A payment or internal accounting entry"

- n: "→ →<br>`account`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "*Deprecated: will be removed in a later version of Dash Core*<br><br>The account which the payment was credited to or debited from.  May be an empty string (\"\") for the default account"

- n: "→ →<br>`address`"
  t: "string (base58)"
  p: "Optional<br>(0 or 1)"
  d: "The address paid in this payment, which may be someone else's address not belonging to this wallet.  May be empty if the address is unknown, such as when paying to a non-standard pubkey script or if this is in the *move* category"

- n: "→ →<br>`category`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Set to one of the following values:<br>• `send` if sending payment<br>• `receive` if this wallet received payment in a regular transaction<br>• `generate` if a matured and spendable coinbase<br>• `immature` if a coinbase that is not spendable yet<br>• `orphan` if a coinbase from a block that's not in the local best block chain<br>• `move` if an off-block-chain move made with the `move` RPC"

- n: "→ →<br>`amount`"
  t: "number (dash)"
  p: "Required<br>(exactly 1)"
  d: "A negative dash amount if sending payment; a positive dash amount if receiving payment (including coinbases)"

- n: "→ →<br>`label`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "A comment for the address/transaction"  

- n: "→ →<br>`vout`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "For an output, the output index (vout) for this output in this transaction.  For an input, the output index for the output being spent in its transaction.  Because inputs list the output indexes from previous transactions, more than one entry in the details array may have the same output index.  Not returned for *move* category payments"

- n: "→ →<br>`fee`"
  t: "number (dash)"
  p: "Optional<br>(0 or 1)"
  d: "If sending payment, the fee paid as a negative dash value.  May be `0`. Not returned if receiving payment or for *move* category payments"

- n: "→ →<br>`confirmations`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The number of confirmations the transaction has received.  Will be `0` for unconfirmed and `-1` for conflicted.  Not returned for *move* category payments"

- n: "→<br>`instantlock`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "Current transaction lock state (InstantSend and/or ChainLock)"  

- n: "→<br>`instantlock_internal`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "Current InstantSend transaction lock state"

- n: "<br>`chainlock`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.14.0*<br><br>If set to `true`, this transaction is in a block that is locked (not susceptible to a chain re-org)"

- n: "→ →<br>`generated`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Set to `true` if the transaction is a coinbase.  Not returned for regular transactions or *move* category payments"

- n: "→ →<br>`trusted`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Indicates whether we consider the outputs of this unconfirmed transaction safe to spend.  Only returned for unconfirmed transactions"

- n: "→ →<br>`blockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of the block on the local best block chain which includes this transaction, encoded as hex in RPC byte order.  Only returned for confirmed transactions"

- n: "→ →<br>`blockindex`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The index of the transaction in the block that includes it.  Only returned for confirmed transactions"

- n: "→ →<br>`blocktime`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "The block header time (Unix epoch time) of the block on the local best block chain which includes this transaction.  Only returned for confirmed transactions"

- n: "→ →<br>`txid`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The TXID of the transaction, encoded as hex in RPC byte order.  Not returned for *move* category payments"

- n: "→ →<br>`walletconflicts`"
  t: "array"
  p: "Optional<br>(0 or 1)"
  d: "An array containing the TXIDs of other transactions that spend the same inputs (UTXOs) as this transaction.  Array may be empty.  Not returned for *move* category payments"

- n: "→ → →<br>TXID"
  t: "string (hex)"
  p: "Optional<br>(0 or more)"
  d: "The TXID of a conflicting transaction, encoded as hex in RPC byte order"

- n: "→ →<br>`time`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "A Unix epoch time when the transaction was added to the wallet"

- n: "→ →<br>`timereceived`"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "A Unix epoch time when the transaction was detected by the local node, or the time of the block on the local best block chain that included the transaction.  Not returned for *move* category payments"

- n: "→ →<br>`comment`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "For transaction originating with this wallet, a locally-stored comment added to the transaction.  Only returned in regular payments if a comment was added.  Always returned in *move* category payments.  May be an empty string"

- n: "→ →<br>`to`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "For transaction originating with this wallet, a locally-stored comment added to the transaction identifying who the transaction was sent to.  Only returned if a comment-to was added.  Never returned by *move* category payments.  May be an empty string"

- n: "→ →<br>`otheraccount`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "This is the account the dash were moved from or moved to, as indicated by a negative or positive *amount* field in this payment.  Only returned by *move* category payments"

- n: "→ →<br>`abandoned`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "*Added in Bitcoin Core 0.12.1*<br><br>Indicates if a transaction is was abandoned:<br>• `true` if it was abandoned (inputs are respendable)<br>• `false`  if it was not abandoned<br>Only returned by *send* category payments"

{% enditemplate %}

*Example from Dash Core 0.14.0*

List the most recent transaction from the main account including watch-only addresses.

{% highlight bash %}
dash-cli listtransactions "" 1 0 true
{% endhighlight %}

Result:

{% highlight json %}
[
  {
    "account": "",
    "address": "ySGKtDZ3qBHRqk7mHsdofShQkqMcAS7SYJ",
    "category": "send",
    "amount": -0.50000000,
    "label": "",
    "vout": 1,
    "fee": -0.00040000,
    "confirmations": 3,
    "instantlock": true,
    "instantlock_internal": true,
    "chainlock": false,
    "blockhash": "000000000327ff7785d799dde99949457ac231ef1d956a2287c2f7bb84d9738c",
    "blockindex": 2,
    "blocktime": 1553798971,
    "txid": "048aae3ad194f5398b67fc7029b26bf50d66ecc7d185fd6d26f8c6ec5a4ed1f9",
    "walletconflicts": [
    ],
    "time": 1553798920,
    "timereceived": 1553798920,
    "abandoned": false
  }
]
{% endhighlight %}

*See also*

* [GetTransaction][rpc gettransaction]: {{summary_getTransaction}}
* [ListSinceBlock][rpc listsinceblock]: {{summary_listSinceBlock}}

{% endautocrossref %}
