{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getspecialtxes.md" %}
<!--__-->

##### GetSpecialTxes
{% include helpers/subhead-links.md %}

{% assign summary_getSpecialTxes="returns an array of special transactions found in the specified block" %}

{% autocrossref %}

*Added in Dash Core 0.13.1*

The `getspecialtxes` RPC {{summary_getSpecialTxes}}

*Parameter #1---Block hash*

{% itemplate ntpd1 %}
- n: "`blockhash`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The block hash."
{% enditemplate %}

*Parameter #2---Special transaction type*

{% itemplate ntpd1 %}
- n: "type"
  t: "int"
  p: "Optional<br>(0 or 1)"
  d: "Filter special txes by type, -1 means all types (default: -1)"

{% enditemplate %}

*Parameter #3---Result limit*

{% itemplate ntpd1 %}
- n: "count"
  t: "int"
  p: "Optional<br>(0 or 1)"
  d: "The number of transactions to return (default: 10)"

{% enditemplate %}

*Parameter #4---Results to skip*

{% itemplate ntpd1 %}
- n: "skip"
  t: "int"
  p: "Optional<br>(0 or 1)"
  d: "The number of transactions to skip (default: 0)"

{% enditemplate %}

*Parameter #5---Verbosity*

{% itemplate ntpd1 %}
- n: "verbosity"
  t: "int"
  p: "Optional<br>(0 or 1)"
  d: "0 for hashes, 1 for hex-encoded data, and 2 for JSON object
 (default: 0)"

{% enditemplate %}

*Result (if `verbosity` was `0`)---An array of transaction IDs*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex): array"
  p: "Required<br>(exactly 1)"
  d: "Array of special transaction hashes"
{% enditemplate %}


*Result (if `verbosity` was `1`)---An array of serialized transactions*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex): array"
  p: "Required<br>(exactly 1)"
  d: "Array of serialized, hex-encoded data for the special transaction(s)"
{% enditemplate %}

*Result (if `verbosity` was `2`)---An array of JSON objects*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex): array of ojbects"
  p: "Required<br>(exactly 1)"
  d: "Array of special transaction objects in the format of the `getrawtransaction` RPC"
{% enditemplate %}

*Example from Dash Core 0.13.1*

List of Special Transactions hashes.

{% highlight bash %}
dash-cli -testnet getspecialtxes \
0000003db0006ecaccdf5ae2cfa9d94406ef40ff65b9ec34668b87fca3da9226
{% endhighlight %}

Result:
{% highlight json %}
[
  "1572a15f56307e413afe3cb7ea0017a1a3fd6d89c6c5f258cc17b2888a8e7fff",
  "89a6dc42063e4a792ec225db64dd9426742a5d1738e8821625d2ab920a6187b2",
  "fa3b3b0d3522becb02ddd15dd075f3d6ecc6a5a50b43c6c9f6d4703a9a8509d5"
]
{% endhighlight %}

List of Provider Registration Special Transactions (type: 1) in serialized, hex-encoded format.

{% highlight bash %}
dash-cli -testnet getspecialtxes \
0000003db0006ecaccdf5ae2cfa9d94406ef40ff65b9ec34668b87fca3da9226 1 10 0 1
{% endhighlight %}

