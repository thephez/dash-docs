{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/ref_bips.md" %}

{% autocrossref %}
<!-- __ -->

## Improvement Proposals
{% include helpers/subhead-links.md %}

### Dash (DIPs)
{% include helpers/subhead-links.md %}

Similar to Bitcoin's BIPs, a Dash Improvement Proposal ([DIP](https://github.com/dashpay/dips)) is a design
document for providing information to the Dash community, or describing a new
feature for Dash processes/environment. The DIP should provide a
concise technical specification of the feature and a rationale for the feature.

{% endautocrossref %}

#### DIP Summary Table
<!-- no subhead-links here -->

Information from [Dash DIP repository](https://github.com/dashpay/dips/blob/master/README.md).

{% include layout/base/dip-table.html %}


{% autocrossref %}

### Bitcoin (BIPs)
{% include helpers/subhead-links.md %}

A Bitcoin Improvement Proposal (BIP) is a design document providing information
to the Bitcoin community, or describing a new feature for Bitcoin or its
processes or environment.

Since Dash is forked from Bitcoin, some BIPs are applicable to both. The following
table provides a list of the BIPs that are relevant to Dash. Some BIPs may only
be partially implemented or modified to meet Dash requirements. The `Dash Status`
column indicates if any changes were made.

{% endautocrossref %}

#### BIP Summary Table
<!-- no subhead-links here -->

Dash-specific BIP information derived from Dash developer
[QuantumExplorer's BIP repository](https://github.com/QuantumExplorer/bips/blob/master/README.mediawiki).

{% include layout/base/bip-table.html %}

\* These BIPs are not Bitcoin or Dash specific (i.e. BIP-0044 Multi-Account Hierarchy for Deterministic Wallets). Generally relates to the Application Layer and not specifically the reference client.
