{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/quorum.md" %}

##### Quorum
{% include helpers/subhead-links.md %}

<!--__-->

{% assign summary_quorum="provides a set of commands for quorums (LLMQs)." %}

{% autocrossref %}

*Added in Dash Core 0.14.0*

The `quorum` RPC {{summary_quorum}}

{% endautocrossref %}

###### Quorum<!--noref--> List
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> list` RPC displays a list of on-chain quorums.

*Parameter #1---quorum count*

{% itemplate ntpd1 %}
- n: "`count`"
  t: "number"
  p: "Optional<br>(0 or 1)"
  d: "Number of quorums to list"
{% enditemplate %}

*Result---a secret/public key pair*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Quorum list"

- n: "→<br>Quorum"
  t: "array"
  p: "Required<br>(1 or more)"
  d: "Array of quorum details"

- n: "→ →<br>Quorum Hash"
  t: "string (hex)"
  p: "Optional<br>(0 or more)"
  d: "A quorum hash"
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum list
{% endhighlight %}

Result:
{% highlight json %}
{
  "llmq_50_60": [
    "00000000023cc6dde69bed898c83fe2328ef38b1ea9da14a599efa14caef0b7d",
    "000000002b968fb3b2fc2ff18d6e89611e366b4d38a6d0437e99bd7c37f2fd83",
    "000000000301054c038b07b5b51493d5efc3f078e3aede6eb603c47943d1cc78",
    "000000000e901278c00c896754a06f8d45d0268c6aff6e72ffb3007d07c10e73",
    "000000001bc592f2a8676203835bc6ad442abeadb9c22b8d6a2999db07354b01",
    "000000000896c37ef8a32318ee871589394f1578473b8825275b610690e47db0",
    "00000000133b192b2319a0716ad18e5788981fff51856f61205af5d6a634ba41",
    "0000000004946f3f9f82a298985f73080d62627d51f6f4ba77f3cd8c6788b3d0",
    "0000000005cb014d3df9bac0ba379f1d5b8b75f0e6d7c408d43ac1db330ec641",
    "0000000006c1653c7ee747f140dd7daa1da23a541e67a0fc0dc88db3482ec4d5"
  ],
  "llmq_400_60": [
    "0000000007697fd69a799bfa26576a177e817bc0e45b9fcfbf48b362b05aeff2"
  ],
  "llmq_400_85": [
  ]
}
{% endhighlight %}

{% endautocrossref %}




{% autocrossref %}

*See also:*

{% endautocrossref %}
