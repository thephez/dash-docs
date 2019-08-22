{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getmemoryinfo.md" %}

##### GetMemoryInfo
{% include helpers/subhead-links.md %}

{% assign summary_getMemoryInfo="returns information about memory usage." %}

<!-- __ -->

{% autocrossref %}

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The `getmemoryinfo` RPC {{summary_getMemoryInfo}}

*Parameter #1---mode*

{% itemplate ntpd1 %}
- n: "mode"
  t: "string"
  p: "Optional<br>Default: `stats`"
  d: "*Added in Dash Core 0.14.1*<br><br>Determines what kind of information is returned.<br>
       - `stats` returns general statistics about memory usage in the daemon.<br>
       - `mallocinfo` returns an XML string describing low-level heap state (only available if compiled with glibc 2.10+)."
{% enditemplate %}

*Result---information about memory usage*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "An object containing information about memory usage"

- n: "→<br>`locked`"
  t: "string : object"
  p: "Required<br>(exactly 1)"
  d: "An object containing information about locked memory manager"

- n: "→→<br>`used`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Number of bytes used"

- n: "→→<br>`free`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Number of bytes available in current arenas"

- n: "→→<br>`total`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Total number of bytes managed"

- n: "→→<br>`locked`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Amount of bytes that succeeded locking"

- n: "→→<br>`chunks_used`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Number allocated chunks"

- n: "→→<br>`chunks_free`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "Number unused chunks"

{% enditemplate %}

*Example from Dash Core 0.12.3*

{% highlight bash %}
dash-cli getmemoryinfo
{% endhighlight %}

Result:

{% highlight json %}
{
  "locked": {
    "used": 1146240,
    "free": 426624,
    "total": 1572864,
    "locked": 1572864,
    "chunks_used": 16368,
    "chunks_free": 7
  }
}
{% endhighlight %}

*See also*

* [GetMemPoolInfo][rpc getmempoolinfo]: {{summary_getMemPoolInfo}}

{% endautocrossref %}
