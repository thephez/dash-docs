{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/setprivatesendamount.md" %}

##### SetPrivateSendAmount
{% include helpers/subhead-links.md %}

{% assign summary_setPrivateSendAmount="sets the amount of DASH to be mixed with PrivateSend" %}

<!-- __ -->

{% autocrossref %}

The `setprivatesendamount` RPC {{summary_setPrivateSendAmount}}

*Parameter #1---amount to mix*

{% itemplate ntpd1 %}
- n: "Amount"
  t: "int"
  p: "Required<br>(exactly 1)"
  d: "The number of DASH to mix (minimum: 2, maximum: 21,000,000)"

{% enditemplate %}

*Result---`null` on success*

*Example from Dash Core 0.13.0*

{% highlight bash %}
dash-cli -testnet setprivatesendamount 2000
{% endhighlight %}

(Success: no result displayed.)

*See also:*

* [SetPrivateSendRounds][rpc setprivatesendrounds]: {{summary_setPrivateSendRounds}}

{% endautocrossref %}
