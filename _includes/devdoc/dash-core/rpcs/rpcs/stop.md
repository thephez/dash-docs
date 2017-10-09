{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/stop.md" %}

##### Stop
{% include helpers/subhead-links.md %}

{% assign summary_stop="safely shuts down the Dash Core server." %}

{% autocrossref %}

The `stop` RPC {{summary_stop}}

*Parameters: none*

*Result---the server is safely shut down*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The string \"Dash Core server stopping\""

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet stop
{% endhighlight %}

Result:

{% highlight text %}
Dash Core server stopping
{% endhighlight %}

*See also: none*

{% endautocrossref %}
