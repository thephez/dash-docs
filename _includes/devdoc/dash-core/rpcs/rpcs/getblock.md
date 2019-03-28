{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/getblock.md" %}

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

*Example from Dash Core 0.14.0*

Get a block in raw hex:

{% highlight bash %}
dash-cli -testnet getblock \
            0000000005fdd3a647d4048f183e639310885fab7983b8e7b5079729e065d91f \
            0
{% endhighlight %}

Result (wrapped):

{% highlight text %}
00000020354559625d75e59743370290291a5c7df72d1af739c3e2ecf7483314\
000000002ba12397f0ae5884e623004a5e790d7c608fa013630656e61057c0e4\
fc67a656031f9d5c3e6f221c890a5ec001030005000100000000000000000000\
00000000000000000000000000000000000000000000ffffffff4c03bc0d0104\
031f9d5c08fabe6d6d736170747365743a7265737574736574000c870f000008\
308d3b4900000019730100000000000000580000004f0000000d2f6e6f646553\
74726174756d2f000000000240230e43000000001976a914cb594917ad4e5849\
688ec63f29a0f7f3badb5da688ac40230e43000000001976a914477a52436b94\
4f3e9223ac8404a7717d4176fa5388ac00000000260100bc0d01001dd9fb7d61\
1bfd2c05c7a508085d2b35053a45fe67c40c0e43be7cd87a7c9b83
{% endhighlight %}

Get the same block in JSON:

{% highlight bash %}
dash-cli -testnet getblock \
            0000000005fdd3a647d4048f183e639310885fab7983b8e7b5079729e065d91f
{% endhighlight %}

Result:

{% highlight json %}
{
  "hash": "0000000005fdd3a647d4048f183e639310885fab7983b8e7b5079729e065d91f",
  "confirmations": 1,
  "size": 315,
  "height": 69052,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "56a667fce4c05710e656066313a08f607c0d795e4a0023e68458aef09723a12b",
  "tx": [
    "56a667fce4c05710e656066313a08f607c0d795e4a0023e68458aef09723a12b"
  ],
  "cbTx": {
    "version": 1,
    "height": 69052,
    "merkleRootMNList": "839b7c7ad87cbe430e0cc467fe453a05352b5d0808a5c7052cfd1b617dfbd91d"
  },
  "time": 1553800963,
  "mediantime": 1553800156,
  "nonce": 3227388553,
  "bits": "1c226f3e",
  "difficulty": 7.434282417439254,
  "chainwork": "000000000000000000000000000000000000000000000000003dfe3d34685d0a",
  "previousblockhash": "00000000143348f7ece2c339f71a2df77d5c1a299002374397e5755d62594535",
  "chainlock": false
}
{% endhighlight %}

Get the same block in JSON with transaction details:

{% highlight bash %}
dash-cli -testnet getblock \
            0000000005fdd3a647d4048f183e639310885fab7983b8e7b5079729e065d91f 2
{% endhighlight %}

Result:

{% highlight json %}
{
  "hash": "0000000005fdd3a647d4048f183e639310885fab7983b8e7b5079729e065d91f",
  "confirmations": 1,
  "size": 315,
  "height": 69052,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "56a667fce4c05710e656066313a08f607c0d795e4a0023e68458aef09723a12b",
  "tx": [
    {
      "txid": "56a667fce4c05710e656066313a08f607c0d795e4a0023e68458aef09723a12b",
      "size": 234,
      "version": 3,
      "type": 5,
      "locktime": 0,
      "vin": [
        {
          "coinbase": "03bc0d0104031f9d5c08fabe6d6d736170747365743a7265737574736574000c870f000008308d3b4900000019730100000000000000580000004f0000000d2f6e6f64655374726174756d2f",
          "sequence": 0
        }
      ],
      "vout": [
        {
          "value": 11.25000000,
          "valueSat": 1125000000,
          "n": 0,
          "scriptPubKey": {
            "asm": "OP_DUP OP_HASH160 cb594917ad4e5849688ec63f29a0f7f3badb5da6 OP_EQUALVERIFY OP_CHECKSIG",
            "hex": "76a914cb594917ad4e5849688ec63f29a0f7f3badb5da688ac",
            "reqSigs": 1,
            "type": "pubkeyhash",
            "addresses": [
              "yereyozxENB9jbhqpbg1coE5c39ExqLSaG"
            ]
          }
        },
        {
          "value": 11.25000000,
          "valueSat": 1125000000,
          "n": 1,
          "scriptPubKey": {
            "asm": "OP_DUP OP_HASH160 477a52436b944f3e9223ac8404a7717d4176fa53 OP_EQUALVERIFY OP_CHECKSIG",
            "hex": "76a914477a52436b944f3e9223ac8404a7717d4176fa5388ac",
            "reqSigs": 1,
            "type": "pubkeyhash",
            "addresses": [
              "ySqPMrmGiB5zu7TYqgdaviEsqixPJc9hNQ"
            ]
          }
        }
      ],
      "extraPayloadSize": 38,
      "extraPayload": "0100bc0d01001dd9fb7d611bfd2c05c7a508085d2b35053a45fe67c40c0e43be7cd87a7c9b83",
      "cbTx": {
        "version": 1,
        "height": 69052,
        "merkleRootMNList": "839b7c7ad87cbe430e0cc467fe453a05352b5d0808a5c7052cfd1b617dfbd91d"
      },
      "instantlock": false,
      "chainlock": false
    }
  ],
  "cbTx": {
    "version": 1,
    "height": 69052,
    "merkleRootMNList": "839b7c7ad87cbe430e0cc467fe453a05352b5d0808a5c7052cfd1b617dfbd91d"
  },
  "time": 1553800963,
  "mediantime": 1553800156,
  "nonce": 3227388553,
  "bits": "1c226f3e",
  "difficulty": 7.434282417439254,
  "chainwork": "000000000000000000000000000000000000000000000000003dfe3d34685d0a",
  "previousblockhash": "00000000143348f7ece2c339f71a2df77d5c1a299002374397e5755d62594535",
  "chainlock": false
}
{% endhighlight %}

*See also*

* [GetBlockHash][rpc getblockhash]: {{summary_getBlockHash}}
* [GetBestBlockHash][rpc getbestblockhash]: {{summary_getBestBlockHash}}

{% endautocrossref %}
