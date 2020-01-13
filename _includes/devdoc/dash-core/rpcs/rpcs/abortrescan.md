{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/abortrescan.md" %}
<!--__-->

##### AbortRescan
{% include helpers/subhead-links.md %}

{% assign summary_abortRescan="Stops current wallet rescan" %}

{% autocrossref %}

The `abortrescan` RPC {{summary_abortRescan}}

Stops current wallet rescan triggered e.g. by an `importprivkey` RPC call.

*Parameters: none*

*Result---`true` on success*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "null"
  p: "Required<br>(exactly 1)"
  d: "`true` when the command was successful or `false` if not successful."
{% enditemplate %}

*Example from Dash Core 0.15.0*

Abort the running wallet rescan

{% highlight bash %}
dash-cli -testnet abortrescan
{% endhighlight %}

Result:
{% highlight text %}
true
{% endhighlight %}

*See also: none*

{% endautocrossref %}
