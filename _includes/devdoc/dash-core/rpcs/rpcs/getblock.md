{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getblock.md" %}
<!--__-->

##### GetBlock
{% include helpers/subhead-links.md %}

{% assign summary_getBlock="gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block." %}

{% autocrossref %}

The `getblock` RPC {{summary_getBlock}}

*Parameter #1---block hash*

{% itemplate ntpd1 %}
- n: "Block Hash"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the header of the block to get, encoded as hex in RPC byte order"

{% enditemplate %}

*Parameter #2---whether to get JSON or hex output*

{% itemplate ntpd1 %}
- n: "Verbosity"
  t: "number (int)"
  p: "Optional<br>(0 or 1)"
  d: "Set to one of the following verbosity levels:<br>• `0` - Get the block in serialized block format;<br>• `1` - Get the decoded block as a JSON object (default)<br>• `2` - Get the decoded block as a JSON object with transaction details"

{% enditemplate %}

*Result (if verbosity was `0`)---a serialized block*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "string (hex)/null"
  p: "Required<br>(exactly 1)"
  d: "The requested block as a serialized block, encoded as hex, or JSON `null` if an error occurred"

{% enditemplate %}

*Result (if verbosity was `1` or omitted)---a JSON block with transaction hashes*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object/null"
  p: "Required<br>(exactly 1)"
  d: "An object containing the requested block, or JSON `null` if an error occurred"

- n: "→<br>`hash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1"

- n: "→<br>`confirmations`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain"

- n: "→<br>`size`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The size of this block in serialized block format, counted in bytes"

- n: "→<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The height of this block on its block chain"

- n: "→<br>`version`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "This block's version number.  See [block version numbers][section block versions]"

- n: "→<br>`versionHex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "_Added in Bitcoin Core 0.13.0_<br><br>The block version formatted in hexadecimal"

- n: "→<br>`merkleroot`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for this block, encoded as hex in RPC byte order"

- n: "→<br>`tx`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array containing the TXIDs of all transactions in this block.  The transactions appear in the array in the same order they appear in the serialized block"

- n: "→ →<br>TXID"
  t: "string (hex)"
  p: "Required<br>(1 or more)"
  d: "The TXID of a transaction in this block, encoded as hex in RPC byte order"

- n: "→<br>`cbTx`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Coinbase special transaction details"

- n: "→ →<br>`version`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The version of the Coinbase special transaction (CbTx)"

- n: "→ →<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The height of this block on its block chain"

- n: "→ →<br>`merkleRootMNList`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for the masternode list"

- n: "→ →<br>`merkleRootQuorums`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for the quorum list"

- n: "→<br>`time`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The value of the *time* field in the block header, indicating approximately when the block was created"

- n: "→<br>`mediantime`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The median block time in Unix epoch time"  

- n: "→<br>`nonce`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The nonce which was successful at turning this particular block into one that could be added to the best block chain"

- n: "→<br>`bits`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass"

- n: "→<br>`difficulty`"
  t: "number (real)"
  p: "Required<br>(exactly 1)"
  d: "The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0"

- n: "→<br>`chainwork`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex"

- n: "→<br>`previousblockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block"

- n: "→<br>`nextblockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order"

{% enditemplate %}

*Result (if verbosity was `2`---a JSON block with full transaction details*

{% assign DEPTH="→" %}
{% include helpers/vars.md %}

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object/null"
  p: "Required<br>(exactly 1)"
  d: "An object containing the requested block, or JSON `null` if an error occurred"

- n: "→<br>`hash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1"

- n: "→<br>`confirmations`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain"

- n: "→<br>`size`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The size of this block in serialized block format, counted in bytes"

- n: "→<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The height of this block on its block chain"

- n: "→<br>`version`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "This block's version number.  See [block version numbers][section block versions]"

- n: "→<br>`versionHex`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "_Added in Bitcoin Core 0.13.0_<br><br>The block version formatted in hexadecimal"

- n: "→<br>`merkleroot`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for this block, encoded as hex in RPC byte order"

- n: "→<br>`tx`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array containing the TXIDs of all transactions in this block.  The transactions appear in the array in the same order they appear in the serialized block"

{{INCLUDE_DECODE_RAW_TRANSACTION}}

- n: "→<br>`cbTx`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Coinbase special transaction details"

- n: "→ →<br>`version`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The version of the Coinbase special transaction (CbTx)"

- n: "→ →<br>`height`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The height of this block on its block chain"

- n: "→ →<br>`merkleRootMNList`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for the masternode list"

- n: "→ →<br>`merkleRootQuorums`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The merkle root for the quorum list"

- n: "→<br>`time`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The value of the *time* field in the block header, indicating approximately when the block was created"

- n: "→<br>`mediantime`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "*Added in Bitcoin Core 0.12.0*<br><br>The median block time in Unix epoch time"  

- n: "→<br>`nonce`"
  t: "number (int)"
  p: "Required<br>(exactly 1)"
  d: "The nonce which was successful at turning this particular block into one that could be added to the best block chain"

- n: "→<br>`bits`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass"

- n: "→<br>`difficulty`"
  t: "number (real)"
  p: "Required<br>(exactly 1)"
  d: "The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0"

- n: "→<br>`chainwork`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex"

- n: "→<br>`previousblockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block"

- n: "→<br>`nextblockhash`"
  t: "string (hex)"
  p: "Optional<br>(0 or 1)"
  d: "The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order"

- n: "<br>`chainlock`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "*Added in Dash Core 0.14.0*<br><br>If set to `true`, this transaction is in a block that is locked (not susceptible to a chain re-org)"

{% enditemplate %}

*Example from Dash Core 0.14.1*

Get a block in raw hex:

{% highlight bash %}
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b \
            0
{% endhighlight %}

Result (wrapped):

{% highlight text %}
00000020272e374a06c87a0ce0e6ee1a0754c98b9ec2493e7c0ac7ba41a07300\
00000000568b3c4156090db4d8db5447762e95dd1d4c921c96801a9086720ded\
85266325916cc05caa94001c5caf359501030005000100000000000000000000\
00000000000000000000000000000000000000000000ffffffff2703ae50011a\
4d696e656420627920416e74506f6f6c2021000b01201da9196f000000000700\
0000ffffffff02809e4730000000001976a914cbd7bfcc50351180132b2c0698\
cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe05780ae4dc\
b6c98b12436c35a93988ac00000000460200ae50010078e5c08b39960887bf95\
185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f92\
45e20cfd5d830382ac634d434725ca6349ab5db920a3
{% endhighlight %}

Get the same block in JSON:

{% highlight bash %}
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b
{% endhighlight %}

Result:

{% highlight json %}
{
  "hash": "00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b",
  "confirmations": 73083,
  "size": 310,
  "height": 86190,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
  "tx": [
    "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56"
  ],
  "cbTx": {
    "version": 2,
    "height": 86190,
    "merkleRootMNList": "877392defa24888af72aa15f92b6609e71db1b385c1895bf870896398bc0e578",
    "merkleRootQuorums": "a320b95dab4963ca2547434d63ac8203835dfd0ce245924fa83dc6bab6ac57c7"
  },
  "time": 1556114577,
  "mediantime": 1556113720,
  "nonce": 2503323484,
  "bits": "1c0094aa",
  "difficulty": 440.8261075201009,
  "chainwork": "0000000000000000000000000000000000000000000000000045ab6f9403a8e7",
  "previousblockhash": "000000000073a041bac70a7c3e49c29e8bc954071aeee6e00c7ac8064a372e27",
  "nextblockhash": "00000000001c6c962639a1aad4cd069f315560a824d489418dc1f26b50a58aed",
  "chainlock": true
}
{% endhighlight %}

Get the same block in JSON with transaction details:

{% highlight bash %}
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b 2
{% endhighlight %}

Result:

{% highlight json %}
{
  "hash": "00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b",
  "confirmations": 73084,
  "size": 310,
  "height": 86190,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
  "tx": [
    {
      "txid": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
      "version": 3,
      "type": 5,
      "size": 229,
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
      "hex": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff2703ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000ffffffff02809e4730000000001976a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3"
    }
  ],
  "cbTx": {
    "version": 2,
    "height": 86190,
    "merkleRootMNList": "877392defa24888af72aa15f92b6609e71db1b385c1895bf870896398bc0e578",
    "merkleRootQuorums": "a320b95dab4963ca2547434d63ac8203835dfd0ce245924fa83dc6bab6ac57c7"
  },
  "time": 1556114577,
  "mediantime": 1556113720,
  "nonce": 2503323484,
  "bits": "1c0094aa",
  "difficulty": 440.8261075201009,
  "chainwork": "0000000000000000000000000000000000000000000000000045ab6f9403a8e7",
  "previousblockhash": "000000000073a041bac70a7c3e49c29e8bc954071aeee6e00c7ac8064a372e27",
  "nextblockhash": "00000000001c6c962639a1aad4cd069f315560a824d489418dc1f26b50a58aed",
  "chainlock": true
}
{% endhighlight %}

*See also*

* [GetBlockHash][rpc getblockhash]: {{summary_getBlockHash}}
* [GetBestBlockHash][rpc getbestblockhash]: {{summary_getBestBlockHash}}

{% endautocrossref %}
