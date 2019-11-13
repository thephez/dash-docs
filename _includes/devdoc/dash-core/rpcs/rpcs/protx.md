{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/protx.md" %}

<!-- __ -->

##### ProTx
{% include helpers/subhead-links.md %}

{% assign summary_proTx="provides a set of commands to execute ProTx related actions." %}

{% autocrossref %}

*Added in Dash Core 0.13.0*

The `protx` RPC {{summary_proTx}}

{% endautocrossref %}

###### ProTx<!--noref--> Register
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> register` RPC creates a ProRegTx referencing an existing collateral and and sends it to the network.

*Parameter #1---collateral address*

{% itemplate ntpd1 %}
- n: "`collateralHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The collateral transaction hash"
{% enditemplate %}

*Parameter #2---collateral index*

{% itemplate ntpd1 %}
- n: "`collateralIndex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The collateral transaction output index"
{% enditemplate %}

*Parameter #3---IP Address and port*

{% itemplate ntpd1 %}
- n: "`ipAndPort`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards."
{% enditemplate %}

*Parameter #4---owner address*

{% itemplate ntpd1 %}
- n: "`ownerAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`."
{% enditemplate %}

*Parameter #5---operator public key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode."
{% enditemplate %}

*Parameter #6---voting address*

{% itemplate ntpd1 %}
- n: "`votingAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used."
{% enditemplate %}

*Parameter #7---operator reward*

{% itemplate ntpd1 %}
- n: "`operatorReward`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The fraction in % to share with the operator. If non-zero, `ipAndPort` must be zero as well.<br>The value must be between '0.00' and '100.00'."
{% enditemplate %}

*Parameter #8---payout address*

{% itemplate ntpd1 %}
- n: "`payoutAddress`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The Dash address to use for masternode reward payments."
{% enditemplate %}

*Parameter #9---fee source address*

{% itemplate ntpd1 %}
- n: "`feeSourceAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider registration transaction (ProRegTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx register\
 8b2eab3413abb6e04d17d1defe2b71039ba6b6f72ea1e5dab29bb10e7b745948 1\
 2.3.4.5:2345 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6\
 88d719278eef605d9c19037366910b59bc28d437de4a8db4d76fda6d6985dbdf10404fb9bb5cd0e8c22f4a914a6c5566\
 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6 5 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
{% endhighlight %}

Result:
{% highlight bash %}
61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Register Fund
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> register_fund` RPC creates and funds a ProRegTx with the 1,000 DASH necessary for a masternode and then sends it to the network.

*Parameter #1---collateral address*

{% itemplate ntpd1 %}
- n: "`collateralAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The Dash address to send the collateral to"
{% enditemplate %}

*Parameter #2---IP Address and port*

{% itemplate ntpd1 %}
- n: "`ipAndPort`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards."
{% enditemplate %}

*Parameter #3---owner address*

{% itemplate ntpd1 %}
- n: "`ownerAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`."
{% enditemplate %}

*Parameter #4---operator public key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode."
{% enditemplate %}

*Parameter #5---voting address*

{% itemplate ntpd1 %}
- n: "`votingAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used."
{% enditemplate %}

*Parameter #6---operator reward*

{% itemplate ntpd1 %}
- n: "`operatorReward`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The fraction in % to share with the operator.<br>The value must be between '0.00' and '100.00'."
{% enditemplate %}

*Parameter #7---payout address*

{% itemplate ntpd1 %}
- n: "`payoutAddress`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The Dash address to use for masternode reward payments."
{% enditemplate %}

*Parameter #8---fund address*

{% itemplate ntpd1 %}
- n: "`fundAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider registration transaction (ProRegTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx register_fund yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7\
 3.4.5.6:3456 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw\
 0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51\
 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw 5 yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7
{% endhighlight %}

Result:
{% highlight bash %}
ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Register Prepare
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> register_prepare` RPC creates an unsigned ProTx and
returns it. The ProTx must be signed externally with the collateral key and then
passed to "protx register_submit". The prepared transaction will also contain inputs
and outputs to cover fees.

*Parameter #1---collateral address*

{% itemplate ntpd1 %}
- n: "`collateralHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The collateral transaction hash"
{% enditemplate %}

*Parameter #2---collateral index*

{% itemplate ntpd1 %}
- n: "`collateralIndex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The collateral transaction output index"
{% enditemplate %}

*Parameter #3---IP Address and port*

{% itemplate ntpd1 %}
- n: "`ipAndPort`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards."
{% enditemplate %}

*Parameter #4---owner address*

{% itemplate ntpd1 %}
- n: "`ownerAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`."
{% enditemplate %}

*Parameter #5---operator public key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode."
{% enditemplate %}

*Parameter #6---voting address*

{% itemplate ntpd1 %}
- n: "`votingAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used."
{% enditemplate %}

*Parameter #7---operator reward*

{% itemplate ntpd1 %}
- n: "`operatorReward`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The fraction in % to share with the operator.<br>The value must be between '0.00' and '100.00'."
{% enditemplate %}

*Parameter #8---payout address*

{% itemplate ntpd1 %}
- n: "`payoutAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The Dash address to use for masternode reward payments."
{% enditemplate %}

*Parameter #9---fee source address*

{% itemplate ntpd1 %}
- n: "`feeSourceAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---unsigned transaction and message to sign*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "JSON object containing an unsigned provider transaction and the message to be signed externally, or JSON `null` if an error occurred"

- n: "→<br>`tx`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The serialized ProRegTx in hex format"

- n: "→<br>`collateralAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The collateral address"

- n: "→<br>`signMessage`"
  t: "string (base64)"
  p: "Required<br>(exactly 1)"
  d: "The string message that needs to be signed with the collateral key."
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx register_prepare\
 df41e398bb245e973340d434d386f431dbd69735a575721b0b6833856e7d31ec 1 \
 9.8.7.6:9876 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz\
 06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280c\
 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz 1.2 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
{% endhighlight %}

Result:
{% highlight json %}
{
  "tx": "0300010001912b88876fee2f8e43e23b5e81276c163cf23d867bad4148170cb106ef9023700000000000feffffff0125623ba40b0000001976a914736e155c1039a269d4019c66219d2a18f0fee27588ac00000000d1010000000000ec317d6e8533680b1b7275a53597d6db31f486d334d44033975e24bb98e341df0100000000000000000000000000ffff090807062694ca6b243168b30461d1f19e2bb89a965a5bac067e06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280cca6b243168b30461d1f19e2bb89a965a5bac067e78001976a914fc136008111fcc7a05be6cec66f97568727a9e5188ace5f6b70ac55411727e25178bd417b9b03f837ad7155d90ad286f3a427203fb9f00",
  "collateralAddress": "yWuKWhDzGQqZL8rw6kGxGrfe6P8bUC2S4f",
  "signMessage": "yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt|120|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|69a49e18c1253b90d39322f7e2f7af74524401bc33a27645e697e74a214e3e1e"
}
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Register Submit
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> register_submit` RPC submits the specified ProTx to the
network. This command will also sign the inputs of the transaction which were
previously added by `protx register_prepare` to cover transaction fees.

*Parameter #1---collateral address*

{% itemplate ntpd1 %}
- n: "`tx`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The serialized transaction previously returned by `protx register_prepare`"
{% enditemplate %}

*Parameter #2---collateral index*

{% itemplate ntpd1 %}
- n: "`sig`"
  t: "string (base64)"
  p: "Required<br>(exactly 1)"
  d: "The signature signed with the collateral key. Must be in base64 format."
{% enditemplate %}

*Result---provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider registration transaction (ProRegTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx register_submit\
 03000100012d988526d5d1efd32320023c92eff09c2963dcb021b0de9761\
 17e5e37dc7a7870000000000feffffff015f603ba40b0000001976a9140c\
 37e07eb5c608961769e6506c23c11e9f9fe00988ac00000000d101000000\
 00002d988526d5d1efd32320023c92eff09c2963dcb021b0de976117e5e3\
 7dc7a7870100000000000000000000000000ffff05060708162e243dd366\
 bf4a329968d77eac9fb63481a600938d125e1b7cba03ca2a097e402185e6\
 160232ea53e6d62898a3be8617b06ff347d967543228bd9b605547c3d478\
 b0a838ca243dd366bf4a329968d77eac9fb63481a600938dc4091976a914\
 e9bf4e6f26fecf1dfc1e04dde43472df378628b888ac6a048e7f645e8adc\
 305ccfd8652066046a0702596af13b8ac97803ade256da2900\
 \
 H90IvqVtFjZkwLJb08yMEgGixs0/FpcdvwImBcir4cYLJhD3pdX+lKD2GsPl6KNxghVXNk5/HpOdBoWAHo9u++Y=
{% endhighlight %}

Result:
{% highlight bash %}
273ce3ebe24183ee4117b10e054cdbb108a3bde5d2f286129e29480d46a3f573
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> List
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> list` RPC returns a list of provider transactions.

Lists all ProTxs in your wallet or on-chain, depending on the given type. If
`type` is not specified, it defaults to `registered`. All types have the optional
argument `detailed` which if set to `true` will result in a detailed list being
returned. If set to `false`, only the hashes of the ProTx will be returned.

*Parameter #1---type*

{% itemplate ntpd1 %}
- n: "`type`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "The type of ProTxs to list:<br>`registered` - all ProTxs registered at height<br>`valid` - all active/valid ProTxs at height<br>`wallet` - all ProTxs found in the current wallet<br><br>Height defaults to current chain-tip if one is not provided"
{% enditemplate %}

*Parameter #2---detailed*

{% itemplate ntpd1 %}
- n: "`detailed`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "If set to `false` (default), only ProTx hashes are returned. If set to `true`, a detailed list of ProTx details is returned."
{% enditemplate %}

*Parameter #3---height*

{% itemplate ntpd1 %}
- n: "`height`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "List ProTxs from this height (default: current chain tip)."
{% enditemplate %}

*Result (if `detailed` was `false`)---provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex): array"
  p: "Required<br>(exactly 1)"
  d: "Array of provider transaction (ProTx) hashes"
{% enditemplate %}

