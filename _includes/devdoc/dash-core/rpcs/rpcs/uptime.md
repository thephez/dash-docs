{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/uptime.md" %}
<!--__-->

##### Uptime
{% include helpers/subhead-links.md %}

{% assign summary_uptime="returns the total uptime of the server." %}

{% autocrossref %}

The `uptime` RPC {{summary_uptime}}

*Parameters: none*

*Result*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of seconds that the server has been running"

{% enditemplate %}

*Example from Dash Core 0.14.1*

{% highlight bash %}
dash-cli -testnet uptime
{% endhighlight %}

Result:
{% highlight text %}
5500
{% endhighlight %}

*See also: none*

{% endautocrossref %}
