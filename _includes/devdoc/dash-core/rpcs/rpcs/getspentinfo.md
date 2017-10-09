{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getspentinfo.md" %}#

##### GetSpentInfo
{% include helpers/subhead-links.md %}

{% assign summary_getSpentInfo="returns the txid and index where an output is spent (requires `spentindex` to be enabled)." %}

{% autocrossref %}

*Added in Dash Core 0.12.1*

The `getspentinfo` RPC {{summary_getSpentInfo}}

*Parameter #1---the TXID of the output*

{% itemplate ntpd1 %}
- n: "TXID"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The TXID of the transaction containing the relevant output, encoded as hex in RPC byte order"

{% enditemplate %}

*Parameter #2---the start block height*

{% itemplate ntpd1 %}
- n: "Index"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The block height to begin looking in"

{% enditemplate %}

*Result---the TXID and spending input index*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object/null"
  p: "Required<br>(exactly 1)"
  d: "Information about the spent output.  If output wasn't found or if an error occurred, this will be JSON `null`"

- n: "→<br>`txid`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The output txid"

- n: "→<br>`index`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "The spending input index"
{% enditemplate %}

*Example from Dash Core 0.12.2*

Get the txid and index where an output is spent:

{% highlight bash %}
dash-cli getspentinfo \
  '''
    {
      "txid": "e0a06b47f0de6f3851a228d5ac377ac38b495adf04298c43e951e679c5b0aa8f", \
      "index": 0
    }
{% endhighlight %}

Result:
**Example needed**

{% highlight json %}

{% endhighlight %}

{% endautocrossref %}