*Result (if `detailed` was `true`)---JSON provider registration transaction details*

{% assign DEPTH="→" %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of objects each containing a provider transaction, or JSON `null` if an error occurred"

  {{INCLUDE_PROTX}}

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet protx list
{% endhighlight %}

Result:
{% highlight json %}
[
  "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2",
  "61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929",
  "ca193751f3cbed2aa4f1b33b0acc48c7ed8b9a3679858d69cf23157a4f545176",
  "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"
]
{% endhighlight %}


List of ProTxs which are active/valid at the given chain height.

{% highlight bash %}
dash-cli -testnet protx list valid false 700
{% endhighlight %}

Result:
{% highlight json %}
[
  "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2"
]
{% endhighlight %}

Detailed list of ProTxs which are active/valid at the given chain height.

{% highlight bash %}
dash-cli -testnet protx list valid true 700
{% endhighlight %}

Result:
{% highlight json %}
[
  {
    "proTxHash": "c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f",
    "collateralHash": "e3270ff48c4b802d56ee58d3d53777f7f9c289964e4df0842518075fc81345b1",
    "collateralIndex": 3,
    "collateralAddress": "yYpzTXjVx7A5uohsmW8sRy7TJp4tihVuZg",
    "operatorReward": 0,
    "state": {
      "service": "1.2.3.4:1234",
      "registeredHeight": 7090,
      "lastPaidHeight": 0,
      "PoSePenalty": 0,
      "PoSeRevivedHeight": -1,
      "PoSeBanHeight": -1,
      "revocationReason": 0,
      "ownerAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "votingAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "payoutAddress": "yU3UdrmS6KpWwBDLQTkp1KjXePwWsMbYdj",
      "pubKeyOperator": "8700add55a28ef22ec042a2f28e25fb4ef04b3024a7c56ad7eed4aebc736f312d18f355370dfb6a5fec9258f464b227e"
    },
    "confirmations": 1,
    "wallet": {
      "hasOwnerKey": false,
      "hasOperatorKey": false,
      "hasVotingKey": false,
      "ownsCollateral": false,
      "ownsPayeeScript": false,
      "ownsOperatorRewardScript": false
    }
  }
]
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Info
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> info` RPC returns detailed information about a deterministic masternode.

{% assign DEPTH="→" %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "An JSON object containing a provider transaction, or JSON `null` if an error occurred"

  {{INCLUDE_PROTX}}
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet protx info\
 2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2
{% endhighlight %}

Result:
{% highlight json %}
{
  "proTxHash": "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2",
  "collateralHash": "8d23d08ee6e2e0577550c90afde9bc63745f734605724ba9908e0220c48dec04",
  "collateralIndex": 1,
  "collateralAddress": "ygp7ZJGQZsVvuU11shixkNZSq9Uw4QrdWj",
  "operatorReward": 5,
  "state": {
    "service": "54.149.207.193:19999",
    "registeredHeight": 683,
    "lastPaidHeight": 785,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": -1,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "ycdU6EyVggw4RaW3EKPHCMBeT6vzRDXgbJ",
    "votingAddress": "ycdU6EyVggw4RaW3EKPHCMBeT6vzRDXgbJ",
    "payoutAddress": "yXsKagNKcHkE2eUKQe8Sf2Z32SKrmQ6XEJ",
    "pubKeyOperator": "8ad9500ef26ae510e0dd8cf0568b2a89d1234697873db2fcdd11674a73caba91cd416f9ac701f4f7807d8db102bc4a39"
  },
  "confirmations": 192,
  "wallet": {
    "hasOwnerKey": true,
    "hasOperatorKey": false,
    "hasVotingKey": true,
    "ownsCollateral": true,
    "ownsPayeeScript": true,
    "ownsOperatorRewardScript": false
  }
}
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Update Service
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> update_service` RPC creates and sends a ProUpServTx to the network.

*Parameter #1---initial provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`proTxHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the provider transaction as hex in RPC byte order"
{% enditemplate %}

*Parameter #2---IP Address and port*

{% itemplate ntpd1 %}
- n: "`ipAndPort`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "IP and port in the form 'IP:PORT'.<br>Must be unique on the network."
{% enditemplate %}

*Parameter #3---operator public key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode."
{% enditemplate %}

*Parameter #4---operator payout address*

{% itemplate ntpd1 %}
- n: "`operatorPayoutAddress`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The Dash address used for operator reward payments. Only allowed when the ProRegTx had a non-zero `operatorReward` value. If set to an empty string, the currently active payout address is reused."
{% enditemplate %}

*Parameter #5---fee source address*

{% itemplate ntpd1 %}
- n: "`feeSourceAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `operatorPayoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---provider update service transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider update service transaction (ProUpServTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx update_service\
 ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd\
 "4.3.2.1:4321"\
 4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1
{% endhighlight %}

Result:
{% highlight bash %}
5b6cfa1bdd3c8b7e0b9550b9c4e809381f81a410bc7f241d3879dd736fd51270
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Update Registrar
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> update_registrar` RPC creates and sends a ProUpRegTx to the network.

*Parameter #1---initial provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`proTxHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the provider transaction as hex in RPC byte order"
{% enditemplate %}

*Parameter #2---operator public key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode. If set to an empty string, the currently active operator BLS public key is reused."
{% enditemplate %}

*Parameter #3---voting address*

{% itemplate ntpd1 %}
- n: "`votingAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, the currently active voting key address is reused."
{% enditemplate %}

*Parameter #4---operator payout address*

{% itemplate ntpd1 %}
- n: "`payoutAddress`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The Dash address to use for masternode reward payments. If set to an empty string, the currently active payout address is reused."
{% enditemplate %}

*Parameter #5---fee source address*

{% itemplate ntpd1 %}
- n: "`feeSourceAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---provider update registrar transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider update registrar transaction (ProUpRegTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx update_registrar\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51"\
 "yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw" "yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7"
{% endhighlight %}

Result:
{% highlight bash %}
702390ef06b10c174841ad7b863df23c166c27815e3be2438e2fee6f87882b91
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Revoke
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> revoke` RPC creates and sends a ProUpRevTx to the network.

*Parameter #1---initial provider registration transaction hash*

{% itemplate ntpd1 %}
- n: "`proTxHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the provider transaction as hex in RPC byte order"
{% enditemplate %}

*Parameter #2---operator private key*

{% itemplate ntpd1 %}
- n: "`operatorPubKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: " The operator private key belonging to the registered operator public key."
{% enditemplate %}

*Parameter #3---reason*

{% itemplate ntpd1 %}
- n: "`reason`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The reason for revocation."
{% enditemplate %}

*Parameter #4---fee source address*

{% itemplate ntpd1 %}
- n: "`feeSourceAddress`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet."
{% enditemplate %}

*Result---provider update revoke transaction hash*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Provider update revoke transaction (ProUpRevTx) hash"
{% enditemplate %}

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet protx revoke\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1"
{% endhighlight %}

Result:
{% highlight bash %}
2aad36dd2ab254bee06b0b5dad51e7603691b72058d5806fd94e1d2d19a7c209
{% endhighlight %}

{% endautocrossref %}

###### ProTx<!--noref--> Diff
<!-- no subhead-links here -->

{% autocrossref %}

The `protx<!--noref--> diff` RPC calculates a diff and a proof between two masternode list.

*Parameter #1---start block height*

{% itemplate ntpd1 %}
- n: "`baseBlock`"
  t: "number (int)"
  p: "Required<br>(Exactly 1)"
  d: ""
{% enditemplate %}

*Parameter #2---end block height*

{% itemplate ntpd1 %}
- n: "`block`"
  t: "bool"
  p: "Required<br>(Exactly 1)"
  d: ""
{% enditemplate %}

*Result---JSON provider registration transaction details*

{% assign DEPTH="→" %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of objects each containing a provider transaction, or JSON `null` if an error occurred"

- n: "→<br>`baseBlockHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the base block as hex in RPC byte order"

- n: "→<br>`blockHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the ending block as hex in RPC byte order"

- n: "→<br>`cbTxMerkleTree`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The coinbase transaction merkle tree"

- n: "→<br>`cbTx`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The coinbase transaction"

- n: "→<br>`deletedMNs`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of deleted masternode hashes"

- n: "→<br>`mnlist`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of masternode details"

- n: "→ →<br>`proRegTxHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the initial provider registration transaction as hex in RPC byte order"

- n: "→ →<br>`confirmedHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the block where the ProRegTx was mined"

- n: "→ →<br>`service`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The IP address/Port of the masternode"

- n: "→ →<br>`pubKeyOperator`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The operator public key"

- n: "→ →<br>`votingAddress`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting address"

- n: "→ →<br>`isValid`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "Set to `true` if masternode is valid"

- n: "→<br>`deletedQuorums`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of deleted quorums"

- n: "→ →<br>`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The quorum type"

- n: "→ →<br>`quorumHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the quorum"

- n: "→<br>`newQuorums`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of new quorums"

- n: "→ →<br>`version`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The quorum version"

- n: "→ →<br>`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The quorum type"

- n: "→ →<br>`quorumHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the quorum"

- n: "→ →<br>`signersCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The number of signers for the quorum"

- n: "→ →<br>`validMembersCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The number of valid members in the quorum"

- n: "→ →<br>`quorumPublicKey`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The public key of the quorum"

- n: "→<br>`merkleRootMNList`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Merkle root of the masternode list"

- n: "→<br>`merkleRootQuorums`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Coinbase Transaction version 2 (Dash Core 0.14.0)*<br><br>Merkle root of the masternode list"
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet protx diff 75000 76000
{% endhighlight %}

Result (truncated):
{% highlight json %}
{
  "baseBlockHash": "0000000003deb00bba101ee581cdc4e1cbd1243ec5cd190472ae93eff07c8881",
  "blockHash": "0000000000c0279636003ed0042c9a454b4c39e9a6c49bb92d420e0bf4e0f49b",
  "cbTxMerkleTree": "01000000015ef8245e2a381174f5e2cc701d5d067d9f16945179380a3ce54415114426eb510101",
  "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff4c03e02801043619ab5c08fabe6d6d736170747365743a7265737574736574d6e48c2ebd4e147373617074736574730100000000000000380000ae250000000d2f6e6f64655374726174756d2f000000000340230e43000000001976a914cb594917ad4e5849688ec63f29a0f7f3badb5da688ac4cfe1c3e000000001976a91470da282ad16926e127064b7d3d787d7f3793014788acf424f104000000001976a914312d9ccd4e73f2e66006e45701bce17125ba681e88ac00000000260100e0280100d26df127ba2765c8f098ab71199c82c59509418efe26cdf02f7c92ce738e2247",
  "deletedMNs": [
  ],
  "mnList": [
    {
      "proRegTxHash": "fef106ff6420f9c6638c9676988a8fc655750caafb506c98cb5ff3d4fea99a41",
      "confirmedHash": "0000000005d5635228f113b50fb5ad66995a7476ed20374e6e159f1f9e62347b",
      "service": "45.48.177.222:19999",
      "pubKeyOperator": "842476e8d82327adfb9b617a7ac3f62868946c0c4b6b0e365747cfb8825b8b79ba0eb1fa62e8583ae7102f59bf70c7c7",
      "votingAddress": "yf7QHemCfbmKEncwZxroTj8JtShXsC28V6",
      "isValid": true
    },
    {
      "proRegTxHash": "7d56a2cf814b344f54ac4b6485a7a5b2b5a439ea796defff67f2a5872c9df5c3",
      "confirmedHash": "00000c66555eea6272e5c7bcdb2648e1a63fd5b23a6d1d4c3f9dc5df43c6a5a8",
      "service": "178.151.192.107:19999",
      "pubKeyOperator": "8631b1ba19ed23fdab61db7a81c9aa1356eaf37d0a29a14cc493e2f863080bf909b4d3e23d536be1d18e4c842566ed67",
      "votingAddress": "yP2LXCZTVVjBFQiN2bhghQvNwdUQG8NMX8",
      "isValid": true
    },
    {
      "proRegTxHash": "be32ec53dbbfb64e5ba29e25e3716f6f4024291914ce4c858cd69f0b4e371dda",
      "confirmedHash": "0000000015717296254a7c6139a50c34ad481dc8fdf7b0ea4c8320dc3fff2759",
      "service": "173.61.30.231:19025",
      "pubKeyOperator": "86ce02e551a46f1ca9a734104b4e387984d733ba99930eb677aae126fa142f201049842422ab2f105e3c9805f1bd54e8",
      "votingAddress": "ySBU7oXuuTSJqtmUArMRFsKefJPtEDkESG",
      "isValid": false
    }
  ],
  "deletedQuorums": [
    {
      "llmqType": 1,
      "quorumHash": "00000000052b95b036c87f82d19878f69bf940e6acf9f03cd818bd07a5686d0e"
    },
    {
      "llmqType": 1,
      "quorumHash": "0000000000e8b557ea26921f4bb143e961dd35209cf8c1c7b73397322c1a5018"
    },
    {
      "llmqType": 1,
      "quorumHash": "000000000b259f422fe3b647b8f1553b846d95dc8c79699d60e48a81dcf14747"
    },
    {
      "llmqType": 1,
      "quorumHash": "00000000143365adb3c3de6a35ae247120df8ca53a61afd82cd6fd4126ca8a4d"
    }
  ],
  "newQuorums": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000001427858db64213ed3ef32ffb2546ca7f2a096adbefc197437b90612",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "922e3683358f09a2619efb9e8329f90d5a8a608a18e26db212613ef7f95818eb6f68372fb313edbf96fdd2cdee20a66d"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000148a6fced08763f3f31dd68a3d88d2d4f2d48eef44eb9311de66129",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "814973fcf54892fa4edbf9e732341ff1227e2a89bf59cb22b52082e940f7c3ac8a7c25163cb375b3cfe3654e86eaa65d"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000009931a8a6dcdf21a869739356e7715eb155c1a18a58c8bf13382ac33",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "0694b46d8581423f2f68196dcc2d06be0b6b365a4100b54e351ab42f5828d09fd03941f8a1255363753a53d32b43f63b"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000006097e9d08a4ca9bedbe4a97bb9bf3fe8d09372d18d2398f185cff5d",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "10d0488558afd929508cd2d11bda7564333a904aa23c8b4a1ed57d86b217e3181497469e7220e9421e14f645a00940fc"
    }
  ],
  "merkleRootMNList": "47228e73ce927c2ff0cd26fe8e410995c5829c1971ab98f0c86527ba27f16dd2"
}
{% endhighlight %}

{% endautocrossref %}

{% autocrossref %}

*See also: none*

{% endautocrossref %}
