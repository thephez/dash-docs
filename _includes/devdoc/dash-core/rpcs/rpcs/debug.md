{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/debug.md" %}
<!-- __ -->

##### Debug
{% include helpers/subhead-links.md %}

{% assign summary_debug="changes the debug category from the console." %}

{% autocrossref %}

The `debug` RPC {{summary_debug}}

*Parameter #1---debug category*

{% itemplate ntpd1 %}
- n: "Debug category"
  t: "string"
  p: "Required<br>(1 or more)"
  d: "The debug category to activate. Use a `+` to specify multiple categories. Categories will be one of the following:<br>• `0` - Disables all categories <br>• `1` or `all` - Enables all categories <br>• `addrman` <br>• `bench` <br>• `cmpctblock` <br>• `coindb` <br>• `db` <br>• `estimatefee` <br>• `http` <br>• `leveldb` <br>• `libevent` <br>• `mempool` <br>• `mempoolrej` <br>• `net` <br>• `proxy` <br>• `prune` <br>• `qt` <br>• `rand` <br>• `reindex` <br>• `rpc` <br>• `selectcoins` <br>• `tor` <br>• `zmq` <br>• `dash` (all subcategories)<br><br>The `dash` sub-categories can be enabled individually:<br>• `chainlocks` <br>• `gobject` <br>• `instantsend` <br>• `keepass` <br>• `llmq<!--noref-->` <br>• `llmq<!--noref-->-dkg` <br>• `llmq<!--noref-->-sigs` <br>• `mnpayments` <br>• `mnsync` <br>• `privatesend` <br>• `spork` <br><br><br>Note: No error will be thrown even if the specified category doesn't match any of the above"
{% enditemplate %}

*Example from Dash Core 0.14.1*

{% highlight bash %}
dash-cli -testnet debug "net+mempool"
{% endhighlight %}

Result:

{% highlight text %}
Debug mode: net+mempool
{% endhighlight %}

*See also: none*

{% endautocrossref %}
