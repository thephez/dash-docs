{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/gobject.md" %}

##### GObject
{% include helpers/subhead-links.md %}

{% assign summary_gObject="provides a set of commands for managing governance objects and displaying information about them." %}

{% autocrossref %}

The `gobject` RPC {{summary_gObject}}

###### GObject Check

###### GObject Prepare

###### GObject Submit

###### GObject Deserialize

###### GObject Count

The `gobject count` RPC returns the count of governance objects and votes.

*Parameters: none*

*Result---count of governance objects and votes*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The count of governance objects and votes"

{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet gobject count
{% endhighlight %}

Result (wrapped):
{% highlight text %}
Governance Objects: 177 (Proposals: 177, Triggers: 0, Watchdogs: 0/0, \
	Other: 0; Erased: 5), Votes: 9680
{% endhighlight %}



###### GObject Get

The `gobject get` RPC returns a governance object by hash.

*Parameter #1---object hash*

{% itemplate ntpd1 %}
- n: "`governance-hash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of a governance object"

{% enditemplate %}

*Result---governance object details*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Information about the governance object"

- n: "→<br>`DataHex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Governance object info as hex string"

- n: "→<br>`DataString`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Governance object info as string"

- n: "→<br>`Hash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Hash of this governance object"

- n: "→<br>`CollateralHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Hash of the collateral payment transaction"

- n: "→<br>`ObjectType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Object types:<br>`1` - Unknown<br>`2` - Proposal<br>`3` - Trigger<br>`4` - Watchdog"

- n: "→<br>`CreationTime`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Object creation time as Unix epoch time"

- n: "→<br>`FundingResult`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Funding vote details"

- n: "→ →<br>`AbsoluteYesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes minus number of `No` votes"

- n: "→ →<br>`YesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes"

- n: "→ →<br>`NoCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `No` votes"

- n: "→ →<br>`AbstainCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Abstain` votes"

- n: "→<br>`ValidResult`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Object validity vote details"

- n: "→ →<br>`AbsoluteYesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes minus number of `No` votes"

- n: "→ →<br>`YesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes"

- n: "→ →<br>`NoCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `No` votes"

- n: "→ →<br>`AbstainCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Abstain` votes"

- n: "→<br>`DeleteResult`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Delete vote details"

- n: "→ →<br>`AbsoluteYesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes minus number of `No` votes"

- n: "→ →<br>`YesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes"

- n: "→ →<br>`NoCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `No` votes"

- n: "→ →<br>`AbstainCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Abstain` votes"

- n: "→<br>`EndorsedResult`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Endorsed vote details"

- n: "→ →<br>`AbsoluteYesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes minus number of `No` votes"

- n: "→ →<br>`YesCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Yes` votes"

- n: "→ →<br>`NoCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `No` votes"

- n: "→ →<br>`AbstainCount`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Number of `Abstain` votes"

- n: "→<br>`fLocalValidity`"
  t: "boolean"
  p: "Required<br>(exactly 1)"
  d: "Valid by the blockchain"

- n: "→<br>`IsValidReason`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "`fLocalValidity` error result. Empty if no error returned."

- n: "→<br>`fCachedValid`"
  t: "boolean"
  p: "Required<br>(exactly 1)"
  d: "Minimum network support has been reached flagging this object as a valid and understood governance object (e.g, the serialized data is correct format, etc)"

- n: "→<br>`fCachedFunding`"
  t: "boolean"
  p: "Required<br>(exactly 1)"
  d: "Minimum network support has been reached for this object to be funded (doesn't mean it will be for sure though)"

- n: "→<br>`fCachedDelete`"
  t: "boolean"
  p: "Required<br>(exactly 1)"
  d: "Minimum network support has been reached saying this object should be deleted from the system entirely"

- n: "→<br>`fCachedEndorsed`"
  t: "boolean"
  p: "Required<br>(exactly 1)"
  d: "Minimum network support has been reached flagging this object as endorsed"


{% enditemplate %}

*Example from Dash Core 0.12.2*

{% highlight bash %}
dash-cli -testnet gobject get \
	42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff
{% endhighlight %}

Result (wrapped):
{% highlight json %}
{
  "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343339353130222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530343338222c227061796d656e745f61646472657373223a22795668577955345933756456784d5234464b3333556741534a41436831436835516a222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530343338222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530343338227d5d5d",
  "DataString": "[[\"proposal\",{\"end_epoch\":\"1507439510\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250438\",\"payment_address\":\"yVhWyU4Y3udVxMR4FK33UgASJACh1Ch5Qj\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250438\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250438\"}]]",
  "Hash": "42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff",
  "CollateralHash": "cb09bd0310c0a67cde9387ad4d8908a7ad9f5d89c5afd58e9332b8bd26a646c7",
  "ObjectType": 1,
  "CreationTime": 1507246694,
  "FundingResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "ValidResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "DeleteResult": {
    "AbsoluteYesCount": 31,
    "YesCount": 31,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "EndorsedResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "fLocalValidity": true,
  "IsValidReason": "",
  "fCachedValid": true,
  "fCachedFunding": false,
  "fCachedDelete": false,
  "fCachedEndorsed": false
}
{% endhighlight %}

###### GObject Getvotes

###### GObject Getcurrentvotes

###### GObject List

###### GObject Diff

###### GObject Vote-alias

###### GObject Vote-conf

###### GObject Vote-many


{% highlight bash %}
dash-cli -testnet gobject
{% endhighlight %}

Result:
{% highlight json %}
	*INSERT RESULTS HERE*
{% endhighlight %}

*See also:*

{% endautocrossref %}
