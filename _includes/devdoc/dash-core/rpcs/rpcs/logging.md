{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/logging.md" %}
<!--__-->

##### Logging
{% include helpers/subhead-links.md %}

{% assign summary_logging="gets and sets the logging configuration" %}

{% autocrossref %}

The `logging` RPC {{summary_logging}}

*Parameter #1---include categories*

{% itemplate ntpd1 %}
- n: "`include`"
  t: "array of strings"
  p: "Optional<br>(0 or 1)"
  d: "Enable debugging for these categories"

{% enditemplate %}

*Parameter #2---exclude categories*

{% itemplate ntpd1 %}
- n: "`exclude`"
  t: "array of strings"
  p: "Optional<br>(0 or 1)"
  d: "Enable debugging for these categories"

{% enditemplate %}

The categories are:

| Type | Category |
| - | - |
| Special | • `0` - Disables all categories <br>• `1` or `all` - Enables all categories <br>• `dash` - Enables/disables all Dash categories |
| Standard | `addrman`, `bench` <br>`cmpctblock`, `coindb`, `db`, `estimatefee`, `http`, `leveldb`, `libevent`, `mempool`, `mempoolrej`, `net`, `proxy`, `prune`, `qt`, `rand`, `reindex`, `rpc`, `selectcoins`, `tor`, `zmq`|
| Dash | <br>`chainlocks`, `gobject`, `instantsend`, `keepass`, `llmq<!--noref-->`, `llmq<!--noref-->-dkg`, `llmq<!--noref-->-sigs`, `mnpayments`, `mnsync`, `privatesend`, `spork` |

*Result---a list of the logging categories that are active*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "A JSON object show a list of the logging categories that are active"

{% enditemplate %}

*Example from Dash Core 0.15.0*

Include a category in logging

{% highlight bash %}
dash-cli -testnet logging '["llmq", "spork"]'
{% endhighlight %}

Result:
{% highlight json %}
{
  "net": 0,
  "tor": 0,
  "mempool": 0,
  "http": 0,
  "bench": 0,
  "zmq": 0,
  "db": 0,
  "rpc": 0,
  "estimatefee": 0,
  "addrman": 0,
  "selectcoins": 0,
  "reindex": 0,
  "cmpctblock": 0,
  "rand": 0,
  "prune": 0,
  "proxy": 0,
  "mempoolrej": 0,
  "libevent": 0,
  "coindb": 0,
  "qt": 0,
  "leveldb": 0,
  "chainlocks": 0,
  "gobject": 0,
  "instantsend": 0,
  "keepass": 0,
  "llmq": 1,
  "llmq-dkg": 0,
  "llmq-sigs": 0,
  "mnpayments": 0,
  "mnsync": 0,
  "privatesend": 0,
  "spork": 1
}
{% endhighlight %}

Excluding a previously included category (without including any new ones):

{% highlight bash %}
dash-cli -testnet logging '[]' '["spork"]'
{% endhighlight %}

Result:
{% highlight json %}
{
  "net": 0,
  "tor": 0,
  "mempool": 0,
  "http": 0,
  "bench": 0,
  "zmq": 0,
  "db": 0,
  "rpc": 0,
  "estimatefee": 0,
  "addrman": 0,
  "selectcoins": 0,
  "reindex": 0,
  "cmpctblock": 0,
  "rand": 0,
  "prune": 0,
  "proxy": 0,
  "mempoolrej": 0,
  "libevent": 0,
  "coindb": 0,
  "qt": 0,
  "leveldb": 0,
  "chainlocks": 0,
  "gobject": 0,
  "instantsend": 0,
  "keepass": 0,
  "llmq": 1,
  "llmq-dkg": 0,
  "llmq-sigs": 0,
  "mnpayments": 0,
  "mnsync": 0,
  "privatesend": 0,
  "spork": 0
}
{% endhighlight %}

*See also*

* [Debug][rpc debug]: {{summary_debug}}

{% endautocrossref %}
