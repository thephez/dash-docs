{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/disconnectnode.md" %}

##### DisconnectNode
{% include helpers/subhead-links.md %}

{% assign summary_disconnectNode="immediately disconnects from a specified node." %}

{% autocrossref %}

*Added in Bitcoin Core 0.12.0*

The `disconnectnode` RPC {{summary_disconnectNode}}

*Parameter #1---hostname/IP address and port of node to disconnect*

{% itemplate ntpd1 %}
- n: "`address`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The node you want to disconnect from as a string in the form of `<IP address>:<port>`.<br><br>*Updated in Bitcoin Core 0.14.1*"
{% enditemplate %}

*Parameter #2---nodeid*

{% itemplate ntpd1 %}
- n: "nodeid"
  t: "number"
  p: "Optional"
  d: "The node ID (see `getpeerinfo` for node IDs)"
{% enditemplate %}

*Result---`null` on success or error on failed disconnect*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "null"
  p: "Required<br>(exactly 1)"
  d: "JSON `null` when the node was disconnected"

{% enditemplate %}

*Example from Dash Core 0.14.1*

Disconnects following node by address.

{% highlight bash %}
dash-cli -testnet disconnectnode 192.0.2.113:19999
{% endhighlight %}

Result (no output from `dash-cli` because result is set to `null`).

Disconnects following node by id.

{% highlight bash %}
dash-cli -testnet disconnectnode "" 3
{% endhighlight %}

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [AddNode][rpc addnode]: {{summary_addNode}}
* [GetAddedNodeInfo][rpc getaddednodeinfo]: {{summary_getAddedNodeInfo}}

{% endautocrossref %}
