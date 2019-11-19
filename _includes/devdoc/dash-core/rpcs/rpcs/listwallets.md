{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/listwallets.md" %}
<!--__-->

##### ListWallets
{% include helpers/subhead-links.md %}

{% assign summary_listWallets="returns a list of currently loaded wallets." %}

{% autocrossref %}

The `listwallets` RPC {{summary_listWallets}}

For full information on the wallet, use the `getwalletinfo` RPC.

*Parameters: none*

*Result*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array of strings containing a list of currently loaded wallet files"

- n: "→<br>Wallet"
  t: "string"
  p: "Required<br>(0 or more)"
  d: "The name of a wallet file"

{% enditemplate %}

*Example from Dash Core 0.15.0*

{% highlight bash %}
dash-cli -testnet listwallets
{% endhighlight %}

Result:
{% highlight json %}
[
  "wallet.dat"
]
{% endhighlight %}

*See also: none*

{% endautocrossref %}