Result:
{% highlight json %}
[
  "0300010001ea721d7420a9b58025894d08f9fecc73b7b87ed09277fa99dad5aa028ea357e1000000006b48304502210093c409672eed335f80630d7108c108d0b85ebe4d8be0758f8a3745f617c4b57302203175063605552c89f6de7f3dadc1773d5ef773b7cc0ccf98e6c5555ea75ba307012102b21d19fec95d9863c5b12fafeb60530e1cfc51d83f49ea9bca7192abb8b83e46feffffff01c4bb609a010000001976a9142efe9f9d3b36b133364d3cccbd27db75a0fbdcb788ac00000000fd120101000000000031567fbaf591ae9d2d0e9050bebce6a311cfd900616f851a3a630aa65e53f6940000000000000000000000000000ffffad3d1ee74a43c1ad3af209f75deaeb9216fc8339fd48d376f9b007ffa44583c9908f4aaca8dd97990c56043e475723f90940ef5fd7d493152540f25f58fb8c965ee5e1be4f850a661476c1ad3af209f75deaeb9216fc8339fd48d376f9b0e8031976a91454bbd7bd7c21553612d60ab16579e51efbcb135288acc281e8bf5a0dd22dfc9f1edeef9ef248f965a79210d997da37fb3e1dec76d1a4412096809bc005c860a0215cb008e3044b972688443b0b7a31ac5a04b728e63b1b5c5489e33dd666435f93c646523ad8a1d935a58957026749cbd0a9bf7e09a77388",
  "03000100012354b77c0f261f3d5b8424cbe67c2f27130f01c531732a08b8ae3f28aaa1b1fb000000006a473044022058323d3d9114492a7a7d350d5e3127d2dc550563968319987079c98f19ed519202204160cfe81adf1f41301136a3cbe03697baa1b14c3103b66bd839ace503dbf2630121026f83a8dad6b4695b136c399405b31d4031fd6631c469673d71eda479157ef9dcfeffffff0106b8609a010000001976a9142a855dc127bfdd5cc0ab73b71ff126e49aa409c488ac00000000fd1201010000000000b60dcb8bab5aba47435942c36ca4ee74ea5b662f4d7c7b528ce341915b2d5aec0100000000000000000000000000ffffad3d1ee74a428d3433cb6b9a1a29fdf07613172bbfdab744889689e308c9d2d8a3cb35f9d7bb7220b1eca82c952b82111119670dacae18a509628c775287e4e796128cd6379b80dffd7d8d3433cb6b9a1a29fdf07613172bbfdab744889610271976a91454bbd7bd7c21553612d60ab16579e51efbcb135288ac512010a2b992d7d5c1e1f999852855cc55162800025cfdf3b56c74e4734a2d97411f858532607cbd8848452dab1f216650def1d11a5abf3fa464c9ffcc7fec894a012a4b70ee5d3b983b5fe640f04a7f3e4fe67fbb5b7cccb71afa37888ad6cca48e"
]
{% endhighlight %}

List of Coinbase Special Transactions (type: 5) in JSON format.

{% highlight bash %}
dash-cli -testnet getspecialtxes \
00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b 5 10 0 2
{% endhighlight %}

Result:
{% highlight json %}
[
  {
    "txid": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
    "size": 229,
    "version": 3,
    "type": 5,
    "locktime": 0,
    "vin": [
      {
        "coinbase": "03ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000",
        "sequence": 4294967295
      }
    ],
    "vout": [
      {
        "value": 8.10000000,
        "valueSat": 810000000,
        "n": 0,
        "scriptPubKey": {
          "asm": "OP_DUP OP_HASH160 cbd7bfcc50351180132b2c0698cb90ad74c473c7 OP_EQUALVERIFY OP_CHECKSIG",
          "hex": "76a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac",
          "reqSigs": 1,
          "type": "pubkeyhash",
          "addresses": [
            "yeuGUfPMrbEqAS2Pw1wonYgEPbM4LAA9LK"
          ]
        }
      },
      {
        "value": 8.10000000,
        "valueSat": 810000000,
        "n": 1,
        "scriptPubKey": {
          "asm": "OP_DUP OP_HASH160 88a060bc2dfe05780ae4dcb6c98b12436c35a939 OP_EQUALVERIFY OP_CHECKSIG",
          "hex": "76a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac",
          "reqSigs": 1,
          "type": "pubkeyhash",
          "addresses": [
            "yYmrsYP3XYMZr1cGtha3QzmuNB1C7CfyhV"
          ]
        }
      }
    ],
    "extraPayloadSize": 70,
    "extraPayload": "0200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3",
    "cbTx": {
      "version": 2,
      "height": 86190,
      "merkleRootMNList": "877392defa24888af72aa15f92b6609e71db1b385c1895bf870896398bc0e578",
      "merkleRootQuorums": "a320b95dab4963ca2547434d63ac8203835dfd0ce245924fa83dc6bab6ac57c7"
    },
    "instantlock": false,
    "chainlock": false
  }
]
{% endhighlight %}

*See also:*

* [GetRawTransaction][rpc getrawtransaction]: {{summary_getRawTransaction}}

{% endautocrossref %}
