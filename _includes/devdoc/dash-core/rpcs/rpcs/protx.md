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

*Parameter #4---owner key address*

{% itemplate ntpd1 %}
- n: "`ownerKeyAddr`"
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

*Parameter #6---voting key address*

{% itemplate ntpd1 %}
- n: "`votingKeyAddr`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting key address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to '0' or an empty string, `ownerAddr` will be used."
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

*Parameter #3---owner key address*

{% itemplate ntpd1 %}
- n: "`ownerKeyAddr`"
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

*Parameter #5---voting key address*

{% itemplate ntpd1 %}
- n: "`votingKeyAddr`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting key address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to '0' or an empty string, `ownerAddr` will be used."
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

*Parameter #4---owner key address*

{% itemplate ntpd1 %}
- n: "`ownerKeyAddr`"
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

*Parameter #6---voting key address*

{% itemplate ntpd1 %}
- n: "`votingKeyAddr`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting key address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to '0' or an empty string, `ownerAddr` will be used."
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
  d: "The Dash address used for operator reward payments. Only allowed when the ProRegTx had a non-zero `operatorReward` value."
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
  d: " The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode."
{% enditemplate %}

*Parameter #3---voting key address*

{% itemplate ntpd1 %}
- n: "`votingKeyAddr`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The voting key address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to '0' or an empty string, the last on-chain voting key of the masternode will be used."
{% enditemplate %}

*Parameter #4---operator payout address*

{% itemplate ntpd1 %}
- n: "`payoutAddress`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The Dash address to use for masternode reward payments. If set to '0' or an empty string, the last on-chain payout address of the masternode will be used."
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

- n: "→<br>`merkleRootMNList`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Merkle root of the masternode list"
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet protx diff 600 700
{% endhighlight %}

Result:
{% highlight json %}
{
  "baseBlockHash": "0000002b88258091c9f343e124040fb7b2e0d88afe4a99d213c046792c183a49",
  "blockHash": "0000051bbea86db62be46c0beae2cb34110e928ace42683ab189e8db9874308f",
  "cbTxMerkleTree": "0200000002a4eaaaaaf7e260b90b1a7987eb269da110559343be5746ac5ef7f39b79c1228e4f7e074272c7e3814f630ce4f2f52f80c0b814fb1ce0e4d954b7b583a55ff0a50103",
  "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff060369fe000102ffffffff0340230e43000000001976a914323a8b6425ea6f8dafd411db13bc303219a9e4f088ac44aab141000000001976a914870ca3662658f261952cbfa56969283ad1e84dc588acfc785c01000000001976a91487da2642cf967c493f126137d4f15e9de36b976888ac0000000026010069fe000068cadec8342737e3f2dddc713b3a206390996c8b806fb5a8a2ccc71240cf7a97",
  "deletedMNs": [
    "285d7da8e94b2348689aca4a63bc6cbbeeb8e912c2088fb9a01e295e3eeeb2ff"
  ],
  "mnList": [
    {
      "proRegTxHash": "39a1339d9bf26de701345beecc5de75a690bc9533741a3dbe90f2fd88b8ed461",
      "confirmedHash": "0000030c37a946836029eeca338604c652e3c6cd368eb54bdfa8553213954f74",
      "service": "198.199.74.241:19999",
      "pubKeyOperator": "0efda51589f86e30cc2305e7388c01ce0309c19a182cf37bced97c7da72236f660c0a395e765e6e06962ecff5a69d7de",
      "votingAddress": "yRCunhZVjbMxDr1C6fD6Pf37sTwH6wG7Uu",
      "isValid": true
    },
    {
      "proRegTxHash": "3dbb7de94e219e8f7eaea4f3c01cf97d77372e10152734c1959f17302369aa49",
      "confirmedHash": "0000043c0d46d3e6b84c1b420b77b65e962207fb6427361f74d243b9b1fd51cb",
      "service": "52.36.64.148:19999",
      "pubKeyOperator": "139b654f0b1c031e1cf2b934c2d895178875cfe7c6a4f6758f02bc66eea7fc292d0040701acbe31f5e14a911cb061a2f",
      "votingAddress": "yWEZQmGADmdSk6xCai7TPcmiSZuY65hBmo",
      "isValid": true
    },
    {
      "proRegTxHash": "851a17fa224374b52b1626f4fb6b5158f2a6add3061e65ef03e1ff13c610c550",
      "confirmedHash": "000009a21e82163268330855c9ef13f938a802e46db0fc8a6b1f97161e9d60d8",
      "service": "104.196.245.194:19999",
      "pubKeyOperator": "0a6bd57731d85539e62c4b46ec150343a0faba9f08af509309634a6e7e016e26b5e809f0e4cc68252c3c46e3a4b35e57",
      "votingAddress": "ycppuGB8m2zn5xRfXyJV8U1nNgT7bFs7u5",
      "isValid": true
    },
    {
      "proRegTxHash": "9e9f7a6d63358ff6e7633d4bb5a3c9eaaebaf29437d5917565ed73f5bcc03dbf",
      "confirmedHash": "00000020b973dddd9dfd392f118d0094adc86bd8bfe9bee67d08705155bc7aaf",
      "service": "207.246.101.212:19999",
      "pubKeyOperator": "02a37189354135fed49de66a43d59590824579ccfa7e9512f50aeaff641e1b78cc5c798c5ae4a35b11958fd153f0a0e3",
      "votingAddress": "yRH7EYkGQgdKvmfdskcMRphdDumLdP6fq1",
      "isValid": true
    }
  ],
  "merkleRootMNList": "977acf4012c7cca2a8b56f808b6c999063203a3b71dcddf2e3372734c8deca68"
}
{% endhighlight %}

{% endautocrossref %}

{% autocrossref %}

*See also: none*

{% endautocrossref %}
