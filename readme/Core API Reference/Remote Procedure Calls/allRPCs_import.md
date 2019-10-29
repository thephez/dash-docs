>>>>>>>> Addressindex RPCs

# GetAddressBalance

*Requires wallet support and `-addressindex` Dash Core command-line/configuration-file parameter to be enabled.*

The `getaddressbalance` RPC returns the balance for address(es).

*Parameter #1---an array of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`addresses` | object | Required<br>(exactly 1) | An array of P2PKH or P2SH Dash address(es)
→Address | string (base58) | Required<br>(1 or more) | The base58check encoded address

*Result---the current balance in duffs and the total number of duffs received (including change)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object listing the current balance and total amount received (including change), or an error if any address is invalid
→<br>`balance` | string | Required<br>(exactly 1) | The current balance in duffs
→<br>`received` | string | Required<br>(exactly 1) | The total number of duffs received (including change)

*Example from Dash Core 0.12.2*

Get the balance for an address:

``` bash
dash-cli getaddressbalance '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"]}'
```

Result:

``` json
{
  "balance": 0,
  "received": 10000100
}
```

*See also*

* [GetBalance](/docs/core-api-ref-remote-procedure-calls-wallet#section-getbalance): gets the balance in decimal dash across all accounts or for a particular account.
* [GetUnconfirmedBalance](/docs/core-api-ref-remote-procedure-calls-wallet#section-getunconfirmedbalance): returns the wallet's total unconfirmed balance.

# GetAddressDeltas

*Requires wallet support and `-addressindex` Dash Core command-line/configuration-file parameter to be enabled.*

The `getaddressdeltas` RPC returns all changes for an address.

*Parameter #1---an array of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`addresses` | object | Required<br>(exactly 1) | An array of P2PKH or P2SH Dash address(es)
→Address | string (base58) | Required<br>(1 or more) | The base58check encoded address

*Parameter #2---the start block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`start` | number (int) | Optional<br>(exactly 1) | The start block height

*Parameter #3---the end block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`end` | number (int) | Optional<br>(exactly 1) | The end block height

*Result---information about all changes for the address(es)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of JSON objects, with each object describing a transaction involving one of the requested addresses
→<br>Delta | object | Required<br>(1 or more) | An object describing a particular address delta
→→<br>`satoshis` | number | Required<br>(exactly 1) | The difference of duffs
→→<br>`txid` | string | Required<br>(exactly 1) | The related txid
→→<br>`blockindex` | number | Required<br>(exactly 1) | The related input or output index
→→<br>`height` | number | Required<br>(exactly 1) | The block height
→→<br>`address` | string | Required<br>(exactly 1) | The base58check encoded address

*Example from Dash Core 0.12.2*

Get the deltas for an address:

``` bash
dash-cli getaddressdeltas '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"], "start":5000, "end":7500}'
```

Result:

``` json
[
  {
    "satoshis": 10000100,
    "txid": "1fe86e463a9394d4ccd9a5ff1c6b483c95b4350ffdb055b55dc3615111e977de",
    "index": 18,
    "blockindex": 1,
    "height": 6708,
    "address": "yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"
  },
  {
    "satoshis": -10000100,
    "txid": "6cb4379eec45cd3bb08b8f4c3a101b8cd89795e24f2cb8288a9941a85fb114cf",
    "index": 0,
    "blockindex": 1,
    "height": 7217,
    "address": "yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"
  }
]
```

# GetAddressMempool

*Requires wallet support and `-addressindex` Dash Core command-line/configuration-file parameter to be enabled.*

The `getaddressmempool` RPC returns all mempool deltas for an address.

*Parameter #1---an array of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`addresses` | object | Required<br>(exactly 1) | An array of P2PKH or P2SH Dash address(es)
→Address | string (base58) | Required<br>(1 or more) | The base58check encoded address

*Result---information about mempool deltas for the address(es)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of JSON objects, with each object describing a transaction involving one of the requested addresses
→Mempool Deltas | object | Required<br>(1 or more) | An object describing a particular mempool address delta
→→<br>`address` | string | Required<br>(exactly 1) | The base58check encoded address
→→<br>`txid` | string | Required<br>(exactly 1) | The related txid
→→<br>`index` | number | Required<br>(exactly 1) | The related input or output index
→→<br>`satoshis` | number | Required<br>(exactly 1) | The difference of duffs
→→<br>`timestamp` | string | Required<br>(exactly 1) | The time the transaction entered the mempool (seconds)
→→<br>`prevtxid` | string | Required<br>(exactly 1) | The previous txid (if spending)
→→<br>`prevout` | string | Required<br>(exactly 1) | The previous transaction output index (if spending)

*Example from Dash Core 0.12.2*

Get the deltas for an address:

``` bash
dash-cli getaddressmempool '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"]}'
```

Result:

``` text
  Example result needed
```

# GetAddressTxids

*Requires wallet support and `-addressindex` Dash Core command-line/configuration-file parameter to be enabled.*

The `getaddresstxids` RPC returns the txids for an address(es).

*Parameter #1---an array of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`addresses` | object | Required<br>(exactly 1) | An array of P2PKH or P2SH Dash address(es)
→Address | string (base58) | Required<br>(1 or more) | The base58check encoded address

*Parameter #2---the start block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`start` | number (int) | Optional<br>(exactly 1) | The start block height

*Parameter #3---the end block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`end` | number (int) | Optional<br>(exactly 1) | The end block height

*Result---information about txids for the address(es)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of txids related to the requested address(es)
→<br>TXID | string | Required<br>(1 or more) | The transaction id

*Example from Dash Core 0.12.2*

Get the deltas for an address:

``` bash
dash-cli getaddresstxids '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"], "start":5000, "end":7500}'
```

Result:

``` json
[
  "1fe86e463a9394d4ccd9a5ff1c6b483c95b4350ffdb055b55dc3615111e977de",
  "6cb4379eec45cd3bb08b8f4c3a101b8cd89795e24f2cb8288a9941a85fb114cf"
]
```

# GetAddressUtxos

*Requires wallet support and `-addressindex` Dash Core command-line/configuration-file parameter to be enabled.*

The `getaddressutxos` RPC returns all unspent outputs for an address.

*Parameter #1---an array of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`addresses` | object | Required<br>(exactly 1) | An array of P2PKH or P2SH Dash address(es)
→Address | string (base58) | Required<br>(1 or more) | The base58check encoded address

*Result---information about unspent outputs for the address(es)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of JSON objects, with each object describing a transaction involving one of the requested addresses
→Unspent outputs | object | Required<br>(1 or more) | An object describing a particular unspent output for the requested address(es)
→→<br>`address` | string | Required<br>(exactly 1) | The base58check encoded address
→→<br>`txid` | string | Required<br>(exactly 1) | The output txid
→→<br>`outputIndex` | number | Required<br>(exactly 1) | The output index
→→<br>`script` | string | Required<br>(exactly 1) | The script hex encoded
→→<br>`satoshis` | number | Required<br>(exactly 1) | The number of duffs of the output
→→<br>`height` | number | Required<br>(exactly 1) | The block height

*Example from Dash Core 0.12.2*

Get the unspent outputs for an address:

``` bash
dash-cli getaddressutxos '{"addresses": ["yLeC3F9UxJmFaRaf5yzH7FDc7RdvBasi84"]}'
```

Result:

``` json
[
  {
    "address": "yLeC3F9UxJmFaRaf5yzH7FDc7RdvBasi84",
    "txid": "ef7bcd083db8c9551ca295698c3b7a6811288fae9944018d2a660a0f939bdb35",
    "outputIndex": 0,
    "script": "76a914038b8a73338c8f9c22024338198d63ff7c4cb4c088ac",
    "satoshis": 1000010000,
    "height": 7683
  }
]
```

>>>>>>>> Block Chain RPCs

# GetBestBlockHash

The `getbestblockhash` RPC returns the header hash of the most recent block on the best block chain.

*Parameters: none*

*Result---hash of the tip from the best block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | The hash of the block header from the most recent block on the best block chain, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getbestblockhash
```

Result:

``` text
00000bafbc94add76cb75e2ec92894837288a481e5c005f6563d91623bf8bc2c
```

*See also*

* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.

# GetBestChainLock

The `getbestchainlock` RPC returns the block hash of the best chainlock.

Throws an error if there is no known chainlock yet.

*Parameters: none*

*Result*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | An object containing the requested block, or JSON `null` if an error occurred
→<br>`blockhash` | string (hex) | Required<br>(exactly 1) | The hash of the block encoded as hex in RPC byte order.
→<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→<br>`known_block` | boolean | Required<br>(exactly 1) | True if the block is known by this node

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet getbestchainlock
```

Result:
``` json
{
  "blockhash": "000000000036ab34d3005941d4224fc5887526355c98b769e27e5ece05f48860",
  "height": 182106,
  "known_block": true
}
```

*See also: none*

# GetBlock

The `getblock` RPC gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.

*Parameter #1---block hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Block Hash | string (hex) | Required<br>(exactly 1) | The hash of the header of the block to get, encoded as hex in RPC byte order

*Parameter #2---whether to get JSON or hex output*

Name | Type | Presence | Description
--- | --- | --- | ---
Verbosity | number (int) | Optional<br>(0 or 1) | Set to one of the following verbosity levels:<br>• `0` - Get the block in serialized block format;<br>• `1` - Get the decoded block as a JSON object (default)<br>• `2` - Get the decoded block as a JSON object with transaction details

*Result (if verbosity was `0`)---a serialized block*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex)/null | Required<br>(exactly 1) | The requested block as a serialized block, encoded as hex, or JSON `null` if an error occurred

*Result (if verbosity was `1` or omitted)---a JSON block with transaction hashes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | An object containing the requested block, or JSON `null` if an error occurred
→<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain
→<br>`size` | number (int) | Required<br>(exactly 1) | The size of this block in serialized block format, counted in bytes
→<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→<br>`version` | number (int) | Required<br>(exactly 1) | This block's version number.  See [block version numbers][section block versions]
→<br>`versionHex` | string (hex) | Required<br>(exactly 1) | _Added in Bitcoin Core 0.13.0_<br><br>The block version formatted in hexadecimal
→<br>`merkleroot` | string (hex) | Required<br>(exactly 1) | The merkle root for this block, encoded as hex in RPC byte order
→<br>`tx` | array | Required<br>(exactly 1) | An array containing the TXIDs of all transactions in this block.  The transactions appear in the array in the same order they appear in the serialized block
→ →<br>TXID | string (hex) | Required<br>(1 or more) | The TXID of a transaction in this block, encoded as hex in RPC byte order
→<br>`cbTx` | object | Required<br>(exactly 1) | Coinbase special transaction details
→ →<br>`version` | number (int) | Required<br>(exactly 1) | The version of the Coinbase special transaction (CbTx)
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→ →<br>`merkleRootMNList` | string (hex) | Required<br>(exactly 1) | The merkle root for the masternode list
→ →<br>`merkleRootQuorums` | string (hex) | Required<br>(exactly 1) | The merkle root for the quorum list
→<br>`time` | number (int) | Required<br>(exactly 1) | The value of the *time* field in the block header, indicating approximately when the block was created
→<br>`mediantime` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The median block time in Unix epoch time
→<br>`nonce` | number (int) | Required<br>(exactly 1) | The nonce which was successful at turning this particular block into one that could be added to the best block chain
→<br>`bits` | string (hex) | Required<br>(exactly 1) | The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex
→<br>`previousblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block
→<br>`nextblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order

*Result (if verbosity was `2`---a JSON block with full transaction details*

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | An object containing the requested block, or JSON `null` if an error occurred
→<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain
→<br>`size` | number (int) | Required<br>(exactly 1) | The size of this block in serialized block format, counted in bytes
→<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→<br>`version` | number (int) | Required<br>(exactly 1) | This block's version number.  See [block version numbers][section block versions]
→<br>`versionHex` | string (hex) | Required<br>(exactly 1) | _Added in Bitcoin Core 0.13.0_<br><br>The block version formatted in hexadecimal
→<br>`merkleroot` | string (hex) | Required<br>(exactly 1) | The merkle root for this block, encoded as hex in RPC byte order
→<br>`tx` | array | Required<br>(exactly 1) | An array containing the TXIDs of all transactions in this block.  The transactions appear in the array in the same order they appear in the serialized block

{{INCLUDE_DECODE_RAW_TRANSACTION}}
→ →<br>`instantlock` | bool | Required<br>(exactly 1) | If set to `true`, this transaction is locked (by InstantSend or a ChainLock)
→ →<br>`instantlock_internal` | bool | Required<br>(exactly 1) | If set to `true`, this transaction has an InstantSend lock
→<br>`cbTx` | object | Required<br>(exactly 1) | Coinbase special transaction details
→ →<br>`version` | number (int) | Required<br>(exactly 1) | The version of the Coinbase special transaction (CbTx)
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→ →<br>`merkleRootMNList` | string (hex) | Required<br>(exactly 1) | The merkle root for the masternode list
→ →<br>`merkleRootQuorums` | string (hex) | Required<br>(exactly 1) | The merkle root for the quorum list
→<br>`time` | number (int) | Required<br>(exactly 1) | The value of the *time* field in the block header, indicating approximately when the block was created
→<br>`mediantime` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The median block time in Unix epoch time
→<br>`nonce` | number (int) | Required<br>(exactly 1) | The nonce which was successful at turning this particular block into one that could be added to the best block chain
→<br>`bits` | string (hex) | Required<br>(exactly 1) | The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex
→<br>`previousblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block
→<br>`nextblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order
<br>`chainlock` | bool | Required<br>(exactly 1) | *Added in Dash Core 0.14.0*<br><br>If set to `true`, this transaction is in a block that is locked (not susceptible to a chain re-org)

*Example from Dash Core 0.14.1*

Get a block in raw hex:

``` bash
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b \
            0
```

Result (wrapped):

``` text
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
```

Get the same block in JSON:

``` bash
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b
```

Result:

``` json
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
```

Get the same block in JSON with transaction details:

``` bash
dash-cli -testnet getblock \
            00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b 2
```

Result:

``` json
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
```

*See also*

* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.

# GetBlockChainInfo

The `getblockchaininfo` RPC provides information about the current state of the block chain.

*Parameters: none*

*Result---A JSON object providing information about the block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the current state of the local block chain
→<br>`chain` | string | Required<br>(exactly 1) | The name of the block chain.  One of `main` for mainnet, `test` for testnet, or `regtest` for regtest
→<br>`blocks` | number (int) | Required<br>(exactly 1) | The number of validated blocks in the local best block chain.  For a new node with just the hardcoded genesis block, this will be 0
→<br>`headers` | number (int) | Required<br>(exactly 1) | The number of validated headers in the local best headers chain.  For a new node with just the hardcoded genesis block, this will be zero.  This number may be higher than the number of *blocks*
→<br>`bestblockhash` | string (hex) | Required<br>(exactly 1) | The hash of the header of the highest validated block in the best block chain, encoded as hex in RPC byte order.  This is identical to the string returned by the `getbestblockhash` RPC
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The difficulty of the highest-height block in the best block chain
→<br>`mediantime` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The median time of the 11 blocks before the most recent block on the blockchain.  Used for validating transaction locktime under BIP113
→<br>`verificationprogress` | number (real) | Required<br>(exactly 1) | Estimate of what percentage of the block chain transactions have been verified so far, starting at 0.0 and increasing to 1.0 for fully verified.  May slightly exceed 1.0 when fully synced to account for transactions in the memory pool which have been verified before being included in a block
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes checked from the genesis block to this block, encoded as big-endian hex
→<br>`pruned` | bool | Required<br>(exactly 1) | *Added in Bitcoin Core 0.11.0*<br><br>Indicates if the blocks are subject to pruning
→<br>`pruneheight` | number (int) | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.11.0*<br><br>The lowest-height complete block stored if pruning is activated
→<br>`softforks` | array | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>An array of objects each describing a current or previous soft fork
→ →<br>Softfork | object | Required<br>(0 or more) | A specific softfork
→ → →<br>`id` | string | Required<br>(exactly 1) | The name of the softfork
→ → →<br>`version` | numeric<br>(int) | Required<br>(exactly 1) | The block version used for the softfork
→ → →<br>`enforce` | string : object | Optional<br>(0 or 1) | The progress toward enforcing the softfork rules for new-version blocks
→ → → →<br>`status` | bool | Required<br>(exactly 1) | Indicates if the threshold was reached
→ → → →<br>`found` | numeric<br>(int) | Optional<br>(0 or 1) | Number of blocks that support the softfork
→ → → →<br>`required` | numeric<br>(int) | Optional<br>(0 or 1) | Number of blocks that are required to reach the threshold
→ → → →<br>`window` | numeric<br>(int) | Optional<br>(0 or 1) | The maximum size of examined window of recent blocks
→ → →<br>`reject` | object | Optional<br>(0 or 1) | The progress toward enforcing the softfork rules for new-version blocks
→ → → →<br>`status` | bool | Optional<br>(0 or 1) | Indicates if the threshold was reached
→ → → →<br>`found` | numeric<br>(int) | Optional<br>(0 or 1) | Number of blocks that support the softfork
→ → → →<br>`required` | numeric<br>(int) | Optional<br>(0 or 1) | Number of blocks that are required to reach the threshold
→ → → →<br>`window` | numeric<br>(int) | Optional<br>(0 or 1) | The maximum size of examined window of recent blocks
→<br>`bip9_softforks` | object | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.1*<br><br>The status of BIP9 softforks in progress
→ →<br>Name | string : object | Required<br>(0 or more) | A specific BIP9 softfork
→ → →<br>`status` | string | Required<br>(exactly 1) | Set to one of the following reasons:<br>• `defined` if voting hasn't started yet<br>• `started` if the voting has started <br>• `locked_in` if the voting was successful but the softfork hasn't been activated yet<br>• `active` if the softfork was activated<br>• `failed` if the softfork has not receieved enough votes
→ → →<br>`bit` | numeric<br>(int) | Optional<br>(0 or 1) | The bit (0-28) in the block version field used to signal this softfork.  Field is only shown when status is `started`
→ → →<br>`startTime` | numeric<br>(int) | Required<br>(exactly 1) | The Unix epoch time when the softfork voting begins
→ → →<br>`timeout` | numeric<br>(int) | Required<br>(exactly 1) | The Unix epoch time at which the deployment is considered failed if not yet locked in
→ → →<br>`since` | numeric<br>(int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.14.0*<br><br>The height of the first block to which the status applies
→ → →<br>`statistics` | string : object | Required<br>(exactly 1) | *Added in Dash Core 0.14.1*<br><br>Numeric statistics about BIP9 signaling for a softfork (only for \started\" status)"
→ → → →<br>`period` | numeric<br>(int) | Optional<br>(0 or 1) | *Added in Dash Core 0.14.1*<br><br>The length in blocks of the BIP9 signaling period.  Field is only shown when status is `started`
→ → → →<br>`threshold` | numeric<br>(int) | Optional<br>(0 or 1) | *Added in Dash Core 0.14.1*<br><br>The number of blocks with the version bit set required to activate the feature.  Field is only shown when status is `started`
→ → → →<br>`elapsed` | numeric<br>(int) | Optional<br>(0 or 1) | *Added in Dash Core 0.14.1*<br><br>The number of blocks elapsed since the beginning of the current period.  Field is only shown when status is `started`
→ → → →<br>`count` | numeric<br>(int) | Optional<br>(0 or 1) | *Added in Dash Core 0.14.1*<br><br>The number of blocks with the version bit set in the current period.  Field is only shown when status is `started`
→<br>`possible` | bool | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.11.0*<br><br>Returns false if there are not enough blocks left in this period to pass activation threshold.  Field is only shown when status is `started`

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet getblockchaininfo
```

Result:

``` json
{
  "chain": "test",
  "blocks": 160508,
  "headers": 160508,
  "bestblockhash": "0000000008ae87c2999faa79c74727ab2a15783fcab515cc940a6c14dfa921a8",
  "difficulty": 24.71182965485547,
  "mediantime": 1566479773,
  "verificationprogress": 0.9999986039171913,
  "chainwork": "0000000000000000000000000000000000000000000000000077db2024e1810b",
  "pruned": false,
  "softforks": [
    {
      "id": "bip34",
      "version": 2,
      "reject": {
        "status": true
      }
    },
    {
      "id": "bip66",
      "version": 3,
      "reject": {
        "status": true
      }
    },
    {
      "id": "bip65",
      "version": 4,
      "reject": {
        "status": true
      }
    }
  ],
  "bip9_softforks": {
    "csv": {
      "status": "active",
      "startTime": 1544655600,
      "timeout": 1576191600,
      "since": 8064
    },
    "dip0001": {
      "status": "active",
      "startTime": 1544655600,
      "timeout": 1576191600,
      "since": 4400
    },
    "dip0003": {
      "status": "active",
      "startTime": 1544655600,
      "timeout": 1576191600,
      "since": 7000
    },
    "dip0008": {
      "status": "active",
      "startTime": 1553126400,
      "timeout": 1584748800,
      "since": 78800
    },
    "bip147": {
      "status": "active",
      "startTime": 1544655600,
      "timeout": 1576191600,
      "since": 4300
    }
  }
}
```

*See also*

* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.
* [GetWalletInfo](/docs/core-api-ref-remote-procedure-calls-wallet#section-getwalletinfo): provides information about the wallet.

# GetBlockCount

The `getblockcount` RPC returns the number of blocks in the local best block chain.

*Parameters: none*

*Result---the number of blocks in the local best block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The number of blocks in the local best block chain.  For a new node with only the hardcoded genesis block, this number will be 0

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getblockcount
```

Result:

``` text
4627
```

*See also*

* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.

# GetBlockHash

The `getblockhash` RPC returns the header hash of a block at the given height in the local best block chain.

*Parameter---a block height*

Name | Type | Presence | Description
--- | --- | --- | ---
Block Height | number (int) | Required<br>(exactly 1) | The height of the block whose header hash should be returned.  The height of the hardcoded genesis block is 0

*Result---the block header hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex)/null | Required<br>(exactly 1) | The hash of the block at the requested height, encoded as hex in RPC byte order, or JSON `null` if an error occurred

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getblockhash 4000
```

Result:

``` text
00000ce22113f3eb8636e225d6a1691e132fdd587aed993e1bc9b07a0235eea4
```

*See also*

* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.

# GetBlockHashes

*Added in Dash Core 0.12.1*

The `getblockhashes` RPC returns array of hashes of blocks within the timestamp range provided (requires `timestampindex` to be enabled).

*Parameter #1---high block timestamp*

Name | Type | Presence | Description
--- | --- | --- | ---
Block Timestamp | number (int) | Required<br>(exactly 1) | The block timestamp for the newest block hash that should be returned.

*Parameter #2---low block timestamp*

Name | Type | Presence | Description
--- | --- | --- | ---
Block Timestamp | number (int) | Required<br>(exactly 1) | The block timestamp for the oldest block hash that should be returned.

*Result---the block header hashes in the give time range*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | The hashes of the blocks in the requested time range
→<br>`hash` | string (hex) | Required<br>(1 or more) | The hash of a block in the chain, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getblockhashes 1507555793 1507554793
```

Result:

``` json
[
  "0000000010a16c6fbc6bd5cdc238c2beabcda334e97fde1500d59be4e6fc4b89",
  "000000009910885e811230c403e55aac6547d6df04ee671b2e8348524f73cab8",
  "000000004bbb3828db1c4d4491760336cec215087819ab656336f30d4095e3d2",
  "00000000ad2df2149aca2261a9a87c41e139dfe8f73d91db7ec0c1837fee21a0",
  "0000000074068a9e3a271d165da3deb28bc3f8c751dde97f460d8078d92a9d06"
]
```

*See also*

* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.

# GetBlockHeader

*Added in Bitcoin Core 0.12.0*

The `getblockheader` RPC gets a block header with a particular header hash from the local block database either as a JSON object or as a serialized block header.

*Parameter #1---header hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Header Hash | string (hex) | Required<br>(exactly 1) | The hash of the block header to get, encoded as hex in RPC byte order

*Parameter #2---JSON or hex output*

Name | Type | Presence | Description
--- | --- | --- | ---
Format | bool | Optional<br>(0 or 1) | Set to `false` to get the block header in serialized block format; set to `true` (the default) to get the decoded block header as a JSON object

*Result (if format was `false`)---a serialized block header*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex)/null | Required<br>(exactly 1) | The requested block header as a serialized block, encoded as hex, or JSON `null` if an error occurred

*Result (if format was `true` or omitted)---a JSON block header*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | An object containing the requested block, or JSON `null` if an error occurred
→<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain
→<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→<br>`version` | number (int) | Required<br>(exactly 1) | This block's version number.  See [block version numbers][section block versions]
→<br>`merkleroot` | string (hex) | Required<br>(exactly 1) | The merkle root for this block, encoded as hex in RPC byte order
→<br>`time` | number (int) | Required<br>(exactly 1) | The time of the block
→<br>`mediantime` | number (int) | Required<br>(exactly 1) | The computed median time of the previous 11 blocks.  Used for validating transaction locktime under BIP113
→<br>`nonce` | number (int) | Required<br>(exactly 1) | The nonce which was successful at turning this particular block into one that could be added to the best block chain
→<br>`bits` | string (hex) | Required<br>(exactly 1) | The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex
→<br>`previousblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block
→<br>`nextblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order

*Changes from Bitcoin - Following items not present in Dash result*

Name | Type | Presence | Description
--- | --- | --- | ---
→<br>`versionHex` | number (hex) | Required<br>(exactly 1) | This block's hex version number.  See [block version numbers][section block versions]

*Example from Dash Core 0.12.2*

Get a block header in raw hex:

``` bash
dash-cli -testnet getblockheader \
            00000000eb0af5aec7b673975a22593dc0cc763f71ba8de26292410273437078 \
            false
```

Result (wrapped):

``` text
01000020f61396cfd2747e94cfa088fe1f7875d8171accc22d6e5616edca0cb8\
00000000c31eb96ee1d9e78d61a601371a348c19e4e59698d0ff7869334b72cb\
7ffb76893b41d6593016011d09b2aa3c

```

Get the same block in JSON:

``` bash
dash-cli -testnet getblockheader \
            00000000eb0af5aec7b673975a22593dc0cc763f71ba8de26292410273437078
```

Result:

``` json

{
  "hash": "00000000eb0af5aec7b673975a22593dc0cc763f71ba8de26292410273437078",
  "confirmations": 7,
  "height": 4635,
  "version": 536870913,
  "merkleroot": "8976fb7fcb724b336978ffd09896e5e4198c341a3701a6618de7d9e16eb91ec3",
  "time": 1507213627,
  "mediantime": 1507213022,
  "nonce": 1017819657,
  "bits": "1d011630",
  "difficulty": 0.920228600314536,
  "chainwork": "000000000000000000000000000000000000000000000000000001e06428c09a",
  "previousblockhash": "00000000b80ccaed16566e2dc2cc1a17d875781ffe88a0cf947e74d2cf9613f6",
  "nextblockhash": "000000003b1aa290db62ae7cfb4dbb67c8e1402a40ef387587f930b8ec3b45db"
}

```

*See also*

* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBlockHashes](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhashes): returns array of hashes of blocks within the timestamp range provided (requires `timestampindex` to be enabled).
* [GetBlockHeaders](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockheaders): returns an array of items with information about the requested number of blockheaders starting from the requested hash.
* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.

# GetBlockHeaders

*Added in Dash Core 0.12.1*

The `getblockheaders` RPC returns an array of items with information about the requested number of blockheaders starting from the requested hash.

*Parameter #1---header hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Header Hash | string (hex) | Required<br>(exactly 1) | The hash of the block header to get, encoded as hex in RPC byte order

*Parameter #2---number of headers to return*

Name | Type | Presence | Description
--- | --- | --- | ---
Count | number | Optional<br>(exactly 1) | The number of block headers to get

*Parameter #3---JSON or hex output*

Name | Type | Presence | Description
--- | --- | --- | ---
Verbose | bool | Optional<br>(0 or 1) | Set to `false` to get the block headers in serialized block format; set to `true` (the default) to get the decoded block headers as a JSON object

*Result (if format was `false`)---a serialized block header*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | The requested block header(s) as a serialized block
→<br>`header` | string (hex) | Required<br>(1 or more) | The block header encoded as hex in RPC byte order

*Result (if format was `true` or omitted)---a JSON block header*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a block header, or JSON `null` if an error occurred
→<br>Block Header | object/null | Required<br>(exactly 1) | An object containing a block header
→ →<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of this block's block header encoded as hex in RPC byte order.  This is the same as the hash provided in parameter #1
→ →<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations the transactions in this block have, starting at 1 when this block is at the tip of the best block chain.  This score will be -1 if the the block is not part of the best block chain
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The height of this block on its block chain
→ →<br>`version` | number (int) | Required<br>(exactly 1) | This block's version number.  See [block version numbers][section block versions]
→ →<br>`merkleroot` | string (hex) | Required<br>(exactly 1) | The merkle root for this block, encoded as hex in RPC byte order
→ →<br>`time` | number (int) | Required<br>(exactly 1) | The time of the block
→ →<br>`mediantime` | number (int) | Required<br>(exactly 1) | The computed median time of the previous 11 blocks.  Used for validating transaction locktime under BIP113
→ →<br>`nonce` | number (int) | Required<br>(exactly 1) | The nonce which was successful at turning this particular block into one that could be added to the best block chain
→ →<br>`bits` | string (hex) | Required<br>(exactly 1) | The value of the *nBits* field in the block header, indicating the target threshold this block's header had to pass
→ →<br>`difficulty` | number (real) | Required<br>(exactly 1) | The estimated amount of work done to find this block relative to the estimated amount of work done to find block 0
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes miners had to check from the genesis block to this block, encoded as big-endian hex
→ →<br>`previousblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the header of the previous block, encoded as hex in RPC byte order.  Not returned for genesis block
→ →<br>`nextblockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the next block on the best block chain, if known, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

Get two block headers in raw hex:

``` bash
dash-cli -testnet getblockheaders \
            0000000010a16c6fbc6bd5cdc238c2beabcda334e97fde1500d59be4e6fc4b89 \
            2 false
```

Result (wrapped):

``` text
[
  "010000207216dc7b7c898ba3fc0b39d1fd16756b97b1e07e3eb5c64d1510a64b0000000\
   0bb64e58a0be4276bf3e9c366bba960953ef9e47a8f62342476be56a5dfa7a2670276db\
   59eae1001d0735577e",
  "01000020894bfce6e49bd50015de7fe934a3cdabbec238c2cdd56bbc6f6ca1100000000\
   0edb2a018d535de70b0622a3303dc329dcb315e7507d074c0c641501c58d88aa08576db\
   59c5db001d03cf8986"
]
```

Get the same two block headers in JSON:

``` bash
dash-cli -testnet getblockheader \
            00000000eb0af5aec7b673975a22593dc0cc763f71ba8de26292410273437078 \
            2 true
```

Result:

``` json
[
  {
    "hash": "0000000010a16c6fbc6bd5cdc238c2beabcda334e97fde1500d59be4e6fc4b89",
    "confirmations": 20,
    "height": 6802,
    "version": 536870913,
    "merkleroot": "67a2a7dfa556be762434628f7ae4f93e9560a9bb66c3e9f36b27e40b8ae564bb",
    "time": 1507554818,
    "mediantime": 1507554058,
    "nonce": 2119644423,
    "bits": "1d00e1ea",
    "difficulty": 1.1331569664903,
    "chainwork": "0000000000000000000000000000000000000000000000000000092c7b511197",
    "previousblockhash": "000000004ba610154dc6b53e7ee0b1976b7516fdd1390bfca38b897c7bdc1672",
    "nextblockhash": "000000009910885e811230c403e55aac6547d6df04ee671b2e8348524f73cab8"
  },
  {
    "hash": "000000009910885e811230c403e55aac6547d6df04ee671b2e8348524f73cab8",
    "confirmations": 19,
    "height": 6803,
    "version": 536870913,
    "merkleroot": "a08ad8581c5041c6c074d007755e31cb9d32dc03332a62b070de35d518a0b2ed",
    "time": 1507554949,
    "mediantime": 1507554181,
    "nonce": 2257178371,
    "bits": "1d00dbc5",
    "difficulty": 1.164838875953147,
    "chainwork": "0000000000000000000000000000000000000000000000000000092da5851d38",
    "previousblockhash": "0000000010a16c6fbc6bd5cdc238c2beabcda334e97fde1500d59be4e6fc4b89",
    "nextblockhash": "000000004bbb3828db1c4d4491760336cec215087819ab656336f30d4095e3d2"
  }
]
```

*See also*

* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBlockHashes](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockhashes): returns array of hashes of blocks within the timestamp range provided (requires `timestampindex` to be enabled).
* [GetBlockHeader](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockheader): gets a block header with a particular header hash from the local block database either as a JSON object or as a serialized block header.
* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.

# GetBlockStats

The `getblockstats` RPC computes per block statistics for a given window.

All amounts are in duffs.

It won't work for some heights with pruning. It won't work without `-txindex` for
`utxo_size_inc`, `*fee` or `*feerate` stats.

*Parameter #1---hash_or_height*

Name | Type | Presence | Description
--- | --- | --- | ---
hash_or_height | string or numeric | Required<br>(exactly 1) | The block hash or height of the target block

*Parameter #2---stats*

Name | Type | Presence | Description
--- | --- | --- | ---
stats | array | optional | Values to plot, by default all values (see result below)

*Result---a JSON object containing the requested statistics*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | An object containing stats for the requested block, or JSON `null` if an error occurred
→<br>`avgfee` | numeric | Required<br>(exactly 1) | Average fee in the block
→<br>`avgfeerate` | numeric | Required<br>(exactly 1) | Average feerate (in duffs per byte)
→<br>`avgtxsize` | numeric | Required<br>(exactly 1) | Average transaction size
→<br>`blockhash` | string (hex) | Required<br>(exactly 1) | The block hash (to check for potential reorgs)
→<br>`height` | numeric | Required<br>(exactly 1) | The height of the block
→<br>`ins` | numeric | Required<br>(exactly 1) | The number of inputs (excluding coinbase)
→<br>`maxfee` | numeric | Required<br>(exactly 1) | Maximum fee in the block
→<br>`maxfeerate` | numeric | Required<br>(exactly 1) | Maximum feerate (in duffs per byte)
→<br>`maxtxsize` | numeric | Required<br>(exactly 1) | Maximum transaction size
→<br>`medianfee` | numeric | Required<br>(exactly 1) | Truncated median fee in the block
→<br>`medianfeerate` | numeric | Required<br>(exactly 1) | Truncated median feerate (in duffs per byte)
→<br>`mediantime` | numeric | Required<br>(exactly 1) | The block median time past
→<br>`mediantxsize` | numeric | Required<br>(exactly 1) | Truncated median transaction size
→<br>`minfee` | numeric | Required<br>(exactly 1) | Minimum fee in the block
→<br>`minfeerate` | numeric | Required<br>(exactly 1) | Minimum feerate (in duffs per byte)

- n: "→<br>`mintxsize`"
  t: "numeric"
  p: "Required<br>(exactly 1)"
→<br>`outs` | numeric | Required<br>(exactly 1) | The number of outputs
→<br>`subsidy` | numeric | Required<br>(exactly 1) | The block subsidy
→<br>`time` | number (real) | Required<br>(exactly 1) | The block time
→<br>`total_out` | numeric | Required<br>(exactly 1) | Total amount in all outputs (excluding coinbase and thus reward [i.e. subsidy + totalfee])
→<br>`total_size` | numeric | Required<br>(exactly 1) | Total size of all non-coinbase transactions
→<br>`totalfee` | numeric | Required<br>(exactly 1) | The fee total
→<br>`txs` | numeric | Required<br>(exactly 1) | The number of transactions (excluding coinbase)
→<br>`utxo_increase` | numeric | Required<br>(exactly 1) | The increase/decrease in the number of unspent outputs
→<br>`utxo_size_inc` | numeric | Required<br>(exactly 1) | The increase/decrease in size for the utxo index (not discounting op_return and similar)

*Example from Dash Core 0.14.1*

``` bash
dash-cli getblockstats 1000 '["blockhash","subsidy", "txs"]'
```

Result:
``` json
{
  "blockhash": "000004e906762c8c70583418d46915b4271fa83c29d5b88544d05e09e3f3621d",
  "subsidy": 50000000000,
  "txs": 1
}
```

*See also: none*

# GetChainTips

The `getchaintips` RPC returns information about the highest-height block (tip) of each local block chain.

*Parameters: none*

*Result---an array of block chain tips*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of JSON objects, with each object describing a chain tip.  At least one tip---the local best block chain---will always be present
→<br>Tip | object | Required<br>(1 or more) | An object describing a particular chain tip.  The first object will always describe the active chain (the local best block chain)
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The height of the highest block in the chain.  A new node with only the genesis block will have a single tip with height of 0
→ →<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of the highest block in the chain, encoded as hex in RPC byte order
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The difficulty of the highest-height block in the best block chain (Added in Dash Core 0.12.1)
→<br>`chainwork` | string (hex) | Required<br>(exactly 1) | The estimated number of block header hashes checked from the genesis block to this block, encoded as big-endian hex (Added in Dash Core 0.12.1)
→ →<br>`branchlen` | number (int) | Required<br>(exactly 1) | The number of blocks that are on this chain but not on the main chain.  For the local best block chain, this will be `0`; for all other chains, it will be at least `1`
→ →<br>`forkpoint` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3*<br><br>Block hash of the last common block between this tip and the main chain
→ →<br>`status` | string | Required<br>(exactly 1) | The status of this chain.  Valid values are:<br>• `active` for the local best block chain<br>• `invalid` for a chain that contains one or more invalid blocks<br>• `headers-only` for a chain with valid headers whose corresponding blocks both haven't been validated and aren't stored locally<br>• `valid-headers` for a chain with valid headers whose corresponding blocks are stored locally, but which haven't been fully validated<br>• `valid-fork` for a chain which is fully validated but which isn't part of the local best block chain (it was probably the local best block chain at some point)<br>• `unknown` for a chain whose reason for not being the active chain is unknown

*Example from Dash Core 0.12.3*

``` bash
dash-cli -testnet getchaintips
```

``` json
[
  {
    "height": 110192,
    "hash": "000000000c6007f40c3b68a77b0e1319a89c0504ae1b391d071cf49fa7591dee",
    "difficulty": 18.38631407059958,
    "chainwork": "000000000000000000000000000000000000000000000000002cbd2546718747",
    "branchlen": 0,
    "forkpoint": "000000000c6007f40c3b68a77b0e1319a89c0504ae1b391d071cf49fa7591dee",
    "status": "active"
  }
]
```

*See also*

* [GetBestBlockHash](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getbestblockhash): returns the header hash of the most recent block on the best block chain.
* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.
* [GetBlockChainInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockchaininfo): provides information about the current state of the block chain.

# GetChainTxStats

The `getchaintxstats` RPC compute statistics about the total number and rate of transactions in the chain.

*Parameter #1---nblocks*

Name | Type | Presence | Description
--- | --- | --- | ---
nblocks | number (int) | Optional | Size of the window in number of blocks (default: one month).

*Parameter #2---blockhash*

Name | Type | Presence | Description
--- | --- | --- | ---
blockhash | string | Optional | The hash of the block that ends the window.

*Result--statistics about transactions*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing transaction statistics
→<br>`time` | number (int) | Required<br>(exactly 1) | The timestamp for the statistics in UNIX format
→<br>`txcount` | number (int) | Required<br>(exactly 1) | The total number of transactions in the chain up to that point
→<br>`txrate` | number (int) | Required<br>(exactly 1) | The average rate of transactions per second in the window

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet getchaintxstats
```

Result:
``` json
{
  "time": 1566416832,
  "txcount": 1353139,
  "txrate": 0.04107376448354556
}
```

*See also: none*

# GetDifficulty

The `getdifficulty` RPC returns the proof-of-work difficulty as a multiple of the minimum difficulty.

*Parameters: none*

*Result---the current difficulty*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (real) | Required<br>(exactly 1) | The difficulty of creating a block with the same target threshold (nBits) as the highest-height block in the local best block chain.  The number is a a multiple of the minimum difficulty

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getdifficulty
```

Result:

``` text
1.069156225528583
```

*See also*

* [GetNetworkHashPS](/docs/core-api-ref-remote-procedure-calls-mining#section-getnetworkhashps): returns the estimated network hashes per second based on the last n blocks.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.

# GetMemPoolAncestors

*Added in Dash Core 0.12.3*

The `getmempoolancestors` RPC returns all in-mempool ancestors for a transaction in the mempool.

*Parameter #1---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Parameter #2---desired output format*

Name | Type | Presence | Description
--- | --- | --- | ---
Format | bool | Optional<br>(0 or 1) | Set to `true` to get json objects describing each transaction in the memory pool; set to `false` (the default) to only get an array of TXIDs

*Result---list of ancestor transactions*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of TXIDs belonging to transactions in the memory pool.  The array may be empty if there are no transactions in the memory pool
→<br>TXID | string | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Result (format: `true`)---a JSON object describing each transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing transactions currently in the memory pool.  May be empty
→<br>TXID | string : object | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order
→ →<br>`size` | number (int) | Required<br>(exactly 1) | The size of the serialized transaction in bytes
→ →<br>`fee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee paid by the transaction in decimal bitcoins
→ →<br>`modifiedfee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee with fee deltas used for mining priority in decimal bitcoins
→ →<br>`time` | number (int) | Required<br>(exactly 1) | The time the transaction entered the memory pool, Unix epoch time format
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The block height when the transaction entered the memory pool
→ →<br>`descendantcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool descendant transactions (including this one)
→ →<br>`descendantsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool descendants (including this one)
→ →<br>`descendantfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool descendants (including this one)
→ →<br>`ancestorcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool ancestor transactions (including this one)
→ →<br>`ancestorsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool ancestors (including this one)
→ →<br>`ancestorfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)
→ →<br>`depends` | array | Required<br>(exactly 1) | An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty
→ → →<br>Depends TXID | string | Optional (0 or more) | The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order

*Examples from Dash Core 0.12.3*

The default (`false`):

``` bash
dash-cli getmempoolancestors 49a512c3d567effd4f605a6023df8b4b523\
ac0ae7bccbaeed1c8a7db1e05e15a
```

Result:

``` json
[
  "d1eefe8a006e2c21b55bc97c1f5b10000d63aa6a777bb11abc0daf62e4296660"
]
```

Verbose output (`true`):

``` bash
dash-cli getmempoolancestors 49a512c3d567effd4f605a6023df8b4b523\
ac0ae7bccbaeed1c8a7db1e05e15a true
```

Result:

``` json
{
  "d1eefe8a006e2c21b55bc97c1f5b10000d63aa6a777bb11abc0daf62e4296660": {
    "size": 963,
    "fee": 0.00000966,
    "modifiedfee": 0.00000966,
    "time": 1519160516,
    "height": 79045,
    "descendantcount": 2,
    "descendantsize": 1189,
    "descendantfees": 1192,
    "ancestorcount": 1,
    "ancestorsize": 963,
    "ancestorfees": 966,
    "depends": [
    ]
  }
}
```

*See also*

* [GetMemPoolDescendants](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempooldescendants): returns all in-mempool descendants for a transaction in the mempool.
* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.

# GetMemPoolDescendants

*Added in Dash Core 0.12.3*

The `getmempooldescendants` RPC returns all in-mempool descendants for a transaction in the mempool.

*Parameter #1---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Parameter #2---desired output format*

Name | Type | Presence | Description
--- | --- | --- | ---
Format | bool | Optional<br>(0 or 1) | Set to `true` to get json objects describing each transaction in the memory pool; set to `false` (the default) to only get an array of TXIDs

*Result---list of descendant transactions*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of TXIDs belonging to transactions in the memory pool.  The array may be empty if there are no transactions in the memory pool
→<br>TXID | string | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Result (format: `true`)---a JSON object describing each transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing transactions currently in the memory pool.  May be empty
→<br>TXID | string : object | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order
→ →<br>`size` | number (int) | Required<br>(exactly 1) | The size of the serialized transaction in bytes
→ →<br>`fee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee paid by the transaction in decimal bitcoins
→ →<br>`modifiedfee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee with fee deltas used for mining priority in decimal bitcoins
→ →<br>`time` | number (int) | Required<br>(exactly 1) | The time the transaction entered the memory pool, Unix epoch time format
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The block height when the transaction entered the memory pool
→ →<br>`descendantcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool descendant transactions (including this one)
→ →<br>`descendantsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool descendants (including this one)
→ →<br>`descendantfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool descendants (including this one)
→ →<br>`ancestorcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool ancestor transactions (including this one)
→ →<br>`ancestorsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool ancestors (including this one)
→ →<br>`ancestorfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)
→ →<br>`depends` | array | Required<br>(exactly 1) | An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty
→ → →<br>Depends TXID | string | Optional (0 or more) | The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order

*Examples from Dash Core 0.14.0*

The default (`false`):

``` bash
dash-cli getmempooldescendants 49a512c3d567effd4f605a6023df8b4b5\
23ac0ae7bccbaeed1c8a7db1e05e15a
```

Result:

``` json
[
  "49a512c3d567effd4f605a6023df8b4b523ac0ae7bccbaeed1c8a7db1e05e15a"
]
```

Verbose output (`true`):

``` bash
dash-cli getmempooldescendants 49a512c3d567effd4f605a6023df8b4b5\
23ac0ae7bccbaeed1c8a7db1e05e15a true
```

Result:

``` json
{
  "49a512c3d567effd4f605a6023df8b4b523ac0ae7bccbaeed1c8a7db1e05e15a": {
    "size": 226,
    "fee": 0.00000226,
    "modifiedfee": 0.00000226,
    "time": 1519160551,
    "height": 79046,
    "descendantcount": 1,
    "descendantsize": 226,
    "descendantfees": 226,
    "ancestorcount": 2,
    "ancestorsize": 1189,
    "ancestorfees": 1192,
    "depends": [
      "d1eefe8a006e2c21b55bc97c1f5b10000d63aa6a777bb11abc0daf62e4296660"
    ]
  }
}
```

*See also*

* [GetMemPoolAncestors](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolancestors): returns all in-mempool ancestors for a transaction in the mempool.
* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.

# GetMemPoolEntry

*Added in Dash Core 0.14.0*

The `getmempoolentry` RPC returns mempool data for given transaction (must be in mempool).

*Parameter #1---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Result ---a JSON object describing the transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing transactions currently in the memory pool.  May be empty
→<br>`size` | number (int) | Required<br>(exactly 1) | The size of the serialized transaction in bytes
→<br>`fee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee paid by the transaction in decimal bitcoins
→<br>`modifiedfee` | number (bitcoins) | Required<br>(exactly 1) | The transaction fee with fee deltas used for mining priority in decimal bitcoins
→<br>`time` | number (int) | Required<br>(exactly 1) | The time the transaction entered the memory pool, Unix epoch time format
→<br>`height` | number (int) | Required<br>(exactly 1) | The block height when the transaction entered the memory pool
→<br>`descendantcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool descendant transactions (including this one)
→<br>`descendantsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool descendants (including this one)
→<br>`descendantfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool descendants (including this one)
→<br>`ancestorcount` | number (int) | Required<br>(exactly 1) | The number of in-mempool ancestor transactions (including this one)
→<br>`ancestorsize` | number (int) | Required<br>(exactly 1) | The size of in-mempool ancestors (including this one)
→<br>`ancestorfees` | number (int) | Required<br>(exactly 1) | The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)
→<br>`depends` | array | Required<br>(exactly 1) | An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty
→ →<br>Depends TXID | string | Optional (0 or more) | The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order
→<br>`instantlock` | bool | Required<br>(exactly 1) | True if this transaction was locked via InstantSend

*Examples from Dash Core 0.12.3*

``` bash
dash-cli getmempoolentry d1eefe8a006e2c21b55bc97c1f5b10000d63aa6\
a777bb11abc0daf62e4296660
```

Result:

``` json
{
  "size": 372,
  "fee": 0.00000375,
  "modifiedfee": 0.00000375,
  "time": 1566315602,
  "height": 159320,
  "descendantcount": 1,
  "descendantsize": 372,
  "descendantfees": 375,
  "ancestorcount": 1,
  "ancestorsize": 372,
  "ancestorfees": 375,
  "depends": [
  ],
  "instantlock": true
}
```

*See also*

* [GetMemPoolAncestors](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolancestors): returns all in-mempool ancestors for a transaction in the mempool.
* [GetMemPoolDescendants](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempooldescendants): returns all in-mempool descendants for a transaction in the mempool.
* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.

# GetMemPoolInfo

The `getmempoolinfo` RPC returns information about the node's current transaction memory pool.

*Parameters: none*

*Result---information about the transaction memory pool*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing information about the memory pool
→<br>`size` | number (int) | Required<br>(exactly 1) | The number of transactions currently in the memory pool
→<br>`bytes` | number (int) | Required<br>(exactly 1) | The total number of bytes in the transactions in the memory pool
→<br>`usage` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.11.0*<br><br>Total memory usage for the mempool in bytes
→<br>`maxmempool` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>Maximum memory usage for the mempool in bytes
→<br>`mempoolminfee` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The lowest fee per kilobyte paid by any transaction in the memory pool
→<br>`instantsendlocks` | number (int) | Required<br>(exactly 1) | *Added in Dash Core 0.14.1*<br><br>Number of unconfirmed InstantSend locks

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet getmempoolinfo
```

Result:

``` json
{
  "size": 1,
  "bytes": 666,
  "usage": 1936,
  "maxmempool": 300000000,
  "mempoolminfee": 0.00000000,
  "instantsendlocks": 1
}
```

*See also*

* [GetBlockChainInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockchaininfo): provides information about the current state of the block chain.
* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetTxOutSetInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-gettxoutsetinfo): returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool.

# GetRawMemPool

The `getrawmempool` RPC returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.

*Parameter---desired output format*

Name | Type | Presence | Description
--- | --- | --- | ---
Format | bool | Optional<br>(0 or 1) | Set to `true` to get verbose output describing each transaction in the memory pool; set to `false` (the default) to only get an array of TXIDs for transactions in the memory pool

*Result (format `false`)---an array of TXIDs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of TXIDs belonging to transactions in the memory pool.  The array may be empty if there are no transactions in the memory pool
→<br>TXID | string | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order

*Result (format: `true`)---a JSON object describing each transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing transactions currently in the memory pool.  May be empty
→<br>TXID | string : object | Optional<br>(0 or more) | The TXID of a transaction in the memory pool, encoded as hex in RPC byte order
→ →<br>`size` | number (int) | Required<br>(exactly 1) | The size of the serialized transaction in bytes
→ →<br>`fee` | amount (Dash) | Required<br>(exactly 1) | The transaction fee paid by the transaction in decimal Dash
→ →<br>`modifiedfee` | amount (Dash) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The transaction fee with fee deltas used for mining priority in decimal Dash
→ →<br>`time` | number (int) | Required<br>(exactly 1) | The time the transaction entered the memory pool, Unix epoch time format
→ →<br>`height` | number (int) | Required<br>(exactly 1) | The block height when the transaction entered the memory pool
→ →<br>`descendantcount` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The number of in-mempool descendant transactions (including this one)
→ →<br>`descendantsize` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The size of in-mempool descendants (including this one)
→ →<br>`descendantfees` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The modified fees (see `modifiedfee` above) of in-mempool descendants (including this one)
→ →<br>`ancestorcount` | number (int) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The number of in-mempool ancestor transactions (including this one)
→ →<br>`ancestorsize` | number (int) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The size of in-mempool ancestors (including this one)
→ →<br>`ancestorfees` | number (int) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*<br><br>The modified fees (see `modifiedfee` above) of in-mempool ancestors (including this one)
→ →<br>`depends` | array | Required<br>(exactly 1) | An array holding TXIDs of unconfirmed transactions this transaction depends upon (parent transactions).  Those transactions must be part of a block before this transaction can be added to a block, although all transactions may be included in the same block.  The array may be empty
→ → →<br>Depends TXID | string | Optional (0 or more) | The TXIDs of any unconfirmed transactions this transaction depends upon, encoded as hex in RPC byte order
→ →<br>`instantlock` | bool | Required<br>(exactly 1) | *Added in Dash Core 0.12.3*<br><br>Set to `true` for locked InstantSend transactions (masternode quorum has locked the transaction inputs via `txlvote` messages). Set to `false` if the masternodes have not approved the InstantSend transaction

*Examples from Dash Core 0.12.3*

The default (`false`):

``` bash
dash-cli getrawmempool
```

Result:

``` json
[
  "9dc994e03e387ff2d2709fbe86edede9f3d7aaddea7f75694495e415561b22fe"
]
```

Verbose output (`true`):

``` bash
dash-cli getrawmempool true
```

Result:

``` json
{
  "3bf4985183ddebcb6b1d58fa04dae9728a8f2bf20be298d81e38a8bd2f50ea47": {
    "size": 225,
    "fee": 0.00000226,
    "modifiedfee": 0.00000226,
    "time": 1566315512,
    "height": 159318,
    "descendantcount": 1,
    "descendantsize": 225,
    "descendantfees": 226,
    "ancestorcount": 2,
    "ancestorsize": 5760,
    "ancestorfees": 5780,
    "depends": [
      "1b8fdb3ce371c1274ee60df807d631320e7efaf30e7867584eb44b8ec4c19d12"
    ],
    "instantlock": true
  },
  "1b8fdb3ce371c1274ee60df807d631320e7efaf30e7867584eb44b8ec4c19d12": {
    "size": 5535,
    "fee": 0.00005554,
    "modifiedfee": 0.00005554,
    "time": 1566315441,
    "height": 159318,
    "descendantcount": 2,
    "descendantsize": 5760,
    "descendantfees": 5780,
    "ancestorcount": 1,
    "ancestorsize": 5535,
    "ancestorfees": 5554,
    "depends": [
    ],
    "instantlock": true
  }
}
```

*See also*

* [GetMemPoolInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolinfo): returns information about the node's current transaction memory pool.
* [GetMemPoolEntry](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolentry): returns mempool data for given transaction (must be in mempool).
* [GetTxOutSetInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-gettxoutsetinfo): returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool.

# GetMerkleBlocks

*Added in Dash Core 0.14.1*

The `getmerkleblocks` RPC returns an array of hex-encoded merkleblocks for <count> blocks starting from <hash> which match <filter>.

*Parameter #1---filter*

Name | Type | Presence | Description
--- | --- | --- | ---
filter | string | Required<br>(exactly 1) | The hex encoded bloom filter

*Parameter #2---hash*

Name | Type | Presence | Description
--- | --- | --- | ---
hash | string | Required<br>(exactly 1) | The block hash

*Parameter #3---count*

Name | Type | Presence | Description
--- | --- | --- | ---
count | number (int) | Optional<br>Default/max=2000 |

*Result---the list of merkleblocks*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of merkleblocks
→<br>Merkle Block | string (hex) | Optional<br>(1 or more) | A serialized, hex-encoded merkleblock

*Example from Dash Core 0.14.1*

``` bash
dash-cli getmerkleblocks \
	"2303028005802040100040000008008400048141010000f8400420800080025004000004130000000000000001" \
	"00000000007e1432d2af52e8463278bf556b55cf5049262f25634557e2e91202"
	2000
```

Result (truncated):
``` json
[
  "000000202c...aefc440107",
  "0000002058...9a17830103"
]
```

*See also: none*

# GetSpecialTxes

*Added in Dash Core 0.13.1*

The `getspecialtxes` RPC returns an array of special transactions found in the specified block

*Parameter #1---Block hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`blockhash` | string | Required<br>(exactly 1) | The block hash.

*Parameter #2---Special transaction type*

Name | Type | Presence | Description
--- | --- | --- | ---
type | int | Optional<br>(0 or 1) | Filter special txes by type, -1 means all types (default: -1)

*Parameter #3---Result limit*

Name | Type | Presence | Description
--- | --- | --- | ---
count | int | Optional<br>(0 or 1) | The number of transactions to return (default: 10)

*Parameter #4---Results to skip*

Name | Type | Presence | Description
--- | --- | --- | ---
skip | int | Optional<br>(0 or 1) | The number of transactions to skip (default: 0)

*Parameter #5---Verbosity*

Name | Type | Presence | Description
--- | --- | --- | ---
- n: "verbosity"
  t: "int"
  p: "Optional<br>(0 or 1)"
  d: "0 for hashes, 1 for hex-encoded data, and 2 for JSON object
 (default: 0)"

*Result (if `verbosity` was `0`)---An array of transaction IDs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex): array | Required<br>(exactly 1) | Array of special transaction hashes

*Result (if `verbosity` was `1`)---An array of serialized transactions*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex): array | Required<br>(exactly 1) | Array of serialized, hex-encoded data for the special transaction(s)

*Result (if `verbosity` was `2`)---An array of JSON objects*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex): array of ojbects | Required<br>(exactly 1) | Array of special transaction objects in the format of the `getrawtransaction` RPC

*Example from Dash Core 0.13.1*

List of Special Transactions hashes.

``` bash
dash-cli -testnet getspecialtxes \
0000003db0006ecaccdf5ae2cfa9d94406ef40ff65b9ec34668b87fca3da9226
```

Result:
``` json
[
  "1572a15f56307e413afe3cb7ea0017a1a3fd6d89c6c5f258cc17b2888a8e7fff",
  "89a6dc42063e4a792ec225db64dd9426742a5d1738e8821625d2ab920a6187b2",
  "fa3b3b0d3522becb02ddd15dd075f3d6ecc6a5a50b43c6c9f6d4703a9a8509d5"
]
```

List of Provider Registration Special Transactions (type: 1) in serialized, hex-encoded format.

``` bash
dash-cli -testnet getspecialtxes \
0000003db0006ecaccdf5ae2cfa9d94406ef40ff65b9ec34668b87fca3da9226 1 10 0 1
```

Result:
``` json
[
  "0300010001ea721d7420a9b58025894d08f9fecc73b7b87ed09277fa99dad5aa028ea357e1000000006b48304502210093c409672eed335f80630d7108c108d0b85ebe4d8be0758f8a3745f617c4b57302203175063605552c89f6de7f3dadc1773d5ef773b7cc0ccf98e6c5555ea75ba307012102b21d19fec95d9863c5b12fafeb60530e1cfc51d83f49ea9bca7192abb8b83e46feffffff01c4bb609a010000001976a9142efe9f9d3b36b133364d3cccbd27db75a0fbdcb788ac00000000fd120101000000000031567fbaf591ae9d2d0e9050bebce6a311cfd900616f851a3a630aa65e53f6940000000000000000000000000000ffffad3d1ee74a43c1ad3af209f75deaeb9216fc8339fd48d376f9b007ffa44583c9908f4aaca8dd97990c56043e475723f90940ef5fd7d493152540f25f58fb8c965ee5e1be4f850a661476c1ad3af209f75deaeb9216fc8339fd48d376f9b0e8031976a91454bbd7bd7c21553612d60ab16579e51efbcb135288acc281e8bf5a0dd22dfc9f1edeef9ef248f965a79210d997da37fb3e1dec76d1a4412096809bc005c860a0215cb008e3044b972688443b0b7a31ac5a04b728e63b1b5c5489e33dd666435f93c646523ad8a1d935a58957026749cbd0a9bf7e09a77388",
  "03000100012354b77c0f261f3d5b8424cbe67c2f27130f01c531732a08b8ae3f28aaa1b1fb000000006a473044022058323d3d9114492a7a7d350d5e3127d2dc550563968319987079c98f19ed519202204160cfe81adf1f41301136a3cbe03697baa1b14c3103b66bd839ace503dbf2630121026f83a8dad6b4695b136c399405b31d4031fd6631c469673d71eda479157ef9dcfeffffff0106b8609a010000001976a9142a855dc127bfdd5cc0ab73b71ff126e49aa409c488ac00000000fd1201010000000000b60dcb8bab5aba47435942c36ca4ee74ea5b662f4d7c7b528ce341915b2d5aec0100000000000000000000000000ffffad3d1ee74a428d3433cb6b9a1a29fdf07613172bbfdab744889689e308c9d2d8a3cb35f9d7bb7220b1eca82c952b82111119670dacae18a509628c775287e4e796128cd6379b80dffd7d8d3433cb6b9a1a29fdf07613172bbfdab744889610271976a91454bbd7bd7c21553612d60ab16579e51efbcb135288ac512010a2b992d7d5c1e1f999852855cc55162800025cfdf3b56c74e4734a2d97411f858532607cbd8848452dab1f216650def1d11a5abf3fa464c9ffcc7fec894a012a4b70ee5d3b983b5fe640f04a7f3e4fe67fbb5b7cccb71afa37888ad6cca48e"
]
```

List of Coinbase Special Transactions (type: 5) in JSON format.

``` bash
dash-cli -testnet getspecialtxes \
00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b 5 10 0 2
```

Result:
``` json
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
```

*See also:*

* [GetRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-getrawtransaction): gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings.

# GetSpentInfo

*Added in Dash Core 0.12.1*

The `getspentinfo` RPC returns the txid and index where an output is spent (requires `spentindex` to be enabled).

*Parameter #1---the TXID of the output*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of the transaction containing the relevant output, encoded as hex in RPC byte order

*Parameter #2---the start block height*

Name | Type | Presence | Description
--- | --- | --- | ---
Index | number (int) | Required<br>(exactly 1) | The block height to begin looking in

*Result---the TXID and spending input index*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the spent output.  If output wasn't found or if an error occurred, this will be JSON `null`
→<br>`txid` | string | Required<br>(exactly 1) | The output txid
→<br>`index` | number | Required<br>(exactly 1) | The spending input index

*Example from Dash Core 0.12.2*

Get the txid and index where an output is spent:

``` bash
dash-cli getspentinfo \
  '''
    {
      "txid": "0456aaf51a8df21dd47c2a06ede046a5bf7403bcb95d14d1d71b178c189fb933", \
      "index": 0
    }
```

Result:

``` json
{
  "txid": "14e874421350840e9d43965967c5a989e7d41ad361ef37484ee67d01d433ecfa",
  "index": 1,
  "height": 7742
}
```

*See also: none*

# GetTxOut

The `gettxout` RPC returns details about an unspent transaction output (UTXO).

*Parameter #1---the TXID of the output to get*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of the transaction containing the output to get, encoded as hex in RPC byte order

*Parameter #2---the output index number (vout) of the output to get*

Name | Type | Presence | Description
--- | --- | --- | ---
Vout | number (int) | Required<br>(exactly 1) | The output index number (vout) of the output within the transaction; the first output in a transaction is vout 0

*Parameter #3---whether to display unconfirmed outputs from the memory pool*

Name | Type | Presence | Description
--- | --- | --- | ---
Unconfirmed | bool | Optional<br>(0 or 1) | Set to `true` to display unconfirmed outputs from the memory pool; set to `false` (the default) to only display outputs from confirmed transactions

*Result---a description of the output*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the output.  If output wasn't found, if it was spent, or if an error occurred, this will be JSON `null`
→<br>`bestblock` | string (hex) | Required<br>(exactly 1) | The hash of the header of the block on the local best block chain which includes this transaction.  The hash will encoded as hex in RPC byte order.  If the transaction is not part of a block, the string will be empty
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations received for the transaction containing this output or `0` if the transaction hasn't been confirmed yet
→<br>`value` | number (Dash) | Required<br>(exactly 1) | The amount of Dash spent to this output.  May be `0`
→<br>`scriptPubKey` | string : object | Optional<br>(0 or 1) | An object with information about the pubkey script.  This may be `null` if there was no pubkey script
→ →<br>`asm` | string | Required<br>(exactly 1) | The pubkey script in decoded form with non-data-pushing opcodes listed
→ →<br>`hex` | string (hex) | Required<br>(exactly 1) | The pubkey script encoded as hex
→ →<br>`reqSigs` | number (int) | Optional<br>(0 or 1) | The number of signatures required; this is always `1` for P2PK, P2PKH, and P2SH (including P2SH multisig because the redeem script is not available in the pubkey script).  It may be greater than 1 for bare multisig.  This value will not be returned for `nulldata` or `nonstandard` script types (see the `type` key below)
→ →<br>`type` | string | Optional<br>(0 or 1) | The type of script.  This will be one of the following:<br>• `pubkey` for a P2PK script<br>• `pubkeyhash` for a P2PKH script<br>• `scripthash` for a P2SH script<br>• `multisig` for a bare multisig script<br>• `nulldata` for nulldata scripts<br>• `nonstandard` for unknown scripts
→ →<br>`addresses` | string : array | Optional<br>(0 or 1) | The P2PKH or P2SH addresses used in this transaction, or the computed P2PKH address of any pubkeys in this transaction.  This array will not be returned for `nulldata` or `nonstandard` script types
→ → →<br>Address | string | Required<br>(1 or more) | A P2PKH or P2SH address
→<br>`coinbase` | bool | Required<br>(exactly 1) | Set to `true` if the transaction output belonged to a coinbase transaction; set to `false` for all other transactions.  Coinbase transactions need to have 101 confirmations before their outputs can be spent

*Example from Dash Core 0.14.1*

Get the UTXO from the following transaction from the first output index ("0"),
searching the memory pool if necessary.

``` bash
dash-cli -testnet gettxout \
  e0a06b47f0de6f3851a228d5ac377ac38b495adf04298c43e951e679c5b0aa8f \
  0 true
```

Result:

``` json
{
  "bestblock": "000000005651f6d7859793dee07d476a2f2a7338e66bbb41caf4b544c5b0318d",
  "confirmations": 2,
  "value": 25.00000000,
  "scriptPubKey": {
    "asm": "OP_DUP OP_HASH160 b66266c5017a759817f3bb99e8d9124bf5bb2e74 OP_EQUALVERIFY OP_CHECKSIG",
    "hex": "76a914b66266c5017a759817f3bb99e8d9124bf5bb2e7488ac",
    "reqSigs": 1,
    "type": "pubkeyhash",
    "addresses": [
      "ycwoiAibTjpwnoCZSX7S4kiB2H8wULw9qo"
    ]
  },
  "coinbase": false
}
```

*See also*

* [GetRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-getrawtransaction): gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings.
* [GetTransaction](/docs/core-api-ref-remote-procedure-calls-wallet#section-gettransaction): gets detailed information about an in-wallet transaction.

# GetTxOutProof

The `gettxoutproof` RPC returns a hex-encoded proof that one or more specified transactions were included in a block.

NOTE: By default this function only works when there is an
unspent output in the UTXO set for this transaction. To make it always work,
you need to maintain a transaction index, using the `-txindex` command line option, or
specify the block in which the transaction is included in manually (by block header hash).

*Parameter #1---the transaction hashes to prove*

Name | Type | Presence | Description
--- | --- | --- | ---
TXIDs | array | Required<br>(exactly 1) | A JSON array of txids to filter
→<br>`txid` | string | Required<br>(1 or more) | TXIDs of the transactions to generate proof for.  All transactions must be in the same block

*Parameter #2---the block to look for txids in*

Name | Type | Presence | Description
--- | --- | --- | ---
Header hash | string | Optional<br>(0 or 1) | If specified, looks for txid in the block with this hash

*Result---serialized, hex-encoded data for the proof*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | A string that is a serialized, hex-encoded data for the proof

*Example from Dash Core 0.12.2*

Get the hex-encoded proof that "txid" was included in block 000000012d774f3c7668f32bc448efeb93b317f312dd863679de3a007d47817f:

``` bash
dash-cli gettxoutproof \
  '''
    [
      "e0a06b47f0de6f3851a228d5ac377ac38b495adf04298c43e951e679c5b0aa8f"
    ]
  ''' \
  '000000012d774f3c7668f32bc448efeb93b317f312dd863679de3a007d47817f'
```

Result (wrapped):

``` text
01000020ed72cc6a7294782a7711d8fa7ef74716ef062dc50bb0820f7eec923801000000\
aa5d17c5128043803b67c7ab03e4d3ffbc9604b54f877f1c5cf9ed3adeaa19b2cd7ed659\
f838011d10a70a480200000002033c89c2baecba9fc983c85dcf365c2d9cc93aca1dee2e\
5ac18124464056542e8faab0c579e651e9438c2904df5a498bc37a37acd528a251386fde\
f0476ba0e00105
```

*See also*

* [VerifyTxOutProof](/docs/core-api-ref-remote-procedure-calls-blockchain#section-verifytxoutproof): verifies that a proof points to one or more transactions in a block, returning the transactions the proof commits to and throwing an RPC error if the block is not in our best block chain.
* [`merkleblock` message][merkleblock message]: A description of the
  format used for the proof.

# GetTxOutSetInfo

The `gettxoutsetinfo` RPC returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool.

*Parameters: none*

*Result---statistics about the UTXO set*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the UTXO set
→<br>`height` | number (int) | Required<br>(exactly 1) | The height of the local best block chain.  A new node with only the hardcoded genesis block will have a height of 0
→<br>`bestblock` | string (hex) | Required<br>(exactly 1) | The hash of the header of the highest block on the local best block chain, encoded as hex in RPC byte order
→<br>`transactions` | number (int) | Required<br>(exactly 1) | The number of transactions with unspent outputs
→<br>`txouts` | number (int) | Required<br>(exactly 1) | The number of unspent transaction outputs
→<br>`bogosize` | number (int) | Required<br>(exactly 1) | A meaningless metric for UTXO set size
→<br>`hash_serialized_2` | string (hex) | Required<br>(exactly 1) | A SHA256(SHA256()) hash of the serialized UTXO set; useful for comparing two nodes to see if they have the same set (they should, if they always used the same serialization format and currently have the same best block).  The hash is encoded as hex in RPC byte order
→<br>`disk_size` | number (int) | Required<br>(exactly 1) | The estimated size of the chainstate on disk
→<br>`total_amount` | number (Dash) | Required<br>(exactly 1) | The total amount of Dash in the UTXO set

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet gettxoutsetinfo
```

Result:

``` json
{
  "height": 159358,
  "bestblock": "0000000000a705ef74a1fc134ea1eba49af8eead40b3df1fc4fb40f5940a0d60",
  "transactions": 187542,
  "txouts": 366996,
  "bogosize": 28344374,
  "hash_serialized_2": "d7326bdc2d9cb7d91580bfd47d6c2972ab1776c2c33c787873a5fd01986c9377",
  "disk_size": 21513509,
  "total_amount": 7517185.08574437
}
```

*See also*

* [GetBlockChainInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockchaininfo): provides information about the current state of the block chain.
* [GetMemPoolInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolinfo): returns information about the node's current transaction memory pool.

# PreciousBlock

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The `preciousblock` RPC treats a block as if it were received before others with the same work. A later `preciousblock` call can override the effect of an earlier one. The effects of `preciousblock` are not retained across restarts.

*Parameter #1---the block hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Header Hash | string (hex) | Required<br>(exactly 1) | The hash of the block to mark as precious

*Result---`null` or error on failure*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | JSON `null`.  The JSON-RPC error field will be set only if you entered an invalid block hash

*Example from Dash Core 0.12.3*

``` bash
dash-cli preciousblock 00000000034d77e287b63922a94f12e8c4ab9e\
1d8056060fd51f6153ea5dc757
```

Result (no output from `dash-cli` because result is set to `null`).

# PruneBlockChain

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The `pruneblockchain` RPC prunes the blockchain up to a specified height or timestamp. The `-prune` option needs to be enabled (disabled by default).

*Parameter #1---the block height or timestamp*

Name | Type | Presence | Description
--- | --- | --- | ---
Height | number (int) | Required<br>(exactly 1) | The block height to prune up to. May be set to a particular height, or a unix timestamp to prune blocks whose block time is at least 2 hours older than the provided timestamp

*Result---the height of the last block pruned*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The height of the last block pruned

*Examples from Dash Core 0.12.3*

``` bash
dash-cli pruneblockchain 413555
```

Result:

``` text
413555
```

*See also*

* [ImportPrunedFunds](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprunedfunds): imports funds without the need of a rescan. Meant for use with pruned wallets.

# VerifyChain

The `verifychain` RPC verifies each entry in the local block chain database.

*Parameter #1---how thoroughly to check each block*

Name | Type | Presence | Description
--- | --- | --- | ---
Check Level | number (int) | Optional<br>(0 or 1) | How thoroughly to check each block, from 0 to 4.  Default is the level set with the `-checklevel` command line argument; if that isn't set, the default is `3`.  Each higher level includes the tests from the lower levels<br><br>Levels are:<br>**0.** Read from disk to ensure the files are accessible<br>**1.**  Ensure each block is valid<br>**2.** Make sure undo files can be read from disk and are in a valid format<br>**3.** Test each block undo to ensure it results in correct state<br>**4.** After undoing blocks, reconnect them to ensure they reconnect correctly

*Parameter #2---the number of blocks to check*

Name | Type | Presence | Description
--- | --- | --- | ---
Number Of Blocks | number (int) | Optional<br>(0 or 1) | The number of blocks to verify.  Set to `0` to check all blocks.  Defaults to the value of the `-checkblocks` command-line argument; if that isn't set, the default is `288`

*Result---verification results*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool | Required<br>(exactly 1) | Set to `true` if verified; set to `false` if verification failed for any reason

*Example from Dash Core 0.12.2*

Verify the most recent 400 blocks in the most through way:

``` bash
dash-cli -testnet verifychain 4 400
```

Result (took < 1 second on a mobile workstation; it would've taken much longer on mainnet):

``` json
true
```

*See also*

* [GetBlockChainInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockchaininfo): provides information about the current state of the block chain.
* [GetTxOutSetInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-gettxoutsetinfo): returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool.

# VerifyTxOutProof

The `verifytxoutproof` RPC verifies that a proof points to one or more transactions in a block, returning the transactions the proof commits to and throwing an RPC error if the block is not in our best block chain.

*Parameter #1---The hex-encoded proof generated by gettxoutproof*

Name | Type | Presence | Description
--- | --- | --- | ---
`proof` | string | Required | A hex-encoded proof

*Result---txid(s) which the proof commits to*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The txid(s) which the proof commits to, or empty array if the proof is invalid

*Example from Dash Core 0.12.2*

Verify a proof:

``` bash
dash-cli verifytxoutproof \
01000020ed72cc6a7294782a7711d8fa7ef74716ef062dc50bb0820f7eec923801000000\
aa5d17c5128043803b67c7ab03e4d3ffbc9604b54f877f1c5cf9ed3adeaa19b2cd7ed659\
f838011d10a70a480200000002033c89c2baecba9fc983c85dcf365c2d9cc93aca1dee2e\
5ac18124464056542e8faab0c579e651e9438c2904df5a498bc37a37acd528a251386fde\
f0476ba0e00105
```

Result:

``` json
[
"e0a06b47f0de6f3851a228d5ac377ac38b495adf04298c43e951e679c5b0aa8f"
]
```

*See also*

* [GetTxOutProof](/docs/core-api-ref-remote-procedure-calls-blockchain#section-gettxoutproof): returns a hex-encoded proof that one or more specified transactions were included in a block.
* [`merkleblock` message][merkleblock message]: A description of the
  format used for the proof.

>>>>>>>> Control RPCs

# Debug

The `debug` RPC changes the debug category from the console.

*Parameter #1---debug category*

Name | Type | Presence | Description
--- | --- | --- | ---
Debug category | string | Required<br>(1 or more) | The debug category to activate. Use a `+` to specify multiple categories. Categories will be one of the following:<br>• `0` - Disables all categories <br>• `1` or `all` - Enables all categories <br>• `addrman` <br>• `bench` <br>• `cmpctblock` <br>• `coindb` <br>• `db` <br>• `estimatefee` <br>• `http` <br>• `leveldb` <br>• `libevent` <br>• `mempool` <br>• `mempoolrej` <br>• `net` <br>• `proxy` <br>• `prune` <br>• `qt` <br>• `rand` <br>• `reindex` <br>• `rpc` <br>• `selectcoins` <br>• `tor` <br>• `zmq` <br>• `dash` (all subcategories)<br><br>The `dash` sub-categories can be enabled individually:<br>• `chainlocks` <br>• `gobject` <br>• `instantsend` <br>• `keepass` <br>• `llmq` <br>• `llmq-dkg` <br>• `llmq-sigs` <br>• `mnpayments` <br>• `mnsync` <br>• `privatesend` <br>• `spork` <br><br><br>Note: No error will be thrown even if the specified category doesn't match any of the above

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet debug "net+mempool"
```

Result:

``` text
Debug mode: net+mempool
```

*See also*

* [Logging](/docs/core-api-ref-remote-procedure-calls-control#section-logging): gets and sets the logging configuration

# GetInfo

The `getinfo` RPC prints various information about the node and the network.

{{WARNING}} `getinfo` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameters: none*

*Result---information about the node and network*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about this node and the network
→<br>`deprecation-warning` | string | Required<br>(exactly 1) | Warning that the getinfo command is deprecated and will be removed in a future version
→<br>`version` | number (int) | Required<br>(exactly 1) | This node's version of Bitcoin Core in its internal integer format.  For example, Dash Core 0.12.2 has the integer version number 120200
→<br>`protocolversion` | number (int) | Required<br>(exactly 1) | The protocol version number used by this node.  See the [protocol versions section][section protocol versions] for more information
→<br>`walletversion` | number (int) | Optional<br>(0 or 1) | The version number of the wallet.  Only returned if wallet support is enabled
→<br>`balance` | number (duffs) | Optional<br>(0 or 1) | The total balance of the wallet in duffs.  Only returned if wallet support is enabled
→<br>`privatesend_balance` | number (duffs) | Optional<br>(0 or 1) | The PrivateSend balance of the wallet in duffs.  Only returned if wallet support is enabled  (Added in Dash Core 0.11.0)
→<br>`blocks` | number (int) | Required<br>(exactly 1) | The number of blocks in the local best block chain.  A new node with only the hardcoded genesis block will return `0`
→<br>`timeoffset` | number (int) | Required<br>(exactly 1) | The offset of the node's clock from the computer's clock (both in UTC) in seconds.  The offset may be up to 4200 seconds (70 minutes)
→<br>`connections` | number (int) | Required<br>(exactly 1) | The total number of open connections (both outgoing and incoming) between this node and other nodes
→<br>`proxy` | string | Required<br>(exactly 1) | The hostname/IP address and port number of the proxy, if set, or an empty string if unset
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | The difficulty of the highest-height block in the local best block chain
→<br>`testnet` | bool | Required<br>(exactly 1) | Set to `true` if this node is on testnet; set to `false` if this node is on mainnet or a regtest
→<br>`keypoololdest` | number (int) | Optional<br>(0 or 1) | The date as Unix epoch time when the oldest key in the wallet key pool was created; useful for only scanning blocks created since this date for transactions.  Only returned if wallet support is enabled
→<br>`keypoolsize` | number (int) | Optional<br>(0 or 1) | The number of keys in the wallet keypool.  Only returned if wallet support is enabled
→<br>`unlocked_until` | number (int) | Optional<br>(0 or 1) | The Unix epoch time when the wallet will automatically re-lock.  Only displayed if wallet encryption is enabled.  Set to `0` if wallet is currently locked
→<br>`paytxfee` | number (duffs) | Optional<br>(0 or 1) | The minimum fee to pay per kilobyte of transaction; may be `0`.  Only returned if wallet support is enabled
→<br>`relayfee` | number (duffs) | Required<br>(exactly 1) | The minimum fee per kilobyte a transaction must pay in order for this node to accept it into its memory pool
→<br>`errors` | string | Required<br>(exactly 1) | A plain-text description of any errors this node has encountered or detected.  If there are no errors, an empty string will be returned.  This is not related to the JSON-RPC `error` field

*Example from Dash Core 0.14.1 with wallet support enabled*

``` bash
dash-cli -testnet getinfo
```

Result:

``` json
{
  "deprecation-warning": "WARNING: getinfo is deprecated and will be fully removed in a future version. Projects should transition to using getblockchaininfo, getnetworkinfo, and getwalletinfo.",
  "version": 140100,
  "protocolversion": 70215,
  "walletversion": 61000,
  "balance": 0.00000000,
  "privatesend_balance": 0.00000000,
  "blocks": 0,
  "timeoffset": 0,
  "connections": 0,
  "proxy": "",
  "difficulty": 0.000244140625,
  "testnet": true,
  "keypoololdest": 1507579068,
  "keypoolsize": 617,
  "unlocked_until": 0,
  "paytxfee": 0.00000000,
  "relayfee": 0.00010000,
  "errors": ""
}
```

*See also*

* [GetBlockChainInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblockchaininfo): provides information about the current state of the block chain.
* [GetMemPoolInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolinfo): returns information about the node's current transaction memory pool.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.
* [GetWalletInfo](/docs/core-api-ref-remote-procedure-calls-wallet#section-getwalletinfo): provides information about the wallet.

# GetMemoryInfo

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The `getmemoryinfo` RPC returns information about memory usage.

*Parameter #1---mode*

Name | Type | Presence | Description
--- | --- | --- | ---
- n: "mode"
  t: "string"
  p: "Optional<br>Default: `stats`"
  d: "*Added in Dash Core 0.14.1*<br><br>Determines what kind of information is returned.<br>
       - `stats` returns general statistics about memory usage in the daemon.<br>
       - `mallocinfo` returns an XML string describing low-level heap state (only available if compiled with glibc 2.10+)."

*Result---information about memory usage*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object containing information about memory usage
→<br>`locked` | string : object | Required<br>(exactly 1) | An object containing information about locked memory manager
→→<br>`used` | number (int) | Required<br>(exactly 1) | Number of bytes used
→→<br>`free` | number (int) | Required<br>(exactly 1) | Number of bytes available in current arenas
→→<br>`total` | number (int) | Required<br>(exactly 1) | Total number of bytes managed
→→<br>`locked` | number (int) | Required<br>(exactly 1) | Amount of bytes that succeeded locking
→→<br>`chunks_used` | number (int) | Required<br>(exactly 1) | Number allocated chunks
→→<br>`chunks_free` | number (int) | Required<br>(exactly 1) | Number unused chunks

*Example from Dash Core 0.12.3*

``` bash
dash-cli getmemoryinfo
```

Result:

``` json
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
```

*See also*

* [GetMemPoolInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolinfo): returns information about the node's current transaction memory pool.

# Help

The `help` RPC lists all available public RPC commands, or gets help for the specified RPC.  Commands which are unavailable will not be listed, such as wallet RPCs if wallet support is disabled.

*Parameter---the name of the RPC to get help for*

Name | Type | Presence | Description
--- | --- | --- | ---
RPC | string | Optional<br>(0 or 1) | The name of the RPC to get help for.  If omitted, Dash Core 0.10x will display an alphabetical list of commands; Dash Core 0.11.0 will display a categorized list of commands

*Result---a list of RPCs or detailed help for a specific RPC*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The help text for the specified RPC or the list of commands.  The `dash-cli` command will parse this text and format it as human-readable text

*Example from Dash Core 0.12.2*

Command to get help about the `help` RPC:

``` bash
dash-cli -testnet help help
```

Result:

``` text
help ( "command" )

List all commands, or get help for a specified command.

Arguments:
1. "command"     (string, optional) The command to get help on

Result:
"text"     (string) The help text

```

*See also*

* The [RPC Quick Reference][section RPC quick reference]

# Logging

The `logging` RPC gets and sets the logging configuration

*Parameter #1---include categories*

Name | Type | Presence | Description
--- | --- | --- | ---
`include` | array of strings | Optional<br>(0 or 1) | Enable debugging for these categories

*Parameter #2---exclude categories*

Name | Type | Presence | Description
--- | --- | --- | ---
`exclude` | array of strings | Optional<br>(0 or 1) | Enable debugging for these categories

The categories are:

| Type | Category |
| - | - |
| Special | • `0` - Disables all categories <br>• `1` or `all` - Enables all categories <br>• `dash` - Enables/disables all Dash categories |
| Standard | `addrman`, `bench` <br>`cmpctblock`, `coindb`, `db`, `estimatefee`, `http`, `leveldb`, `libevent`, `mempool`, `mempoolrej`, `net`, `proxy`, `prune`, `qt`, `rand`, `reindex`, `rpc`, `selectcoins`, `tor`, `zmq`|
| Dash | <br>`chainlocks`, `gobject`, `instantsend`, `keepass`, `llmq`, `llmq-dkg`, `llmq-sigs`, `mnpayments`, `mnsync`, `privatesend`, `spork` |

*Result---a list of the logging categories that are active*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A JSON object show a list of the logging categories that are active

*Example from Dash Core 0.14.1*

Include a category in logging

``` bash
dash-cli -testnet logging '["llmq", "spork"]'
```

Result:
``` json
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
```

Excluding a previously included category (without including any new ones):

``` bash
dash-cli -testnet logging '[]' '["spork"]'
```

Result:
``` json
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
```

*See also*

* [Debug](/docs/core-api-ref-remote-procedure-calls-control#section-debug): changes the debug category from the console.

# Stop

The `stop` RPC safely shuts down the Dash Core server.

*Parameters: none*

*Result---the server is safely shut down*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The string \Dash Core server stopping\""

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet stop
```

Result:

``` text
Dash Core server stopping
```

*See also: none*

# Uptime

The `uptime` RPC returns the total uptime of the server.

*Parameters: none*

*Result*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The number of seconds that the server has been running

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet uptime
```

Result:
``` text
5500
```

*See also: none*

>>>>>>>> Dash RPCs

# GetGovernanceInfo

The `getgovernanceinfo` RPC returns an object containing governance parameters.

*Parameters: none*

*Result---information about the governance system*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the governance system
→<br>`governanceminquorum` | number (int) | Required<br>(exactly 1) | The absolute minimum number of votes needed to trigger a governance action
→<br>`proposalfee` | number (int) | Required<br>(exactly 1) | The collateral transaction fee which must be paid to create a proposal in Dash
→<br>`superblockcycle` | number (int) | Required<br>(exactly 1) | The number of blocks between superblocks
→<br>`lastsuperblock` | number (int) | Required<br>(exactly 1) | The block number of the last superblock
→<br>`nextsuperblock` | number (int) | Required<br>(exactly 1) | The block number of the next superblock

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet getgovernanceinfo
```

Result:
``` json
{
  "governanceminquorum": 1,
  "proposalfee": 5.00000000,
  "superblockcycle": 24,
  "lastsuperblock": 250824,
  "nextsuperblock": 250848
}
```

*See also:*

* [GObject](/docs/core-api-ref-remote-procedure-calls-dash#section-gobject): provides a set of commands for managing governance objects and displaying information about them.

# GetPoolInfo

The `getpoolinfo` RPC returns an object containing mixing pool related information.

*Parameters: none*

*Result---information about the mixing pool*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the mixing pool
→<br>`state` | string | Required<br>(exactly 1) | Mixing pool state.  Will be one of the following:<br>• `IDLE` <br>• `QUEUE` <br>• `ACCEPTING_ENTRIES` <br>• `SIGNING` <br>• `ERROR` <br>• `SUCCESS` <br>• `UNKNOWN` <br>
→<br>`mixing_mode` | string | Required<br>(exactly 1) | Mixing mode - will be one of the following:<br>• `normal` <br>• `multi-session` <br>
→<br>`queue` | number (int) | Required<br>(exactly 1) | Queue size
→<br>`entries` | number (int) | Required<br>(exactly 1) | The number of entries
→<br>`status` | string | Required<br>(exactly 1) | A more detailed description of the current state
→<br>`outpoint` | string (hex) | Optional<br>(exactly 1) | Previous output
→<br>`addr` | string | Optional<br>(exactly 1) | Address
→<br>`keys_left` | number (int) | Optional<br>(exactly 1) | The number of keys left in the local wallet
→<br>`warnings` | number (int) | Optional<br>(exactly 1) | Warnings related to local wallet

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getpoolinfo
```

Result:
``` json
{
  "state": "IDLE",
  "mixing_mode": "normal",
  "queue": 0,
  "entries": 0,
  "status": "PrivateSend is idle.",
  "keys_left": 617,
  "warnings": ""
}
```

``` json
{
  "state": "QUEUE",
  "mixing_mode": "normal",
  "queue": 1,
  "entries": 0,
  "status": "Submitted to masternode, waiting in queue .",
  "outpoint": "e3a6b7878a7e9413898bb379b323c521676f9d460db17ec3bf42d9ac0c9a432f-1",
  "addr": "217.182.229.146:19999",
  "keys_left": 571,
  "warnings": ""
}
```

``` json
{
  "state": "ERROR",
  "mixing_mode": "normal",
  "queue": 0,
  "entries": 0,
  "status": "PrivateSend request incomplete: Session timed out. Will retry...",
  "keys_left": 571,
  "warnings": ""
}
```

*See also:*

# GetSuperblockBudget

The `getsuperblockbudget` RPC returns the absolute maximum sum of superblock payments allowed.

*Parameter #1---block index*

Name | Type | Presence | Description
--- | --- | --- | ---
index | number (int) | Required<br>(exactly 1) | The superblock index

*Result---maximum sum of superblock payments*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The absolute maximum sum of superblock payments allowed, in DASH

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getsuperblockbudget 7392
```

Result:
``` text
367.20
```

*See also:*

* [GetGovernanceInfo](/docs/core-api-ref-remote-procedure-calls-dash#section-getgovernanceinfo): returns an object containing governance parameters.

# GObject

The `gobject` RPC provides a set of commands for managing governance objects and displaying information about them.

## GObject Check

The `gobject check` RPC validates governance object data (_proposals only_).

*Parameter #1---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | The data (hex) of a governance proposal object

*Result---governance object status*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing status
→<br>`Object Status` | string | Required<br>(exactly 1) | Status of the governance object

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject check 7b22656e645f65706f6368223a3135363034353730\
35352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22796\
4354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061\
796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333\
439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result:
``` json
{
  "Object status": "OK"
}
```

## GObject Prepare

The `gobject prepare` RPC prepares a governance object by signing and creating a collateral transaction.

*Parameter #1---parent hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`parent-hash` | string (hex) | Required<br>(exactly 1) | Hash of the parent object. Usually the root node which has a hash of 0

*Parameter #2---revision*

Name | Type | Presence | Description
--- | --- | --- | ---
`revision` | int | Required<br>(exactly 1) | Object revision number

*Parameter #3---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time (Unix epoch time)

*Parameter #4---data*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | **Updated in Dash Core 0.14.0 to require all new proposals to use JSON serialization.**<br><br>Object data (JSON object with governance details). Additional details regarding this are provided in an example below.

*Parameter #5---use-IS*

Name | Type | Presence | Description
--- | --- | --- | ---
`use-IS` | boolean | Optional<br>(0 or 1) | *Deprecated and ignored since Dash Core 0.14.1*

*Parameter #6---outputHash*

Name | Type | Presence | Description
--- | --- | --- | ---
`outputHash` | string (hex) | Optional<br>(0 or 1) | *Added in Dash Core 0.13.0*<br><br>The single output to submit the proposal fee from

*Parameter #7---outputIndex*

Name | Type | Presence | Description
--- | --- | --- | ---
`outputIndex` | numeric | Optional<br>(0 or 1) | *Added in Dash Core 0.13.0*<br><br>The output index (required if the `outputHash` parameter is provided)

*Result---collateral transaction ID*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Transaction ID for the collateral transaction

**Details of the `data-hex` field:**

The `data-hex` field is comprised of a JSON object as described in [GObject
Deserialize](#gobject-deserialize) which is serialized to hex.

An example of a proposal JSON object is shown here:

``` json
{
  "end_epoch": 1560457055,
  "name": "test",
  "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
  "payment_amount": 5,
  "start_epoch": 1560453490,
  "type": 1,
  "url": "http://test.com"
}
```

To serialize the object, first remove all spaces from the JSON object as shown below:

``` json
{"end_epoch":1560457055,"name":"test","payment_address":"yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB","payment_amount":5,"start_epoch":1560453490,"type":1,"url":"http://test.com"}
```

Then convert the string to its hex equivalent as shown below. This is what will
be used for the `data-hex` field of the `gobject prepare` command:

``` bash
7b22656e645f65706f6368223a313536303435373035352c226e616d65223a2274657374222c\
227061796d656e745f61646472657373223a227964354b4d52457333474c4d65366d544a5972\
33597248316a75774e777246436642222c227061796d656e745f616d6f756e74223a352c2273\
746172745f65706f6368223a313536303435333439302c2274797065223a312c2275726c223a\
22687474703a2f2f746573742e636f6d227d
```

*Example from Dash Core 0.14.0*

``` bash
gobject prepare 0 1 1560449223 7b22656e645f65706f6368223a3135363034353730353\
52c226e616d65223a2274657374222c227061796d656e745f61646472657373223a227964354\
b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061796d6\
56e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333439302\
c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result (Collateral Transaction ID):
``` bash
3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262
```

## GObject Submit

The `gobject submit` RPC submits a governance object to network (objects must
first be prepared via `gobject prepare`).

Note: Parameters 1-4 should be the same values as the ones used for `gobject
prepare`.

*Parameter #1---parent hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`parent-hash` | string (hex) | Required<br>(exactly 1) | Hash of the parent object. Usually the root node which has a hash of 0

*Parameter #2---revision*

Name | Type | Presence | Description
--- | --- | --- | ---
`revision` | int | Required<br>(exactly 1) | Object revision number

*Parameter #3---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time

*Parameter #4---data*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | **Updated in Dash Core 0.14.0 to require all new proposals to use JSON serialization.**<br><br>Object data (JSON object with governance details). See [GObject Prepare](#gobject-prepare) for additional details about this field.

*Parameter #5---fee transaction ID*

Name | Type | Presence | Description
--- | --- | --- | ---
`data` | string (hex) | Required<br>(exactly 1) | Fee transaction ID - required for all objects except triggers

*Result---governance object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Governance object hash

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject submit 0 1 1560449223 7b22656e645f65706f6368223a3\
13536303435373035352c226e616d65223a2274657374222c227061796d656e745f61646472\
657373223a227964354b4d52457333474c4d65366d544a597233597248316a75774e7772464\
36642222c227061796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a\
313536303435333439302c2274797065223a312c2275726c223a22687474703a2f2f7465737\
42e636f6d227d \
3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262
```

Result (Governance Object Hash):
``` bash
e353b2ab5f7e7cb24b95e00e153ec2a6339249672f18b8e8e144aa711678710d
```

## GObject Deserialize

The `gobject deserialize` RPC deserializes a governance object from a hex string to JSON.

*Parameter #1---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`hex_data` | string (hex) | Required<br>(exactly 1) | The data (hex) of a governance object

**Results**

The result output varies depending on the type of governance object being
deserialized. Examples are shown below for both proposal and trigger object types.

**Result - Proposal**

*Result---governance proposal object deserialized to JSON*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Array of governance objects
→ →<br>`end_epoch` | string | Required<br>(exactly 1) | Governance object info as string
→ →<br>`name` | string (hex) | Required<br>(exactly 1) | Proposal name
→ →<br>`payment_address` | string (hex) | Required<br>(exactly 1) | Proposal payment address
→ →<br>`payment_amount` | string | Required<br>(exactly 1) | Proposal payment amount
→ →<br>`start_epoch` | string (hex) | Required<br>(exactly 1) | Proposal start
→ →<br>`type` | int | Required<br>(exactly 1) | Object type
→ →<br>`url` | string | Required<br>(exactly 1) | Proposal URL

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject deserialize 7b22656e645f65706f6368223a313536303435\
373035352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22\
7964354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c2270\
61796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a31353630343533\
3439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result:
``` json
{
  "end_epoch": 1560457055,
  "name": "test",
  "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
  "payment_amount": 5,
  "start_epoch": 1560453490,
  "type": 1,
  "url": "http://test.com"
}
```

**Result - Trigger**

*Result---governance trigger object deserialized to JSON*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Array of governance objects
→ →<br>`event_block_height` | int | Required<br>(exactly 1) | Block height to activate trigger
→ →<br>`payment_addresses` | string (hex) | Required<br>(exactly 1) | Proposal payment address
→ →<br>`payment_amounts` | string | Required<br>(exactly 1) | Proposal payment amount
→ →<br>`proposal_hashes` | string (hex) | Required<br>(exactly 1) | Proposal hashes
→ →<br>`type` | int | Required<br>(exactly 1) | Object type

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject deserialize 7b226576656e745f626c6f636b5f68656967687\
4223a203131393539322c20227061796d656e745f616464726573736573223a20227954686d6e\
75565a316765516e79776f456147627079333362695435473573587a62222c20227061796d656\
e745f616d6f756e7473223a2022312e3335393631393331222c202270726f706f73616c5f6861\
73686573223a20223836333966636464653131626432373032373663396330333564366435346\
3653962393138323465366466373532636164376464646331616532663734386435222c202274\
797065223a20327d
```

Result (wrapped):
``` json
{
  "event_block_height": 119592,
  "payment_addresses": "yThmnuVZ1geQnywoEaGbpy33biT5G5sXzb",
  "payment_amounts": "1.35961931",
  "proposal_hashes": "8639fcdde11bd270276c9c035d6d54ce9b91824e6df752cad7dddc1ae2f748d5",
  "type": 2
}
```

## GObject Count

The `gobject count` RPC returns the count of governance objects and votes.

*Parameter #1---mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Optional<br>(exactly 1) | Result return format:<br>`json` (default)<br>`all` - Default before Dash Core 0.12.3 (for backwards compatibility)

**Command Mode - `json`**

*Result---count of governance objects and votes*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>`objects_total` | int | Required<br>(exactly 1) | Total object count
→<br>`proposals` | int | Required<br>(exactly 1) | Proposal count
→<br>`triggers` | int | Required<br>(exactly 1) | Trigger count
→<br>`other` | int | Required<br>(exactly 1) | Non-proposal/trigger count
→<br>`erased` | int | Required<br>(exactly 1) | Erased count
→<br>`votes` | int | Required<br>(exactly 1) | Vote count

*Example from Dash Core 0.14.0 (mode: `json`/default)*

``` bash
dash-cli -testnet gobject count
```

Result (wrapped):
``` json
{
  "objects_total": 3,
  "proposals": 3,
  "triggers": 0,
  "other": 0,
  "erased": 4,
  "votes": 18
}
```

**Command Mode - `all`**

*Result---count of governance objects and votes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The count of governance objects and votes

*Example from Dash Core 0.14.0 (mode: `all`)*

``` bash
dash-cli -testnet gobject count all
```

Result (wrapped):
``` text
Governance Objects: 177 (Proposals: 177, Triggers: 0, Other: 0; Erased: 5), \
Votes: 9680
```

## GObject Get

The `gobject get` RPC returns a governance object by hash.

*Parameter #1---object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | The hash of a governance object

*Result---governance object details*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>`DataHex` | string (hex) | Required<br>(exactly 1) | Governance object info as hex string
→<br>`DataString` | string | Required<br>(exactly 1) | Governance object info as string
→<br>`Hash` | string (hex) | Required<br>(exactly 1) | Hash of this governance object
→<br>`CollateralHash` | string (hex) | Required<br>(exactly 1) | Hash of the collateral payment transaction
→<br>`ObjectType` | number | Required<br>(exactly 1) | Object types:<br>`1` - Unknown<br>`2` - Proposal<br>`3` - Trigger
→<br>`CreationTime` | number | Required<br>(exactly 1) | Object creation time as Unix epoch time
→<br>`FundingResult` | object | Required<br>(exactly 1) | Funding vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`ValidResult` | object | Required<br>(exactly 1) | Object validity vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`DeleteResult` | object | Required<br>(exactly 1) | Delete vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`EndorsedResult` | object | Required<br>(exactly 1) | Endorsed vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`fLocalValidity` | boolean | Required<br>(exactly 1) | Valid by the blockchain
→<br>`IsValidReason` | string | Required<br>(exactly 1) | `fLocalValidity` error result. Empty if no error returned.
→<br>`fCachedValid` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as a valid and understood governance object (e.g, the serialized data is correct format, etc)
→<br>`fCachedFunding` | boolean | Required<br>(exactly 1) | Minimum network support has been reached for this object to be funded (doesn't mean it will be for sure though)
→<br>`fCachedDelete` | boolean | Required<br>(exactly 1) | Minimum network support has been reached saying this object should be deleted from the system entirely
→<br>`fCachedEndorsed` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as endorsed

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject get \
	42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff
```

Result (wrapped):
``` json
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
```

## GObject Getvotes

{{WARNING}} **_Removed in Dash Core 0.14.0._**

## GObject Getcurrentvotes

The `gobject getcurrentvotes` RPC gets only current (tallying) votes for a governance object hash (does not include old votes).

*Parameter #1---object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | The hash of a governance object

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>Vote Info | string | Required<br>(1 or more) | Key: vote-hash<br><br>Value: vinMasternode, time, outcome, and signal of the vote

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject getcurrentvotes 78941af577f639ac94440e4855a1ed8f\
  696f1506d1c0bed4f4b68f05be26d3ca
```

Result (truncated):
``` json
{
  "174aaba65982d25a23f437e2a66ec3836146ba7b7ce5b3fe2d5476907f7079d9": "2eab488e3a7b030303de0d18e357ce17a9fc6b8876705d61076bbe923b2e5fc8-1:1509354047:YES:DELETE",
  "444d4d871ec35479804f060c733f516908382642ec2dfce6044a59fcadfdcd60": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1508866932:YES:FUNDING",
  "d49a472c62e9d8105931829fc50ef6c6ce04a230507646ee0eaa615e863ef3a0": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1509117071:YES:DELETE",
  "78442507441d4524d2493b8568d130415c1eb394adb2fe38d6ffeb199115bc5d": "3df7fb192e21c34da99bdd10c34e58ecaf3f3c37d6b2289f0ffedba5050188cc-1:1509312524:YES:DELETE",
  "aa4dc9d3b9e74e8c1ffc725b737d07f8a32e43c64907e4bea19e64a86135f08a": "af9f5646ace92f76b3a01b0abe08716a0a7ded64074c2d2e712c93174b9013d1-1:1508866932:YES:FUNDING",
}
```

## GObject List

The `gobject list` RPC Lists governance objects (can be filtered by signal and/or object type).

*Parameter #1---signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `valid`<br>• `funding`<br>• `delete`<br>• `endorsed`<br>• `all` (_DEFAULT_)

*Parameter #2---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `proposals`<br>• `triggers`<br>• `all` (_DEFAULT_)

*Result---governance objects*

{{INCLUDE_GOVERNANCE_OBJECT}}

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject list all proposals
```

Result (truncated):
``` json
{
  "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343430303338222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530393636222c227061796d656e745f61646472657373223a2279544c636f506d4e315963654432534345474d6b6e34395753565a4277626f646e6e222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530393636222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530393636227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507440038\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250966\",\"payment_address\":\"yTLcoPmN1YceD2SCEGMkn49WSVZBwbodnn\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250966\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250966\"}]]",
    "Hash": "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe",
    "CollateralHash": "a51ea89c14735f8b5df37cd846b3561494cc616d4a741e4ef83b368d45c960ba",
    "ObjectType": 1,
    "CreationTime": 1507250966,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  },
  "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343534383935222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323635383233222c227061796d656e745f61646472657373223a2279664e68484c4c695936577a5a646a51766137324a64395134313468516578514c68222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323635383233222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323635383233227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507454895\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507265823\",\"payment_address\":\"yfNhHLLiY6WzZdjQva72Jd9Q414hQexQLh\",\"payment_amount\":\"2\",\"start_epoch\":\"1507265823\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507265823\"}]]",
    "Hash": "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff",
    "CollateralHash": "1707470c4372ba048b72945365b4bb71afc8a986e0755c1f1e8a37bba21fde83",
    "ObjectType": 1,
    "CreationTime": 1507265823,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  }
}
```

## GObject Diff

The `gobject diff` RPC Lists governance objects differences since last diff.

*Parameter #1---signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `valid`<br>• `funding`<br>• `delete`<br>• `endorsed`<br>• `all` (_DEFAULT_)

*Parameter #2---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `proposals`<br>• `triggers`<br>• `all` (_DEFAULT_)

*Result---governance objects*

{{INCLUDE_GOVERNANCE_OBJECT}}

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject diff all all
```

Result (truncated):
``` json
{
  "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343533353731222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323634343939222c227061796d656e745f61646472657373223a2279697355653636445352487048504233514245426764574746637068435933626234222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323634343939222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323634343939227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507453571\",\"name\":\"testproposal\",\"payment_address\":\"yisUe66DSRHpHPB3QBEBgdWGFcphCY3bb4\",\"payment_amount\":\"2\",\"start_epoch\":\"1507264499\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507264499\"}]]",
    "Hash": "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301",
    "CollateralHash": "a25c44b57931afd74530ce39741f91456446a8fd794d2f1c58c42d6f492647ad",
    "ObjectType": 1,
    "CreationTime": 1507264499,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  }
}
```

## GObject Vote-alias

The `gobject vote-alias` RPC votes on a governance object by masternode alias (using masternode.conf setup).

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #4---masternode alias*

Name | Type | Presence | Description
--- | --- | --- | ---
`alias` | string | Required<br>(exactly 1) | Alias of voting masternode

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>Masternode Alias | object | Required<br>(1 or more) | Name of the masternode alias
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-alias \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b \
funding yes MN01
```

Result:
``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "MN01": {
      "result": "success"
    }
  }
}
```

## GObject Vote-conf

The `gobject vote-conf` RPC votes on a governance object by masternode configured in dash.conf.

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>`dash.conf` | object | Required<br>(1 or more) |
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-conf \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes
```

``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "dash.conf": {
      "result": "success"
    }
  }
}
```

## GObject Vote-many

The `gobject vote-many` RPC votes on a governance object by all masternodes (using masternode.conf setup).

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #4---masternode alias*

Name | Type | Presence | Description
--- | --- | --- | ---
`alias` | string | Required<br>(exactly 1) | Alias of voting masternode

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>Masternode Alias | object | Required<br>(1 or more) | Name of the masternode alias
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-many \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes
```

``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "MN01": {
      "result": "success"
    }
  }
}
```

*See also:*

* [GetGovernanceInfo](/docs/core-api-ref-remote-procedure-calls-dash#section-getgovernanceinfo): returns an object containing governance parameters.
* [GetSuperblockBudget](/docs/core-api-ref-remote-procedure-calls-dash#section-getsuperblockbudget): returns the absolute maximum sum of superblock payments allowed.

# Masternode

The `masternode` RPC provides a set of commands for managing masternodes and displaying information about them.

## Masternode Count

The `masternode count` RPC prints the number of all known masternodes.

*Parameter #1---mode*

Name | Type | Presence | Description
--- | --- | --- | ---
Mode | string (hex) | Deprecated | Which masternodes to count:<br>`total` - Pre-0.12.3 default result,<br>`ps` - PrivateSend capable,<br>`enabled` - Enabled,<br>`all` - All,<br>`qualify` - Eligible for payment

*Result---number of known masternodes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Masternode count by mode
→<br>`total` | int | Required<br>(exactly 1) | Count of all masternodes
→<br>`enabled` | int | Required<br>(exactly 1) | Count of enabled masternodes

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode count
```

Result:
``` bash
{
  "total": 185,
  "enabled": 130
}
```

**Get summarized count of all masternodes**

*Result---summary of known masternodes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Summary of masternodes in each state

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode count all
```

Result:
``` bash
Total: 185 (Enabled: 130)
```

**Get total count of all masternodes (default output of `masternode count` pre-0.12.3)**

*Result---number of known masternodes in mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | int | Required<br>(exactly 1) | Number of masternodes

*Example from Dash Core 0.12.3*

``` bash
dash-cli -testnet masternode count total
```

Result:
``` bash
142
```

## Masternode Current

The `masternode current` RPC prints info on current masternode winner to be paid the next block (calculated locally).

*Parameters: none*

*Result---current winning masternode info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>`height` | int | Required<br>(exactly 1) | Block height
→<br>`IP:port` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`payee` | string | Required<br>(exactly 1) | Payee address

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode current
```

Result:
``` json
{
  "height": 76179,
  "IP:port": "34.242.53.163:26155",
  "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d",
  "outpoint": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d-1",
  "payee": "yZnU7YJJgGQKvKPQFqXJ4k4DGSsRMhgLXx"
}
```

## Masternode Outputs

The `masternode outputs` RPC prints masternode compatible outputs.

*Parameters: none*

*Result---masternode outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Masternode compatible outputs
→<br>Output | string | Required<br>(1 or more) | Masternode compatible output (TXID:Index)

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternode outputs
```

Result:
``` json
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f": "1"
}
```

## Masternode Status

The `masternode status` RPC prints masternode status information.

*Parameters: none*

*Result---masternode status info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Masternode status info
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`service` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The masternode's ProRegTx hash
→<br>`collateralHash` | string (hex) | Required<br>(exactly 1) | The masternode's collateral hash
→<br>`collateralIndex` | int | Required<br>(exactly 1) | Index of the collateral
→<br>`dmnState` | object | Required<br>(exactly 1) | Deterministic Masternode State
→ →<br>`service` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→ →<br>`registeredHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was registered
→ →<br>`lastPaidHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last paid
→ →<br>`PoSePenalty` | int | Required<br>(exactly 1) | Current proof-of-service penalty
→ →<br>`PoSeRevivedHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last revived from a PoSe ban
→ →<br>`PoSeBanHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last PoSe banned
→ →<br>`revocationReason` | int | Required<br>(exactly 1) | Reason code for of masternode operator key revocation
→ →<br>`ownerAddress` | string | Required<br>(exactly 1) | The owner address
→ →<br>`votingAddress` | string | Required<br>(exactly 1) | The voting address
→ →<br>`payoutAddress` | string | Required<br>(exactly 1) | The payout address
→ →<br>`pubKeyOperator` | string | Required<br>(exactly 1) | The operator public key
→ →<br>`operatorPayoutAddress` | string | Optional<br>(0 or 1) | The operator payout address
→<br>`status` | string | Required<br>(1 or more) | The masternode's status

*Example from Dash Core 0.13.2*

``` bash
dash-cli -testnet masternode status
```

Result:
``` json
{
  "outpoint": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357-0",
  "service": "45.32.237.76:19999",
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "collateralHash": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357",
  "collateralIndex": 0,
  "dmnState": {
    "service": "45.32.237.76:19999",
    "registeredHeight": 7402,
    "lastPaidHeight": 59721,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": 61915,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "yT8DDY5NkX4ZtBkUVz7y1RgzbakCnMPogh",
    "votingAddress": "yMLrhooXyJtpV3R2ncsxvkrh6wRennNPoG",
    "payoutAddress": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
    "pubKeyOperator": "02a2e2673109a5e204f8a82baf628bb5f09a8dfc671859e84d2661cae03e6c6e198a037e968253e94cd099d07b98e94e"
  },
  "state": "READY",
  "status": "Ready"
}
```

## Masternode List

The `masternode list` prints a list of all known masternodes.

This RPC uses the same parameters and returns the same data as
[masternodelist](/docs/core-api-ref-remote-procedure-calls-dash#section-masternodelist). Please reference it for full details.

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternode list \
	rank f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f
```

Result:
``` json
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1": 11
}
```

## Masternode Winner

The `masternode winner` RPC prints info on the next masternode winner to vote for.

*Parameters: none*

*Result---next masternode winner info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>`height` | int | Required<br>(exactly 1) | Block height
→<br>`IP:port` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`payee` | string | Required<br>(exactly 1) | Payee address

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode winner
```

Result:
``` json
{
  "height": 76191,
  "IP:port": "34.242.53.163:26173",
  "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f",
  "outpoint": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f-1",
  "payee": "yhp182AnF7gUAyHiWgSbDrKqHKt2dzhoyW"
}
```

## Masternode Winners

The `masternode winners` RPC prints the list of masternode winners.

By default, the 10 previous block winners, the current block winner, and the
next 20 block winners are displayed. More past block winners can be requested
via the optional `count` parameter.

*Parameter #1---count*

Name | Type | Presence | Description
--- | --- | --- | ---
Count | string (hex) | Optional<br>(exactly 1) | Number of previous block winners to display (default: 10)

*Parameter #2---filter*

Name | Type | Presence | Description
--- | --- | --- | ---
Filter | string | Optional<br>(exactly 1) | Payment address to filter by

*Result---masternode winners*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>Masternode Winner | int | Required<br>(exactly 1) | Key: Block height<br>Value: payee address

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternode winners
```

Result (current block - 37458):
``` json
{
  "37448": "ygSWwhyzU61FNEta8gDh8gfoH5EZZUvc5m:8",
  "37449": "yjGZLzSSoFfTFgLDJrgniXfYxu3xF9xKQg:5",
  "37450": "yRTo1wXWoNnPFWcQVepKGXuLsoypnPkGWj:7",
  "37451": "yYMFRAYZ25XspHZ1EXC39wUMx9FhoC5VT2:9",
  "37452": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v:7",
  "37453": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v:4",
  "37454": "yUamtYUFhqUxCMny3JTcZJTyttVt8SYFug:9",
  "37455": "yU35XcdGMnj8Exa2ZZqCg4ongiNqQwpeUZ:9",
  "37456": "yaJc6tADbEjxQBAC69ugWNoTFpzxqkcgWd:7",
  "37457": "yf4WpwRX17p7YRkHJPQpHMXTwzi5s2VDcR:7",
  "37458": "ydbfUYWfLm6xg7Y5aBLjy38DvksrvNcHEc:9",
  "37459": "yYp9k2iuDptT2MB7qVZtVy6ModHtLXFjio:6",
  "37460": "yP1UHNx26ShYLej56SbHiTiPAUv2QppbUv:6",
  "37461": "yaCtZRpiYnVFMyWELHZF74v9ayLKCLPcC9:8",
  "37462": "ygYFnLHoVRyhRoxd6fXQ9nmEafX4eLoWkB:6",
  "37463": "yM5kTThWi8MnAFtZqx98Zipp1BbyypUZGK:7",
  "37464": "yeDY39aiqbBHbJft5F6rokR23EaZca6UTU:9",
  "37465": "yMME1ns1xfpGS2XbFPktsNyp7Cjr1BoJxb:8",
  "37466": "ycn5RWc4Ruo35FTS8bJwugVyCEkfVcrw9a:6",
  "37467": "yUTDkKKhbvDrnwkiaoP8HvqxTNC6rNnUe2:6",
  "37468": "yTstes2nSaSpvu9nTapiCGnjCLvLD5fUqt:5",
  "37469": "Unknown",
  "37470": "Unknown",
  "37471": "Unknown",
  "37472": "Unknown",
  "37473": "Unknown",
  "37474": "Unknown",
  "37475": "Unknown",
  "37476": "Unknown",
  "37477": "Unknown"
}
```

Get a filtered list of masternode winners

``` bash
dash-cli -testnet masternode winners 150 "yTZ99"
```

Result:
``` json
{
  "37338": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:9",
  "37339": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:8",
  "37432": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:6",
  "37433": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM:9"
}
```

**Deprecated RPCs**

![Warning icon](https://dash-docs.github.io/img/icons/icon_warning.svg) The following RPCs were deprecated by Dash Core 0.14.0

**Masternode Check**

Forces a check of all masternodes and removes invalid ones.

**Masternode Genkey**

Generates a new masternodeprivkey.

**Masternode Start-alias**

Starts a single remote masternode by assigned alias configured in masternode.conf.

**Masternode Start-mode**

Starts remote masternodes configured in masternode.conf. Valid modes are: `all`, `missing`, or `disabled`.

**Masternode List-conf**

Prints masternode.conf in JSON format.

*See also:*

* [MasternodeList](/docs/core-api-ref-remote-procedure-calls-dash#section-masternodelist): returns a list of masternodes in different modes.

# MasternodeList

The `masternodelist` RPC returns a list of masternodes in different modes.

*Parameter #1---List mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Optional (exactly 1);<br>Required to use `filter` | The mode to run list in

*Mode Options (Default=json)*

Mode | Description
--- | --- | --- |
`addr` | Print IP address associated with a masternode (can be additionally filtered, partial match)
`full` | Print info in format 'status payee lastpaidtime lastpaidblock IP' (can be additionally filtered, partial match)
`info` | Print info in format 'status payee IP' (can be additionally filtered, partial match)
`json` (Default) | Print info in JSON format (can be additionally filtered, partial match)
`lastpaidblock` | Print the last block height a node was paid on the network
`lastpaidtime` | Print the last time a node was paid on the network
`owneraddress` | Print the masternode owner Dash address
`payee` | Print Dash address associated with a masternode (can be additionally filtered, partial match)
`pubKeyOperator` | Print the masternode operator public key
`status` | Print masternode status: ENABLED / POSE_BANNED (can be additionally filtered, partial match)
`votingaddress` | Print the masternode voting Dash address

*Parameter #2---List filter*

Name | Type | Presence | Description
--- | --- | --- | ---
`filter` | string | Optional<br>(exactly 1) | Filter results. Partial match by outpoint by default in all modes, additional matches in some modes are also available.

*Result---the masternode list*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the masternode sync status
→<br>Masternode Info | string | Required<br>(1 or more) | The requested masternode info. Output varies based on selected `mode` and `filter` parameters

*Example from Dash Core 0.14.0*

Get unfiltered Masternode list in default mode

``` bash
dash-cli -testnet masternodelist
```

Result:
``` json
{
  "64fbf05880cdbd35a0278ba01a5edf0c20a9c756d15f883d496f5df35b31b542-1": {
    "proTxHash": "ab51b2ba4dca27658e13fea81c0764167c1466aa2d92050c67e4490ce7623da0",
    "address": "167.99.164.60:19999",
    "payee": "ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX",
    "status": "ENABLED",
    "lastpaidtime": 1556615121,
    "lastpaidblock": 89725,
    "owneraddress": "yisedvAxYga44V9bTABzoQ7KoQMugyfU1E",
    "votingaddress": "yVpKfQgjkRkezFS5SpZvAEVFsbv9zJedf4",
    "collateraladdress": "yeXE94admJeH3oKiaB7UpwWnPZD6Q8srhT",
    "pubkeyoperator": "8072ac9a55d1cf5bf9c4262d49e2ef1ffcd716b8983ffdc62b940fec6cb4179d6275f8b68316f29c6c2ad540db329258"
  },
  "6ed4aa5fa90565c2331bcd22275f684ecdca5da8dd7f83ca943aadc6f44e6746-0": {
    "proTxHash": "8f5d5c7c0d9232f45f3a77eef6541922f827930b1f3bb789ad1771dc4d6275c0",
    "address": "3.209.222.37:19999",
    "payee": "yiVDR2HothEwH2Ss17GntqNp1rBUthnyje",
    "status": "POSE_BANNED",
    "lastpaidtime": 1554219432,
    "lastpaidblock": 72365,
    "owneraddress": "ycAZ9adjpGfZ2WLEpyfyUWAjkF6sXdD5df",
    "votingaddress": "yQrieR9S99hqnPghoj12RszMXYzc6yzyn2",
    "collateraladdress": "ya82BzRBhuFZAPhgXvhkzZgqiVsMdnfan7",
    "pubkeyoperator": "0a7fd01cfd502296cfd523d58ee9f4cff34243abb0dcc543ec237ff4d73938e69d187f0b6838bbaf9d54b89adc0d4c8e"
  },
  "4758b97bbd20024e171767b8baf4290bec1475b254180869cdfe0db75d7faefb-0": {
    "proTxHash": "5cd86ed16f87819dca7b6e4e3d24947b1a6328ed8cc4c9aec7af35fa2b162220",
    "address": "68.183.167.16:19999",
    "payee": "ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX",
    "status": "ENABLED",
    "lastpaidtime": 1556616437,
    "lastpaidblock": 89734,
    "owneraddress": "yPmESxMJhZYuKDLJ1oYdH6kpE8oADVAPUQ",
    "votingaddress": "yLvTNLDLHa3pDMbFDRBX5mVMjCshzrDD1X",
    "collateraladdress": "ydGCjUEVRHkQZK3ajCsGJGDE9sjrbbS56v",
    "pubkeyoperator": "18af4d035eed23d30eb02808af0c133d9879c0fb82c72329ab2ed208ebc1631641ca42bbf462239d151f4e84d8dcde7b"
  }
}
```

Get a filtered Masternode list

``` bash
dash-cli -testnet masternodelist full "NEW"
```

Result:
``` json
{
  "64fbf05880cdbd35a0278ba01a5edf0c20a9c756d15f883d496f5df35b31b542-1": "           ENABLED ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX 1553155206  65121 167.99.164.60:19999",
  "809818107c1104bbba6d386567aa231a294219387e591542df599b7ae7d23339-1": "       POSE_BANNED yLriZkwBhftk8VBUqrSykhFhAi4PowZ2Rs 1547488185  24447 45.48.177.222:19999",
  "d9fd715b7d896f5426e90bd3383a67fd3e311e00c021750560c6e5c5f9cdac85-1": "           ENABLED yRbiW3dguCym4fzUGZCf2kWzKUgw97zEqE 1553155396  65122 109.235.71.56:19999",
  "0950cce784fadcc2df4febb19d3a21eab4836ba22ea996ce7e2dde32b6c31431-0": "           ENABLED ycZgaHNb8AQq7HnJ3rTwx2fXUd7VCWQumX 1553154969  65119 165.227.63.223:19999",
  "08b493929f61a3205f09af9290af9034bec6a8355040a82ce4413f294c703e9a-0": "           ENABLED ybCE7m9oPjvCjm8MzPdbMBGgkF7p9wXsFq 1553153959  65110 34.207.45.58:19999",
  "b4f9de65ae676b63f84f2865317b8b512a12516c4459f2f59ca2626c71f7dda3-1": "       POSE_BANNED yYmromZERpc15GTDvgvjmjChPmgHbhWf1r          0      0 1.1.1.1:19999",
  "b7ec36db0c4ece8018183dcb90eed910e38e1c8d3641bbb4facced9a48a283a3-5": "           ENABLED ybFPBD7hm9KVd2Dubj97K5mw2ymR8gWJre 1553164088  65172 18.202.52.170:20028",
  "71fa05269adf3efc9ffa9a9ce33d27320de61c230cdf4a3835ba7f707bd7807a-1": "       POSE_BANNED yVxBZ8JeM5qRbLnUnswZ2APV3rgeZ7C9n9 1552466625  61158 167.99.110.59:19999"
}
```

*See also:*

* [Masternode](/docs/core-api-ref-remote-procedure-calls-dash#section-masternode): provides a set of commands for managing masternodes and displaying information about them.
* [MnSync](/docs/core-api-ref-remote-procedure-calls-dash#section-mnsync): returns the sync status, updates to the next step or resets it entirely.

# MnSync

The `mnsync` RPC returns the sync status, updates to the next step or resets it entirely.

*Parameter #1---Command mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`status` - Get masternode sync status<br>`next` - Move to next sync asset<br>`reset` - Reset sync status

**Command Mode - `status`**

*Result---the sync status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the masternode sync status
→<br>`AssetID` | number (int) | Required<br>(exactly 1) | The sync asset ID
→<br>`AssetName` | string | Required<br>(exactly 1) | The sync asset name
→<br>`AssetStartTime` | number (int) | Required<br>(exactly 1) | The sync asset start time
→<br>`Attempt` | number (int) | Required<br>(exactly 1) | The sync attempt number
→<br>`IsBlockchainSynced` | boolean | Required<br>(exactly 1) | Blockchain sync status
→<br>`IsSynced` | boolean | Required<br>(exactly 1) | Masternode sync status
→<br>`IsFailed` | boolean | Required<br>(exactly 1) | Masternode list sync fail status

Sync Assets

AssetID | AssetName
--- | --- | --- |
0 | MASTERNODE_SYNC_INITIAL
1 | MASTERNODE_SYNC_WAITING
_2_ | **Deprecated since 0.14.0**<br>_MASTERNODE_SYNC_LIST_
_3_ | **Deprecated since 0.14.0**<br>_MASTERNODE_SYNC_MNW_
4 | MASTERNODE_SYNC_GOVERNANCE
-1 | MASTERNODE_SYNC_FAILED
999 | MASTERNODE_SYNC_FINISHED

*Example from Dash Core 0.14.0*

Get Masternode sync status

``` bash
dash-cli -testnet mnsync status
```

Result:
``` json
{
  "AssetID": 999,
  "AssetName": "MASTERNODE_SYNC_FINISHED",
  "AssetStartTime": 1507662300,
  "Attempt": 0,
  "IsBlockchainSynced": true,
  "IsSynced": true,
  "IsFailed": false
}
```

**Command Mode - `next`**

*Result---next command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet mnsync next
```

Result:
``` text
sync updated to MASTERNODE_SYNC_GOVERNANCE
```

**Command Mode - `reset`**

*Result---reset command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status:<br>`success` or `failure`

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet mnsync reset
```

Result:
``` text
success
```

*See also:*

* [Masternode](/docs/core-api-ref-remote-procedure-calls-dash#section-masternode): provides a set of commands for managing masternodes and displaying information about them.
* [MasternodeList](/docs/core-api-ref-remote-procedure-calls-dash#section-masternodelist): returns a list of masternodes in different modes.

# PrivateSend

As of Dash Core 0.12.3, client-side mixing is not supported on masternodes.

The `privatesend` RPC controls the mixing process.

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`start` - Start mixing<br>`stop` - Stop mixing<br>`reset` - Reset mixing

**Command Mode - `start`**

*Result---start command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet privatesend start
```

Result:
``` text
Mixing started successfully
```

**Command Mode - `stop`**

*Result---stop command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet privatesend stop
```

Result:
``` text
Mixing was stopped
```

**Command Mode - `reset`**

*Result---reset command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet privatesend reset
```

Result:
``` text
Mixing was reset
```

*See also: none*

# Spork {#spork-rpc}

The `spork` RPC reads or updates spork settings on the network.

To display the status of sporks, use the `show` or `active` syntax.

*Parameter #1---Command mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`show` - Display spork values<br>`active` - Display spork activation status

**Command Mode - `show`**

*Result---spork values*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing status
→<br>`Spork Value` | int64_t | Required<br>(1 or more) | Spork value (epoch datetime to enable/disable)

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet spork show
```

Result:
``` json
{
  "SPORK_2_INSTANTSEND_ENABLED": 0,
  "SPORK_3_INSTANTSEND_BLOCK_FILTERING": 0,
  "SPORK_6_NEW_SIGS": 4000000000,
  "SPORK_9_SUPERBLOCKS_ENABLED": 0,
  "SPORK_15_DETERMINISTIC_MNS_ENABLED": 1047200,
  "SPORK_16_INSTANTSEND_AUTOLOCKS": 0,
  "SPORK_17_QUORUM_DKG_ENABLED": 0,
  "SPORK_19_CHAINLOCKS_ENABLED": 0,
  "SPORK_20_INSTANTSEND_LLMQ_BASED": 0
}
```

**Command Mode - `active`**

*Result---spork active status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing status
→<br>`Spork Activation Status` | bool | Required<br>(1 or more) | Spork activation status

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet spork active
```

Result:
``` json
{
  "SPORK_2_INSTANTSEND_ENABLED": true,
  "SPORK_3_INSTANTSEND_BLOCK_FILTERING": true,
  "SPORK_6_NEW_SIGS": false,
  "SPORK_9_SUPERBLOCKS_ENABLED": true,
  "SPORK_15_DETERMINISTIC_MNS_ENABLED": true,
  "SPORK_16_INSTANTSEND_AUTOLOCKS": true,
  "SPORK_17_QUORUM_DKG_ENABLED": true,
  "SPORK_19_CHAINLOCKS_ENABLED": true,
  "SPORK_20_INSTANTSEND_LLMQ_BASED": true
}
```

To update the state of a spork activation, use the `<name> [value]` syntax.

**Command Mode - `update`**

*Parameter #1---Spork name*

Name | Type | Presence | Description
--- | --- | --- | ---
`name` | string | Required<br>(exactly 1) | The name of the spork to update

*Parameter #2---Spork value*

Name | Type | Presence | Description
--- | --- | --- | ---
`value` | int | Required<br>(exactly 1) | The value to assign the spork

*Result---spork update status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Update status (`success` or `failure`)

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet spork SPORK_2_INSTANTSEND_ENABLED 0
```

Result:
``` bash
failure
```

*See also: none*

# VoteRaw

The `voteraw` RPC compiles and relays a governance vote with provided external signature instead of signing vote internally

*Parameter #1---masternode transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`masternode-tx-hash` | string (hex) | Required<br>(exactly 1) | Hash of the masternode collateral transaction

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`masternode-tx-index` | string | Required<br>(exactly 1) | Index of the masternode collateral transaction

*Parameter #3---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #4---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #5---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #6---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time

*Parameter #7---vote signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`vote-sig` | string (base64) | Required<br>(exactly 1) | The vote signature created by external application (i.e. [Dash Masternode Tool](https://github.com/Bertrand256/dash-masternode-tool) or [dashmnb](https://github.com/chaeplin/dashmnb)).<br><br>Must match the Dash Core ([governance vote signature format](https://github.com/dashpay/dash/blob/48d63ab296f5613c727306ea39524f51d157a04c/src/governance-vote.cpp#L240-#L241)).

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet voteraw \
f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f 1 \
65a358fefaace40fc07053350be23e519178519290f963dab8ba92f6f85f98c3 \
funding yes 1512507255 \
H1jXKZQp1TZWBPW11E665OwmGBYV1038FohEr0au7zp+O5BCKmVDP/3rGq38ZMy3KOpwnBu6ehd6jlas79hsRBY=
```

Result:
``` bash
Voted successfully
```

*See also:*

* [GObject](/docs/core-api-ref-remote-procedure-calls-dash#section-gobject): provides a set of commands for managing governance objects and displaying information about them.

>>>>>>>> Evolution RPCs

# BLS

*Added in Dash Core 0.13.0*

The `bls` RPC provides a set of commands to execute BLS-related actions.

## BLS Generate

The `bls generate` RPC creates a new BLS secret/public key pair.

*Parameters: none*

*Result---a secret/public key pair*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | BLS key pair
→<br>`secret` | string (hex) | Required<br>(exactly 1) | A BLS secret key
→<br>`public` | string (hex) | Required<br>(exactly 1) | A BLS public key

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet bls generate
```

Result:
``` json
{
  "secret": "52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144",
  "public": "885d01d746c3e4d2093b0975de2d8c1f3e5a2c3e8fdaaed929f86fc9fbb278a095248163c101a2456650b415776b7990"
}
```

## BLS FromSecret

The `bls fromsecret` RPC parses a BLS secret key and returns the secret/public key pair.

*Parameter #1---secret key*

Name | Type | Presence | Description
--- | --- | --- | ---
`secret` | string (hex) | Required<br>(exactly 1) | The BLS secret key

*Result---the secret/public key pair*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | BLS key pair
→<br>`secret` | string (hex) | Required<br>(exactly 1) | A BLS secret key
→<br>`public` | string (hex) | Required<br>(exactly 1) | A BLS public key

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet bls fromsecret 52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144
```

Result:
``` json
{
  "secret": "52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144",
  "public": "885d01d746c3e4d2093b0975de2d8c1f3e5a2c3e8fdaaed929f86fc9fbb278a095248163c101a2456650b415776b7990"
}
```

*See also: none*

# ProTx

*Added in Dash Core 0.13.0*

The `protx` RPC provides a set of commands to execute ProTx related actions.

## ProTx Register

The `protx register` RPC creates a ProRegTx referencing an existing collateral and and sends it to the network.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralHash` | string (hex) | Required<br>(exactly 1) | The collateral transaction hash

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralIndex` | string (hex) | Required<br>(exactly 1) | The collateral transaction output index

*Parameter #3---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards.

*Parameter #4---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #5---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #6---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #7---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator. If non-zero, `ipAndPort` must be zero as well.<br>The value must be between '0.00' and '100.00'.

*Parameter #8---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #9---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx register\
 8b2eab3413abb6e04d17d1defe2b71039ba6b6f72ea1e5dab29bb10e7b745948 1\
 2.3.4.5:2345 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6\
 88d719278eef605d9c19037366910b59bc28d437de4a8db4d76fda6d6985dbdf10404fb9bb5cd0e8c22f4a914a6c5566\
 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6 5 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
```

Result:
``` bash
61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929
```

## ProTx Register Fund

The `protx register_fund` RPC creates and funds a ProRegTx with the 1,000 DASH necessary for a masternode and then sends it to the network.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to send the collateral to

*Parameter #2---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards.

*Parameter #3---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #4---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #5---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #6---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator.<br>The value must be between '0.00' and '100.00'.

*Parameter #7---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #8---fund address*

Name | Type | Presence | Description
--- | --- | --- | ---
`fundAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx register_fund yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7\
 3.4.5.6:3456 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw\
 0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51\
 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw 5 yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7
```

Result:
``` bash
ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd
```

## ProTx Register Prepare

The `protx register_prepare` RPC creates an unsigned ProTx and
returns it. The ProTx must be signed externally with the collateral key and then
passed to "protx register_submit". The prepared transaction will also contain inputs
and outputs to cover fees.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralHash` | string (hex) | Required<br>(exactly 1) | The collateral transaction hash

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralIndex` | string (hex) | Required<br>(exactly 1) | The collateral transaction output index

*Parameter #3---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards.

*Parameter #4---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The owner key used for payee updates and proposal voting. The private key belonging to this address be known in your wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #5---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #6---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #7---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator.<br>The value must be between '0.00' and '100.00'.

*Parameter #8---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #9---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---unsigned transaction and message to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | JSON object containing an unsigned provider transaction and the message to be signed externally, or JSON `null` if an error occurred
→<br>`tx` | string (hex) | Required<br>(exactly 1) | The serialized ProRegTx in hex format
→<br>`collateralAddress` | string (hex) | Required<br>(exactly 1) | The collateral address
→<br>`signMessage` | string (base64) | Required<br>(exactly 1) | The string message that needs to be signed with the collateral key.

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx register_prepare\
 df41e398bb245e973340d434d386f431dbd69735a575721b0b6833856e7d31ec 1 \
 9.8.7.6:9876 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz\
 06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280c\
 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz 1.2 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
```

Result:
``` json
{
  "tx": "0300010001912b88876fee2f8e43e23b5e81276c163cf23d867bad4148170cb106ef9023700000000000feffffff0125623ba40b0000001976a914736e155c1039a269d4019c66219d2a18f0fee27588ac00000000d1010000000000ec317d6e8533680b1b7275a53597d6db31f486d334d44033975e24bb98e341df0100000000000000000000000000ffff090807062694ca6b243168b30461d1f19e2bb89a965a5bac067e06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280cca6b243168b30461d1f19e2bb89a965a5bac067e78001976a914fc136008111fcc7a05be6cec66f97568727a9e5188ace5f6b70ac55411727e25178bd417b9b03f837ad7155d90ad286f3a427203fb9f00",
  "collateralAddress": "yWuKWhDzGQqZL8rw6kGxGrfe6P8bUC2S4f",
  "signMessage": "yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt|120|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|69a49e18c1253b90d39322f7e2f7af74524401bc33a27645e697e74a214e3e1e"
}
```

## ProTx Register Submit

The `protx register_submit` RPC submits the specified ProTx to the
network. This command will also sign the inputs of the transaction which were
previously added by `protx register_prepare` to cover transaction fees.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`tx` | string (hex) | Required<br>(exactly 1) | The serialized transaction previously returned by `protx register_prepare`

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`sig` | string (base64) | Required<br>(exactly 1) | The signature signed with the collateral key. Must be in base64 format.

*Result---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx register_submit\
 03000100012d988526d5d1efd32320023c92eff09c2963dcb021b0de9761\
 17e5e37dc7a7870000000000feffffff015f603ba40b0000001976a9140c\
 37e07eb5c608961769e6506c23c11e9f9fe00988ac00000000d101000000\
 00002d988526d5d1efd32320023c92eff09c2963dcb021b0de976117e5e3\
 7dc7a7870100000000000000000000000000ffff05060708162e243dd366\
 bf4a329968d77eac9fb63481a600938d125e1b7cba03ca2a097e402185e6\
 160232ea53e6d62898a3be8617b06ff347d967543228bd9b605547c3d478\
 b0a838ca243dd366bf4a329968d77eac9fb63481a600938dc4091976a914\
 e9bf4e6f26fecf1dfc1e04dde43472df378628b888ac6a048e7f645e8adc\
 305ccfd8652066046a0702596af13b8ac97803ade256da2900\
 \
 H90IvqVtFjZkwLJb08yMEgGixs0/FpcdvwImBcir4cYLJhD3pdX+lKD2GsPl6KNxghVXNk5/HpOdBoWAHo9u++Y=
```

Result:
``` bash
273ce3ebe24183ee4117b10e054cdbb108a3bde5d2f286129e29480d46a3f573
```

## ProTx List

The `protx list` RPC returns a list of provider transactions.

Lists all ProTxs in your wallet or on-chain, depending on the given type. If
`type` is not specified, it defaults to `registered`. All types have the optional
argument `detailed` which if set to `true` will result in a detailed list being
returned. If set to `false`, only the hashes of the ProTx will be returned.

*Parameter #1---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string | Optional<br>(0 or 1) | The type of ProTxs to list:<br>`registered` - all ProTxs registered at height<br>`valid` - all active/valid ProTxs at height<br>`wallet` - all ProTxs found in the current wallet<br><br>Height defaults to current chain-tip if one is not provided

*Parameter #2---detailed*

Name | Type | Presence | Description
--- | --- | --- | ---
`detailed` | bool | Optional<br>(0 or 1) | If set to `false` (default), only ProTx hashes are returned. If set to `true`, a detailed list of ProTx details is returned.

*Parameter #3---height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | bool | Optional<br>(0 or 1) | List ProTxs from this height (default: current chain tip).

*Result (if `detailed` was `false`)---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex): array | Required<br>(exactly 1) | Array of provider transaction (ProTx) hashes

*Result (if `detailed` was `true`)---JSON provider registration transaction details*

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred

  {{INCLUDE_PROTX}}

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet protx list
```

Result:
``` json
[
  "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2",
  "61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929",
  "ca193751f3cbed2aa4f1b33b0acc48c7ed8b9a3679858d69cf23157a4f545176",
  "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"
]
```

List of ProTxs which are active/valid at the given chain height.

``` bash
dash-cli -testnet protx list valid false 700
```

Result:
``` json
[
  "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2"
]
```

Detailed list of ProTxs which are active/valid at the given chain height.

``` bash
dash-cli -testnet protx list valid true 700
```

Result:
``` json
[
  {
    "proTxHash": "c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f",
    "collateralHash": "e3270ff48c4b802d56ee58d3d53777f7f9c289964e4df0842518075fc81345b1",
    "collateralIndex": 3,
    "collateralAddress": "yYpzTXjVx7A5uohsmW8sRy7TJp4tihVuZg",
    "operatorReward": 0,
    "state": {
      "service": "1.2.3.4:1234",
      "registeredHeight": 7090,
      "lastPaidHeight": 0,
      "PoSePenalty": 0,
      "PoSeRevivedHeight": -1,
      "PoSeBanHeight": -1,
      "revocationReason": 0,
      "ownerAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "votingAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "payoutAddress": "yU3UdrmS6KpWwBDLQTkp1KjXePwWsMbYdj",
      "pubKeyOperator": "8700add55a28ef22ec042a2f28e25fb4ef04b3024a7c56ad7eed4aebc736f312d18f355370dfb6a5fec9258f464b227e"
    },
    "confirmations": 1,
    "wallet": {
      "hasOwnerKey": false,
      "hasOperatorKey": false,
      "hasVotingKey": false,
      "ownsCollateral": false,
      "ownsPayeeScript": false,
      "ownsOperatorRewardScript": false
    }
  }
]
```

## ProTx Info

The `protx info` RPC returns detailed information about a deterministic masternode.

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An JSON object containing a provider transaction, or JSON `null` if an error occurred

  {{INCLUDE_PROTX}}

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet protx info\
 2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2
```

Result:
``` json
{
  "proTxHash": "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2",
  "collateralHash": "8d23d08ee6e2e0577550c90afde9bc63745f734605724ba9908e0220c48dec04",
  "collateralIndex": 1,
  "collateralAddress": "ygp7ZJGQZsVvuU11shixkNZSq9Uw4QrdWj",
  "operatorReward": 5,
  "state": {
    "service": "54.149.207.193:19999",
    "registeredHeight": 683,
    "lastPaidHeight": 785,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": -1,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "ycdU6EyVggw4RaW3EKPHCMBeT6vzRDXgbJ",
    "votingAddress": "ycdU6EyVggw4RaW3EKPHCMBeT6vzRDXgbJ",
    "payoutAddress": "yXsKagNKcHkE2eUKQe8Sf2Z32SKrmQ6XEJ",
    "pubKeyOperator": "8ad9500ef26ae510e0dd8cf0568b2a89d1234697873db2fcdd11674a73caba91cd416f9ac701f4f7807d8db102bc4a39"
  },
  "confirmations": 192,
  "wallet": {
    "hasOwnerKey": true,
    "hasOperatorKey": false,
    "hasVotingKey": true,
    "ownsCollateral": true,
    "ownsPayeeScript": true,
    "ownsOperatorRewardScript": false
  }
}
```

## ProTx Update Service

The `protx update_service` RPC creates and sends a ProUpServTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.

*Parameter #3---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #4---operator payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPayoutAddress` | string (hex) | Optional<br>(0 or 1) | The Dash address used for operator reward payments. Only allowed when the ProRegTx had a non-zero `operatorReward` value. If set to an empty string, the currently active payout address is reused.

*Parameter #5---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `operatorPayoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update service transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update service transaction (ProUpServTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx update_service\
 ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd\
 "4.3.2.1:4321"\
 4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1
```

Result:
``` bash
5b6cfa1bdd3c8b7e0b9550b9c4e809381f81a410bc7f241d3879dd736fd51270
```

## ProTx Update Registrar

The `protx update_registrar` RPC creates and sends a ProUpRegTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode. If set to an empty string, the last on-chain operator key of the masternode will be used.

*Parameter #3---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #4---operator payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string (hex) | Optional<br>(0 or 1) | The Dash address to use for masternode reward payments. If set to an empty string, the last on-chain payout address of the masternode will be used.

*Parameter #5---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update registrar transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update registrar transaction (ProUpRegTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx update_registrar\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51"\
 "yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw" "yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7"
```

Result:
``` bash
702390ef06b10c174841ad7b863df23c166c27815e3be2438e2fee6f87882b91
```

## ProTx Revoke

The `protx revoke` RPC creates and sends a ProUpRevTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---operator private key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator private key belonging to the registered operator public key.

*Parameter #3---reason*

Name | Type | Presence | Description
--- | --- | --- | ---
`reason` | number | Required<br>(exactly 1) | The reason for revocation.

*Parameter #4---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update revoke transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update revoke transaction (ProUpRevTx) hash

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet protx revoke\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1"
```

Result:
``` bash
2aad36dd2ab254bee06b0b5dad51e7603691b72058d5806fd94e1d2d19a7c209
```

## ProTx Diff

The `protx diff` RPC calculates a diff and a proof between two masternode list.

*Parameter #1---start block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`baseBlock` | number (int) | Required<br>(Exactly 1) |

*Parameter #2---end block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`block` | bool | Required<br>(Exactly 1) |

*Result---JSON provider registration transaction details*

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred
→<br>`baseBlockHash` | string (hex) | Required<br>(exactly 1) | The hash of the base block as hex in RPC byte order
→<br>`blockHash` | string (hex) | Required<br>(exactly 1) | The hash of the ending block as hex in RPC byte order
→<br>`cbTxMerkleTree` | string (hex) | Required<br>(exactly 1) | The coinbase transaction merkle tree
→<br>`cbTx` | string (hex) | Required<br>(exactly 1) | The coinbase transaction
→<br>`deletedMNs` | array | Required<br>(exactly 1) | An array of deleted masternode hashes
→<br>`mnlist` | array | Required<br>(exactly 1) | An array of masternode details
→ →<br>`proRegTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the initial provider registration transaction as hex in RPC byte order
→ →<br>`confirmedHash` | string (hex) | Required<br>(exactly 1) | The hash of the block where the ProRegTx was mined
→ →<br>`service` | string | Required<br>(exactly 1) | The IP address/Port of the masternode
→ →<br>`pubKeyOperator` | string (hex) | Required<br>(exactly 1) | The operator public key
→ →<br>`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address
→ →<br>`isValid` | bool | Required<br>(exactly 1) | Set to `true` if masternode is valid
→<br>`deletedQuorums` | array | Required<br>(exactly 1) | An array of deleted quorums
→ →<br>`llmqType` | number | Required<br>(exactly 1) | The quorum type
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→<br>`newQuorums` | array | Required<br>(exactly 1) | An array of new quorums
→ →<br>`version` | number | Required<br>(exactly 1) | The quorum version
→ →<br>`llmqType` | number | Required<br>(exactly 1) | The quorum type
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→ →<br>`signersCount` | number | Required<br>(exactly 1) | The number of signers for the quorum
→ →<br>`validMembersCount` | number | Required<br>(exactly 1) | The number of valid members in the quorum
→ →<br>`quorumPublicKey` | string (hex) | Required<br>(exactly 1) | The public key of the quorum
→<br>`merkleRootMNList` | string (hex) | Required<br>(exactly 1) | Merkle root of the masternode list
→<br>`merkleRootQuorums` | string (hex) | Required<br>(exactly 1) | *Added in Coinbase Transaction version 2 (Dash Core 0.14.0)*<br><br>Merkle root of the masternode list

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet protx diff 75000 76000
```

Result (truncated):
``` json
{
  "baseBlockHash": "0000000003deb00bba101ee581cdc4e1cbd1243ec5cd190472ae93eff07c8881",
  "blockHash": "0000000000c0279636003ed0042c9a454b4c39e9a6c49bb92d420e0bf4e0f49b",
  "cbTxMerkleTree": "01000000015ef8245e2a381174f5e2cc701d5d067d9f16945179380a3ce54415114426eb510101",
  "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff4c03e02801043619ab5c08fabe6d6d736170747365743a7265737574736574d6e48c2ebd4e147373617074736574730100000000000000380000ae250000000d2f6e6f64655374726174756d2f000000000340230e43000000001976a914cb594917ad4e5849688ec63f29a0f7f3badb5da688ac4cfe1c3e000000001976a91470da282ad16926e127064b7d3d787d7f3793014788acf424f104000000001976a914312d9ccd4e73f2e66006e45701bce17125ba681e88ac00000000260100e0280100d26df127ba2765c8f098ab71199c82c59509418efe26cdf02f7c92ce738e2247",
  "deletedMNs": [
  ],
  "mnList": [
    {
      "proRegTxHash": "fef106ff6420f9c6638c9676988a8fc655750caafb506c98cb5ff3d4fea99a41",
      "confirmedHash": "0000000005d5635228f113b50fb5ad66995a7476ed20374e6e159f1f9e62347b",
      "service": "45.48.177.222:19999",
      "pubKeyOperator": "842476e8d82327adfb9b617a7ac3f62868946c0c4b6b0e365747cfb8825b8b79ba0eb1fa62e8583ae7102f59bf70c7c7",
      "votingAddress": "yf7QHemCfbmKEncwZxroTj8JtShXsC28V6",
      "isValid": true
    },
    {
      "proRegTxHash": "7d56a2cf814b344f54ac4b6485a7a5b2b5a439ea796defff67f2a5872c9df5c3",
      "confirmedHash": "00000c66555eea6272e5c7bcdb2648e1a63fd5b23a6d1d4c3f9dc5df43c6a5a8",
      "service": "178.151.192.107:19999",
      "pubKeyOperator": "8631b1ba19ed23fdab61db7a81c9aa1356eaf37d0a29a14cc493e2f863080bf909b4d3e23d536be1d18e4c842566ed67",
      "votingAddress": "yP2LXCZTVVjBFQiN2bhghQvNwdUQG8NMX8",
      "isValid": true
    },
    {
      "proRegTxHash": "be32ec53dbbfb64e5ba29e25e3716f6f4024291914ce4c858cd69f0b4e371dda",
      "confirmedHash": "0000000015717296254a7c6139a50c34ad481dc8fdf7b0ea4c8320dc3fff2759",
      "service": "173.61.30.231:19025",
      "pubKeyOperator": "86ce02e551a46f1ca9a734104b4e387984d733ba99930eb677aae126fa142f201049842422ab2f105e3c9805f1bd54e8",
      "votingAddress": "ySBU7oXuuTSJqtmUArMRFsKefJPtEDkESG",
      "isValid": false
    }
  ],
  "deletedQuorums": [
    {
      "llmqType": 1,
      "quorumHash": "00000000052b95b036c87f82d19878f69bf940e6acf9f03cd818bd07a5686d0e"
    },
    {
      "llmqType": 1,
      "quorumHash": "0000000000e8b557ea26921f4bb143e961dd35209cf8c1c7b73397322c1a5018"
    },
    {
      "llmqType": 1,
      "quorumHash": "000000000b259f422fe3b647b8f1553b846d95dc8c79699d60e48a81dcf14747"
    },
    {
      "llmqType": 1,
      "quorumHash": "00000000143365adb3c3de6a35ae247120df8ca53a61afd82cd6fd4126ca8a4d"
    }
  ],
  "newQuorums": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000001427858db64213ed3ef32ffb2546ca7f2a096adbefc197437b90612",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "922e3683358f09a2619efb9e8329f90d5a8a608a18e26db212613ef7f95818eb6f68372fb313edbf96fdd2cdee20a66d"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000148a6fced08763f3f31dd68a3d88d2d4f2d48eef44eb9311de66129",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "814973fcf54892fa4edbf9e732341ff1227e2a89bf59cb22b52082e940f7c3ac8a7c25163cb375b3cfe3654e86eaa65d"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000009931a8a6dcdf21a869739356e7715eb155c1a18a58c8bf13382ac33",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "0694b46d8581423f2f68196dcc2d06be0b6b365a4100b54e351ab42f5828d09fd03941f8a1255363753a53d32b43f63b"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000006097e9d08a4ca9bedbe4a97bb9bf3fe8d09372d18d2398f185cff5d",
      "signersCount": 50,
      "validMembersCount": 50,
      "quorumPublicKey": "10d0488558afd929508cd2d11bda7564333a904aa23c8b4a1ed57d86b217e3181497469e7220e9421e14f645a00940fc"
    }
  ],
  "merkleRootMNList": "47228e73ce927c2ff0cd26fe8e410995c5829c1971ab98f0c86527ba27f16dd2"
}
```

*See also: none*

# Quorum

*Added in Dash Core 0.14.0*

The `quorum` RPC provides a set of commands for quorums (LLMQs).

## Quorum List

The `quorum list` RPC displays a list of on-chain quorums.

*Parameter #1---quorum count*

Name | Type | Presence | Description
--- | --- | --- | ---
`count` | number | Optional<br>(0 or 1) | Number of quorums to list. Will list active quorums if `count` is not specified.

*Result---a list of quorums*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Quorum list
→<br>Quorum | array | Required<br>(1 or more) | Array of quorum details
→ →<br>Quorum Hash | string (hex) | Optional<br>(0 or more) | A quorum hash

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum list
```

Result:
``` json
{
  "llmq_50_60": [
    "00000000023cc6dde69bed898c83fe2328ef38b1ea9da14a599efa14caef0b7d",
    "000000002b968fb3b2fc2ff18d6e89611e366b4d38a6d0437e99bd7c37f2fd83",
    "000000000301054c038b07b5b51493d5efc3f078e3aede6eb603c47943d1cc78",
    "000000000e901278c00c896754a06f8d45d0268c6aff6e72ffb3007d07c10e73",
    "000000001bc592f2a8676203835bc6ad442abeadb9c22b8d6a2999db07354b01",
    "000000000896c37ef8a32318ee871589394f1578473b8825275b610690e47db0",
    "00000000133b192b2319a0716ad18e5788981fff51856f61205af5d6a634ba41",
    "0000000004946f3f9f82a298985f73080d62627d51f6f4ba77f3cd8c6788b3d0",
    "0000000005cb014d3df9bac0ba379f1d5b8b75f0e6d7c408d43ac1db330ec641",
    "0000000006c1653c7ee747f140dd7daa1da23a541e67a0fc0dc88db3482ec4d5"
  ],
  "llmq_400_60": [
    "0000000007697fd69a799bfa26576a177e817bc0e45b9fcfbf48b362b05aeff2"
  ],
  "llmq_400_85": [
  ]
}
```

## Quorum Info

The `quorum info` RPC returns information about a specific quorum.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorums](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types) to list:<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85

*Parameter #2---quorum hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum

*Parameter #3---secret key share*

Name | Type | Presence | Description
--- | --- | --- | ---
`includeSkShare` | bool | Optional<br>(0 or 1) | Include the secret key share (default: `false`)

*Result---information about a quorum*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Quorum list
→<br>`height` | number | Required<br>(exactly 1) | Block height of the quorum
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→<br>`minedBlock` | string (hex) | Required<br>(exactly 1) | The hash of the block that established the quorum
→<br>`members` | array | Required<br>(exactly 1) | An array containing quorum member details
→ →<br>Member | object | Required<br>(1 or more) | An object describing a particular member
→ → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→ → →<br>`valid` | bool | Required<br>(exactly 1) | Indicates if the member is valid
→ → →<br>`pubKeyShare` | string | Optional<br>(0 or 1) | Member public key share
→<br>`quorumPublicKey` | string | Required<br>(exactly 1) | Quorum public key
→<br>`secretKeyShare` | string | Optional<br>(exactly 1) | Quorum secret key share

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum info 1 \
  0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a true
```

Result (truncated):
``` json
{
  "height": 76728,
  "quorumHash": "0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a",
  "minedBlock": "0000000009d8c183650d12e9ff952967ecfde58404e80db1bf5a7d1a31ccd4ee",
  "members": [
    {
      "proTxHash": "5eccc0b9a1a2b8a9c3511cae98a664c377e8493c35cdd120e0d71f0b6b0f62c5",
      "valid": true,
      "pubKeyShare": "04a4ae5cb7f598d1bcc6fa49162fe8c19f6ad763ce3959f5afdc3c00e19d8261af37729ae8a707860ecdea067029d3e9"
    },
    {
      "proTxHash": "1e17ddf8748ed5e6696255da61922bd3985fd15a33fcb2d051cf84242e89f121",
      "valid": true,
      "pubKeyShare": "8239b67aff5368e710a8ebe5f1f3e9087e8f9c52ed165293779f40b0e764a20972f2ade9367f41cd4f64a3516ad8c90c"
    },
    {
      "proTxHash": "f1eb4ac02ab1acbace0a01328e204c4fd7dec5e53a72cccac7729c5802dbeaf4",
      "valid": true,
      "pubKeyShare": "969655b04484de85b3f1ecce5a9745ec7fd0a34533e13fcf285e15ed034578a604e0e2af98cd12cf89d1cfcc167c978d"
    },
    {
      "proTxHash": "a288f5de676eb63dee13a618d39bd6b07ad73e9ae40148202fc5b5f32e1b0bfb",
      "valid": true,
      "pubKeyShare": "047bee41fdce58f8d87ba6820c784f2a096d85d1ceec62520013c7c3ef9de9203b82eadc910b197a906be2cd5fd21c53"
    },
    {
      "proTxHash": "57795a35a3a127e817704b6b8ce64ac7f6afc49f0d0172c1e4125987c31dd1d7",
      "valid": true,
      "pubKeyShare": "168b9cb406bc44348b5de18c9017817f4e1b15c304ab8d365ba3828712ab1f64c1e4715715d61a96c5923fbe8c470788"
    },
    {
      "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
      "valid": true,
      "pubKeyShare": "93a85894c04dbc06e9a598126aa8ba9983427a089710c4ff37b9b9f12980780e988f89192b5feaa25f907b8db9efb930"
    }
  ],
  "quorumPublicKey": "18772a3ca86f47795f4e9fa40babe89c7be6bc15bb4e4c8a137715a814a4118516a63b89c5c415b9dfe956f2d6a4fde3",
  "secretKeyShare": "3da0d8f532309660f7f44aa0ed42c1569773b39c70f5771ce5604be77e50759e"
}
```

## Quorum DKGStatus

The `quorum list` RPC displays the status of the current DKG process.

*Parameter #1---detail level*

Name | Type | Presence | Description
--- | --- | --- | ---
`detail_level` | number | Optional<br>(0 or 1) | Detail level of output (default: 0):<br>`0` - Only show counts (_default_)<br>`1` - Show member indexes<br>`2` - Show member's ProTxHashes<br><br>_Note: Works only when Spork 17 is enabled and only displays details related to the node running the command._

*Result (if detail level was 0 or omitted)---JSON DKG details*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred
→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the initial provider registration transaction as hex in RPC byte order
→<br>`time` | string (hex) | Required<br>(exactly 1) | The Unix epoch time
→<br>`timeStr` | string (hex) | Required<br>(exactly 1) | The UTC time as a string
→<br>`session` | object | Required<br>(exactly 1) | Object containing DKG Session information
→ →<br>LLMQ Type | object | Required<br>(exactly 1) | Object
→ → →<br>`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85
→ → →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum
→ → →<br>`quorumHeight` | number | Required<br>(exactly 1) | The block height of the quorum
→ → →<br>`phase` | number | Required<br>(exactly 1) | The active DKG phase<br>`1` - Initialized<br>`2` - Contributing<br>`3` - Complaining<br>`4` - Justifying<br>`5` - Committing<br>`6` - Finalizing
→ → →<br>`sentContributions` | bool | Required<br>(exactly 1) | True when contributions have been sent
→ → →<br>`sentComplaint` | bool | Required<br>(exactly 1) | True when complaints have been sent
→ → →<br>`sentJustification` | bool | Required<br>(exactly 1) | True when justifications have been sent
→ → →<br>`sentPrematureCommitment` | bool | Required<br>(exactly 1) | True when premature commitments have been sent
→ → →<br>`aborted` | bool | Required<br>(exactly 1) | True if the DKG session has been aborted
→ → →<br>`badMembers` | number | Required<br>(exactly 1) | Number of bad members
→ → →<br>`weComplain` | number | Required<br>(exactly 1) | Number of complaints sent
→ → →<br>`receivedContributions` | number | Required<br>(exactly 1) | Number of contributions received
→ → →<br>`receivedComplaints` | number | Required<br>(exactly 1) | Number of complaints received
→ → →<br>`receivedJustifications` | number | Required<br>(exactly 1) | Number of justifications received
→ → →<br>`receivedPrematureCommitments` | number | Required<br>(exactly 1) | Number of premature commitments received
→<br>`minableCommitments` | object | Required<br>(exactly 1) | Object containing minable commitments

*Result (if detail level was 1)---JSON DKG details including member index*

Note: detail level 1 includes all level 0 fields and expands the following fields.

Name | Type | Presence | Description
--- | --- | --- | ---
→ → →<br>`badMembers` | array | Required<br>(exactly 1) | Array containing the member index for each bad member
→ → →<br>`weComplain` | array | Required<br>(exactly 1) | Array containing the member index for each complaint sent
→ → →<br>`receivedContributions` | array | Required<br>(exactly 1) | Array containing the member index for each contribution received
→ → →<br>`receivedComplaints` | array | Required<br>(exactly 1) | Array containing the member index for each complaint received
→ → →<br>`receivedJustifications` | array | Required<br>(exactly 1) | Array containing the member index for each justification received
→ → →<br>`receivedPrematureCommitments` | array | Required<br>(exactly 1) | Array containing the member index for each commitment received

*Result (if detail level was 2)---JSON DKG details including member index and ProTx hash*

Note: detail level 2 includes all level 0 fields, adds the `allMembers` field, and expands several fields.

Name | Type | Presence | Description
--- | --- | --- | ---
→ → →<br>`badMembers` | array | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a bad member
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`weComplain` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member being complained about
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedContributions` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a contribution was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedComplaints` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a complaint was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedJustifications` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a justification was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedPrematureCommitments` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a premature commitment was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`allMembers` | array | Required<br>(exactly 1) | Array containing the provider registration transaction hash for all quorum members

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum dkgstatus
```

Result:
``` json
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1555172494,
  "timeStr": "2019-04-13 16:21:34",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "quorumHeight": 79368,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": 2,
      "weComplain": 0,
      "receivedContributions": 48,
      "receivedComplaints": 44,
      "receivedJustifications": 0,
      "receivedPrematureCommitments": 44
    }
  },
  "minableCommitments": {
    "llmq_50_60": {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "signersCount": 0,
      "validMembersCount": 0,
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  }
}
```

*Example from Dash Core 0.14.0 (detail_level: 1)*

``` bash
dash-cli -testnet quorum dkgstatus 1
```

Result:
``` json
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1555172494,
  "timeStr": "2019-04-13 16:21:34",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "quorumHeight": 79368,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": [
        35,
        42
      ],
      "weComplain": [
      ],
      "receivedContributions": [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
        31,
        32,
        33,
        34,
        36,
        37,
        38,
        39,
        40,
        41,
        43,
        44,
        45,
        46,
        47,
        48,
        49
      ],
      "receivedComplaints": [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
        31,
        33,
        34,
        36,
        37,
        38,
        39,
        40,
        41,
        43,
        44,
        45,
        46,
        47,
        48,
        49
      ],
      "receivedJustifications": [
      ],
      "receivedPrematureCommitments": [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
        31,
        33,
        34,
        36,
        37,
        38,
        39,
        40,
        41,
        43,
        44,
        45,
        46,
        47,
        48,
        49
      ]
    }
  },
  "minableCommitments": {
    "llmq_50_60": {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "signersCount": 0,
      "validMembersCount": 0,
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  }
}
```

*Example from Dash Core 0.14.0 (detail_level: 2)*

``` bash
dash-cli -testnet quorum dkgstatus 2
```

Result:
``` json
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1555172494,
  "timeStr": "2019-04-13 16:21:34",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "quorumHeight": 79368,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": [
        {
          "memberIndex": 35,
          "proTxHash": "c24aea30305d539887223fd923df775644b1d86db0aac8c654026e823b549cd7"
        },
        {
          "memberIndex": 42,
          "proTxHash": "f0567069d4f2a2e536e46173a097b318daf03edef989f6875ca06f5c4d49abc9"
        }
      ],
      "weComplain": [
      ],
      "receivedContributions": [
        {
          "memberIndex": 0,
          "proTxHash": "a6670caf2842a4ae5cb4bb78b3c10343456922b500693f6da043af541d58d9cb"
        },
        {
          "memberIndex": 1,
          "proTxHash": "77c0615fb5eb946f7f731a44eb36dc37ee77bf959e7205937d88186cacfbdc7e"
        },
        {
          "memberIndex": 2,
          "proTxHash": "8070c631ce9ac8850d2e95d4ed7be70171ead22ccd7f4bc9c3aee0a227f323c9"
        },
        {
          "memberIndex": 3,
          "proTxHash": "596be0851532a66037744afa694e4de6485f326f4638e704db93cc726866cda3"
        },
        {
          "memberIndex": 4,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        },
        {
          "memberIndex": 5,
          "proTxHash": "9f4f9f83ecbcd5739d7f1479ee14b508f2414d044a717acba0960566c4e6091d"
        },
        {
          "memberIndex": 6,
          "proTxHash": "21c0923badd20f953360c586edfcbb1a830be83206e30b3f65765f7794f2a640"
        },
        {
          "memberIndex": 7,
          "proTxHash": "cc36055f36345b85a2b8176e79feff0ff822c490691c7f8e8d3348b4b1a1d8ac"
        },
        {
          "memberIndex": 8,
          "proTxHash": "4636ed7acbacbc76aba60aa7a1011688fe9ad5fd701d0bf8fc42a502ea3e6543"
        },
        {
          "memberIndex": 9,
          "proTxHash": "32e5ad5cf9a06eb13e0f65cb7ecde1a93ef24995d07355fac2ff05ebd5b9ddbf"
        },
        {
          "memberIndex": 10,
          "proTxHash": "0022afbe93054ca11ce9b67892661af4558597bacff0ab82bff05a2b4a89ca2d"
        },
        {
          "memberIndex": 11,
          "proTxHash": "2523dc6e034911b9004862e87b4d23a32ed6198aec177915df7893f51cd645bd"
        },
        {
          "memberIndex": 12,
          "proTxHash": "abe5d16432915b201cf6f11299a1abd62e5f69a2c4e8717694d1e42d96dbd580"
        },
        {
          "memberIndex": 13,
          "proTxHash": "f443dd87ec7981e8630ae957f295d9d226d4bd3895f59dbd80b30137a92b3735"
        },
        {
          "memberIndex": 14,
          "proTxHash": "6a5be5c068a0be432b7db0772b25094a59ce1f433dd2df0d410511ac641c3768"
        },
        {
          "memberIndex": 15,
          "proTxHash": "84435c41688c8021a25a644e6b94c9f5159aff5658ee2e12f5cea5c714c21aa3"
        },
        {
          "memberIndex": 16,
          "proTxHash": "2db238aa40837319ca13e27aae4333d1248475546be6cfad985a3785c0ac9bd6"
        },
        {
          "memberIndex": 17,
          "proTxHash": "cefb7c69f75d9fbba21f648c6205bebf9b16325956404c70af03144c1135c7d7"
        },
        {
          "memberIndex": 18,
          "proTxHash": "cc7041c869c7c1c0bae7c137f0cda708ad492bc89c4b8f7a40a353d90335febf"
        },
        {
          "memberIndex": 19,
          "proTxHash": "24e642275f5d5f17f67db502d905153cfd83ffbd3d49c90196ec01200917fb31"
        },
        {
          "memberIndex": 20,
          "proTxHash": "bc5c77926b0ccfcb742123a1edf2c27147888f694701df399982a862309921c8"
        },
        {
          "memberIndex": 21,
          "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63"
        },
        {
          "memberIndex": 22,
          "proTxHash": "11eabc1e72394af02bbe86815975d054816fe69006fdc64c6d7a06b585e5c311"
        },
        {
          "memberIndex": 23,
          "proTxHash": "71cf5017c4c5f69db5c17a8cfb4c28ffc14ad1715dba2a83f0c30e534291f828"
        },
        {
          "memberIndex": 24,
          "proTxHash": "d567ac9cc7437848210365a0225271ec26a6a6c7d852544a6e9cbd40756075b3"
        },
        {
          "memberIndex": 25,
          "proTxHash": "16ef804605595f67a0e078f7ffbdd93ac55bcd22d9094cb8b61ef527c48f4c44"
        },
        {
          "memberIndex": 26,
          "proTxHash": "f51b426420ac4c518ad07c2bb03e434389337b4e2977d39233114d5e8ef21f69"
        },
        {
          "memberIndex": 27,
          "proTxHash": "2460848868c210d23c68460050f83f47a7ad00db2c47ad6f223a9b1eb04c8d54"
        },
        {
          "memberIndex": 28,
          "proTxHash": "49d94e4c584929320cfe159faf4f6e398f1b2d1fdaa413c01345ce23870d2ca9"
        },
        {
          "memberIndex": 29,
          "proTxHash": "e8b039ce3f1016b7caf781d1b0efbc11191860ec3b131fc49591402a260ba638"
        },
        {
          "memberIndex": 30,
          "proTxHash": "5ab82a5348b5d4c126b0c172665d364352be37c96ce442e710d4a844a6f80bf9"
        },
        {
          "memberIndex": 31,
          "proTxHash": "05b83104eea971582c803ded305109ecb734b582da93b8e301c6f00d6be6c496"
        },
        {
          "memberIndex": 32,
          "proTxHash": "c98c6303af03f7f3b2673ceece962134088e5dcc3c69a0977069c6201b26dc9b"
        },
        {
          "memberIndex": 33,
          "proTxHash": "f933d592d677f3409274646ddea2ffaaca77dfd4ceab7c54037a04e05fc7ee8b"
        },
        {
          "memberIndex": 34,
          "proTxHash": "5d40e68f65e7263d91e114b644ff7f8c9c376db63550d5ef9bc4228870c4f053"
        },
        {
          "memberIndex": 36,
          "proTxHash": "a36edfac56f7f1b0f58aa793115fbd53d792315857033fb32a862507a3f060ff"
        },
        {
          "memberIndex": 37,
          "proTxHash": "c9d43a69bd9effdaed579edc901c5d848711481047c9cc76bad8232d8f329dcd"
        },
        {
          "memberIndex": 38,
          "proTxHash": "d82152084615c73d79f3eb8b0ec6a61e6d0f94c4cdcf26f773f0e42b72176f6f"
        },
        {
          "memberIndex": 39,
          "proTxHash": "869f7f2054a6ed4241967afb74c3b1a07701d2772b368eb0bbfd2e3365adf6f3"
        },
        {
          "memberIndex": 40,
          "proTxHash": "5f1a70a350d21f673d93fae45a50c0362947366e46c96bade51b7933f0cada3e"
        },
        {
          "memberIndex": 41,
          "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f"
        },
        {
          "memberIndex": 43,
          "proTxHash": "254bcd3b28d696ce9d468cd521e6be3f7eb01da32d8bf9fdf34868baaf09d9e7"
        },
        {
          "memberIndex": 44,
          "proTxHash": "0ae626ed4ee06c1f042b2eaa9669302a2e60a0df8137843b39de53f2c3e265aa"
        },
        {
          "memberIndex": 45,
          "proTxHash": "cfa6f7b58c78f827c15e8f1b6a5a2a3a92140101719006d8226a363e2c0c8e5c"
        },
        {
          "memberIndex": 46,
          "proTxHash": "03811a53a20289799f56227f576915492d2cede48522cd1b3f67c6c89cdacf83"
        },
        {
          "memberIndex": 47,
          "proTxHash": "f989866b2fadb674a1ca63746ff8bb97232d6843c95f9e805b8bc2a5ae8e768d"
        },
        {
          "memberIndex": 48,
          "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d"
        },
        {
          "memberIndex": 49,
          "proTxHash": "e441bbb2f056d471ae9fad83b4dd0fa691a0574eb4a373a0e59d6108614ee07e"
        }
      ],
      "receivedComplaints": [
        {
          "memberIndex": 0,
          "proTxHash": "a6670caf2842a4ae5cb4bb78b3c10343456922b500693f6da043af541d58d9cb"
        },
        {
          "memberIndex": 1,
          "proTxHash": "77c0615fb5eb946f7f731a44eb36dc37ee77bf959e7205937d88186cacfbdc7e"
        },
        {
          "memberIndex": 2,
          "proTxHash": "8070c631ce9ac8850d2e95d4ed7be70171ead22ccd7f4bc9c3aee0a227f323c9"
        },
        {
          "memberIndex": 3,
          "proTxHash": "596be0851532a66037744afa694e4de6485f326f4638e704db93cc726866cda3"
        },
        {
          "memberIndex": 4,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        },
        {
          "memberIndex": 5,
          "proTxHash": "9f4f9f83ecbcd5739d7f1479ee14b508f2414d044a717acba0960566c4e6091d"
        },
        {
          "memberIndex": 6,
          "proTxHash": "21c0923badd20f953360c586edfcbb1a830be83206e30b3f65765f7794f2a640"
        },
        {
          "memberIndex": 7,
          "proTxHash": "cc36055f36345b85a2b8176e79feff0ff822c490691c7f8e8d3348b4b1a1d8ac"
        },
        {
          "memberIndex": 8,
          "proTxHash": "4636ed7acbacbc76aba60aa7a1011688fe9ad5fd701d0bf8fc42a502ea3e6543"
        },
        {
          "memberIndex": 9,
          "proTxHash": "32e5ad5cf9a06eb13e0f65cb7ecde1a93ef24995d07355fac2ff05ebd5b9ddbf"
        },
        {
          "memberIndex": 10,
          "proTxHash": "0022afbe93054ca11ce9b67892661af4558597bacff0ab82bff05a2b4a89ca2d"
        },
        {
          "memberIndex": 11,
          "proTxHash": "2523dc6e034911b9004862e87b4d23a32ed6198aec177915df7893f51cd645bd"
        },
        {
          "memberIndex": 12,
          "proTxHash": "abe5d16432915b201cf6f11299a1abd62e5f69a2c4e8717694d1e42d96dbd580"
        },
        {
          "memberIndex": 14,
          "proTxHash": "6a5be5c068a0be432b7db0772b25094a59ce1f433dd2df0d410511ac641c3768"
        },
        {
          "memberIndex": 15,
          "proTxHash": "84435c41688c8021a25a644e6b94c9f5159aff5658ee2e12f5cea5c714c21aa3"
        },
        {
          "memberIndex": 16,
          "proTxHash": "2db238aa40837319ca13e27aae4333d1248475546be6cfad985a3785c0ac9bd6"
        },
        {
          "memberIndex": 17,
          "proTxHash": "cefb7c69f75d9fbba21f648c6205bebf9b16325956404c70af03144c1135c7d7"
        },
        {
          "memberIndex": 18,
          "proTxHash": "cc7041c869c7c1c0bae7c137f0cda708ad492bc89c4b8f7a40a353d90335febf"
        },
        {
          "memberIndex": 19,
          "proTxHash": "24e642275f5d5f17f67db502d905153cfd83ffbd3d49c90196ec01200917fb31"
        },
        {
          "memberIndex": 20,
          "proTxHash": "bc5c77926b0ccfcb742123a1edf2c27147888f694701df399982a862309921c8"
        },
        {
          "memberIndex": 21,
          "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63"
        },
        {
          "memberIndex": 24,
          "proTxHash": "d567ac9cc7437848210365a0225271ec26a6a6c7d852544a6e9cbd40756075b3"
        },
        {
          "memberIndex": 25,
          "proTxHash": "16ef804605595f67a0e078f7ffbdd93ac55bcd22d9094cb8b61ef527c48f4c44"
        },
        {
          "memberIndex": 26,
          "proTxHash": "f51b426420ac4c518ad07c2bb03e434389337b4e2977d39233114d5e8ef21f69"
        },
        {
          "memberIndex": 27,
          "proTxHash": "2460848868c210d23c68460050f83f47a7ad00db2c47ad6f223a9b1eb04c8d54"
        },
        {
          "memberIndex": 28,
          "proTxHash": "49d94e4c584929320cfe159faf4f6e398f1b2d1fdaa413c01345ce23870d2ca9"
        },
        {
          "memberIndex": 29,
          "proTxHash": "e8b039ce3f1016b7caf781d1b0efbc11191860ec3b131fc49591402a260ba638"
        },
        {
          "memberIndex": 30,
          "proTxHash": "5ab82a5348b5d4c126b0c172665d364352be37c96ce442e710d4a844a6f80bf9"
        },
        {
          "memberIndex": 31,
          "proTxHash": "05b83104eea971582c803ded305109ecb734b582da93b8e301c6f00d6be6c496"
        },
        {
          "memberIndex": 33,
          "proTxHash": "f933d592d677f3409274646ddea2ffaaca77dfd4ceab7c54037a04e05fc7ee8b"
        },
        {
          "memberIndex": 34,
          "proTxHash": "5d40e68f65e7263d91e114b644ff7f8c9c376db63550d5ef9bc4228870c4f053"
        },
        {
          "memberIndex": 36,
          "proTxHash": "a36edfac56f7f1b0f58aa793115fbd53d792315857033fb32a862507a3f060ff"
        },
        {
          "memberIndex": 37,
          "proTxHash": "c9d43a69bd9effdaed579edc901c5d848711481047c9cc76bad8232d8f329dcd"
        },
        {
          "memberIndex": 38,
          "proTxHash": "d82152084615c73d79f3eb8b0ec6a61e6d0f94c4cdcf26f773f0e42b72176f6f"
        },
        {
          "memberIndex": 39,
          "proTxHash": "869f7f2054a6ed4241967afb74c3b1a07701d2772b368eb0bbfd2e3365adf6f3"
        },
        {
          "memberIndex": 40,
          "proTxHash": "5f1a70a350d21f673d93fae45a50c0362947366e46c96bade51b7933f0cada3e"
        },
        {
          "memberIndex": 41,
          "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f"
        },
        {
          "memberIndex": 43,
          "proTxHash": "254bcd3b28d696ce9d468cd521e6be3f7eb01da32d8bf9fdf34868baaf09d9e7"
        },
        {
          "memberIndex": 44,
          "proTxHash": "0ae626ed4ee06c1f042b2eaa9669302a2e60a0df8137843b39de53f2c3e265aa"
        },
        {
          "memberIndex": 45,
          "proTxHash": "cfa6f7b58c78f827c15e8f1b6a5a2a3a92140101719006d8226a363e2c0c8e5c"
        },
        {
          "memberIndex": 46,
          "proTxHash": "03811a53a20289799f56227f576915492d2cede48522cd1b3f67c6c89cdacf83"
        },
        {
          "memberIndex": 47,
          "proTxHash": "f989866b2fadb674a1ca63746ff8bb97232d6843c95f9e805b8bc2a5ae8e768d"
        },
        {
          "memberIndex": 48,
          "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d"
        },
        {
          "memberIndex": 49,
          "proTxHash": "e441bbb2f056d471ae9fad83b4dd0fa691a0574eb4a373a0e59d6108614ee07e"
        }
      ],
      "receivedJustifications": [
      ],
      "receivedPrematureCommitments": [
        {
          "memberIndex": 0,
          "proTxHash": "a6670caf2842a4ae5cb4bb78b3c10343456922b500693f6da043af541d58d9cb"
        },
        {
          "memberIndex": 1,
          "proTxHash": "77c0615fb5eb946f7f731a44eb36dc37ee77bf959e7205937d88186cacfbdc7e"
        },
        {
          "memberIndex": 2,
          "proTxHash": "8070c631ce9ac8850d2e95d4ed7be70171ead22ccd7f4bc9c3aee0a227f323c9"
        },
        {
          "memberIndex": 3,
          "proTxHash": "596be0851532a66037744afa694e4de6485f326f4638e704db93cc726866cda3"
        },
        {
          "memberIndex": 4,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        },
        {
          "memberIndex": 5,
          "proTxHash": "9f4f9f83ecbcd5739d7f1479ee14b508f2414d044a717acba0960566c4e6091d"
        },
        {
          "memberIndex": 6,
          "proTxHash": "21c0923badd20f953360c586edfcbb1a830be83206e30b3f65765f7794f2a640"
        },
        {
          "memberIndex": 7,
          "proTxHash": "cc36055f36345b85a2b8176e79feff0ff822c490691c7f8e8d3348b4b1a1d8ac"
        },
        {
          "memberIndex": 8,
          "proTxHash": "4636ed7acbacbc76aba60aa7a1011688fe9ad5fd701d0bf8fc42a502ea3e6543"
        },
        {
          "memberIndex": 9,
          "proTxHash": "32e5ad5cf9a06eb13e0f65cb7ecde1a93ef24995d07355fac2ff05ebd5b9ddbf"
        },
        {
          "memberIndex": 10,
          "proTxHash": "0022afbe93054ca11ce9b67892661af4558597bacff0ab82bff05a2b4a89ca2d"
        },
        {
          "memberIndex": 11,
          "proTxHash": "2523dc6e034911b9004862e87b4d23a32ed6198aec177915df7893f51cd645bd"
        },
        {
          "memberIndex": 12,
          "proTxHash": "abe5d16432915b201cf6f11299a1abd62e5f69a2c4e8717694d1e42d96dbd580"
        },
        {
          "memberIndex": 14,
          "proTxHash": "6a5be5c068a0be432b7db0772b25094a59ce1f433dd2df0d410511ac641c3768"
        },
        {
          "memberIndex": 15,
          "proTxHash": "84435c41688c8021a25a644e6b94c9f5159aff5658ee2e12f5cea5c714c21aa3"
        },
        {
          "memberIndex": 16,
          "proTxHash": "2db238aa40837319ca13e27aae4333d1248475546be6cfad985a3785c0ac9bd6"
        },
        {
          "memberIndex": 17,
          "proTxHash": "cefb7c69f75d9fbba21f648c6205bebf9b16325956404c70af03144c1135c7d7"
        },
        {
          "memberIndex": 18,
          "proTxHash": "cc7041c869c7c1c0bae7c137f0cda708ad492bc89c4b8f7a40a353d90335febf"
        },
        {
          "memberIndex": 19,
          "proTxHash": "24e642275f5d5f17f67db502d905153cfd83ffbd3d49c90196ec01200917fb31"
        },
        {
          "memberIndex": 20,
          "proTxHash": "bc5c77926b0ccfcb742123a1edf2c27147888f694701df399982a862309921c8"
        },
        {
          "memberIndex": 21,
          "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63"
        },
        {
          "memberIndex": 24,
          "proTxHash": "d567ac9cc7437848210365a0225271ec26a6a6c7d852544a6e9cbd40756075b3"
        },
        {
          "memberIndex": 25,
          "proTxHash": "16ef804605595f67a0e078f7ffbdd93ac55bcd22d9094cb8b61ef527c48f4c44"
        },
        {
          "memberIndex": 26,
          "proTxHash": "f51b426420ac4c518ad07c2bb03e434389337b4e2977d39233114d5e8ef21f69"
        },
        {
          "memberIndex": 27,
          "proTxHash": "2460848868c210d23c68460050f83f47a7ad00db2c47ad6f223a9b1eb04c8d54"
        },
        {
          "memberIndex": 28,
          "proTxHash": "49d94e4c584929320cfe159faf4f6e398f1b2d1fdaa413c01345ce23870d2ca9"
        },
        {
          "memberIndex": 29,
          "proTxHash": "e8b039ce3f1016b7caf781d1b0efbc11191860ec3b131fc49591402a260ba638"
        },
        {
          "memberIndex": 30,
          "proTxHash": "5ab82a5348b5d4c126b0c172665d364352be37c96ce442e710d4a844a6f80bf9"
        },
        {
          "memberIndex": 31,
          "proTxHash": "05b83104eea971582c803ded305109ecb734b582da93b8e301c6f00d6be6c496"
        },
        {
          "memberIndex": 33,
          "proTxHash": "f933d592d677f3409274646ddea2ffaaca77dfd4ceab7c54037a04e05fc7ee8b"
        },
        {
          "memberIndex": 34,
          "proTxHash": "5d40e68f65e7263d91e114b644ff7f8c9c376db63550d5ef9bc4228870c4f053"
        },
        {
          "memberIndex": 36,
          "proTxHash": "a36edfac56f7f1b0f58aa793115fbd53d792315857033fb32a862507a3f060ff"
        },
        {
          "memberIndex": 37,
          "proTxHash": "c9d43a69bd9effdaed579edc901c5d848711481047c9cc76bad8232d8f329dcd"
        },
        {
          "memberIndex": 38,
          "proTxHash": "d82152084615c73d79f3eb8b0ec6a61e6d0f94c4cdcf26f773f0e42b72176f6f"
        },
        {
          "memberIndex": 39,
          "proTxHash": "869f7f2054a6ed4241967afb74c3b1a07701d2772b368eb0bbfd2e3365adf6f3"
        },
        {
          "memberIndex": 40,
          "proTxHash": "5f1a70a350d21f673d93fae45a50c0362947366e46c96bade51b7933f0cada3e"
        },
        {
          "memberIndex": 41,
          "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f"
        },
        {
          "memberIndex": 43,
          "proTxHash": "254bcd3b28d696ce9d468cd521e6be3f7eb01da32d8bf9fdf34868baaf09d9e7"
        },
        {
          "memberIndex": 44,
          "proTxHash": "0ae626ed4ee06c1f042b2eaa9669302a2e60a0df8137843b39de53f2c3e265aa"
        },
        {
          "memberIndex": 45,
          "proTxHash": "cfa6f7b58c78f827c15e8f1b6a5a2a3a92140101719006d8226a363e2c0c8e5c"
        },
        {
          "memberIndex": 46,
          "proTxHash": "03811a53a20289799f56227f576915492d2cede48522cd1b3f67c6c89cdacf83"
        },
        {
          "memberIndex": 47,
          "proTxHash": "f989866b2fadb674a1ca63746ff8bb97232d6843c95f9e805b8bc2a5ae8e768d"
        },
        {
          "memberIndex": 48,
          "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d"
        },
        {
          "memberIndex": 49,
          "proTxHash": "e441bbb2f056d471ae9fad83b4dd0fa691a0574eb4a373a0e59d6108614ee07e"
        }
      ],
      "allMembers": [
        "a6670caf2842a4ae5cb4bb78b3c10343456922b500693f6da043af541d58d9cb",
        "77c0615fb5eb946f7f731a44eb36dc37ee77bf959e7205937d88186cacfbdc7e",
        "8070c631ce9ac8850d2e95d4ed7be70171ead22ccd7f4bc9c3aee0a227f323c9",
        "596be0851532a66037744afa694e4de6485f326f4638e704db93cc726866cda3",
        "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239",
        "9f4f9f83ecbcd5739d7f1479ee14b508f2414d044a717acba0960566c4e6091d",
        "21c0923badd20f953360c586edfcbb1a830be83206e30b3f65765f7794f2a640",
        "cc36055f36345b85a2b8176e79feff0ff822c490691c7f8e8d3348b4b1a1d8ac",
        "4636ed7acbacbc76aba60aa7a1011688fe9ad5fd701d0bf8fc42a502ea3e6543",
        "32e5ad5cf9a06eb13e0f65cb7ecde1a93ef24995d07355fac2ff05ebd5b9ddbf",
        "0022afbe93054ca11ce9b67892661af4558597bacff0ab82bff05a2b4a89ca2d",
        "2523dc6e034911b9004862e87b4d23a32ed6198aec177915df7893f51cd645bd",
        "abe5d16432915b201cf6f11299a1abd62e5f69a2c4e8717694d1e42d96dbd580",
        "f443dd87ec7981e8630ae957f295d9d226d4bd3895f59dbd80b30137a92b3735",
        "6a5be5c068a0be432b7db0772b25094a59ce1f433dd2df0d410511ac641c3768",
        "84435c41688c8021a25a644e6b94c9f5159aff5658ee2e12f5cea5c714c21aa3",
        "2db238aa40837319ca13e27aae4333d1248475546be6cfad985a3785c0ac9bd6",
        "cefb7c69f75d9fbba21f648c6205bebf9b16325956404c70af03144c1135c7d7",
        "cc7041c869c7c1c0bae7c137f0cda708ad492bc89c4b8f7a40a353d90335febf",
        "24e642275f5d5f17f67db502d905153cfd83ffbd3d49c90196ec01200917fb31",
        "bc5c77926b0ccfcb742123a1edf2c27147888f694701df399982a862309921c8",
        "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
        "11eabc1e72394af02bbe86815975d054816fe69006fdc64c6d7a06b585e5c311",
        "71cf5017c4c5f69db5c17a8cfb4c28ffc14ad1715dba2a83f0c30e534291f828",
        "d567ac9cc7437848210365a0225271ec26a6a6c7d852544a6e9cbd40756075b3",
        "16ef804605595f67a0e078f7ffbdd93ac55bcd22d9094cb8b61ef527c48f4c44",
        "f51b426420ac4c518ad07c2bb03e434389337b4e2977d39233114d5e8ef21f69",
        "2460848868c210d23c68460050f83f47a7ad00db2c47ad6f223a9b1eb04c8d54",
        "49d94e4c584929320cfe159faf4f6e398f1b2d1fdaa413c01345ce23870d2ca9",
        "e8b039ce3f1016b7caf781d1b0efbc11191860ec3b131fc49591402a260ba638",
        "5ab82a5348b5d4c126b0c172665d364352be37c96ce442e710d4a844a6f80bf9",
        "05b83104eea971582c803ded305109ecb734b582da93b8e301c6f00d6be6c496",
        "c98c6303af03f7f3b2673ceece962134088e5dcc3c69a0977069c6201b26dc9b",
        "f933d592d677f3409274646ddea2ffaaca77dfd4ceab7c54037a04e05fc7ee8b",
        "5d40e68f65e7263d91e114b644ff7f8c9c376db63550d5ef9bc4228870c4f053",
        "c24aea30305d539887223fd923df775644b1d86db0aac8c654026e823b549cd7",
        "a36edfac56f7f1b0f58aa793115fbd53d792315857033fb32a862507a3f060ff",
        "c9d43a69bd9effdaed579edc901c5d848711481047c9cc76bad8232d8f329dcd",
        "d82152084615c73d79f3eb8b0ec6a61e6d0f94c4cdcf26f773f0e42b72176f6f",
        "869f7f2054a6ed4241967afb74c3b1a07701d2772b368eb0bbfd2e3365adf6f3",
        "5f1a70a350d21f673d93fae45a50c0362947366e46c96bade51b7933f0cada3e",
        "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f",
        "f0567069d4f2a2e536e46173a097b318daf03edef989f6875ca06f5c4d49abc9",
        "254bcd3b28d696ce9d468cd521e6be3f7eb01da32d8bf9fdf34868baaf09d9e7",
        "0ae626ed4ee06c1f042b2eaa9669302a2e60a0df8137843b39de53f2c3e265aa",
        "cfa6f7b58c78f827c15e8f1b6a5a2a3a92140101719006d8226a363e2c0c8e5c",
        "03811a53a20289799f56227f576915492d2cede48522cd1b3f67c6c89cdacf83",
        "f989866b2fadb674a1ca63746ff8bb97232d6843c95f9e805b8bc2a5ae8e768d",
        "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d",
        "e441bbb2f056d471ae9fad83b4dd0fa691a0574eb4a373a0e59d6108614ee07e"
      ]
    }
  },
  "minableCommitments": {
    "llmq_50_60": {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000122768294b19a5f6750094f6e9caa135c0826372d0538d4ceb910bc",
      "signersCount": 0,
      "validMembersCount": 0,
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  }
}
```

## Quorum Sign

The `quorum sign` RPC requests threshold-signing for a message.

![Warning icon](https://dash-docs.github.io/img/icons/icon_warning.svg) Note: Used for RegTest testing only.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum sign 1 \
  "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234" \
  "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
```

Result:
``` json
false
```

## Quorum GetRecSig

The `quorum getrecsig` RPC checks gets the recovered signature for a previous threshold-signing message request.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---recovered signature*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | Recovered signature details
→<br>`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum
→<br>`id` | string (hex) | Required<br>(exactly 1) | The signing session ID
→<br>`msgHash` | string (hex) | Required<br>(exactly 1) | The message hash
→<br>`sig` | string (hex) | Required<br>(exactly 1) | The recovered signature
→<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of the recovered signature

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum getrecsig 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
``` json
{
  "llmqType": 1,
  "quorumHash": "00000000008344da08e4d262773ea545472fbf625f78b3ebfe5fc067c33b1d22",
  "id": "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f",
  "msgHash": "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4",
  "sig": "1365171c408d686af2ca8f5fae91cdf9cf0b5eec60b0b161b9288a1c68e2cd68f225495a787415c924c5953a6282d131178aa6baf4c2673d19549fc627740cf71d295f8a38b9970525a7f248d54a548e16da285b5c1f3ec0740ad40edbcc8615",
  "hash": "d9b7f7904746fbb3eeaeec36fadc79b351f6a854cd22ee9e607592aee972fcb2"
}
```

## Quorum HasRecSig

The `quorum hasrecsig` RPC checks for a recovered signature for a previous threshold-signing message request.

![Warning icon](https://dash-docs.github.io/img/icons/icon_warning.svg) Note: Used for RegTest testing only.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum hasrecsig 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
``` json
true
```

## Quorum IsConflicting

The `quorum isconflicting` RPC checks if there is a conflict for a threshold-signing message request.

![Warning icon](https://dash-docs.github.io/img/icons/icon_warning.svg) Note: Used for RegTest testing only.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet quorum isconflicting 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
``` json
false
```

## Quorum MemberOf

The `quorum` RPC checks which quorums the given masternode is a member of.

*Parameter #1---proTxHash*

Name | Type | Presence | Description
--- | --- | --- | ---
proTxHash | string | Required<br>(exactly 1) | ProTxHash of the masternode.

*Parameter #2---scanQuorumsCount*

Name | Type | Presence | Description
--- | --- | --- | ---
scanQuorumsCount | number | Optional | Number of quorums to scan for. If not specified, the active quorum count for each specific quorum type is used.

*Result---list of quorums the masternode is a member of*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | Array of objects | Required<br>(exactly 1) | Array containing info for quorum's the masternode belongs to
→<br>Quorum | object | Required<br>(0 or more) | An object describing quorum details
→ →<br>`height` | number | Required<br>(exactly 1) | Block height of the quorum
→ →<br>`type` | string | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types)
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→ →<br>`minedBlock` | string (hex) | Required<br>(exactly 1) | The hash of the block that established the quorum
→ →<br>`quorumPublicKey` | string (hex) | Required<br>(exactly 1) | Quorum public key
→ →<br>`isValidMember` | bool | Required<br>(exactly 1) | Indicates if the member is valid
→ →<br>`memberIndex` | number | Required<br>(exactly 1) | Index of the member within the quorum

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet quorum memberof 1 \
  39c07d2c9c6d0ead56f52726b63c15e295cb5c3ecf7fe1fefcfb23b2e3cfed1f 1
```

Result:
``` json
[
  {
    "height": 72000,
    "type": "llmq_400_60",
    "quorumHash": "0000000007697fd69a799bfa26576a177e817bc0e45b9fcfbf48b362b05aeff2",
    "minedBlock": "00000000014d910dca80944b52aa3f522d5604254043b8354d641912aace4343",
    "quorumPublicKey": "03a3fbbe99d80a9be8fc59fd4fe43dfbeba9119b688e97493664716cdf15ae47fad70fea7cb93f20fba10d689f9e3c02",
    "isValidMember": true,
    "memberIndex": 80
  }
]
```

*See also: none*

>>>>>>>> Generating RPCs

# Generate

*Requires wallet support.*

The `generate` RPC mines blocks immediately (before the RPC call returns).

*Parameter #1---the number of blocks to generate*

Name | Type | Presence | Description
--- | --- | --- | ---
`numblocks` | number (int) | Required<br>(exactly 1) | The number of blocks to generate.  The RPC call will not return until all blocks have been generated.

*Parameter #2---the number of iterations*

Name | Type | Presence | Description
--- | --- | --- | ---
`maxtries` | number (int) | Required<br>(exactly 1) | The number of iterations to try (default = 1000000).

*Result---the generated block header hashes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing the block header hashes of the generated blocks (may be empty if used with `generate 0`)
→<br>Header Hashes | string (hex) | Required<br>(1 or more) | The hashes of the headers of the blocks generated in regtest mode, as hex in RPC byte order

*Example from Dash Core 0.12.2*

Using regtest mode, generate 2 blocks:

``` bash
dash-cli -regtest generate 2
```

Result:

``` json
[
  "55a4c47da8151c0823eec22c41ebc6d690a0288302179625bae9eb6f36808266",
  "3f07b9aa4e3bcd5518610945c4a6b32699acac71b1762605ff79ba553111fc79"
]
```

*See also*

* [GenerateToAddress](/docs/core-api-ref-remote-procedure-calls-generating#section-generatetoaddress): mines blocks immediately to a specified address.
* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.
* [GetGenerate](/docs/core-api-ref-remote-procedure-calls-removed#section-getgenerate): was removed in Dash Core 0.12.3.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [SetGenerate](/docs/core-api-ref-remote-procedure-calls-removed#section-setgenerate): was removed in Dash Core 0.12.3.

# GenerateToAddress

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

*Requires wallet support.*

The `generatetoaddress` RPC mines blocks immediately to a specified address.

*Parameter #1---the number of blocks to generate*

Name | Type | Presence | Description
--- | --- | --- | ---
Blocks | number (int) | Required<br>(exactly 1) | The number of blocks to generate.  The RPC call will not return until all blocks have been generated or the maximum number of iterations has been reached

*Parameter #2---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The address that will receive the newly generated Dash

*Parameter #3---the maximum number of iterations to try*

Name | Type | Presence | Description
--- | --- | --- | ---
Maxtries | number (int) | Optional<br>(0 or 1) | The maximum number of iterations that are tried to create the requested number of blocks.  Default is `1000000`

*Result---the generated block header hashes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing the block header hashes of the generated blocks (may be empty if used with `generate 0`)
→<br>Header Hashes | string (hex) | Required<br>(1 or more) | The hashes of the headers of the blocks generated, as hex in RPC byte order

*Example from Dash Core 0.12.3*

Using regtest mode, generate 2 blocks with maximal 500000 iterations:

``` bash
dash-cli -regtest generatetoaddress 2 "yaQzdWrDVYGncLKSKG4bHQ\
ML9UdAe726QN" 500000
```

Result:

``` json
[
  "34726c518d1688a9c56b3399e892089d3a639b43de194517c07da2b168a3a89c",
  "1f030abe2bb323b8895542e3a85ed8386bd92c67af9d19fe9c163a4c5f5ef149"
]
```

*See also*

* [Generate](/docs/core-api-ref-remote-procedure-calls-generating#section-generate): mines blocks immediately (before the RPC call returns).
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.

>>>>>>>> Mining RPCs

# GetBlockTemplate

The `getblocktemplate` RPC gets a block template or proposal for use with mining software. For more
information, please see the following resources:

* [Bitcoin Wiki GetBlockTemplate](https://en.bitcoin.it/wiki/Getblocktemplate)
* [BIP22](https://github.com/bitcoin/bips/blob/master/bip-0022.mediawiki)
* [BIP23](https://github.com/bitcoin/bips/blob/master/bip-0023.mediawiki)

*Parameter #1---a JSON request object*

Name | Type | Presence | Description
--- | --- | --- | ---
Request | object | Optional<br>(exactly 1) | A JSON request object
→<br>`mode` | string | Optional<br>(exactly 1) | This must be set to \template\" or omitted"
→<br>`capabilities` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Capability | string | Optional<br>(exactly 1) | Client side supported feature, `longpoll`, `coinbasetxn`, `coinbasevalue`, `proposal`, `serverlist`, `workid`
→<br>`rules` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Rules | string | Optional<br>(exactly 1) | Client side supported softfork deployment, `csv`, `dip0001`, etc.

*Result---block template*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing a block template
→<br>`capabilities` | array (string) | Required<br>(1 or more) | The client side supported features
→ →<br>Capability | string | Optional<br>(0 or more) | A client side supported feature
→<br>`version` | number (int) | Required<br>(exactly 1) | The block version
→<br>`rules` | array (string) | Required<br>(1 or more) | The specific block rules that are to be enforced
→ →<br>Block Rule | string | Optional<br>(0 or more) | A specific block rule to be enforced
→<br>`vbavailable` | object | Required<br>(exactly 1) | Contains the set of pending, supported versionbit (BIP 9) softfork deployments
→ →<br>Bit Number | number | Required<br>(0 or more) | The bit number the named softfork rule
→<br>`vbrequired` | number | Required<br>(exactly 1) | The bit mask of versionbits the server requires set in submissions
→<br>`previousblockhash` | string (hex) | Required<br>(exactly 1) | The hash of current highest block
→<br>`transactions` | array (objects) | Optional<br>(0 or more) | Non-coinbase transactions to be included in the next block
→ →<br>Transaction | object | Optional<br>(0 or more) | Non-coinbase transaction
→ → →<br>`data` | string (hex) | Optional<br>(0 or more) | Transaction data encoded in hex (byte-for-byte)
→ → →<br>`hash` | string (hex) | Optional<br>(0 or more) | The hash/id encoded in little-endian hex
→ → →<br>`depends` | array (numbers) | Required<br>(0 or more) | An array holding TXIDs of unconfirmed transactions this TX depends upon (parent transactions).
→ → → →<br>Transaction number | number | Optional<br>(1 or more) | Transactions before this one (by 1-based index in `transactions` list) that must be present in the final block if this one is
→ → →<br>`fee` | number | Required<br>(exactly 1) | The difference in value between transaction inputs and outputs (in duffs). For coinbase transactions, this is a negative number of the total collected block fees (ie., not including the block subsidy); if key is not present, fee is unknown and clients MUST NOT assume there isn't one
→ → →<br>`sigops` | number | Required<br>(exactly 1) | Total SigOps. If not present, the count is unknown (clients MUST NOT assume there aren't any)
→ → →<br>`required` | boolean | Optional<br>(exactly 1) | If provided and true, this transaction must be in the final block
→<br>`coinbaseaux` | object | Required<br>(exactly 1) | A object containing data that should be included in the coinbase scriptSig content
→ →<br>Flags | string | Required<br>(0 or more) |
→<br>`coinbasevalue` | number | Required<br>(exactly 1) | The maximum allowable input to coinbase transaction, including the generation award and transaction fees (in duffs)
→<br>`coinbasetxn` | object | Required<br>(exactly 1) | Information for the coinbase transaction)
→<br>`target` | string | Required<br>(exactly 1) | The hash target
→<br>`mintime` | number | Required<br>(exactly 1) | The minimum timestamp appropriate for next block time in seconds since epoch
→<br>`mutable` | array (string) | Required<br>(exactly 1) | The list of ways the block template may be changed
→ →<br>Value | string | Required<br>(0 or more) | A way the block template may be changed, e.g. 'time', 'transactions', 'prevblock'
→<br>`noncerange` | string | Required<br>(exactly 1) | A range of valid nonces
→<br>`sigoplimit` | number | Required<br>(exactly 1) | The limit of sigops in blocks
→<br>`sizelimit` | number | Required<br>(exactly 1) | The limit of block size
→<br>`curtime` | number | Required<br>(exactly 1) | The current timestamp in seconds since epoch
→<br>`bits` | string | Required<br>(exactly 1) | The compressed target of next block
→<br>`previousbits` | string | Required<br>(exactly 1) | The compressed target of  the current highest block
→<br>`height` | number | Required<br>(exactly 1) | The height of the next block
→<br>`masternode` | array (objects) | Required<br>(0 or more) | Required masternode payments that must be included in the next block
→ →<br>Masternode Payee | object | Optional<br>(0 or more) | Object containing a masternode payee's information
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`masternode_payments_started` | boolean | Required<br>(exactly 1) | True if masternode payments started
→<br>`masternode_payments_enforced` | boolean | Required<br>(exactly 1) | True if masternode payments enforced
→<br>`superblock` | array (objects) | Required<br>(0 or more) | The superblock payees that must be included in the next block
→ →<br>Superblock Payee | object | Optional<br>(0 or more) | Object containing a superblock payee's information
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`superblocks_started` | boolean | Required<br>(exactly 1) | True if superblock payments started
→<br>`superblocks_enabled` | boolean | Required<br>(exactly 1) | True if superblock payments enabled
→<br>`coinbase_payload` | string | Required<br>(exactly 1) | _Added in Dash Core 0.13.0_<br><br>Coinbase transaction payload data encoded in hexadecimal

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet getblocktemplate
```

Result:

``` json
{
  "capabilities": [
    "proposal"
  ],
  "version": 536870920,
  "rules": [
    "csv",
    "dip0001",
    "bip147"
  ],
  "vbavailable": {
    "dip0003": 3
  },
  "vbrequired": 0,
  "previousblockhash": "0000000004dd4bf3ed4f4bac4a8f8c781a73bff32886390ec15fa0c5686476ac",
  "transactions": [
  ],
  "coinbaseaux": {
    "flags": ""
  },
  "coinbasevalue": 2089285715,
  "longpollid": "0000000004dd4bf3ed4f4bac4a8f8c781a73bff32886390ec15fa0c5686476ac4",
  "target": "000000000eeb4b00000000000000000000000000000000000000000000000000",
  "mintime": 1542118149,
  "mutable": [
    "time",
    "transactions",
    "prevblock"
  ],
  "noncerange": "00000000ffffffff",
  "sigoplimit": 40000,
  "sizelimit": 2000000,
  "curtime": 1542119335,
  "bits": "1c0eeb4b",
  "previousbits": "1c0e639b",
  "height": 263905,
  "masternode": [
    {
      "payee": "yedxgyCLu7BpxBbpeLUw4vAkxNrcEgHt57",
      "script": "76a914c8f2a948efe84e9d9795aa473c5afb6023d6c07488ac",
      "amount": 1044642850
    }
  ],
  "masternode_payments_started": true,
  "masternode_payments_enforced": true,
  "superblock": [
  ],
  "superblocks_started": true,
  "superblocks_enabled": true,
  "coinbase_payload": ""
}
```

*See also*

* [SetGenerate](/docs/core-api-ref-remote-procedure-calls-removed#section-setgenerate): was removed in Dash Core 0.12.3.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [SubmitBlock](/docs/core-api-ref-remote-procedure-calls-mining#section-submitblock): accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.
* [PrioritiseTransaction](/docs/core-api-ref-remote-procedure-calls-mining#section-prioritisetransaction): adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

# GetMiningInfo

The `getmininginfo` RPC returns various mining-related information.

*Parameters: none*

*Result---various mining-related information*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Various mining-related information
→<br>`blocks` | number (int) | Required<br>(exactly 1) | The height of the highest block on the local best block chain
→<br>`currentblocksize` | number (int) | Required<br>(exactly 1) | If generation was enabled since the last time this node was restarted, this is the size in bytes of the last block built by this node for header hash checking.  Otherwise, the value `0`
→<br>`currentblocktx` | number (int) | Required<br>(exactly 1) | If generation was enabled since the last time this node was restarted, this is the number of transactions in the last block built by this node for header hash checking.  Otherwise, this is the value `0`
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | If generation was enabled since the last time this node was restarted, this is the difficulty of the highest-height block in the local best block chain.  Otherwise, this is the value `0`
→<br>`errors` | string | Required<br>(exactly 1) | A plain-text description of any errors this node has encountered or detected.  If there are no errors, an empty string will be returned.  This is not related to the JSON-RPC `error` field
→<br>`genproclimit` | number (int) | Required<br>(exactly 1) | The processor limit for generation (-1 if no generation - see getgenerate or setgenerate calls).<br><br>*Removed in Bitcoin Core 0.13.0*
→<br>`networkhashps` | number (int) | Required<br>(exactly 1) | An estimate of the number of hashes per second the network is generating to maintain the current difficulty.  See the `getnetworkhashps` RPC for configurable access to this data
→<br>`pooledtx` | number (int) | Required<br>(exactly 1) | The number of transactions in the memory pool
→<br>`testnet` | bool | Required<br>(exactly 1) | Set to `true` if this node is running on testnet.  Set to `false` if this node is on mainnet or a regtest<br><br>*Removed in Bitcoin Core 0.14.0*
→<br>`chain` | string | Required<br>(exactly 1) | Set to `main` for mainnet, `test` for testnet, and `regtest` for regtest
→<br>`generate` | bool | Optional<br>(0 or 1) | Set to `true` if generation is currently enabled; set to `false` if generation is currently disabled.  Only returned if the node has wallet support enabled<br><br>*Removed in Bitcoin Core 0.13.0*

*Example from Dash Core 0.12.2*

``` bash
dash-cli getmininginfo
```

Result:

``` json
{
  "blocks": 8036,
  "currentblocksize": 0,
  "currentblocktx": 0,
  "difficulty": 0.8239043524175907,
  "errors": "",
  "genproclimit": 1,
  "networkhashps": 22234635.4469006,
  "pooledtx": 3,
  "testnet": true,
  "chain": "test",
  "generate": false
}
```

*See also*

* [GetMemPoolInfo](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getmempoolinfo): returns information about the node's current transaction memory pool.
* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.
* [Generate](/docs/core-api-ref-remote-procedure-calls-generating#section-generate): mines blocks immediately (before the RPC call returns).

# GetNetworkHashPS

The `getnetworkhashps` RPC returns the estimated network hashes per second based on the last n blocks.

*Parameter #1---number of blocks to average*

Name | Type | Presence | Description
--- | --- | --- | ---
`blocks` | number (int) | Optional<br>(0 or 1) | The number of blocks to average together for calculating the estimated hashes per second.  Default is `120`.  Use `-1` to average all blocks produced since the last difficulty change

*Parameter #2---block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | number (int) | Optional<br>(0 or 1) | The height of the last block to use for calculating the average.  Defaults to `-1` for the highest-height block on the local best block chain.  If the specified height is higher than the highest block on the local best block chain, it will be interpreted the same as `-1`

*Result---estimated hashes per second*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The estimated number of hashes per second based on the parameters provided.  May be 0 (for Height=`0`, the genesis block) or a negative value if the highest-height block averaged has a block header time earlier than the lowest-height block averaged

*Example from Dash Core 0.12.2*

Get the average hashes per second for all the blocks since the last
difficulty change before block 6000.

``` bash
dash-cli -testnet getnetworkhashps -1 6000
```

Result:

``` json
22214011.90821117
```

*See also*

* [GetDifficulty](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getdifficulty): returns the proof-of-work difficulty as a multiple of the minimum difficulty.
* [GetBlock](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.

# PrioritiseTransaction

The `prioritisetransaction` RPC adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

*Parameter #1---the TXID of the transaction to modify*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string | Required<br>(exactly 1) | The TXID of the transaction whose virtual priority or fee you want to modify, encoded as hex in RPC byte order

*Parameter #2---the change to make to the virtual fee*

Name | Type | Presence | Description
--- | --- | --- | ---
Fee | number (int) | Required<br>(exactly 1) | **Warning:** this value is in duffs, not Dash<br><br>If positive, the virtual fee to add to the actual fee paid by the transaction; if negative, the virtual fee to subtract from the actual fee paid by the transaction.  No change is made to the actual fee paid by the transaction

*Result---`true` if the priority is changed*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool (true only) | Required<br>(exactly 1) | Always set to `true` if all three parameters are provided.  Will not return an error if the TXID is not in the memory pool.  If fewer or more than three arguments are provided, or if something goes wrong, will be set to `null`

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet prioritisetransaction \
    f86c74f27fdd9c7e618d69b3606eeae1710b3f02fabede6ae8c88dd7bb756942 \
    456789
```

Result:

``` json
true
```

*See also*

* [GetRawMemPool](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.

# SubmitBlock

The `submitblock` RPC accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.

*Parameter #1---the new block in serialized block format as hex*

Name | Type | Presence | Description
--- | --- | --- | ---
Block | string (hex) | Required<br>(exactly 1) | The full block to submit in serialized block format as hex

*Parameter #2---dummy value*

Name | Type | Presence | Description
--- | --- | --- | ---
`dummy` | object | Optional<br>(0 or 1) | A dummy value for compatibility with BIP22. This value is ignored.

*Result---`null` or error string*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null/string | Required<br>(exactly 1) | If the block submission succeeded, set to JSON `null`.  If submission failed, set to one of the following strings: `duplicate`, `duplicate-invalid`, `inconclusive`, or `rejected`.  The JSON-RPC `error` field will still be set to `null` if submission failed for one of these reasons

*Example from Dash Core 0.14.1*

Submit the following block with the a dummy value, "test".

``` bash
dash-cli -testnet submitblock 0100002032e3965d5fdd7a883209d516599337eb4cb82f\
  7aea22ecc114942c1f00000000244388a3bd2c38a85bf337755a1a165d0df2b335e3886058\
  40e08a3cdf1ce1a4297ede598f6a011d027c1c300201000000010000000000000000000000\
  000000000000000000000000000000000000000000ffffffff1202791f0e2f5032506f6f6c\
  2d74444153482fffffffff044d75bb8b010000001976a914d4a5ea2641e9dd37f7a5ad5c92\
  9df4743518769188acac2ea68f010000001976a9148d0934de58f969df3b53a72b4f47211d\
  890ebf5588ac68b9ea03000000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b9\
  80e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d\
  7281bdc9430f35ac00000000000000002a6a28f47e935509fc85533dc78197e93e87d1c793\
  43bda495429d8e3680069f6a22780000000002000000000000000100000001078e0c77e3b0\
  4323d0834841f965543aaae2b275f684f55fbaf22e1c83bff97e010000006a473044022077\
  6e96d202cc4f50f79d269d7cd36712c7486282dda0cb6eae583c916c98b34c022070941efb\
  3201cf500cc6b879d6570fc477d4c3e6a8d91286e84465235f542c42012102dddbfc3fe06b\
  96e3a36f3e815222cd1cb9586b3193c4a0de030477f621956d51feffffff02a00bd1000000\
  00001976a914d7b47d4b40a23c389f5a17754d7f60f511c7d0ec88ac316168821300000019\
  76a914c9190e507834b78a624d7578f1ad3819592ca1aa88ac771f0000 \
  "test"
```

Result (the block above was already on a local block chain):

``` text
duplicate
```

*See also*

* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.

>>>>>>>> Network RPCs

# AddNode

The `addnode` RPC attempts to add or remove a node from the addnode list, or to try a connection to a node once.

*Parameter #1---hostname/IP address and port of node to add or remove*

Name | Type | Presence | Description
--- | --- | --- | ---
`node` | string | Required<br>(exactly 1) | The node to add as a string in the form of `<IP address>:<port>`.

*Parameter #2---whether to add or remove the node, or to try only once to connect*

Name | Type | Presence | Description
--- | --- | --- | ---
`command` | string | Required<br>(exactly 1) | What to do with the IP address above.  Options are:<br>• `add` to add a node to the addnode list.  Up to 8 nodes can be added additional to the default 8 nodes. Not limited by `-maxconnections`<br>• `remove` to remove a node from the list.  If currently connected, this will disconnect immediately<br>• `onetry` to immediately attempt connection to the node even if the outgoing connection slots are full; this will only attempt the connection once

*Result---`null` plus error on failed remove*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always JSON `null` whether the node was added, removed, tried-and-connected, or tried-and-not-connected.  The JSON-RPC error field will be set only if you try adding a node that was already added or removing a node that is not on the addnodes list

*Example from Dash Core 0.12.2*

Try connecting to the following node.

``` bash
dash-cli -testnet addnode 192.0.2.113:19999 onetry
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [GetAddedNodeInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getaddednodeinfo): returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the `addnode` RPC will have their information displayed.

# ClearBanned

*Added in Bitcoin Core 0.12.0*

The `clearbanned` RPC clears list of banned nodes.

*Parameters: none*

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | JSON `null` when the list was cleared

*Example from Dash Core 0.12.2*

Clears the ban list.

``` bash
dash-cli clearbanned
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [ListBanned](/docs/core-api-ref-remote-procedure-calls-network#section-listbanned): lists all banned IPs/Subnets.
* [SetBan](/docs/core-api-ref-remote-procedure-calls-network#section-setban): attempts add or remove a IP/Subnet from the banned list.

# DisconnectNode

*Added in Bitcoin Core 0.12.0*

The `disconnectnode` RPC immediately disconnects from a specified node.

*Parameter #1---hostname/IP address and port of node to disconnect*

Name | Type | Presence | Description
--- | --- | --- | ---
`address` | string | Required<br>(exactly 1) | The node you want to disconnect from as a string in the form of `<IP address>:<port>`.<br><br>*Updated in Bitcoin Core 0.14.1*

*Parameter #2---nodeid*

Name | Type | Presence | Description
--- | --- | --- | ---
nodeid | number | Optional | The node ID (see `getpeerinfo` for node IDs)

*Result---`null` on success or error on failed disconnect*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | JSON `null` when the node was disconnected

*Example from Dash Core 0.14.1*

Disconnects following node by address.

``` bash
dash-cli -testnet disconnectnode 192.0.2.113:19999
```

Result (no output from `dash-cli` because result is set to `null`).

Disconnects following node by id.

``` bash
dash-cli -testnet disconnectnode "" 3
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [AddNode](/docs/core-api-ref-remote-procedure-calls-network#section-addnode): attempts to add or remove a node from the addnode list, or to try a connection to a node once.
* [GetAddedNodeInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getaddednodeinfo): returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the `addnode` RPC will have their information displayed.

# GetAddedNodeInfo

The `getaddednodeinfo` RPC returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the `addnode` RPC will have their information displayed.

Prior to Dash Core 0.12.3, this dummy parameter was required for historical purposes but not used:

*DEPRECATED Parameter #1---whether to display connection information*

Name | Type | Presence | Description
--- | --- | --- | ---
_Dummy_ | _bool_ | _Required<br>(exactly 1)_ | _Removed in Dash Core 0.12.3_

Beginning with Dash Core 0.12.3, this is the single (optional) parameter:

*Parameter #1---what node to display information about*

Name | Type | Presence | Description
--- | --- | --- | ---
`node` | string | Optional<br>(0 or 1) | The node to get information about in the same `<IP address>:<port>` format as the `addnode` RPC.  If this parameter is not provided, information about all added nodes will be returned

*Result---a list of added nodes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing objects describing each added node.  If no added nodes are present, the array will be empty.  Nodes added with `onetry` will not be returned
→<br>Added Node | object | Optional<br>(0 or more) | An object containing details about a single added node
→ →<br>`addednode` | string | Required<br>(exactly 1) | An added node in the same `<IP address>:<port>` format as used in the `addnode` RPC.
→ →<br>`connected` | bool | Optional<br>(0 or 1) | This will be set to `true` if the node is currently connected and `false` if it is not
→ →<br>`addresses` | array | Required<br>(exactly 1) | This will be an array of addresses belonging to the added node
→ → →<br>Address | object | Optional<br>(0 or more) | An object describing one of this node's addresses
→ → → →<br>`address` | string | Required<br>(exactly 1) | An IP address and port number of the node.  If the node was added using a DNS address, this will be the resolved IP address
→ → → →<br>`connected` | string | Required<br>(exactly 1) | Whether or not the local node is connected to this addnode using this IP address.  Valid values are:<br>• `false` for not connected<br>• `inbound` if the addnode connected to us<br>• `outbound` if we connected to the addnode

*Example from Dash Core 0.12.3*

``` bash
dash-cli getaddednodeinfo
```

Result (real hostname and IP address replaced with [RFC5737](http://tools.ietf.org/html/rfc5737) reserved address):

``` json
[
  {
    "addednode": "192.0.2.113:19999",
    "connected": true,
    "addresses": [
      {
        "address": "192.0.2.113:19999",
        "connected": "outbound"
      }
    ]
  }
]
```

*See also*

* [AddNode](/docs/core-api-ref-remote-procedure-calls-network#section-addnode): attempts to add or remove a node from the addnode list, or to try a connection to a node once.
* [GetPeerInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getpeerinfo): returns data about each connected network node.

# GetConnectionCount

The `getconnectioncount` RPC returns the number of connections to other nodes.

*Parameters: none*

*Result---the number of connections to other nodes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The total number of connections to other nodes (both inbound and outbound)

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getconnectioncount
{% endhighlight bash %}

Result:

{% highlight json %}
14
```

*See also*

* [GetNetTotals](/docs/core-api-ref-remote-procedure-calls-network#section-getnettotals): returns information about network traffic, including bytes in, bytes out, and the current time.
* [GetPeerInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getpeerinfo): returns data about each connected network node.
* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.

# GetNetTotals

The `getnettotals` RPC returns information about network traffic, including bytes in, bytes out, and the current time.

*Parameters: none*

*Result---the current bytes in, bytes out, and current time*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object containing information about the node's network totals
→<br>`totalbytesrecv` | number (int) | Required<br>(exactly 1) | The total number of bytes received since the node was last restarted
→<br>`totalbytessent` | number (int) | Required<br>(exactly 1) | The total number of bytes sent since the node was last restarted
→<br>`timemillis` | number (int) | Required<br>(exactly 1) | Unix epoch time in milliseconds according to the operating system's clock (not the node adjusted time)
→<br>`uploadtarget` | string : <br>object | Required<br>(exactly 1) | The upload target information
→ →<br>`timeframe` | number (int) | Required<br>(exactly 1) | Length of the measuring timeframe in seconds (currently set to `24` hours)
→ →<br>`target` | number (int) | Required<br>(exactly 1) | The maximum allowed outbound traffic in bytes (default is `0`).  Can be changed with `-maxuploadtarget`
→ →<br>`target_reached` | bool | Required<br>(exactly 1) | Indicates if the target is reached.  If the target is reached the node won't serve SPV and historical block requests anymore
→ →<br>`serve_historical_blocks` | bool | Required<br>(exactly 1) | Indicates if historical blocks are served
→ →<br>`bytes_left_in_cycle` | number (int) | Required<br>(exactly 1) | Amount of bytes left in current time cycle.  `0` is displayed if no upload target is set
→ →<br>`time_left_in_cycle` | number (int) | Required<br>(exactly 1) | Seconds left in current time cycle.  `0` is displayed if no upload target is set

*Example from Dash Core 0.12.2*

``` bash
dash-cli getnettotals
```

Result:

``` json
{
  "totalbytesrecv": 4661588,
  "totalbytessent": 2899423,
  "timemillis": 1507815162756,
  "uploadtarget": {
    "timeframe": 86400,
    "target": 0,
    "target_reached": false,
    "serve_historical_blocks": true,
    "bytes_left_in_cycle": 0,
    "time_left_in_cycle": 0
  }
}
```

*See also*

* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.
* [GetPeerInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getpeerinfo): returns data about each connected network node.

# GetNetworkInfo

The `getnetworkinfo` RPC returns information about the node's connection to the network.

*Parameters: none*

*Result---information about the node's connection to the network*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about this node's connection to the network
→<br>`version` | number | Required<br>(exactly 1) | This node's version of Dash Core in its internal integer format.  For example, Dash Core 0.12.2 has the integer version number 120200
→<br>`subversion` | string | Required<br>(exactly 1) | The user agent this node sends in its `version` message
→<br>`protocolversion` | number (int) | Required<br>(exactly 1) | The protocol version number used by this node.  See the [protocol versions section][section protocol versions] for more information
→<br>`localservices` | string (hex) | Required<br>(exactly 1) | The services supported by this node as advertised in its `version` message
→<br>`localrelay` | bool | Required<br>(exactly 1) | *Added in Bitcoin Core 0.13.0*<br><br>The services supported by this node as advertised in its `version` message
→<br>`timeoffset` | number (int) | Required<br>(exactly 1) | The offset of the node's clock from the computer's clock (both in UTC) in seconds.  The offset may be up to 4200 seconds (70 minutes)
→<br>`networkactive` | bool | Required<br>(exactly 1) | Set to `true` if P2P networking is enabled.  Set to `false` if P2P networking is disabled. Enabling/disabling done via [SetNetworkActive](/docs/core-api-ref-remote-procedure-calls-network#section-setnetworkactive)
→<br>`connections` | number (int) | Required<br>(exactly 1) | The total number of open connections (both outgoing and incoming) between this node and other nodes
→<br>`networks` | array | Required<br>(exactly 1) | An array with three objects: one describing the IPv4 connection, one describing the IPv6 connection, and one describing the Tor hidden service (onion) connection
→ →<br>Network | object | Optional<br>(0 to 3) | An object describing a network.  If the network is unroutable, it will not be returned
→ → →<br>`name` | string | Required<br>(exactly 1) | The name of the network.  Either `ipv4`, `ipv6`, or `onion`
→ → →<br>`limited` | bool | Required<br>(exactly 1) | Set to `true` if only connections to this network are allowed according to the `-onlynet` Dash Core command-line/configuration-file parameter.  Otherwise set to `false`
→ → →<br>`reachable` | bool | Required<br>(exactly 1) | Set to `true` if connections can be made to or from this network.  Otherwise set to `false`
→ → →<br>`proxy` | string | Required<br>(exactly 1) | The hostname and port of any proxy being used for this network.  If a proxy is not in use, an empty string
→ → →<br>`proxy_randomize_credentials` | bool | Required<br>(exactly 1) | *Added in Bitcoin Core 0.11.0*<br><br>Set to `true` if randomized credentials are set for this proxy. Otherwise set to `false`
→<br>`relayfee` | number (DASH) | Required<br>(exactly 1) | The minimum relay fee per kilobyte for transactions in order for this node to accept it into its memory pool
→<br>`incrementalfee` | number (DASH) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3*<br><br>The minimum fee increment for mempool limiting or BIP 125 replacement in DASH/kB
→<br>`localaddresses` | array | Required<br>(exactly 1) | An array of objects each describing the local addresses this node believes it listens on
→ →<br>Address | object | Optional<br>(0 or more) | An object describing a particular address this node believes it listens on
→ → →<br>`address` | string | Required<br>(exactly 1) | An IP address or .onion address this node believes it listens on.  This may be manually configured, auto detected, or based on `version` messages this node received from its peers
→ → →<br>`port` | number (int) | Required<br>(exactly 1) | The port number this node believes it listens on for the associated `address`.  This may be manually configured, auto detected, or based on `version` messages this node received from its peers
→ → →<br>`score` | number (int) | Required<br>(exactly 1) | The number of incoming connections during the uptime of this node that have used this `address` in their `version` message
→<br>`warnings` | string | Required<br>(exactly 1) | *Added in Bitcoin Core 0.11.0*<br><br>A plain-text description of any network warnings. If there are no warnings, an empty string will be returned.

*Example from Dash Core 0.12.3*

``` bash
dash-cli getnetworkinfo
```

Result (actual addresses have been replaced with [RFC5737](http://tools.ietf.org/html/rfc5737) reserved addresses):

``` json
{
  "version": 120300,
  "subversion": "/Dash Core:0.12.3/",
  "protocolversion": 70208,
  "localservices": "0000000000000005",
  "localrelay": true,
  "timeoffset": 0,
  "networkactive": true,
  "connections": 9,
  "networks": [
    {
      "name": "ipv4",
      "limited": false,
      "reachable": true,
      "proxy": "",
      "proxy_randomize_credentials": false
    },
    {
      "name": "ipv6",
      "limited": false,
      "reachable": true,
      "proxy": "",
      "proxy_randomize_credentials": false
    },
    {
      "name": "onion",
      "limited": true,
      "reachable": false,
      "proxy": "",
      "proxy_randomize_credentials": false
    }
  ],
  "relayfee": 0.00001000,
  "incrementalfee": 0.00001000,
  "localaddresses": [
    {
      "address": "192.0.2.113",
      "port": 19999,
      "score": 4
    }
  ],
  "warnings": ""
}

```

*See also*

* [GetPeerInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getpeerinfo): returns data about each connected network node.
* [GetNetTotals](/docs/core-api-ref-remote-procedure-calls-network#section-getnettotals): returns information about network traffic, including bytes in, bytes out, and the current time.
* [SetNetworkActive](/docs/core-api-ref-remote-procedure-calls-network#section-setnetworkactive): disables/enables all P2P network activity.

# GetPeerInfo

The `getpeerinfo` RPC returns data about each connected network node.

*Parameters: none*

*Result---information about each currently-connected network node*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each describing one connected node.  If there are no connections, the array will be empty
→<br>Node | object | Optional<br>(0 or more) | An object describing a particular connected node
→ →<br>`id` | number (int) | Required<br>(exactly 1) | The node's index number in the local node address database
→ →<br>`addr` | string | Required<br>(exactly 1) | The IP address and port number used for the connection to the remote node
→ →<br>`addrlocal` | string | Optional<br>(0 or 1) | Our IP address and port number according to the remote node.  May be incorrect due to error or lying.  Most SPV nodes set this to `127.0.0.1:9999`
→ →<br>`addrbind` | string | Optional<br>(0 or 1) | Bind address of the connection to the peer
→ →<br>`services` | string (hex) | Required<br>(exactly 1) | The services advertised by the remote node in its `version` message
→ →<br>`lastsend` | number (int) | Required<br>(exactly 1) | The Unix epoch time when we last successfully sent data to the TCP socket for this node
→ →<br>`lastrecv` | number (int) | Required<br>(exactly 1) | The Unix epoch time when we last received data from this node
→ →<br>`bytessent` | number (int) | Required<br>(exactly 1) | The total number of bytes we've sent to this node
→ →<br>`bytesrecv` | number (int) | Required<br>(exactly 1) | The total number of bytes we've received from this node
→ →<br>`conntime` | number (int) | Required<br>(exactly 1) | The Unix epoch time when we connected to this node
→ →<br>`timeoffset` | number (int) | Required<br>(exactly 1) | *Added in Bitcoin Core 0.12.0*<br><br>The time offset in seconds
→ →<br>`pingtime` | number (real) | Required<br>(exactly 1) | The number of seconds this node took to respond to our last P2P `ping` message
→ →<br>`minping` | number (real) | Optional<br>(0 or 1) | *Updated in Bitcoin Core 0.13.0*<br><br>The minimum observed ping time (if any at all)
→ →<br>`pingwait` | number (real) | Optional<br>(0 or 1) | The number of seconds we've been waiting for this node to respond to a P2P `ping` message.  Only shown if there's an outstanding `ping` message
→ →<br>`version` | number (int) | Required<br>(exactly 1) | The protocol version number used by this node.  See the [protocol versions section][section protocol versions] for more information
→ →<br>`subver` | string | Required<br>(exactly 1) | The user agent this node sends in its `version` message.  This string will have been sanitized to prevent corrupting the JSON results.  May be an empty string
→ →<br>`inbound` | bool | Required<br>(exactly 1) | Set to `true` if this node connected to us (inbound); set to `false` if we connected to this node (outbound)
→ →<br>`addnode` | bool | Required<br>(exactly 1) | Set to `true` if this node was added via the `addnode` RPC.
→ →<br>`startingheight` | number (int) | Required<br>(exactly 1) | The height of the remote node's block chain when it connected to us as reported in its `version` message
→ →<br>`banscore` | number (int) | Required<br>(exactly 1) | The ban score we've assigned the node based on any misbehavior it's made.  By default, Dash Core disconnects when the ban score reaches `100`
→ →<br>`synced_headers` | number (int) | Required<br>(exactly 1) | The highest-height header we have in common with this node based the last P2P `headers` message it sent us.  If a `headers` message has not been received, this will be set to `-1`
→ →<br>`synced_blocks` | number (int) | Required<br>(exactly 1) | The highest-height block we have in common with this node based on P2P `inv` messages this node sent us.  If no block `inv` messages have been received from this node, this will be set to `-1`
→ →<br>`inflight` | array | Required<br>(exactly 1) | An array of blocks which have been requested from this peer.  May be empty
→ → →<br>Blocks | number (int) | Optional<br>(0 or more) | The height of a block being requested from the remote peer
→ →<br>`whitelisted` | bool | Required<br>(exactly 1) | Set to `true` if the remote peer has been whitelisted; otherwise, set to `false`.  Whitelisted peers will not be banned if their ban score exceeds the maximum (100 by default).  By default, peers connecting from localhost are whitelisted
→ →<br>`bytessent_per_msg` | string : <br>object | Required<br>(exactly 1) | *Added in Bitcoin Core 0.13.0*<br><br>Information about total sent bytes aggregated by message type
→ → →<br>Message Type | number (int) | Required<br>(1 or more) | Total sent bytes aggregated by message type. One field for every used message type
→ →<br>`bytesrecv_per_msg` | string : <br>object | Required<br>(exactly 1) | *Added in Bitcoin Core 0.13.0*<br><br>Information about total received bytes aggregated by message type
→ → →<br>Message Type | number (int) | Required<br>(1 or more) | Total received bytes aggregated by message type. One field for every used message type

*Example from Dash Core 0.12.2*

``` bash
dash-cli getpeerinfo
```

Result (edited to show only a single entry, with IP addresses changed to
[RFC5737](http://tools.ietf.org/html/rfc5737) reserved IP addresses):

``` json
[
  {
    "id": 3,
    "addr": "192.0.2.113:19999",
    "addrlocal": "127.0.0.1:56332",
    "addrbind": "192.168.10.111:56332",
    "services": "0000000000000005",
    "relaytxes": true,
    "lastsend": 1507818327,
    "lastrecv": 1507818327,
    "bytessent": 844135,
    "bytesrecv": 887651,
    "conntime": 1507808575,
    "timeoffset": 0,
    "pingtime": 0.113646,
    "minping": 0.106826,
    "version": 70215,
    "subver": "/Dash Core:0.14.0.3/",
    "inbound": false,
    "addnode": false,
    "startingheight": 159292,
    "banscore": 0,
    "synced_headers": 159350,
    "synced_blocks": 159350,
    "inflight": [
    ],
    "whitelisted": false,
    "bytessent_per_msg": {
      "addr": 55,
      "dsq": 69530,
      "getaddr": 24,
      "getdata": 9224,
      "getheaders": 989,
      "getsporks": 24,
      "govsync": 66,
      "headers": 6148,
      "inv": 837,
      "ping": 1856,
      "pong": 1856,
      "qsendrecsigs": 25,
      "sendcmpct": 33,
      "senddsq": 25,
      "sendheaders": 24,
      "tx": 5808,
      "verack": 24,
      "version": 160
    },
    "bytesrecv_per_msg": {
      "*other*": 25,
      "addr": 17362,
      "clsig": 3276,
      "getdata": 122,
      "getheaders": 989,
      "headers": 5300,
      "inv": 24611,
      "islock": 3249,
      "mnauth": 152,
      "ping": 1856,
      "pong": 1856,
      "qsigrec": 16492,
      "sendcmpct": 33,
      "senddsq": 25,
      "sendheaders": 24,
      "spork": 2090,
      "ssc": 32,
      "tx": 11523,
      "verack": 24,
      "version": 162
    }
  }
]
```

*See also*

* [GetAddedNodeInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getaddednodeinfo): returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the `addnode` RPC will have their information displayed.
* [GetNetTotals](/docs/core-api-ref-remote-procedure-calls-network#section-getnettotals): returns information about network traffic, including bytes in, bytes out, and the current time.
* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.

# ListBanned

*Added in Bitcoin Core 0.12.0*

The `listbanned` RPC lists all banned IPs/Subnets.

*Parameters: none*

*Result---information about each banned IP/Subnet*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An array of objects each describing one entry. If there are no entries in the ban list, the array will be empty
→<br>Node | object | Optional<br>(0 or more) | A ban list entry
→ →<br>`address` | string | Required<br>(exactly 1) | The IP/Subnet of the entry
→ →<br>`banned_until` | number<br>(int) | Required<br>(exactly 1) | The Unix epoch time when the entry was added to the ban list
→ →<br>`ban_created` | number<br>(int) | Required<br>(exactly 1) | The Unix epoch time until the IP/Subnet is banned
→ →<br>`ban_reason` | string | Required<br>(exactly 1) | Set to one of the following reasons:<br>• `node misbehaving` if the node was banned by the client because of DoS violations<br>• `manually added` if the node was manually banned by the user

*Examples from Dash Core 0.12.2*

The default (`false`):

``` bash
dash-cli listbanned
```

Result:

``` json
[
  {
    "address": "192.0.2.201/32",
    "banned_until": 1507906175,
    "ban_created": 1507819775,
    "ban_reason": "node misbehaving"
  },
  {
    "address": "192.0.2.101/32",
    "banned_until": 1507906199,
    "ban_created": 1507819799,
    "ban_reason": "manually added"
  }
]
```

*See also*

* [SetBan](/docs/core-api-ref-remote-procedure-calls-network#section-setban): attempts add or remove a IP/Subnet from the banned list.
* [ClearBanned](/docs/core-api-ref-remote-procedure-calls-network#section-clearbanned): clears list of banned nodes.

# Ping {#ping-rpc}

The `ping` RPC sends a P2P ping message to all connected nodes to measure ping time. Results are provided by the `getpeerinfo` RPC pingtime and pingwait fields as decimal seconds. The P2P `ping` message is handled in a queue with all other commands, so it measures processing backlog, not just network ping.

*Parameters: none*

*Result---`null`*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required | Always JSON `null`

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet ping
```

(Success: no result printed.)

Get the results using the `getpeerinfo` RPC:

``` bash
dash-cli -testnet getpeerinfo | grep ping
```

Results:

``` json
        "pingtime" : 0.11790800,
        "pingtime" : 0.22673400,
        "pingtime" : 0.16451900,
        "pingtime" : 0.12465200,
        "pingtime" : 0.13267900,
        "pingtime" : 0.23983300,
        "pingtime" : 0.16764700,
        "pingtime" : 0.11337300,
```

*See also*

* [GetPeerInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getpeerinfo): returns data about each connected network node.
* [P2P Ping Message][ping message]

# SetBan

*Added in Bitcoin Core 0.12.0*

The `setban` RPC attempts add or remove a IP/Subnet from the banned list.

*Parameter #1---IP/Subnet of the node*

Name | Type | Presence | Description
--- | --- | --- | ---
IP(/Netmask) | string | Required<br>(exactly 1) | The node to add or remove as a string in the form of `<IP address>`.  The IP address may be a hostname resolvable through DNS, an IPv4 address, an IPv4-as-IPv6 address, or an IPv6 address

*Parameter #2---whether to add or remove the node*

Name | Type | Presence | Description
--- | --- | --- | ---
Command | string | Required<br>(exactly 1) | What to do with the IP/Subnet address above.  Options are:<br>• `add` to add a node to the addnode list<br>• `remove` to remove a node from the list.  If currently connected, this will disconnect immediately

*Parameter #3---time how long the ip is banned*

Name | Type | Presence | Description
--- | --- | --- | ---
Bantime | numeric<br>(int) | Optional<br>(0 or 1) | Time in seconds how long (or until when if `absolute` is set) the entry is banned. The default is 24h which can also be overwritten by the -bantime startup argument

*Parameter #4---whether a relative or absolute timestamp*

Name | Type | Presence | Description
--- | --- | --- | ---
Absolute | bool | Optional<br>(0 or 1) | If set, the bantime must be a absolute timestamp in seconds since epoch (Jan 1 1970 GMT)

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always JSON `null`

*Example from Dash Core 0.12.2*

Ban the following node.

``` bash
dash-cli -testnet setban 192.0.2.113 add 2592000
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [ListBanned](/docs/core-api-ref-remote-procedure-calls-network#section-listbanned): lists all banned IPs/Subnets.
* [ClearBanned](/docs/core-api-ref-remote-procedure-calls-network#section-clearbanned): clears list of banned nodes.

# SetNetworkActive

*Added in Bitcoin Core 0.14.0*

The `setnetworkactive` RPC disables/enables all P2P network activity.

*Parameter #1---whether to disable or enable all P2P network activity*

Name | Type | Presence | Description
--- | --- | --- | ---
Activate | bool | Required<br>(exactly 1) | Set to `true` to enable all P2P network activity. Set to `false` to disable all P2P network activity

*Result---`null` or error on failure*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | JSON `null`.  The JSON-RPC error field will be set only if you entered an invalid parameter

*Example from Dash Core 0.12.2*

``` bash
dash-cli setnetworkactive true
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.

>>>>>>>> Raw Transaction RPCs

# CombineRawTransaction

The `combinerawtransaction` RPC combine multiple partially signed transactions into one transaction.

The combined transaction may be another partially signed transaction or a
fully signed transaction.

*Parameter #1---txs*

Name | Type | Presence | Description
--- | --- | --- | ---
txs | string | Required | A json array of hex strings of partially signed transactions

*Result---hex-encoded raw transaction with signature(s)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(Exactly 1) | The resulting raw transaction in serialized transaction format encoded as hex.

*Example from Dash Core 0.14.1*

The following example shows a fully signed two input transaction being assembled
by combining two partially signed transactions. The first hex-encoded string is
the transaction with only the first input signed. The second hex-encoded string is
the transaction with only the second input signed.

``` bash
dash-cli combinerawtransaction '[
 "0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd769520010000006b483045022100f8770316327966fb1972338d14db8d38048455da8b62f6350b117c797cea459e02206c63c103cf53ce1d24a313b3e6853913fa14febafd733e683b6eb46a7beec0fa012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa79655267baa7c86a0100000000ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bcdb02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8a8f027d8a77cbdcb88ac00000000",
 "0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd7695200100000000ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa79655267baa7c86a010000006b4830450221008c3abc11ea84cc98cf674afc5b6d3d078d672768d289f2ab976ea4b2a49129fc022008470458b1b179800e7f5348196d510d2f147e69fe836c94135fc5c620312acd012102912ba98d6641f79864d04d41523167f5db267e45d1633e9243a0be7efb675719ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bcdb02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8a8f027d8a77cbdcb88ac00000000"
]'
```

Result:
``` bash
0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd7695\
20010000006b483045022100f8770316327966fb1972338d14db8d38048455da8b62f635\
0b117c797cea459e02206c63c103cf53ce1d24a313b3e6853913fa14febafd733e683b6e\
b46a7beec0fa012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5cc\
f7a7df77a9ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa796552\
67baa7c86a010000006b4830450221008c3abc11ea84cc98cf674afc5b6d3d078d672768\
d289f2ab976ea4b2a49129fc022008470458b1b179800e7f5348196d510d2f147e69fe83\
6c94135fc5c620312acd012102912ba98d6641f79864d04d41523167f5db267e45d1633e\
9243a0be7efb675719ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bc\
db02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8\
a8f027d8a77cbdcb88ac00000000
```

*See also:*

* [CreateRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.
* [DecodeRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction.
* [SignRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-signrawtransaction): signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.
* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.
* [Serialized Transaction Format][raw transaction format]

# CreateRawTransaction

The `createrawtransaction` RPC creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.

*Parameter #1---Inputs*

Name | Type | Presence | Description
--- | --- | --- | ---
Transactions | array | Required<br>(exactly 1) | An array of objects, each one to be used as an input to the transaction
→ Input | object | Required<br>(1 or more) | An object describing a particular input
→ →<br>`txid` | string (hex) | Required<br>(exactly 1) | The TXID of the outpoint to be spent encoded as hex in RPC byte order
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | The output index number (vout) of the outpoint to be spent; the first output in a transaction is index `0`
→ →<br>`Sequence` | number (int) | Optional<br>(0 or 1) | Added in Dash Core 0.12.3.0.<br><br>The sequence number to use for the input

*Parameter #2---P2PKH or P2SH addresses and amounts*

Name | Type | Presence | Description
--- | --- | --- | ---
Outputs | object | Required<br>(exactly 1) | The addresses and amounts to pay
→<br>Address/Amount | string : number (Dash) | Required<br>(1 or more) | A key/value pair with the address to pay as a string (key) and the amount to pay that address (value) in Dash
→<br>Data/Hex | data : hex | Required<br>(1 or more) | A key/value pair where the key is 'data' and the value is hex encoded data

*Parameter #3---locktime*

Name | Type | Presence | Description
--- | --- | --- | ---
Locktime | numeric (int) | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.12.0*<br><br>Indicates the earliest time a transaction can be added to the block chain

*Result---the unsigned raw transaction in hex*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(Exactly 1) | The resulting unsigned raw transaction in serialized transaction format encoded as hex.  If the transaction couldn't be generated, this will be set to JSON `null` and the JSON-RPC error field may contain an error message

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet createrawtransaction '''
  [
    {
      "txid": "061ec99eb641ffdeaa05a1a724a255103bebc445b15c6c8c028b19c08608496b",
      "vout" : 1
    }
  ]''' \
  '{"ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 800, "yY6AmGopsZS31wy1JLHR9P6AC6owFaXwuh":74.99}' '0'

```

Result (wrapped):

``` text
01000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e06\
0100000000ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3\
cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8ebb5b64486dc43400c0226b4\
28a488ac00000000
```

*See also*

* [CombineRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-combinerawtransaction): combine multiple partially signed transactions into one transaction.
* [DecodeRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction.
* [SignRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-signrawtransaction): signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.
* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.
* [Serialized Transaction Format][raw transaction format]

# DecodeRawTransaction

The `decoderawtransaction` RPC decodes a serialized transaction hex string into a JSON object describing the transaction.

*Parameter #1---serialized transaction in hex*

Name | Type | Presence | Description
--- | --- | --- | ---
Serialized Transaction | string (hex) | Required<br>(exactly 1) | The transaction to decode in serialized transaction format

*Result---the decoded transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing the decoded transaction, or JSON `null` if the transaction could not be decoded

{{INCLUDE_DECODE_RAW_TRANSACTION}}

*Example from Dash Core 0.13.0*

Decode a signed one-input, two-output transaction:

``` bash
dash-cli decoderawtransaction 02000000015d0b26079696875e9fc3cb480420aae3c8\
b1da628fbb14cc718066df7fe7c5fd010000006a47304402202cfa683981898ad9adb89534\
23a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee\
27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a\
82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000001976a914b02ae52066\
542b4aec5cf45c7cae3183d7bd322788ac00f90295000000001976a914252c9de3a0ebd5c9\
5886187b24969d4ccdb5576e88ac943d0000
```

Result:

``` json
{
  "txid": "f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7",
  "size": 225,
  "version": 2,
  "type": 0,
  "locktime": 15764,
  "vin": [
    {
      "txid": "fdc5e77fdf668071cc14bb8f62dab1c8e3aa200448cbc39f5e87969607260b5d",
      "vout": 1,
      "scriptSig": {
        "asm": "304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9[ALL] 03d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08",
        "hex": "47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08"
      },
      "sequence": 4294967294
    }
  ],
  "vout": [
    {
      "value": 12.79999774,
      "valueSat": 1279999774,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 b02ae52066542b4aec5cf45c7cae3183d7bd3227 OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "ycNwAN4DQ7Xnw5XLKg84SR4U1GE22FfLNQ"
        ]
      }
    },
    {
      "value": 25.00000000,
      "valueSat": 2500000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 252c9de3a0ebd5c95886187b24969d4ccdb5576e OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "yPi1JKw5fn8bMFsCCtnkGagogW6GXwGktZ"
        ]
      }
    }
  ],
  "instantlock": true
}
```

Decode a coinbase special transaction (CbTx):

``` bash
dash-cli decoderawtransaction 03000500010000000000000000000000000000000000\
000000000000000000000000000000ffffffff2703ae50011a4d696e656420627920416e74\
506f6f6c2021000b01201da9196f0000000007000000ffffffff02809e4730000000001976\
a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488\
a060bc2dfe05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b39\
960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f92\
45e20cfd5d830382ac634d434725ca6349ab5db920a3
```

Result:

``` json
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
  "instantlock_internal": false,
  "chainlock": false
}
```

*See also*

* [CombineRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-combinerawtransaction): combine multiple partially signed transactions into one transaction.
* [CreateRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.
* [SignRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-signrawtransaction): signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.
* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.

# DecodeScript

The `decodescript` RPC decodes a hex-encoded P2SH redeem script.

*Parameter #1---a hex-encoded redeem script*

Name | Type | Presence | Description
--- | --- | --- | ---
Redeem Script | string (hex) | Required<br>(exactly 1) | The redeem script to decode as a hex-encoded serialized script

*Result---the decoded script*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing the decoded script, or JSON `null` if the script could not be decoded
→<br>`asm` | string | Required<br>(exactly 1) | The redeem script in decoded form with non-data-pushing opcodes listed.  May be empty
→<br>`reqSigs` | number (int) | Optional<br>(0 or 1) | The number of signatures required; this is always `1` for P2PK or P2PKH within P2SH.  It may be greater than 1 for P2SH multisig.  This value will not be returned for `nonstandard` script types (see the `type` key above)
→<br>`type` | string | Optional<br>(0 or 1) | The type of script.  This will be one of the following:<br>• `pubkey` for a P2PK script inside P2SH<br>• `pubkeyhash` for a P2PKH script inside P2SH<br>• `multisig` for a multisig script inside P2SH<br>• `nonstandard` for unknown scripts
→<br>`addresses` | array | Optional<br>(0 or 1) | A P2PKH addresses used in this script, or the computed P2PKH addresses of any pubkeys in this script.  This array will not be returned for `nonstandard` script types
→ →<br>Address | string | Required<br>(1 or more) | A P2PKH address
→<br>`p2sh` | string (hex) | Required<br>(exactly 1) | The P2SH address of this redeem script

*Example from Dash Core 0.12.2*

A 2-of-3 P2SH multisig pubkey script:

``` bash
dash-cli -testnet decodescript 522102eacba539d92eb88d4e73bb32\
749d79f53f6e8d7947ac40a71bd4b26c13b6ec29210311f97539724e0de38fb1\
ff79f5148e5202459d06ed07193ab18c730274fd0d882103251f25a5c0291446\
d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d053ae
```

Result:

``` json
{
  "asm": "2 02eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29 0311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d88 03251f25a5c0291446d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d0 3 OP_CHECKMULTISIG",
  "reqSigs": 2,
  "type": "multisig",
  "addresses": [
    "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
    "yWAk1cDVvsRdPYjnzcFkySJux75yaCE7xz",
    "yVJj7TB3ZhMcSP2wo65ZFNqy23BQH9tT87"
  ],
  "p2sh": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW"
}
```

*See also*

* [CreateMultiSig](/docs/core-api-ref-remote-procedure-calls-utility#section-createmultisig): creates a P2SH multi-signature address.
* [Pay-To-Script-Hash (P2SH)][/en/glossary/p2sh-address]

﻿

# FundRawTransaction

*Requires wallet support.*

The `fundrawtransaction` RPC adds inputs to a transaction until it has enough in value to meet its out value.  This will not modify existing inputs, and will add one change output to the outputs.
Note that inputs which were signed may need to be resigned after completion since in/outputs have been added.  The inputs added will not be signed, use signrawtransaction for that.
All existing inputs must have their previous output transaction be in the wallet.

*Parameter #1---The hex string of the raw transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
Hexstring | string (hex) | Required<br>(exactly 1) | The hex string of the raw transaction

*Parameter #2---Additional options*

Note: For backwards compatibility, passing in a `true` instead of an object will result in {\"includeWatching\":true}\n"

Name | Type | Presence | Description
--- | --- | --- | ---
Options | Object | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.13.0*<br><br>Additional options
→ <br>`changeAddress` | string | Optional<br>(0 or 1) | The bitcoin address to receive the change. If not set, the address is chosen from address pool
→ <br>`changePosition` | nummeric (int) | Optional<br>(0 or 1) | The index of the change output. If not set, the change position is randomly chosen
`includeWatching` | bool | Optional<br>(0 or 1) | Inputs from watch-only addresses are also considered. The default is `false`
→ <br>`lockUnspent` | bool | Optional<br>(0 or 1) | The selected outputs are locked after running the rpc call. The default is `false`
→ <br>`reserveChangeKey` | bool | Optional<br>(0 or 1) | *Deprecated and ignored in Dash Core 0.14.1*<br><br>Reserves the change output key from the keypool. The default is `true`. Before Bitcoin Core 0.14.0, the used keypool key was never marked as change-address key and directly returned to the keypool (leading to address reuse).
→ <br>`feeRate` | numeric (bitcoins) | Optional<br>(0 or 1) | The specific feerate  you are willing to pay(BTC per KB). If not set, the wallet determines the fee
→ <br>`subtractFeeFromOutputs` | array | Optional<br>(0 or 1) | A json array of integers. The fee will be equally deducted from the amount of each specified output. The outputs are specified by their zero-based index, before any change output is added.

- n: "→ →<br>Output index"
  t: numeric (int)
  p: Optional<br>(0 or more)
  d: "A output index number (vout) from which the fee should be subtracted.
  If multiple vouts are provided, the total fee will be divided by the
  numer of vouts listed and each vout will have that amount subtracted
  from it"

*Result---information about the created transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object including information about the created transaction
→ <br>hex | string (hex) | Required<br>(Exactly 1) | The resulting unsigned raw transaction in serialized transaction format encoded as hex
→ <br>fee | numeric (bitcoins) | Required<br>(Exactly 1) | Fee in BTC the resulting transaction pays
→ <br>changepos | numeric (int) | Required<br>(Exactly 1) | The position of the added change output, or `-1` if no change output was added

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet fundrawtransaction 01000000000100205fa012000000\
1976a914485485425fa99504ec1638ac4213f3cfc9f32ef388ac00000000

```

Result:

``` text
{
  "hex": "01000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e060100000000feffffff023e1207bf010000001976a914bd652a167e7ad674f7815dc549bea9c57a7f919b88ac00205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388ac00000000",
  "changepos": 0,
  "fee": 0.00000226
}
```

*See also*

* [CreateRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.
* [DecodeRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction.
* [SignRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-signrawtransaction): signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.
* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.
* [Serialized Transaction Format][raw transaction format]

﻿

# GetRawTransaction

The `getrawtransaction` RPC gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings.

Note: By default this function only works for mempool transactions. If the
`-txindex` option is enabled, it also works for blockchain transactions. For now,
it also works for transactions with unspent outputs although this feature is
deprecated.

{{reindexNote}}

*Parameter #1---the TXID of the transaction to get*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of the transaction to get, encoded as hex in RPC byte order

*Parameter #2---whether to get the serialized or decoded transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
Format | bool | Optional<br>(0 or 1) | *Updated in Dash Core 0.12.3 / Bitcoin Core 0.14.0*<br><br>Set to `false` (the default) to return the serialized transaction as hex.  Set to `true` to return a decoded transaction.  Before 0.12.3, use `0` and `1`, respectively

*Result (if transaction not found)---`null`*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the transaction wasn't found, the result will be JSON `null`.  This can occur because the transaction doesn't exist in the block chain or memory pool, or because it isn't part of the transaction index.  See the Dash Core `-help` entry for `-txindex`

*Result (if verbose=`false`)---the serialized transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | If the transaction was found, this will be the serialized transaction encoded as hex

*Result (if verbose=`true`)---the decoded transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | If the transaction was found, this will be an object describing it

{{INCLUDE_DECODE_RAW_TRANSACTION}}
→<br>`hex` | string (hex) | Required<br>(exactly 1) | The serialized, hex-encoded data for the provided `txid`
→<br>`blockhash` | string (hex) | Optional<br>(0 or 1) | If the transaction has been included in a block on the local best block chain, this is the hash of that block encoded as hex in RPC byte order
→<br>`height` | number (int) | Optional<br>(0 or 1) | The block height where the transaction was mined
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | If the transaction has been included in a block on the local best block chain, this is how many confirmations it has.  Otherwise, this is `0`
→<br>`time` | number (int) | Optional<br>(0 or 1) | If the transaction has been included in a block on the local best block chain, this is the block header time of that block (may be in the future)
→<br>`blocktime` | number (int) | Optional<br>(0 or 1) | This field is currently identical to the time field described above
→<br>`instantlock` | bool | Required<br>(exactly 1) | If set to `true`, this transaction is locked (by InstantSend or a ChainLock)
→<br>`instantlock_internal` | bool | Required<br>(exactly 1) | If set to `true`, this transaction has an InstantSend lock
→<br>`chainlock` | bool | Required<br>(exactly 1) | *Added in Dash Core 0.14.0*<br><br>If set to `true`, this transaction is in a block that is locked (not susceptible to a chain re-org)

*Examples from Dash Core 0.14.0*

A classical transaction in serialized transaction format:

``` bash
dash-cli getrawtransaction \
  f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7
```

Result (wrapped):

``` text
02000000015d0b26079696875e9fc3cb480420aae3c8b1da628fbb14cc718066\
df7fe7c5fd010000006a47304402202cfa683981898ad9adb8953423a38f7185\
ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee\
27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d17\
1f6236497a82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000\
001976a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac00f9029500\
0000001976a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac943d0000
```

Get the same transaction in JSON:

``` bash
dash-cli getrawtransaction \
f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7 \
1
```

Result:

``` json
{
  "txid": "f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7",
  "version": 2,
  "type": 0,
  "size": 225,
  "locktime": 15764,
  "vin": [
    {
      "txid": "fdc5e77fdf668071cc14bb8f62dab1c8e3aa200448cbc39f5e87969607260b5d",
      "vout": 1,
      "scriptSig": {
        "asm": "304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9[ALL] 03d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08",
        "hex": "47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08"
      },
      "value": 37.80000000,
      "valueSat": 3780000000,
      "address": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
      "sequence": 4294967294
    }
  ],
  "vout": [
    {
      "value": 12.79999774,
      "valueSat": 1279999774,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 b02ae52066542b4aec5cf45c7cae3183d7bd3227 OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "ycNwAN4DQ7Xnw5XLKg84SR4U1GE22FfLNQ"
        ]
      },
      "spentTxId": "85b40136f077cded9587022645fde82389e2f01b0bec697d8cd22ccab930f3d3",
      "spentIndex": 19,
      "spentHeight": 20631
    },
    {
      "value": 25.00000000,
      "valueSat": 2500000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_DUP OP_HASH160 252c9de3a0ebd5c95886187b24969d4ccdb5576e OP_EQUALVERIFY OP_CHECKSIG",
        "hex": "76a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac",
        "reqSigs": 1,
        "type": "pubkeyhash",
        "addresses": [
          "yPi1JKw5fn8bMFsCCtnkGagogW6GXwGktZ"
        ]
      },
      "spentTxId": "90aa8902dbab71c07a5ac06dfe45c5e5fa1f032788b5f916951d0969c9feef39",
      "spentIndex": 1,
      "spentHeight": 24630
    }
  ],
  "hex": "02000000015d0b26079696875e9fc3cb480420aae3c8b1da628fbb14cc718066df7fe7c5fd010000006a47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000001976a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac00f90295000000001976a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac943d0000",
  "blockhash": "0000000005f395d62a40ef9f2a13000bd4076e2131c8671db8333a5b31e4403f",
  "height": 15765,
  "confirmations": 153657,
  "time": 1546278750,
  "blocktime": 1546278750,
  "instantlock": true,
  "instantlock_internal": false,
  "chainlock": true
}
```

A special transaction (CbTx) in serialized transaction format:

``` bash
dash-cli getrawtransaction \
  25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56
```

Result (wrapped):

``` text
030005000100000000000000000000000000000000000000000000000000000000000\
00000ffffffff2703ae50011a4d696e656420627920416e74506f6f6c2021000b0120\
1da9196f0000000007000000ffffffff02809e4730000000001976a914cbd7bfcc503\
51180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe\
05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b3996088\
7bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f92\
45e20cfd5d830382ac634d434725ca6349ab5db920a3
```

Get the same transaction in JSON:

``` bash
dash-cli getrawtransaction \
25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56 \
1
```

Result:

``` json
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
      },
      "spentTxId": "1790b286922d1a439bdc056939bc902a222f9d66ee63d8427805617eedf835bd",
      "spentIndex": 83,
      "spentHeight": 94680
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
  "hex": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff2703ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000ffffffff02809e4730000000001976a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3",
  "blockhash": "00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b",
  "height": 86190,
  "confirmations": 83233,
  "time": 1556114577,
  "blocktime": 1556114577,
  "instantlock": true,
  "instantlock_internal": false,
  "chainlock": true
}
```

*See also*

* [GetSpecialTxes](/docs/core-api-ref-remote-procedure-calls-blockchain#section-getspecialtxes): returns an array of special transactions found in the specified block
* [GetTransaction](/docs/core-api-ref-remote-procedure-calls-wallet#section-gettransaction): gets detailed information about an in-wallet transaction.

# SendRawTransaction

The `sendrawtransaction` RPC validates a transaction and broadcasts it to the peer-to-peer network.

*Parameter #1---a serialized transaction to broadcast*

Name | Type | Presence | Description
--- | --- | --- | ---
Transaction | string (hex) | Required<br>(exactly 1) | The serialized transaction to broadcast encoded as hex

*Parameter #2--whether to allow high fees*

Name | Type | Presence | Description
--- | --- | --- | ---
Allow High Fees | bool | Optional<br>(0 or 1) | Set to `true` to allow the transaction to pay a high transaction fee.  Set to `false` (the default) to prevent Bitcoin Core from broadcasting the transaction if it includes a high fee.  Transaction fees are the sum of the inputs minus the sum of the outputs, so this high fees check helps ensures user including a change address to return most of the difference back to themselves

*Parameter #3--whether to use InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
Use InstantSend | bool | Optional<br>(0 or 1) | *Depcrecated and ignored since Dash Core 0.14.1*

*Result---a TXID or error message*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null/string (hex) | Required<br>(exactly 1) | If the transaction was accepted by the node for broadcast, this will be the TXID of the transaction encoded as hex in RPC byte order.  If the transaction was rejected by the node, this will set to `null`, the JSON-RPC error field will be set to a code, and the JSON-RPC message field may contain an informative error message

*Examples from Dash Core 0.12.2*

Broadcast a signed transaction:

``` bash
dash-cli -testnet sendrawtransaction 01000000016b490886c0198b\
028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e0601000000694630\
43022033a61c56fa0867ed67b76b023204a9dc0ee6b0d63305dc5f65fe943354\
45ff2f021f712f55399d5238fc7146497c431fc4182a1de0b96fc22716e0845f\
561d542e012102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71b\
d4b26c13b6ec29ffffffff0200205fa0120000001976a914485485425fa99504\
ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8\
ebb5b64486dc43400c0226b428a488ac00000000
```

Result:

``` text
2f124cb550d9967b81914b544dea3783de23e85d67a9816f9bada665ecfe1cd5
```

*See also*

* [CombineRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-combinerawtransaction): combine multiple partially signed transactions into one transaction.
* [CreateRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.
* [DecodeRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction.
* [SignRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-signrawtransaction): signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.

# SignRawTransaction

The `signrawtransaction` RPC signs a transaction in the serialized transaction format using private keys stored in the wallet or provided in the call.

*Parameter #1---the transaction to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
Transaction | string (hex | Required<br>(exactly 1) | The transaction to sign as a serialized transaction

*Parameter #2---unspent transaction output details*

Name | Type | Presence | Description
--- | --- | --- | ---
Dependencies | array | Optional<br>(0 or 1) | The previous outputs being spent by this transaction
→<br>Output | object | Optional<br>(0 or more) | An output being spent
→ →<br>`txid` | string (hex) | Required<br>(exactly 1) | The TXID of the transaction the output appeared in.  The TXID must be encoded in hex in RPC byte order
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | The index number of the output (vout) as it appeared in its transaction, with the first output being 0
→ →<br>`scriptPubKey` | string (hex) | Required<br>(exactly 1) | The output's pubkey script encoded as hex
→ →<br>`redeemScript` | string (hex) | Optional<br>(0 or 1) | If the pubkey script was a script hash, this must be the corresponding redeem script
→ →<br>`amount` | numeric | Required<br>(exactly 1) | The amount of Dash spent

*Parameter #3---private keys for signing*

Name | Type | Presence | Description
--- | --- | --- | ---
Private Keys | array | Optional<br>(0 or 1) | An array holding private keys.  If any keys are provided, only they will be used to sign the transaction (even if the wallet has other matching keys).  If this array is empty or not used, and wallet support is enabled, keys from the wallet will be used
→<br>Key | string (base58) | Required<br>(1 or more) | A private key in base58check format to use to create a signature for this transaction

*Parameter #4---signature hash type*

Name | Type | Presence | Description
--- | --- | --- | ---
SigHash | string | Optional<br>(0 or 1) | The type of signature hash to use for all of the signatures performed.  (You must use separate calls to the `signrawtransaction` RPC if you want to use different signature hash types for different signatures.  The allowed values are: `ALL`, `NONE`, `SINGLE`, `ALL|ANYONECANPAY`, `NONE|ANYONECANPAY`, and `SINGLE|ANYONECANPAY`

*Result---the transaction with any signatures made*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | The results of the signature
→<br>`hex` | string (hex) | Required<br>(exactly 1) | The resulting serialized transaction encoded as hex with any signatures made inserted.  If no signatures were made, this will be the same transaction provided in parameter #1
→<br>`complete` | bool | Required<br>(exactly 1) | The value `true` if transaction is fully signed; the value `false` if more signatures are required

*Example from Dash Core 0.12.2*

Sign the hex generated in the example section for the `createrawtransaction`
RPC:

``` bash
dash-cli -testnet signrawtransaction 01000000016b490886c0198b028c6c5cb14\
5c4eb3b1055a224a7a105aadeff41b69ec91e060100000000ffffffff0200205fa012000\
0001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001\
976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000
```

Result:

``` json
{
  "hex": "01000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e060100000069463043022033a61c56fa0867ed67b76b023204a9dc0ee6b0d63305dc5f65fe94335445ff2f021f712f55399d5238fc7146497c431fc4182a1de0b96fc22716e0845f561d542e012102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000",
  "complete": true
}
```

*See also*

* [CombineRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-combinerawtransaction): combine multiple partially signed transactions into one transaction.
* [CreateRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network.
* [DecodeRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction.
* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.

>>>>>>>> Utility RPCs

# CreateMultiSig

The `createmultisig` RPC creates a P2SH multi-signature address.

*Parameter #1---the number of signatures required*

Name | Type | Presence | Description
--- | --- | --- | ---
Required | number (int) | Required<br>(exactly 1) | The minimum (*m*) number of signatures required to spend this m-of-n multisig script

*Parameter #2---the full public keys, or addresses for known public keys*

Name | Type | Presence | Description
--- | --- | --- | ---
Keys Or Addresses | array | Required<br>(exactly 1) | An array of strings with each string being a public key or address
→<br>Key Or Address | string | Required<br>(1 or more) | A public key against which signatures will be checked.  If wallet support is enabled, this may be a P2PKH address belonging to the wallet---the corresponding public key will be substituted.  There must be at least as many keys as specified by the Required parameter, and there may be more keys

*Result---P2SH address and hex-encoded redeem script*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing the multisig address
→<br>`address` | string (base58) | Required<br>(exactly 1) | The P2SH address for this multisig redeem script
→<br>`redeemScript` | string (hex) | Required<br>(exactly 1) | The multisig redeem script encoded as hex

*Example from Dash Core 0.12.2*

Creating a 2-of-3 P2SH multisig address by mixing two P2PKH addresses and
one full public key:

``` bash
dash-cli -testnet createmultisig 2 '''
  [
    "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
    "0311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d88",
    "yVJj7TB3ZhMcSP2wo65ZFNqy23BQH9tT87"
  ]
'''
```

Result:

{%highlight json %}
{
  "address": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW",
  "redeemScript": "522102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29210311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d882103251f25a5c0291446d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d053ae"
}
{% endhighlight %}

*See also*

* [AddMultiSigAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-addmultisigaddress): adds a P2SH multisig address to the wallet.
* [DecodeScript](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decodescript): decodes a hex-encoded P2SH redeem script.
* [Pay-To-Script-Hash (P2SH)][/en/glossary/p2sh-address]

# EstimateFee

The `estimatefee` RPC estimates the transaction fee per kilobyte that needs to be paid for a transaction to begin confirmation within a certain number of blocks.

*Parameter #1---how many blocks the transaction may wait before being included*

Name | Type | Presence | Description
--- | --- | --- | ---
Blocks | number (int) | Required<br>(exactly 1) | The maximum number of blocks a transaction should have to wait before it is predicted to be included in a block. Has to be between 1 and 25 blocks

*Result---the fee the transaction needs to pay per kilobyte*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (Dash) | Required<br>(exactly 1) | The estimated fee the transaction should pay in order to be included within the specified number of blocks.  If the node doesn't have enough information to make an estimate, the value `-1` will be returned

*Examples from Dash Core 0.12.2*

``` bash
dash-cli estimatefee 6
```

Result:

``` json
0.00044345
```

Requesting data the node can't calculate (out of range):

``` bash
dash-cli estimatefee 100
```

Result:

``` json
-1
```

*See also*

* [SetTxFee](/docs/core-api-ref-remote-procedure-calls-wallet#section-settxfee): sets the transaction fee per kilobyte paid by transactions created by this wallet.

# EstimateSmartFee

The `estimatesmartfee` RPC estimates the transaction fee per kilobyte that needs to be paid for a transaction to begin confirmation within a certain number of blocks and returns the number of blocks for which the estimate is valid.

*Parameter #1---how many confirmations the transaction may wait before being included*

Name | Type | Presence | Description
--- | --- | --- | ---
conf_target | number (int) | Required<br>(exactly 1) | Confirmation target in blocks (1 - 1008)

*Parameter #2---estimate mode*

Name | Type | Presence | Description
--- | --- | --- | ---
estimate_mode | string | Optional<br>Default=<br>`CONSERVATIVE` | The fee estimate mode. Whether to return a more conservative estimate which also satisfies a longer history. A conservative estimate potentially returns a higher feerate and is more likely to be sufficient for the desired target, but is not as responsive to short term drops in the prevailing fee market.  Must be one of:<br>`UNSET` (defaults to `CONSERVATIVE`)<br>`ECONOMICAL`<br>`CONSERVATIVE`

*Result---the fee the transaction needs to pay per kilobyte*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | JSON Object containing estimate information
→<br>`feerate` | number (Dash) | Optional<br>(0 or 1) | The estimated fee the transaction should pay in order to be included within the specified number of blocks.  If the node doesn't have enough information to make an estimate, this field will not be returned
→<br>`error` | JSON array (strings) | Optional<br>(0 or 1) | Errors encountered during processing
→<br>`blocks` | number | Required<br>(exactly 1) | Block number where the estimate was found

*Examples from Dash Core 0.14.1*

``` bash
dash-cli estimatesmartfee 6
```

Result:

``` json
{
  "feerate": 0.00044345,
  "blocks": 6
}
```

Requesting data the node can't calculate (out of range):

``` bash
dash-cli estimatesmartfee 2
```

Result:

``` json
{
  "errors": [
    "Insufficient data or no feerate found"
  ],
  "blocks": 2
}
```

*See also*

* [SetTxFee](/docs/core-api-ref-remote-procedure-calls-wallet#section-settxfee): sets the transaction fee per kilobyte paid by transactions created by this wallet.

# SignMessageWithPrivKey

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The `signmessagewithprivkey` RPC signs a message with a given private key.

*Parameter #1---the private key to sign with*

Name | Type | Presence | Description
--- | --- | --- | ---
Private Key | string (base58) | Required<br>(exactly 1) | The private key to sign the message with encoded in base58check using wallet import format (WIF)

*Parameter #2---the message to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
Message | string | Required<br>(exactly 1) | The message to sign

*Result---the message signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base64) | Required<br>(exactly 1) | The signature of the message, encoded in base64.

*Example from Dash Core 0.12.3*

Sign a the message "Hello, World!" using the following private key:

``` bash
dash-cli signmessagewithprivkey cNKbZBqUCjuBRSnAJWwFWxKESJ5Lw\
G4uxBSJ1UeBNBGVRupFKr6S "Hello, World!"
```

Result:

``` text
IBx8jxFjutPlcZcFdQPlA2n/B4yTrYhH43qYJURKRj7LWhSD0ERE/nnRLOnXi/gwULUcqfqOKqnqkSvuJjlgEvc=
```

*See also*

* [SignMessage](/docs/core-api-ref-remote-procedure-calls-wallet#section-signmessage): signs a message with the private key of an address.
* [VerifyMessage](/docs/core-api-ref-remote-procedure-calls-utility#section-verifymessage): verifies a signed message.

# ValidateAddress

The `validateaddress` RPC returns information about the given Dash address.

*Parameter #1---a P2PKH or P2SH address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH or P2SH address to validate encoded in base58check format

*Result---information about the address*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the address
→<br>`isvalid` | bool | Required<br>(exactly 1) | Set to `true` if the address is a valid P2PKH or P2SH address; set to `false` otherwise
→<br>`address` | string (base58) | Optional<br>(0 or 1) | The Dash address given as parameter
→<br>`scriptPubKey` | string (hex) | Optional<br>(0 or 1) | The hex encoded scriptPubKey generated by the address
→<br>`ismine` | bool | Optional<br>(0 or 1) | Set to `true` if the address belongs to the wallet; set to false if it does not.  Only returned if wallet support enabled
→<br>`iswatchonly` | bool | Optional<br>(0 or 1) | Set to `true` if the address is watch-only.  Otherwise set to `false`.  Only returned if address is in the wallet
→<br>`isscript` | bool | Optional<br>(0 or 1) | Set to `true` if a P2SH address; otherwise set to `false`.  Only returned if the address is in the wallet
→<br>`script` | string | Optional<br>(0 or 1) | Only returned for P2SH addresses belonging to this wallet. This is the type of script:<br>• `pubkey` for a P2PK script inside P2SH<br>• `pubkeyhash` for a P2PKH script inside P2SH<br>• `multisig` for a multisig script inside P2SH<br>• `nonstandard` for unknown scripts
→<br>`hex` | string (hex) | Optional<br>(0 or 1) | Only returned for P2SH addresses belonging to this wallet.  This is the redeem script encoded as hex
→<br>`addresses` | array | Optional<br>(0 or 1) | Only returned for P2SH addresses belonging to the wallet.  A P2PKH addresses used in this script, or the computed P2PKH addresses of any pubkeys in this script.  This array will be empty for `nonstandard` script types
→ →<br>Address | string | Optional<br>(0 or more) | A P2PKH address
→<br>`sigsrequired` | number (int) | Optional<br>(0 or 1) | Only returned for multisig P2SH addresses belonging to the wallet.  The number of signatures required by this script
→<br>`pubkey` | string (hex) | Optional<br>(0 or 1) | The public key corresponding to this address.  Only returned if the address is a P2PKH address in the wallet
→<br>`iscompressed` | bool | Optional<br>(0 or 1) | Set to `true` if a compressed public key or set to `false` if an uncompressed public key.  Only returned if the address is a P2PKH address in the wallet
→<br>`account` | string | Optional<br>(0 or 1) | *Deprecated: will be removed in a later version of Bitcoin Core*<br><br>The account this address belong to.  May be an empty string for the default account.  Only returned if the address belongs to the wallet
→<br>`timestamp` | number (int) | Optional<br>(0 or 1) | *Added in Dash Core 0.12.3*<br><br>The creation time of the key if available in seconds since epoch (Jan 1 1970 GMT)
→<br>`hdkeypath` | string | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.13.0*<br><br>The HD keypath if the key is HD and available
→<br>`hdmasterkeyid` | string (hash160) | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.13.0*<br><br>The Hash160 of the HD master public key

*Example from Dash Core 0.12.3*

Validate the following P2PKH address from the wallet:

``` bash
dash-cli validateaddress yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb
```

Result:

``` json
{
  "isvalid": true,
  "address": "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
  "scriptPubKey": "76a9141b767409bd8717b56cfcb00747811432ab1aa8a788ac",
  "ismine": true,
  "iswatchonly": false,
  "isscript": false,
  "pubkey": "02eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29",
  "iscompressed": true,
  "account": "Msig 1",
  "timestamp": 0
}
```

Validate the following P2SH multisig address from the wallet:

``` bash
dash-cli -testnet validateaddress 8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW
```

Result:

``` json
{
  "isvalid": true,
  "address": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW",
  "scriptPubKey": "a914a33155e490d146e656a9bac2cbee9c625ef42f0a87",
  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "script": "multisig",
  "hex": "522102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29210311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d882103251f25a5c0291446d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d053ae",
  "addresses": [
    "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
    "yWAk1cDVvsRdPYjnzcFkySJux75yaCE7xz",
    "yVJj7TB3ZhMcSP2wo65ZFNqy23BQH9tT87"
  ],
  "sigsrequired": 2,
  "account": "test account"
  "timestamp": 0
}
```

*See also*

* [ImportAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [GetNewAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.

# VerifyMessage

The `verifymessage` RPC verifies a signed message.

*Parameter #1---the address corresponding to the signing key*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH address corresponding to the private key which made the signature.  A P2PKH address is a hash of the public key corresponding to the private key which made the signature.  When the ECDSA signature is checked, up to four possible ECDSA public keys will be reconstructed from from the signature; each key will be hashed and compared against the P2PKH address provided to see if any of them match.  If there are no matches, signature validation will fail

*Parameter #2---the signature*

Name | Type | Presence | Description
--- | --- | --- | ---
Signature | string (base64) | Required<br>(exactly 1) | The signature created by the signer encoded as base-64 (the format output by the `signmessage` RPC)

*Parameter #3---the message*

Name | Type | Presence | Description
--- | --- | --- | ---
Message | string | Required<br>(exactly 1) | The message exactly as it was signed (e.g. no extra whitespace)

*Result: `true`, `false`, or an error*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | boolean | Required<br>(exactly 1) | Set to `true` if the message was signed by a key corresponding to the provided P2PKH address; set to `false` if it was not signed by that key; set to JSON `null` if an error occurred

*Example from Dash Core 0.12.2*

Check the signature on the message created in the example for
`signmessage`:

``` bash
dash-cli -testnet verifymessage \
  yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb \
  H4XULzfHCf16In2ECk9Ta9QxQPq639zQto2JA3OLlo3JbUdrClvJ89+A1z+Z9POd6l8LJhn1jGpQYF8mX4jkQvE= \
  'Hello, World!'
```

Result:

``` json
true
```

*See also*

* [SignMessage](/docs/core-api-ref-remote-procedure-calls-wallet#section-signmessage): signs a message with the private key of an address.

>>>>>>>> Wallet RPCs

# AbandonTransaction

*Added in Bitcoin Core 0.12.0*

The `abandontransaction` RPC marks an in-wallet transaction and all its in-wallet descendants as abandoned. This allows their inputs to be respent.

*Parameter #1---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of the transaction that you want to abandon.  The TXID must be encoded as hex in RPC byte order

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | JSON `null` when the transaction and all descendants were abandoned

*Example from Dash Core 0.12.2*

Abandons the transaction on your node.

``` bash
dash-cli abandontransaction fa3970c341c9f5de6ab13f128cbfec58d732e736a505fe32137ad551c799ecc4
```

Result (no output from `dash-cli` because result is set to `null`).

*See also*

* [SendRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network.

# AbortRescan

The `abortrescan` RPC Stops current wallet rescan

Stops current wallet rescan triggered e.g. by an `importprivkey` RPC call.

*Parameters: none*

*Result---`true` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | `true` when the command was successful or `false` if not successful.

*Example from Dash Core 0.14.1*

Abort the running wallet rescan

``` bash
dash-cli -testnet abortrescan
```

Result:
``` text
true
```

*See also: none*

# AddMultiSigAddress

*Requires wallet support.*

The `addmultisigaddress` RPC adds a P2SH multisig address to the wallet.

*Parameter #1---the number of signatures required*

Name | Type | Presence | Description
--- | --- | --- | ---
Required | number (int) | Required<br>(exactly 1) | The minimum (*m*) number of signatures required to spend this m-of-n multisig script

*Parameter #2---the full public keys, or addresses for known public keys*

Name | Type | Presence | Description
--- | --- | --- | ---
Keys Or Addresses | array | Required<br>(exactly 1) | An array of strings with each string being a public key or address
→<br>Key Or Address | string | Required<br>(1 or more) | A public key against which signatures will be checked.  Alternatively, this may be a P2PKH address belonging to the wallet---the corresponding public key will be substituted.  There must be at least as many keys as specified by the Required parameter, and there may be more keys

*Parameter #3---the account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Optional<br>(0 or 1) | The account name in which the address should be stored.  Default is the default account, \\" (an empty string)"

*Result---a P2SH address printed and stored in the wallet*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | The P2SH multisig address.  The address will also be added to the wallet, and outputs paying that address will be tracked by the wallet

*Example from Dash Core 0.12.2*

Adding a 2-of-3 P2SH multisig address to the "test account" by mixing
two P2PKH addresses and one full public key:

``` bash
dash-cli -testnet addmultisigaddress 2 '''
  [
    "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
    "0311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d88",
    "yVJj7TB3ZhMcSP2wo65ZFNqy23BQH9tT87"
  ]
''' \
 'test account'
```

Result:

``` text
8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW
```

(New P2SH multisig address also stored in wallet.)

*See also*

* [CreateMultiSig](/docs/core-api-ref-remote-procedure-calls-utility#section-createmultisig): creates a P2SH multi-signature address.
* [DecodeScript](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-decodescript): decodes a hex-encoded P2SH redeem script.
* [Pay-To-Script-Hash (P2SH)][/en/glossary/p2sh-address]

# BackupWallet

*Requires wallet support.*

The `backupwallet` RPC safely copies `wallet.dat` to the specified file, which can be a directory or a path with filename.

*Parameter #1---destination directory or filename*

Name | Type | Presence | Description
--- | --- | --- | ---
Destination | string | Required<br>(exactly 1) | A filename or directory name.  If a filename, it will be created or overwritten.  If a directory name, the file `wallet.dat` will be created or overwritten within that directory

*Result---`null` or error*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always `null` whether success or failure.  The JSON-RPC error and message fields will be set if a failure occurred

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet backupwallet /tmp/backup.dat
```

*See also*

* [DumpWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-dumpwallet): creates or overwrites a file with all wallet keys in a human-readable format.
* [ImportWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-importwallet): imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

# DumpHDInfo

The `dumphdinfo` RPC returns an object containing sensitive private info about this HD wallet

*Parameters: none*

*Result---HD wallet information*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | An object containing sensitive private info about this HD wallet.
→ <br>`hdseed` | string | Required<br>(exactly 1) | The BIP-32 HD seed (in hex)
→ <br>`mnemonic` | string | Required<br>(exactly 1) | The BIP-39 mnemonic for this HD wallet (English words)
→ <br>`mnemonicpassphrase` | string | Required<br>(exactly 1) | The BIP-39 mnemonic passphrase for this HD wallet (may be empty)

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet dumphdinfo
```

Result (truncated for security reasons):
``` json
{
  "hdseed": "20c63c3fb298ebd52de3 ...",
  "mnemonic": "cost circle shiver ...",
  "mnemonicpassphrase": ""
}
```

*See also: none*

# DumpPrivKey

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `dumpprivkey` RPC returns the wallet-import-format (WIP) private key corresponding to an address. (But does not remove it from the wallet.)

*Parameter #1---the address corresponding to the private key to get*

Name | Type | Presence | Description
--- | --- | --- | ---
P2PKH Address | string (base58) | Required<br>(exactly 1) | The P2PKH address corresponding to the private key you want returned.  Must be the address corresponding to a private key in this wallet

*Result---the private key*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | The private key encoded as base58check using wallet import format

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet dumpprivkey ycBuREgSskHHkWLxDa9A5WppCki6PfFycL
```

Result:

``` text
cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw
```

*See also*

* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [DumpWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-dumpwallet): creates or overwrites a file with all wallet keys in a human-readable format.

# DumpWallet

*Requires wallet support.  Requires an unlocked wallet or an unencrypted
wallet.*

The `dumpwallet` RPC creates or overwrites a file with all wallet keys in a human-readable format.

*Parameter #1---a filename*

Name | Type | Presence | Description
--- | --- | --- | ---
Filename | string | Required<br>(exactly 1) | The file in which the wallet dump will be placed.  May be prefaced by an absolute file path.  An existing file with that name will be overwritten

*Result---information about exported wallet*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing dumped wallet file
→<br>`dashcoreversion` | string | Required<br>(exactly 1) | Dash Core build details
→<br>`lastblockheight` | int | Required<br>(exactly 1) | Height of the most recent block received
→<br>`lastblockhash` | string (hex) | Required<br>(exactly 1) | Hash of the most recent block received
→<br>`lastblocktime` | string | Required<br>(exactly 1) | Timestamp of the most recent block received
→<br>`keys` | int | Required<br>(exactly 1) | Number of keys dumped
→<br>`file` | string | Required<br>(exactly 1) | Name of the file the wallet was dumped to
→<br>`warning` | string | Required<br>(exactly 1) | Warning to not share the file due to it containing the private keys

*Example from Dash Core 0.13.0*

Create a wallet dump and then print its first 10 lines.

``` bash
dash-cli -testnet dumpwallet /tmp/dump.txt
head /tmp/dump.txt
```

Results:

``` json
{
  "dashcoreversion": "v0.13.0.0",
  "lastblockheight": 250186,
  "lastblockhash": "0000000000a82fb1890de5da4740d0671910a436fe6fc4503a3e553adef073b4",
  "lastblocktime": "2018-10-23T12:50:44Z",
  "keys": 8135,
  "file": "/tmp/dump.txt",
  "warning": "/tmp/dump.txt file contains all private keys from this wallet. Do not share it with anyone!"
}
```

Results (the first 10 lines of the file):

``` bash
>>>>>>>> Wallet dump created by Dash Core v0.13.0.0
>>>>>>>> * Created on 2018-10-23T12:55:38Z
>>>>>>>> * Best block at time of backup was 250186 (0000000000a82fb1890de5da4740d0671910a436fe6fc4503a3e553adef073b4),
>>>>>>>>   mined on 2018-10-23T12:50:44Z

cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw 2017-11-28T18:21:36Z label=test%20label # addr=ycBuREgSskHHkWLxDa9A5WppCki6PfFycL
cTBRPnJoPjEMh67v1zes437v8Po5bFLDWKgEudTJMhVaLs1ZVGJe 2017-11-28T18:21:37Z reserve=1 # addr=yNsWkgPLN1u7p5dfWYnasYdgirU2J3tjUj
cRkkwrFnQUrih3QiT87sNy1AxyfjzqVYSyVYuL3qnJcSiQfE4QJa 2017-11-28T18:21:37Z reserve=1 # addr=yRkHzRbRKn8gBp5826mbaBvxLuBBNDVQg3
cQM7KoqQjHCCTrDhnfBEY1vpW9W65zRvaQeTb41UbFb6WX8Q8UkQ 2017-11-28T18:21:37Z reserve=1 # addr=yVEdefApUYiDLHApvvWCK5afTtJeQada8Y
cTGSKYaQTQabnjNSwCqpjYXiucVujTXiwp9dzmJV9cNAiayAJusi 2017-11-28T18:21:37Z reserve=1 # addr=ybQYgp21ZyZK8JuMLb2CVwG4TaWrXVXD5M
```

*See also*

* [BackupWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-backupwallet): safely copies `wallet.dat` to the specified file, which can be a directory or a path with filename.
* [ImportWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-importwallet): imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

# EncryptWallet

*Requires wallet support.*

The `encryptwallet` RPC encrypts the wallet with a passphrase.  This is only to enable encryption for the first time. After encryption is enabled, you will need to enter the passphrase to use private keys.

{{WARNING}} if using this RPC on the command line, remember
that your shell probably saves your command lines (including the value
of the passphrase parameter). In addition, there is no RPC to completely
disable encryption. If you want to return to an unencrypted wallet, you
must create a new wallet and restore your data from a backup made with
the `dumpwallet` RPC.

*Parameter #1---a passphrase*

Name | Type | Presence | Description
--- | --- | --- | ---
Passphrase | string | Required<br>(exactly 1) | The passphrase to use for the encrypted wallet.  Must be at least one character

*Result---a notice (with program shutdown)*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | A notice that the server is stopping and that you need to make a new backup.  The wallet is now encrypted

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet encryptwallet "test"
```

Result:

``` text
Wallet encrypted; Dash Core server stopping, restart to run with encrypted wallet.
The keypool has been flushed and a new HD seed was generated (if you are using
HD). You need to make a new backup.

```

*See also*

* [WalletPassphrase](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrase): stores the wallet decryption key in memory for the indicated number of seconds. Issuing the `walletpassphrase` command while the wallet is already unlocked will set a new unlock time that overrides the old one.
* [WalletLock](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletlock): removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call `walletpassphrase` again before being able to call any methods which require the wallet to be unlocked.
* [WalletPassphraseChange](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrasechange): changes the wallet passphrase from 'old passphrase' to 'new passphrase'.

# GetAccount

*Requires wallet support.*

The `getaccount` RPC returns the name of the account associated with the given address.

{{WARNING}} `setaccount` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---a Dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | A P2PKH or P2SH Dash address belonging either to a specific account or the default account (\\")"

*Result---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The name of an account, or an empty string (\\", the default account)"

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getaccount yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq
```

Result:

``` text
doc test
```

*See also*

* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.

# GetAccountAddress

*Requires wallet support.*

The `getaccountaddress` RPC returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address.

{{WARNING}} `getaccountaddress` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of an account.  Use an empty string (\\") for the default account.  If the account doesn't exist, it will be created"

*Result---a Dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | An address, belonging to the account specified, which has not yet received any payments

*Example from Dash Core 0.12.2*

Get an address for the default account:

``` bash
dash-cli -testnet getaccountaddress ""
```

Result:

``` text
yNUQ6RzTpNj5GP5ebdRcusJ7K9JJKx6VvV
```

*See also*

* [GetNewAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.
* [GetRawChangeAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getrawchangeaddress): returns a new Dash address for receiving change. This is for use with raw transactions, not normal use.
* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.

# GetAddressesByAccount

*Requires wallet support.*

The `getaddressesbyaccount` RPC returns a list of every address assigned to a particular account.

{{WARNING}} `getaddressesbyaccount` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---the account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of the account containing the addresses to get.  To get addresses from the default account, pass an empty string (\\")"

*Result---a list of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing all addresses belonging to the specified account.  If the account has no addresses, the array will be empty
Address | string (base58) | Optional<br>(1 or more) | A P2PKH or P2SH address belonging to the account

*Example from Dash Core 0.12.2*

Get the addresses assigned to the account "doc test":

``` bash
dash-cli -testnet getaddressesbyaccount "doc test"
```

Result:

``` json
[
  "yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq",
  "yhT2HS1SxvXkMVdAdf6RNtGPfuVFvwZi35"
]
```

*See also*

* [GetAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccount): returns the name of the account associated with the given address.
* [GetBalance](/docs/core-api-ref-remote-procedure-calls-wallet#section-getbalance): gets the balance in decimal dash across all accounts or for a particular account.

# GetBalance

*Requires wallet support.*

The `getbalance` RPC gets the balance in decimal dash across all accounts or for a particular account.

*Parameter #1---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Optional<br>(0 or 1) | *Deprecated: will be removed in a later version of Bitcoin Core*<br><br>The name of an account to get the balance for.  An empty string (\\") is the default account.  The string `*` will get the balance for all accounts (this is the default behavior)"

*Parameter #2---the minimum number of confirmations*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #3---whether to add the balance from transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions

*Parameter #4---whether to include watch-only addresses*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---the balance in dash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (dash) | Required<br>(exactly 1) | The balance of the account (or all accounts) in dash

*Examples from Dash Core 0.13.0*

Get the balance for the main ("") account, including transactions with
at least five confirmations and those spent to watch-only addresses in
that account. Do not include InstantSend locked transactions.

``` bash
dash-cli -testnet getbalance "" 3 false true
```

Result:

``` json
0.00000000
```

Get the balance for the main ("") account, including transactions with
at least one confirmation and those spent to watch-only addresses in
that account. Include the balance from InstantSend locked transactions.

``` bash
dash-cli -testnet getbalance "" 3 true true
```

Result:

``` json
1.00000000
```

*See also*

* [ListAccounts](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaccounts): lists accounts and their balances.
* [GetReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaccount): returns the total amount received by addresses in a particular account from transactions with the specified number of confirmations.  It does not count coinbase transactions.
* [GetReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaddress): returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.

# GetNewAddress

*Requires wallet support.*

The `getnewaddress` RPC returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.

*Parameter #1---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Optional<br>(0 or 1) | The name of the account to put the address in.  The default is the default account, an empty string (\\")"

*Result---a dash address never previously returned*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | A P2PKH address which has not previously been returned by this RPC.  The address will be marked as a receiving address in the wallet.  The address may already have been part of the keypool, so other RPCs such as the `dumpwallet` RPC may have disclosed it previously.  If the wallet is unlocked, its keypool will also be filled to its max (by default, 100 unused keys).  If the wallet is locked and its keypool is empty, this RPC will fail

*Example from Dash Core 0.12.2*

Create a new address in the "doc test" account:

``` bash
dash-cli -testnet getnewaddress "doc test"
```

Result:

``` text
yPuNTqCGzXtU3eEV5jHvhhJkzEPyJLmVkb
```

*See also*

* [GetAccountAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccountaddress): returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address.
* [GetRawChangeAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getrawchangeaddress): returns a new Dash address for receiving change. This is for use with raw transactions, not normal use.
* [GetBalance](/docs/core-api-ref-remote-procedure-calls-wallet#section-getbalance): gets the balance in decimal dash across all accounts or for a particular account.

# GetRawChangeAddress

*Requires wallet support.*

The `getrawchangeaddress` RPC returns a new Dash address for receiving change. This is for use with raw transactions, not normal use.

*Parameters: none*

*Result---a P2PKH address which can be used in raw transactions*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | A P2PKH address which has not previously been returned by this RPC.  The address will be removed from the keypool but not marked as a receiving address, so RPCs such as the `dumpwallet` RPC will show it as a change address.  The address may already have been part of the keypool, so other RPCs such as the `dumpwallet` RPC may have disclosed it previously.  If the wallet is unlocked, its keypool will also be filled to its max (by default, 100 unused keys).  If the wallet is locked and its keypool is empty, this RPC will fail

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getrawchangeaddress
```

Result:

``` text
yXBr9BiJmugTzHPgByDmvjJMAkvhTmXVJ8
```

*See also*

* [GetNewAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.
* [GetAccountAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccountaddress): returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address.

# GetReceivedByAccount

*Requires wallet support.*

The `getreceivedbyaccount` RPC returns the total amount received by addresses in a particular account from transactions with the specified number of confirmations.  It does not count coinbase transactions.

{{WARNING}} `getreceivedbyaccount` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---the account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of the account containing the addresses to get.  For the default account, use an empty string (\\")"

*Parameter #2---the minimum number of confirmations*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #3---whether to include transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions (default=false)

*Result---the number of dash received*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (dash) | Required<br>(exactly 1) | The number of dash received by the account.  May be `0`

*Example from Dash Core 0.12.2*

Get the dash received by the "doc test" account with six or more
confirmations:

``` bash
dash-cli -testnet getreceivedbyaccount "doc test" 6
```

Result:

``` json
0.30000000
```

*See also*

* [GetReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaddress): returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.
* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.
* [ListAccounts](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaccounts): lists accounts and their balances.

# GetReceivedByAddress

*Requires wallet support.*

{{WARNING_ICON}} Note: This RPC only returns a balance for addresses contained in the local wallet.

The `getreceivedbyaddress` RPC returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.

*Parameter #1---the address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string | Required<br>(exactly 1) | __Only works for addresses contained in the local wallet__<br><br>The address whose transactions should be tallied

*Parameter #2---the minimum number of confirmations*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #3---whether to include transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions

*Result---the amount of dash received*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (dash) | Required<br>(exactly 1) | The amount of dash received by the address, excluding coinbase transactions.  May be `0`

*Example from Dash Core 0.13.0*

Get the dash received for a particular address, only counting
transactions with six or more confirmations (ignore InstantSend locked transactions):

``` bash
dash-cli -testnet getreceivedbyaddress yYoCWcjbykWsQJ7MVJrTMeQd8TZe5N4Q7g 6
```

Result:

``` json
0.00000000
```

Get the dash received for a particular address, only counting
transactions with six or more confirmations (include InstantSend locked transactions):

``` bash
dash-cli -testnet getreceivedbyaddress yYoCWcjbykWsQJ7MVJrTMeQd8TZe5N4Q7g 6 true
```

Result:

``` json
0.30000000
```

*See also*

* [GetReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaccount): returns the total amount received by addresses in a particular account from transactions with the specified number of confirmations.  It does not count coinbase transactions.
* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.
* [ListAccounts](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaccounts): lists accounts and their balances.

# GetTransaction

*Requires wallet support.*

The `gettransaction` RPC gets detailed information about an in-wallet transaction.

*Parameter #1---a transaction identifier (TXID)*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string (hex) | Required<br>(exactly 1) | The TXID of the transaction to get details about.  The TXID must be encoded as hex in RPC byte order

*Parameter #2---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---a description of the transaction*

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing how the transaction affects the wallet
→<br>`amount` | number (dash) | Required<br>(exactly 1) | A positive number of dash if this transaction increased the total wallet balance; a negative number of dash if this transaction decreased the total wallet balance, or `0` if the transaction had no net effect on wallet balance
→<br>`fee` | number (dash) | Optional<br>(0 or 1) | If an outgoing transaction, this is the fee paid by the transaction reported as negative dash

{{INCLUDE_F_LIST_TRANSACTIONS_F_FULL}}
→<br>`DS` | bool | Optional<br>(0 or 1) | Set to 1 if a PrivateSend transaction
→<br>`details` | array | Required<br>(exactly 1) | An array containing one object for each input or output in the transaction which affected the wallet
→ → <br>`involvesWatchonly` | bool | Optional<br>(0 or 1) | Set to `true` if the input or output involves a watch-only address.  Otherwise not returned
→ →<br>`account` | string | Required<br>(exactly 1) | The account which the payment was credited to or debited from.  May be an empty string (\\") for the default account"
→ →<br>`address` | string (base58) | Optional<br>(0 or 1) | If an output, the address paid (may be someone else's address not belonging to this wallet).  If an input, the address paid in the previous output.  May be empty if the address is unknown, such as when paying to a non-standard pubkey script
→ →<br>`category` | string | Required<br>(exactly 1) | Set to one of the following values:<br>• `send` if sending payment normally<br>• `privatesend` if sending PrivateSend payment<br>• `receive` if this wallet received payment in a regular transaction<br>• `generate` if a matured and spendable coinbase<br>• `immature` if a coinbase that is not spendable yet<br>• `orphan` if a coinbase from a block that's not in the local best block chain
→ →<br>`amount` | number (dash) | Required<br>(exactly 1) | A negative dash amount if sending payment; a positive dash amount if receiving payment (including coinbases)
→ →<br>`label` | string | Optional<br>(0 or 1) | An optional comment for the address/transaction
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | For an output, the output index (vout) for this output in this transaction.  For an input, the output index for the output being spent in its transaction.  Because inputs list the output indexes from previous transactions, more than one entry in the details array may have the same output index
→ →<br>`fee` | number (dash) | Optional<br>(0 or 1) | If sending payment, the fee paid as a negative dash value.  May be `0`.  Not returned if receiving payment
→ →<br>`abandoned` | bool | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.12.1*<br><br>Indicates if a transaction is was abandoned:<br>• `true` if it was abandoned (inputs are respendable)<br>• `false`  if it was not abandoned<br>Only returned by *send* category payments
→<br>`hex` | string (hex) | Required<br>(exactly 1) | The transaction in serialized transaction format

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gettransaction \
  c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc
```

Result:
``` json
{
  "amount": -50.00000000,
  "fee": -0.00030000,
  "confirmations": 3064,
  "instantlock": false,
  "instantlock_internal": false,
  "chainlock": false,
  "blockhash": "00000a01007be2912c3123085534b58d341cb5e5980b967e8dcc021089487a1e",
  "blockindex": 1,
  "blocktime": 1553290594,
  "trusted": true,
  "txid": "c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc",
  "walletconflicts": [
  ],
  "time": 1553290584,
  "timereceived": 1553290584,
  "details": [
    {
      "account": "",
      "address": "ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe",
      "category": "send",
      "amount": -50.00000000,
      "label": "Electrum",
      "vout": 1,
      "fee": -0.00030000,
      "abandoned": false
    }
  ],
  "hex": "0200000003aac865dba0e98fe32533df6bc3eaac160d04bb02966584fb61fc8d7788e09537010000006a47304402202d537257f23ab42b3e14f2ab533f39bb4586aa1b29a1f833f718a59493c8a601022019c6c156c20e66ef256519592b3c977b64d417c94aea4dca20cf18522a138993012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffff47833a270d2e2bac47bc5dc0df576c3a68b01bedbc89692060ac4113a6f9cb67010000006a4730440220442c19a913b10edc533bf63310f5294d6d91eec0eb9c510a3c6b0f33333f27320220501d5093ecdf603b8af9734e21d5de4710c8500309bfa4acdda243a294442b2c012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffffdcfd2d0fb30d79ffeadab8832e65be2310b67043ff3d74deac9a9cb825acda67000000006b483045022100cae8c025d3bec82903f356a5ec38d78a141447b6562e3aceac901f5fcc6f8567022076407835937514d6690c81c0c3b97f92d2b0ae9749249affaf539ead825692f4012102d6be44ab930ff67f084fbaf47a38b539b8d5da65c010952a972c9e524b6009dffeffffff0204fe2b00000000001976a914e3b0093477c2f629430d0a7b5813fe8b0153b0fd88ac00f2052a010000001976a914ae4365dedb1836ba215b9149602e0787a23376d288ac42010100"
}
```

*See also*

* [GetRawTransaction](/docs/core-api-ref-remote-procedure-calls-raw-transaction#section-getrawtransaction): gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings.

# GetUnconfirmedBalance

*Requires wallet support.*

The `getunconfirmedbalance` RPC returns the wallet's total unconfirmed balance.

*Parameters: none*

*Result---the balance of unconfirmed transactions paying this wallet*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (dash) | Required<br>(exactly 1) | The total number of dash paid to this wallet in unconfirmed transactions

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getunconfirmedbalance
```

Result (no unconfirmed incoming payments):

``` json
0.00000000
```

*See also*

* [GetBalance](/docs/core-api-ref-remote-procedure-calls-wallet#section-getbalance): gets the balance in decimal dash across all accounts or for a particular account.

# GetWalletInfo

*Requires wallet support.*

The `getwalletinfo` RPC provides information about the wallet.

*Parameters: none*

*Result---information about the wallet*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing the wallet
→<br>`walletversion` | number (int) | Required<br>(exactly 1) | The version number of the wallet
→<br>`balance` | number (dash) | Required<br>(exactly 1) | The total confirmed balance of the wallet.  The same as returned by the `getbalance` RPC with default parameters
→<br>`privatesendbalance` | number (dash) | Required<br>(exactly 1) | *Added in Dash Core 0.12.3*<br><br>The total PrivateSend balance of the wallet
→<br>`unconfirmed_balance` | number (dash) | Required<br>(exactly 1) | The total unconfirmed balance of the wallet.  The same as returned by the `getunconfirmedbalance` RPC with default parameters
→<br>`immature_balance` | number (dash) | Required<br>(exactly 1) | The total immature balance of the wallet.  This includes mining/masternode rewards that cannot be spent yet
→<br>`txcount` | number (int) | Required<br>(exactly 1) | The total number of transactions in the wallet (both spends and receives)
→<br>`keypoololdest` | number (int) | Required<br>(exactly 1) | The date as Unix epoch time when the oldest key in the wallet key pool was created; useful for only scanning blocks created since this date for transactions
→<br>`keypoolsize` | number (int) | Required<br>(exactly 1) | The number of keys in the wallet keypool
→<br>`keypoolsize_hd_internal` | number (int) | Optional<br>(0 or 1) | How many new keys are pre-generated for internal use (used for change outputs, only appears if the wallet is using this feature, otherwise external keys are used)
→<br>`keys_left` | number (int) | Required<br>(exactly 1) | The number of unused keys left since the last automatic backup
→<br>`unlocked_until` | number (int) | Optional<br>(0 or 1) | Only returned if the wallet was encrypted with the `encryptwallet` RPC. A Unix epoch date when the wallet will be locked, or `0` if the wallet is currently locked
→<br>`paytxfee` | number (int) | Required<br>(exactly 1) | The transaction fee configuration, set in DASH/kB
→<br>`hdchainid` | string (hash) | Optional<br>(0 or 1) | The ID of the HD chain
→<br>`hdaccountcount` | number (int) | Optional<br>(0 or 1) | How many accounts of the HD chain are in this wallet
→ →<br>`hdaccountcountindex` | number (int) | Optional<br>(0 or 1) | The index of the account
→ →<br>`hdexternalkeyindex` | number (int) | Optional<br>(0 or 1) | Current external child key index
→ →<br>`hdinternalkeyindex` | number (int) | Optional<br>(0 or 1) | Current internal child key index

*Example from Dash Core 0.12.3*

``` bash
dash-cli -testnet getwalletinfo
```

Result:

``` json
{
  "walletversion": 61000,
  "balance": 3000.00000000,
  "privatesend_balance": 413.20413200,
  "unconfirmed_balance": 10.10000000,
  "immature_balance": 11.25000000,
  "txcount": 267,
  "keypoololdest": 1508428379,
  "keypoolsize": 999,
  "keys_left": 978,
  "unlocked_until": 0,
  "paytxfee": 0.00000000
}
```

*See also*

* [ListTransactions](/docs/core-api-ref-remote-procedure-calls-wallet#section-listtransactions): returns the most recent transactions that affect the wallet.

# ImportAddress

*Requires wallet support.*

The `importaddress` RPC adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.

*Parameter #1---the address or pubkey script to watch*

Name | Type | Presence | Description
--- | --- | --- | ---
Address or Script | string (base58 or hex) | Required<br>(exactly 1) | Either a P2PKH or P2SH address encoded in base58check, or a pubkey script encoded as hex

*Parameter #2---The account into which to place the address or pubkey script*

Name | Type | Presence | Description
--- | --- | --- | ---
Label | string | Optional<br>(0 or 1) | An optional label.  Default is an empty string(\\")"

*Parameter #3---whether to rescan the block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
Rescan | bool | Optional<br>(0 or 1) | Set to `true` (the default) to rescan the entire local block database for transactions affecting any address or pubkey script in the wallet (including transaction affecting the newly-added address or pubkey script).  Set to `false` to not rescan the block database (rescanning can be performed at any time by restarting Dash Core with the `-rescan` command-line argument).  Rescanning may take several minutes.

*Parameter #4---whether to rescan the block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
P2SH | bool | Optional<br>(0 or 1) | Add the P2SH version of the script as well

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the address or pubkey script is added to the wallet (or is already part of the wallet), JSON `null` will be returned

*Example from Dash Core 0.12.2*

Add an address, rescanning the local block database for any transactions
matching it.

``` bash
dash-cli -testnet importaddress \
  yg89Yt5Tjzs9nRpX3wJCuvr7KuQvgkvmeC "watch-only test" true
```

Result:

(No output; success.)

Show that the address has been added:

``` bash
dash-cli -testnet getaccount yg89Yt5Tjzs9nRpX3wJCuvr7KuQvgkvmeC
```

Result:

``` text
watch-only test
```

*See also*

* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [ListReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaddress): lists the total number of dash received by each address.

# ImportElectrumWallet

The `importelectrumwallet` RPC imports keys from an Electrum wallet export file (.csv or .json)

*Parameter #1---file name*

Name | Type | Presence | Description
--- | --- | --- | ---
File Name | string | Required<br>(exactly 1) | The Electrum wallet export file (should be in csv or json format)

*Parameter #2---index*

Name | Type | Presence | Description
--- | --- | --- | ---
Index | number (int) | Optional<br>(0 or 1) | Rescan the wallet for transactions starting from this block index (default: 0)

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the Electrum keys are imported successfully, JSON `null` will be returned

*Example from Dash Core 0.12.2*

``` bash
dash-cli importelectrumwallet /tmp/electrum-export.csv
```

(Success: no result displayed.)

*See also: none*

# ImportMulti

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

*Requires wallet support.  Wallet must be unlocked.*

The `importmulti` RPC imports addresses or scripts (with private keys, public keys, or P2SH redeem scripts) and optionally performs the minimum necessary rescan for all imports.

*Parameter #1---the addresses/scripts to import*

Name | Type | Presence | Description
--- | --- | --- | ---
Imports | array | Required<br>(exactly 1) | An array of JSON objects, each one being an address or script to be imported
→ Import | object | Required<br>(1 or more) | A JSON object describing a particular import
→ →<br>`scriptPubKey` | string (hex) | Optional<br>(0 or 1) | The script (string) to be imported.  Must have either this field or `address` below
→ →<br>`address` | string (base58) | Optional<br>(0 or 1) | The P2PKH or P2SH address to be imported.  Must have either this field or `scriptPubKey` above
→ →<br>`timestamp` | number (int) / string | Required<br>(exactly 1) | The creation time of the key in Unix epoch time or the string “now” to substitute the current synced block chain time. The timestamp of the oldest key will determine how far back block chain rescans need to begin. Specify `now` to bypass scanning for keys which are known to never have been used.  Specify `0` to scan the entire block chain. Blocks up to 2 hours before the earliest key creation time will be scanned
→ →<br>`redeemscript` | string | Optional<br>(0 or 1) | A redeem script. Only allowed if either the `address` field is a P2SH address or the `scriptPubKey` field is a P2SH scriptPubKey
→ →<br>`pubkeys` | array | Optional<br>(0 or 1) | Array of strings giving pubkeys that must occur in the scriptPubKey or redeemscript
→ →<br>`keys` | array | Optional<br>(0 or 1) | Array of strings giving private keys whose corresponding public keys must occur in the scriptPubKey or redeemscript
→ →<br>`internal` | bool | Optional<br>(0 or 1) | Stating whether matching outputs should be treated as change rather than incoming payments. The default is `false`
→ →<br>`watchonly` | bool | Optional<br>(0 or 1) | Stating whether matching outputs should be considered watched even when they're not spendable. This is only allowed if keys are empty. The default is `false`
→ →<br>`label` | string | Optional<br>(0 or 1) | Label to assign to the address, only allowed with `internal` set to `false`. The default is an empty string (“”)

*Parameter #2---options regarding the import*

Name | Type | Presence | Description
--- | --- | --- | ---
Option | object | Optional<br>(0 or 1) | JSON object with options regarding the import
→ <br>`rescan` | bool | Optional<br>(0 or 1) | Set to `true` (the default) to rescan the entire local block chain for transactions affecting any imported address or script. Set to `false` to not rescan after the import. Rescanning may take a considerable amount of time and may require re-downloading blocks if using block chain pruning

*Result---execution result*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of JSON objects, with each object describing the execution result of each import
→ Result | object | Required<br>(1 or more) | A JSON object describing the execution result of an imported address or script
→ → <br>`success` | string | Required<br>(exactly 1) | Displays `true` if the import has been successful or `false` if it failed
→ → <br>`error` | string : object | Optional<br>(0 or 1) | A JSON object containing details about the error. Only displayed if the import fails
→ → → <br>`code` | number (int) | Optional<br>(0 or 1) | The error code
→ → → <br>`message` | string | Optional<br>(0 or 1) | The error message

*Example from Dash Core 0.12.3*

Import the address `ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe` (giving it a label and scanning the entire block chain) and the scriptPubKey `76a9146cf5870411edc31ba5630d61c7cddff55b884fda88ac` (giving a specific timestamp and label):

``` bash
dash-cli importmulti '
  [
    {
      "scriptPubKey" : { "address": "ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe" },
      "timestamp" : 0,
      "label" : "Personal"
    },
    {
      "scriptPubKey" : "76a9146cf5870411edc31ba5630d61c7cddff55b884fda88ac",
      "timestamp" : 1493912405,
      "label" : "TestFailure"
    }
  ]' '{ "rescan": true }'
```

Result (scriptPubKey import failed because `internal` was not set to `true`):

``` json
[
  {
    "success": true
  },
  {
    "success": false,
    "error": {
      "code": -8,
      "message": "Internal must be set for hex scriptPubKey"
    }
  }
]
```

*See also*

* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [ImportAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [ImportWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-importwallet): imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

# ImportPrivKey

*Requires wallet support.  Wallet must be unlocked.*

The `importprivkey` RPC adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.

*Parameter #1---the private key to import*

Name | Type | Presence | Description
--- | --- | --- | ---
Private Key | string (base58) | Required<br>(exactly 1) | The private key to import into the wallet encoded in base58check using wallet import format (WIF)

*Parameter #2---the account into which the key should be placed*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Optional<br>(0 or 1) | The name of an account to which transactions involving the key should be assigned.  The default is the default account, an empty string (\\")"

*Parameter #3---whether to rescan the block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
Rescan | bool | Optional<br>(0 or 1) | Set to `true` (the default) to rescan the entire local block database for transactions affecting any address or pubkey script in the wallet (including transaction affecting the newly-added address for this private key).  Set to `false` to not rescan the block database (rescanning can be performed at any time by restarting Dash Core with the `-rescan` command-line argument).  Rescanning may take several minutes.  Notes: if the address for this key is already in the wallet, the block database will not be rescanned even if this parameter is set

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the private key is added to the wallet (or is already part of the wallet), JSON `null` will be returned

*Example from Dash Core 0.12.2*

Import the private key for the address
ycBuREgSskHHkWLxDa9A5WppCki6PfFycL, giving it a label and scanning the
entire block chain:

``` bash
dash-cli -testnet importprivkey \
              cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw \
              "test label" \
              true
```

(Success: no result displayed.)

*See also*

* [DumpPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-dumpprivkey): returns the wallet-import-format (WIP) private key corresponding to an address. (But does not remove it from the wallet.)
* [ImportAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [ImportPubKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importpubkey): imports a public key (in hex) that can be watched as if it were in your wallet but cannot be used to spend
* [ImportWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-importwallet): imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

# ImportPrunedFunds

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

*Requires wallet support.*

The `importprunedfunds` RPC imports funds without the need of a rescan. Meant for use with pruned wallets. Corresponding address or script must previously be included in wallet.
The end-user is responsible to import additional transactions that subsequently spend the imported
outputs or rescan after the point in the blockchain the transaction is included.

*Parameter #1---the raw transaction to import*

Name | Type | Presence | Description
--- | --- | --- | ---
Raw Transaction | string<br>(hex) | Required<br>(exactly 1) | A raw transaction in hex funding an already-existing address in wallet

*Parameter #2---the tx out proof that cointains the transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
TX Out Proof | string<br>(hex) | Required<br>(exactly 1) | The hex output from gettxoutproof that contains the transaction

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the funds are added to wallet, JSON `null` will be returned

*Example from Dash Core 0.12.3*

``` bash
bitcoin-cli importprunedfunds "txhex" "txoutproof"
```

(Success: no result displayed.)

*See also*

* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [RemovePrunedFunds](/docs/core-api-ref-remote-procedure-calls-wallet#section-removeprunedfunds): deletes the specified transaction from the wallet. Meant for use with pruned wallets and as a companion to importprunedfunds.

# ImportPubKey

The `importpubkey` RPC imports a public key (in hex) that can be watched as if it were in your wallet but cannot be used to spend

*Parameter #1---the public key to import*

Name | Type | Presence | Description
--- | --- | --- | ---
Private Key | string (hex) | Required<br>(exactly 1) | The public key to import

*Parameter #2---the account into which the key should be placed*

Name | Type | Presence | Description
--- | --- | --- | ---
Label | string | Optional<br>(0 or 1) | The label the key should be assigned

*Parameter #3---whether to rescan the block chain*

Name | Type | Presence | Description
--- | --- | --- | ---
Rescan | bool | Optional<br>(0 or 1) | Set to `true` (the default) to rescan the entire local block database for transactions affecting any address or pubkey script in the wallet.  Set to `false` to not rescan the block database (rescanning can be performed at any time by restarting Dash Core with the `-rescan` command-line argument).  Rescanning may take several minutes.  Notes: if the address for this key is already in the wallet, the block database will not be rescanned even if this parameter is set

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the public key is added to the wallet (or is already part of the wallet), JSON `null` will be returned

*Example from Dash Core 0.12.2*

Import the public key for the address, giving it a label and scanning the
entire block chain:

``` bash
dash-cli -testnet importpubkey \
    0210c1349657c1253d3d64d1b31d3500b09335bf12b8df061666e216f550a43249 \
    "test label" \
    true
```

(Success: no result displayed.)

*See also:*

* [ImportAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [ImportWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-importwallet): imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

# ImportWallet

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `importwallet` RPC imports private keys from a file in wallet dump file format (see the `dumpwallet` RPC). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.

*Parameter #1---the file to import*

Name | Type | Presence | Description
--- | --- | --- | ---
Filename | string | Required<br>(exactly 1) | The file to import.  The path is relative to Dash Core's working directory

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If all the keys in the file are added to the wallet (or are already part of the wallet), JSON `null` will be returned

*Example from Dash Core 0.12.2*

Import the file shown in the example subsection of the `dumpwallet` RPC.

``` bash
dash-cli -testnet importwallet /tmp/dump.txt
```

(Success: no result displayed.)

*See also*

* [DumpWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-dumpwallet): creates or overwrites a file with all wallet keys in a human-readable format.
* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.

# KeePass

The `keepass` RPC provides commands for configuring and managing KeePass authentication

*Parameter #1---Command mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required (exactly 1) | The command mode to use:<br>`genkey`,<br>`init`,<br>`setpassphrase`

*Command Options*

Mode | Description
--- | --- | --- |
`genkey` | Generates a base64 encoded 256 bit AES key that can be used for the communication with KeePassHttp. This is only necessary for manual configuration.
`init` | Sets up the association between Dash Core and KeePass by generating an AES key and sending an association message to KeePassHttp. This will trigger KeePass to ask for an Id for the association. Returns the association and the base64 encoded string for the AES key.
`setpassphrase` | Updates the passphrase in KeePassHttp to a new value. This should match the passphrase you intend to use for the wallet. Please note that the standard RPC commands walletpassphrasechange and the wallet encryption from the QT GUI already send the updates to KeePassHttp, so this is only necessary for manual manipulation of the password.

**Command Mode - `genkey`**

*Result---the new key*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | string (base64) | Required (exactly 1) | The new key

*Example from Dash Core 0.12.2*

Manually generate a key

``` bash
dash-cli -testnet keepass genkey
```

Result:
``` bash
Generated Key: dNjo+J8Jb30txbJiKq4s9H6vEgWq/whb1w9bb2cTOFo=
```

**Command Mode - `init`**

*Result---initialization response*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | string | Required (exactly 1) | The success/error status

*Example from Dash Core 0.12.2*

Automatically initialize

``` bash
dash-cli -testnet keepass init
```

Result (wrapped):
``` bash
Association successful. Id: testwalletassociation - \
Key: MSb+JLygqz7ZH40SyJ1QR62i00IXoa3tmT85MGGI2K0=
```

**Command Mode - `setpassphrase`**

*Parameter #2---Passphrase*

Name | Type | Presence | Description
--- | --- | --- | ---
Passphrase | string | Required (exactly 1) | The passphrase to set

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | string | Required (exactly 1) | The success/error status

*Example from Dash Core 0.12.2*

Set KeePass passphrase

``` bash
dash-cli -testnet keepass setpassphrase 1BWi20Xyk76uWumxJQy4
```

Result:
``` bash
setlogin: Updated credentials.
```

*See also: none*

# KeyPoolRefill

*Requires wallet support.  Requires an unlocked wallet or an unencrypted
wallet.*

The `keypoolrefill` RPC fills the cache of unused pre-generated keys (the keypool).

*Parameter #1---the new keypool size*

Name | Type | Presence | Description
--- | --- | --- | ---
Key Pool Size | number (int) | Optional<br>(0 or 1) | The new size of the keypool; if the number of keys in the keypool is less than this number, new keys will be generated.  Default is `1000`.  The value `0` also equals the default.  The value specified is for this call only---the default keypool size is not changed

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the keypool is successfully filled, JSON `null` will be returned

*Example from Dash Core 0.12.2*

Generate one extra key than the default:

``` bash
dash-cli -testnet keypoolrefill 1001
```

(No result shown: success.)

*See also*

* [GetNewAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.
* [GetAccountAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccountaddress): returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address.
* [GetWalletInfo](/docs/core-api-ref-remote-procedure-calls-wallet#section-getwalletinfo): provides information about the wallet.

# ListAccounts

*Requires wallet support.*

The `listaccounts` RPC lists accounts and their balances.

{{WARNING}} `listaccounts` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---the minimum number of confirmations a transaction must have*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #2--- whether to include transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions

*Parameter #3---whether to include watch-only addresses in results*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---a list of accounts and their balances*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A JSON array containing key/value pairs with account names and values.  Must include, at the very least, the default account (\\")"
→<br>Account : Balance | string : number (dash) | Required<br>(1 or more) | The name of an account as a string paired with the balance of the account as a number of dash.  The number of dash may be negative if the account has spent more dash than it received.  Accounts with zero balances and zero transactions will be displayed

*Example from Dash Core 0.13.0*

Display account balances with one confirmation and watch-only addresses
included. Add the balance of InstantSend locked transactions also.

``` bash
dash-cli -testnet listaccounts 1 true true
```

Result:

``` json
{
  "": -2941.30029732,
  "Watching": 8.50000000,
  "MN": 2000.25442744,
  "PS": 37.02970000,
  "Recv1": 3843.48167912,
}
```

*See also*

* [GetAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccount): returns the name of the account associated with the given address.
* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.
* [ListReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaccount): lists the total number of dash received by each account.

# ListAddressBalances

The `listaddressbalances` RPC lists addresses of this wallet and their balances

*Parameter #1---Minimum Amount*

Name | Type | Presence | Description
--- | --- | --- | ---
Minimum Amount | numeric (int) | Optional<br>(0 or 1) | Minimum balance in DASH an address should have to be shown in the list (default=0)

*Result---an object containing the addresses and their balances*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object containing key/value pairs corresponding to the addresses with balances > the minimum amount.  May be empty
→<br>Address/Amount | string (base58):<br>number (DASH) | Optional<br>(1 or more) | A key/value pair with a base58check-encoded string containing the address as the key, and an amount of DASH as the value

*Example from Dash Core 0.12.3*

``` bash
dash-cli -testnet listaddressbalances 25
```

Result:
``` json
{
  "yMQtQkcMBXrAZyqTGZeg7tQHzmbypGEP4w": 299.99990000,
  "yRyfgrHm4f5A8GGvqpqTFvbCrCQHJm1L4V": 99.13570000,
  "ybePwhPzUbiWzFhkgxPgP6iHnTLTyFH6sU": 123.45600000,
  "ycCdPQnjNEVRgrQY8j6mxEx9h7oaQpo5Ge": 500.00000000
}
```

*See also:*

* [ListAddressGroupings](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaddressgroupings): lists groups of addresses that may have had their common ownership made public by common use as inputs in the same transaction or from being used as change from a previous transaction.

# ListAddressGroupings

*Requires wallet support.*

The `listaddressgroupings` RPC lists groups of addresses that may have had their common ownership made public by common use as inputs in the same transaction or from being used as change from a previous transaction.

*Parameters: none*

*Result---an array of arrays describing the groupings*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing the groupings.  May be empty
→<br>Groupings | array | Optional<br>(0 or more) | An array containing arrays of addresses which can be associated with each other
→ →<br>Address Details | array | Required<br>(1 or more) | An array containing information about a particular address
→ → →<br>Address | string (base58) | Required<br>(exactly 1) | The address in base58check format
→ → →<br>Balance | number (bitcoins) | Required<br>(exactly 1) | The current spendable balance of the address, not counting unconfirmed transactions
→ → →<br>Account | string | Optional<br>(0 or 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>The account the address belongs to, if any.  This field will not be returned for change addresses.  The default account is an empty string (\\")"

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet listaddressgroupings
```

Result (edited to only three results):

``` json
[
  [
    [
      "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
      0.00000000
    ]
  ],
  [
    [
      "yX7SvurfpwSD7QDA3pZNYNxt6kPPiZmRAk",
      27.02970000,
      "Test1"
    ]
  ],
  [
    [
      "ygMuVDN2raRBma86GpwyQeJV18kR1261d1",
      11.00000000,
      "Test2"
    ]
  ]
]
```

*See also*

* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.
* [GetTransaction](/docs/core-api-ref-remote-procedure-calls-wallet#section-gettransaction): gets detailed information about an in-wallet transaction.
* [ListAddressBalances](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaddressbalances): lists addresses of this wallet and their balances

# ListLockUnspent

*Requires wallet support.*

The `listlockunspent` RPC returns a list of temporarily unspendable (locked) outputs.

*Parameters: none*

*Result---an array of locked outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing all locked outputs.  May be empty
→<br>Output | object | Optional<br>(1 or more) | An object describing a particular locked output
→ →<br>`txid` | string (hex) | Required<br>(exactly 1) | The TXID of the transaction containing the locked output, encoded as hex in RPC byte order
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | The output index number (vout) of the locked output within the transaction.  Output index `0` is the first output within the transaction

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet listlockunspent
```

Result:

``` json
[
  {
    "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
    "vout": 0
  }
]
```

*See also*

* [LockUnspent](/docs/core-api-ref-remote-procedure-calls-wallet#section-lockunspent): temporarily locks or unlocks specified transaction outputs. A locked transaction output will not be chosen by automatic coin selection when spending dash. Locks are stored in memory only, so nodes start with zero locked outputs and the locked output list is always cleared when a node stops or fails.

# ListReceivedByAccount

*Requires wallet support.*

The `listreceivedbyaccount` RPC lists the total number of dash received by each account.

{{WARNING}} `listreceivedbyaccount` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---the minimum number of confirmations a transaction must have to be counted*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #2---whether to include transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions

*Parameter #3---whether to include empty accounts*

Name | Type | Presence | Description
--- | --- | --- | ---
Include Empty | bool | Optional<br>(0 or 1) | Set to `true` to display accounts which have never received a payment.  Set to `false` (the default) to only include accounts which have received a payment.  Any account which has received a payment will be displayed even if its current balance is `0`

*Parameter #4---whether to include watch-only addresses in results*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---account names, balances, and minimum confirmations*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing objects each describing an account.  At the very least, the default account (\\") will be included"
→<br>Account | object | Required<br>(1 or more) | An object describing an account
→ →<br>`involvesWatchonly` | bool | Optional<br>(0 or 1) | Set to `true` if the balance of this account includes a watch-only address which has received a spendable payment (that is, a payment with at least the specified number of confirmations and which is not an immature coinbase).  Otherwise not returned
→ →<br>`account` | string | Required<br>(exactly 1) | The name of the account
→ →<br>`amount` | number (dash) | Required<br>(exactly 1) | The total amount received by this account in dash
→ →<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations received by the last transaction received by this account.  May be `0`
→ →<br>`label` | string | Optional<br>(0 or 1) | A comment for the address/transaction

*Example from Dash Core 0.13.0*

Get the balances for all non-empty accounts, including transactions
which have been confirmed at least six times and InstantSend locked transactions:

``` bash
dash-cli -testnet listreceivedbyaccount 6 true false true
```

Result (edited to only show the first two results):

``` json
[
    {
        "account" : "",
        "amount" : 0.19960000,
        "confirmations" : 53601
    },
    {
        "account" : "doc test",
        "amount" : 0.30000000,
        "confirmations" : 8991
    }
]
```

*See also*

* [ListReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaddress): lists the total number of dash received by each address.
* [GetReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaccount): returns the total amount received by addresses in a particular account from transactions with the specified number of confirmations.  It does not count coinbase transactions.
* [GetReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaddress): returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.

# ListReceivedByAddress

*Requires wallet support.*

The `listreceivedbyaddress` RPC lists the total number of dash received by each address.

*Parameter #1---the minimum number of confirmations a transaction must have to be counted*

{{INCLUDE_CONFIRMATIONS_PARAMETER}}

*Parameter #2---whether to include transactions locked via InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
addlocked | bool | Optional<br>(exactly 1) | Add the balance from InstantSend locked transactions

*Parameter #3---whether to include empty accounts*

Name | Type | Presence | Description
--- | --- | --- | ---
Include Empty | bool | Optional<br>(0 or 1) | Set to `true` to display accounts which have never received a payment.  Set to `false` (the default) to only include accounts which have received a payment.  Any account which has received a payment will be displayed even if its current balance is `0`

*Parameter #4---whether to include watch-only addresses in results*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---addresses, account names, balances, and minimum confirmations*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing objects each describing a particular address
→<br>Address | object | Optional<br>(0 or more) | An object describing an address
→ →<br>`involvesWatchonly` | bool | Optional<br>(0 or 1) | Set to `true` if this address is a watch-only address which has received a spendable payment (that is, a payment with at least the specified number of confirmations and which is not an immature coinbase).  Otherwise not returned
→ →<br>`address` | string (base58) | Required<br>(exactly 1) | The address being described encoded in base58check
→ →<br>`account` | string | Required<br>(exactly 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>The account the address belongs to.  May be the default account, an empty string (\\")"
→ →<br>`amount` | number (dash) | Required<br>(exactly 1) | The total amount the address has received in dash
→ →<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations of the latest transaction to the address.  May be `0` for unconfirmed
→ →<br>`label` | string | Required<br>(exactly 1) | The account the address belongs to.  May be the default account, an empty string (\\")"
→ →<br>`txids` | array | Required<br>(exactly 1) | An array of TXIDs belonging to transactions that pay the address
→ → →<br>TXID | string | Optional<br>(0 or more) | The TXID of a transaction paying the address, encoded as hex in RPC byte order

*Example from Dash Core 0.13.0*

List addresses with balances confirmed by at least six blocks, including
watch-only addresses. Also include the balance from InstantSend locked transactions:

``` bash
dash-cli -testnet listreceivedbyaddress 6 true false true
```

Result (edit to show only two entries):

``` json
[
  {
    "address": "yV3ZTfwyfUmpspncMSitiwzh7EvqSGrqZA",
    "account": "",
    "amount": 1000.00000000,
    "confirmations": 26779,
    "label": "",
    "txids": [
      "0456aaf51a8df21dd47c2a06ede046a5bf7403bcb95d14d1d71b178c189fb933"
    ]
  },
  {
    "involvesWatchonly" : true,
    "address": "yfoR9uM3rcDfUc7AEfUNm5BjVYGFw7uQ9w",
    "account": "Watching",
    "amount": 1877.78476068,
    "confirmations": 26876,
    "label": "Watching",
    "txids": [
      "cd64114c803a2a243cb6ce4eb5c98e60cd2c688be8e900b3b957fe520cf42601",
      "83d3f7f31926908962e336341b1895d5f734f9d7149bdb35f0381cc78019bd83"
    ]
  }
]
```

*See also*

* [ListReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaccount): lists the total number of dash received by each account.
* [GetReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaddress): returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.
* [GetReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getreceivedbyaccount): returns the total amount received by addresses in a particular account from transactions with the specified number of confirmations.  It does not count coinbase transactions.

# ListSinceBlock

*Requires wallet support.*

The `listsinceblock` RPC gets all transactions affecting the wallet which have occurred since a particular block, plus the header hash of a block at a particular depth.

*Parameter #1---a block header hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Header Hash | string (hex) | Optional<br>(0 or 1) | The hash of a block header encoded as hex in RPC byte order.  All transactions affecting the wallet which are not in that block or any earlier block will be returned, including unconfirmed transactions.  Default is the hash of the genesis block, so all transactions affecting the wallet are returned by default

*Parameter #2---the target confirmations for the lastblock field*

Name | Type | Presence | Description
--- | --- | --- | ---
Target Confirmations | number (int) | Optional<br>(0 or 1) | Sets the lastblock field of the results to the header hash of a block with this many confirmations.  This does not affect which transactions are returned.  Default is `1`, so the hash of the most recent block on the local best block chain is returned

*Parameter #3---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Parameter #4---include_removed*

Name | Type | Presence | Description
--- | --- | --- | ---
include_removed | bool | Optional<br>Default=`true` | Show transactions that were removed due to a reorg in the \removed\" array (not guaranteed to work on pruned nodes)"

**Result**

{% include helpers/vars.md %}

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object containing an array of transactions and the lastblock field
→<br>`transactions` | array | Required<br>(exactly 1) | An array of objects each describing a particular **payment** to or from this wallet.  The objects in this array do not describe an actual transactions, so more than one object in this array may come from the same transaction.  This array may be empty
→ →<br>Payment | object | Optional<br>(0 or more) | An payment which did not appear in the specified block or an earlier block

{{INCLUDE_F_LIST_TRANSACTIONS}}
{{INCLUDE_F_LIST_TRANSACTIONS_F_FULL}}
→<br>`removed` | array | Optional<br>(0 or 1) | Structure is the same as `transactions`. Only present if `include_removed` is `true`.<br>_Note_: transactions that were re-added in the active chain will appear as-is in this array, and may thus have a positive confirmation count.
→<br>`lastblock` | string (hex) | Required<br>(exactly 1) | The header hash of the block with the number of confirmations specified in the *target confirmations* parameter, encoded as hex in RPC byte order

*Example from Dash Core 0.14.1*

Get all transactions since a particular block (including watch-only
transactions) and the header hash of the sixth most recent block.

``` bash
dash-cli -testnet listsinceblock \
              0000000001fc119ea77e0c67783227fb9d55386125179ea5597109d311af2337 \
              6 true true
```

Result (edited to show only two payments):

``` json
{
  "transactions": [
    {
      "account": "",
      "address": "yMaodAgCofB2gmHEtATAiV3w5NkzTpmkgS",
      "category": "send",
      "amount": -2365.65209808,
      "label": "Mining Consolidation",
      "vout": 0,
      "fee": -0.00031420,
      "confirmations": 5,
      "instantlock": true,
      "instantlock_internal": false,
      "chainlock": true,
      "blockhash": "00000000001c4e142c6deaa273206706d37a7aa792887d9bd81ae787d4259137",
      "blockindex": 1,
      "blocktime": 1566399553,
      "txid": "bb8a2789c3166181cc190e0fd7675770217b69c9aeafe0d8207baf1ebeb05845",
      "walletconflicts": [
      ],
      "time": 1566399271,
      "timereceived": 1566399271,
      "abandoned": false
    },
    {
      "account": "Mining Consolidation",
      "address": "yMaodAgCofB2gmHEtATAiV3w5NkzTpmkgS",
      "category": "receive",
      "amount": 2365.65209808,
      "label": "Mining Consolidation",
      "vout": 0,
      "confirmations": 5,
      "instantlock": true,
      "instantlock_internal": false,
      "chainlock": true,
      "blockhash": "00000000001c4e142c6deaa273206706d37a7aa792887d9bd81ae787d4259137",
      "blockindex": 1,
      "blocktime": 1566399553,
      "txid": "bb8a2789c3166181cc190e0fd7675770217b69c9aeafe0d8207baf1ebeb05845",
      "walletconflicts": [
      ],
      "time": 1566399271,
      "timereceived": 1566399271
    }
  ],
  "removed": [
  ],
  "lastblock": "000000000158ad1e4eab53044e18aaf76e605a27252862d4f1d78cfd373f1686"
}
```

*See also*

* [ListReceivedByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaccount): lists the total number of dash received by each account.
* [ListReceivedByAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-listreceivedbyaddress): lists the total number of dash received by each address.

# ListTransactions

*Requires wallet support.*

The `listtransactions` RPC returns the most recent transactions that affect the wallet.

*Parameter #1---an account name to get transactions from*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Optional<br>(0 or 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>The name of an account to get transactions from.  Use an empty string (\\") to get transactions for the default account.  Default is `*` to get transactions for all accounts."

*Parameter #2---the number of transactions to get*

Name | Type | Presence | Description
--- | --- | --- | ---
Count | number (int) | Optional<br>(0 or 1) | The number of the most recent transactions to list.  Default is `10`

*Parameter #3---the number of transactions to skip*

Name | Type | Presence | Description
--- | --- | --- | ---
Skip | number (int) | Optional<br>(0 or 1) | The number of the most recent transactions which should not be returned.  Allows for pagination of results.  Default is `0`

*Parameter #4---whether to include watch-only addresses in details and calculations*

{{INCLUDE_INCLUDE_WATCH_ONLY_PARAMETER}}

*Result---payment details*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing objects, with each object describing a **payment** or internal accounting entry (not a transaction).  More than one object in this array may come from a single transaction.  Array may be empty
→<br>Payment | object | Optional<br>(0 or more) | A payment or internal accounting entry
→ →<br>`account` | string | Required<br>(exactly 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>The account which the payment was credited to or debited from.  May be an empty string (\\") for the default account"
→ →<br>`address` | string (base58) | Optional<br>(0 or 1) | The address paid in this payment, which may be someone else's address not belonging to this wallet.  May be empty if the address is unknown, such as when paying to a non-standard pubkey script or if this is in the *move* category
→ →<br>`category` | string | Required<br>(exactly 1) | Set to one of the following values:<br>• `send` if sending payment<br>• `receive` if this wallet received payment in a regular transaction<br>• `generate` if a matured and spendable coinbase<br>• `immature` if a coinbase that is not spendable yet<br>• `orphan` if a coinbase from a block that's not in the local best block chain<br>• `move` if an off-block-chain move made with the `move` RPC
→ →<br>`amount` | number (dash) | Required<br>(exactly 1) | A negative dash amount if sending payment; a positive dash amount if receiving payment (including coinbases)
→ →<br>`label` | string | Optional<br>(0 or 1) | A comment for the address/transaction
→ →<br>`vout` | number (int) | Optional<br>(0 or 1) | For an output, the output index (vout) for this output in this transaction.  For an input, the output index for the output being spent in its transaction.  Because inputs list the output indexes from previous transactions, more than one entry in the details array may have the same output index.  Not returned for *move* category payments
→ →<br>`fee` | number (dash) | Optional<br>(0 or 1) | If sending payment, the fee paid as a negative dash value.  May be `0`. Not returned if receiving payment or for *move* category payments
→ →<br>`confirmations` | number (int) | Optional<br>(0 or 1) | The number of confirmations the transaction has received.  Will be `0` for unconfirmed and `-1` for conflicted.  Not returned for *move* category payments
→<br>`instantlock` | bool | Required<br>(exactly 1) | Current transaction lock state (InstantSend and/or ChainLock)
→<br>`instantlock_internal` | bool | Required<br>(exactly 1) | Current InstantSend transaction lock state
<br>`chainlock` | bool | Required<br>(exactly 1) | *Added in Dash Core 0.14.0*<br><br>If set to `true`, this transaction is in a block that is locked (not susceptible to a chain re-org)
→ →<br>`generated` | bool | Optional<br>(0 or 1) | Set to `true` if the transaction is a coinbase.  Not returned for regular transactions or *move* category payments
→ →<br>`trusted` | bool | Optional<br>(0 or 1) | Indicates whether we consider the outputs of this unconfirmed transaction safe to spend.  Only returned for unconfirmed transactions
→ →<br>`blockhash` | string (hex) | Optional<br>(0 or 1) | The hash of the block on the local best block chain which includes this transaction, encoded as hex in RPC byte order.  Only returned for confirmed transactions
→ →<br>`blockindex` | number (int) | Optional<br>(0 or 1) | The index of the transaction in the block that includes it.  Only returned for confirmed transactions
→ →<br>`blocktime` | number (int) | Optional<br>(0 or 1) | The block header time (Unix epoch time) of the block on the local best block chain which includes this transaction.  Only returned for confirmed transactions
→ →<br>`txid` | string (hex) | Optional<br>(0 or 1) | The TXID of the transaction, encoded as hex in RPC byte order.  Not returned for *move* category payments
→ →<br>`walletconflicts` | array | Optional<br>(0 or 1) | An array containing the TXIDs of other transactions that spend the same inputs (UTXOs) as this transaction.  Array may be empty.  Not returned for *move* category payments
→ → →<br>TXID | string (hex) | Optional<br>(0 or more) | The TXID of a conflicting transaction, encoded as hex in RPC byte order
→ →<br>`time` | number (int) | Required<br>(exactly 1) | A Unix epoch time when the transaction was added to the wallet
→ →<br>`timereceived` | number (int) | Optional<br>(0 or 1) | A Unix epoch time when the transaction was detected by the local node, or the time of the block on the local best block chain that included the transaction.  Not returned for *move* category payments
→ →<br>`comment` | string | Optional<br>(0 or 1) | For transaction originating with this wallet, a locally-stored comment added to the transaction.  Only returned in regular payments if a comment was added.  Always returned in *move* category payments.  May be an empty string
→ →<br>`to` | string | Optional<br>(0 or 1) | For transaction originating with this wallet, a locally-stored comment added to the transaction identifying who the transaction was sent to.  Only returned if a comment-to was added.  Never returned by *move* category payments.  May be an empty string
→ →<br>`otheraccount` | string | Optional<br>(0 or 1) | This is the account the dash were moved from or moved to, as indicated by a negative or positive *amount* field in this payment.  Only returned by *move* category payments
→ →<br>`abandoned` | bool | Optional<br>(0 or 1) | *Added in Bitcoin Core 0.12.1*<br><br>Indicates if a transaction is was abandoned:<br>• `true` if it was abandoned (inputs are respendable)<br>• `false`  if it was not abandoned<br>Only returned by *send* category payments

*Example from Dash Core 0.14.0*

List the most recent transaction from the main account including watch-only addresses.

``` bash
dash-cli listtransactions "" 1 0 true
```

Result:

``` json
[
  {
    "account": "",
    "address": "ySGKtDZ3qBHRqk7mHsdofShQkqMcAS7SYJ",
    "category": "send",
    "amount": -0.50000000,
    "label": "",
    "vout": 1,
    "fee": -0.00040000,
    "confirmations": 3,
    "instantlock": true,
    "instantlock_internal": true,
    "chainlock": false,
    "blockhash": "000000000327ff7785d799dde99949457ac231ef1d956a2287c2f7bb84d9738c",
    "blockindex": 2,
    "blocktime": 1553798971,
    "txid": "048aae3ad194f5398b67fc7029b26bf50d66ecc7d185fd6d26f8c6ec5a4ed1f9",
    "walletconflicts": [
    ],
    "time": 1553798920,
    "timereceived": 1553798920,
    "abandoned": false
  }
]
```

*See also*

* [GetTransaction](/docs/core-api-ref-remote-procedure-calls-wallet#section-gettransaction): gets detailed information about an in-wallet transaction.
* [ListSinceBlock](/docs/core-api-ref-remote-procedure-calls-wallet#section-listsinceblock): gets all transactions affecting the wallet which have occurred since a particular block, plus the header hash of a block at a particular depth.

# ListUnspent

*Requires wallet support.*

The `listunspent` RPC returns an array of unspent transaction outputs belonging to this wallet. **Note:** as of Bitcoin
Core 0.10.0, outputs affecting watch-only addresses will be returned; see
the *spendable* field in the results described below.

*Parameter #1---the minimum number of confirmations an output must have*

Name | Type | Presence | Description
--- | --- | --- | ---
Minimum Confirmations | number (int) | Optional<br>(0 or 1) | The minimum number of confirmations the transaction containing an output must have in order to be returned.  Use `0` to return outputs from unconfirmed transactions. Default is `1`

*Parameter #2---the maximum number of confirmations an output may have*

Name | Type | Presence | Description
--- | --- | --- | ---
Maximum Confirmations | number (int) | Optional<br>(0 or 1) | The maximum number of confirmations the transaction containing an output may have in order to be returned.  Default is `9999999` (~10 million)

*Parameter #3---the addresses an output must pay*

Name | Type | Presence | Description
--- | --- | --- | ---
Addresses | array | Optional<br>(0 or 1) | If present, only outputs which pay an address in this array will be returned
→<br>Address | string (base58) | Required<br>(1 or more) | A P2PKH or P2SH address

*Parameter #4---include unsafe outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
Include Unsafe | bool | Optional<br>(false or true) | Include outputs that are not safe to spend . See description of `safe` attribute below.  Default is `true`

*Parameter #5---query options*

Name | Type | Presence | Description
--- | --- | --- | ---
Query Options | json | Optional | JSON with query options. Available options:<br> - `minimumAmount`: Minimum value of each UTXO in DASH<br> - `maximumAmount`: Maximum value of each UTXO in DASH<br> - `maximumCount`: Maximum number of UTXOs<br> - `minimumSumAmount`: Minimum sum value of all UTXOs in DASH

*Result---the list of unspent outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each describing an unspent output.  May be empty
→<br>Unspent Output | object | Optional<br>(0 or more) | An object describing a particular unspent output belonging to this wallet
→ →<br>`txid` | string (hex) | Required<br>(exactly 1) | The TXID of the transaction containing the output, encoded as hex in RPC byte order
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | The output index number (vout) of the output within its containing transaction
→ →<br>`address` | string (base58) | Optional<br>(0 or 1) | The P2PKH or P2SH address the output paid.  Only returned for P2PKH or P2SH output scripts
→ →<br>`account` | string | Optional<br>(0 or 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>If the address returned belongs to an account, this is the account.  Otherwise not returned
→ →<br>`scriptPubKey` | string (hex) | Required<br>(exactly 1) | The output script paid, encoded as hex
→ →<br>`redeemScript` | string (hex) | Optional<br>(0 or 1) | If the output is a P2SH whose script belongs to this wallet, this is the redeem script
→ →<br>`amount` | number (int) | Required<br>(exactly 1) | The amount paid to the output in dash
→ →<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations received for the transaction containing this output
→ →<br>`spendable` | bool | Required<br>(exactly 1) | Set to `true` if the private key or keys needed to spend this output are part of the wallet.  Set to `false` if not (such as for watch-only addresses)
→ →<br>`solvable` | bool | Required<br>(exactly 1) | *Added in Bitcoin Core 0.13.0*<br><br>Set to `true` if the wallet knows how to spend this output.  Set to `false` if the wallet does not know how to spend the output.  It is ignored if the private keys are available
→ →<br>`ps_rounds` | number (int) | Required<br>(exactly 1) | The number of PrivateSend rounds
→ →<br>`safe` | bool | Required<br>(exactly 1) | *Added in Bitcoin Core 0.15.0*<br><br>Whether this output is considered safe to spend. Unconfirmed transactions from outside keys are considered unsafe and are not eligible for spending by `fundrawtransaction` and `sendtoaddress`.

*Example from Dash Core 0.14.1*

Get all outputs confirmed at least 6 times for a particular
address:

``` bash
dash-cli -testnet listunspent 6 99999999 '''
  [
    "yLki4jbxX28JB3TThm1DTgRfbKVhhiMx3d"
  ]
'''
```

Result:

``` json
[
  {
    "txid": "534fe12e360773dddf8aa125a4027d2d8c0073e13ff2f04fd733202b85dbdcf1",
    "vout": 0,
    "address": "yLki4jbxX28JB3TThm1DTgRfbKVhhiMx3d",
    "scriptPubKey": "76a91404c719ccf48d39d3e6253ac98edaf2b5d24f0c0588ac",
    "amount": 1.00001000,
    "confirmations": 85,
    "spendable": true,
    "solvable": true,
    "safe": true,
    "ps_rounds": 13
  }
]
```

Get all outputs for a particular address that have at least 1 confirmation and a maximum value of 10:

``` bash
listunspent 1 9999999 "[\"yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD\"]" true "{\"maximumAmount\":\"10\"}"

dash-cli -testnet listunspent 1 9999999 '''
  [
    "yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD"
  ]
  ''' true '''
  {
    "maximumAmount": "10"
  }
  '''
```

Result:

``` json
[
  {
    "txid": "42cd5150fd1179b5a194e034685d524e6d5d38703ac794d236495923a29addc5",
    "vout": 1,
    "address": "yQqTPAw1Nk8iFDeDXqe5dQ7A9xD6LVUStD",
    "account": "",
    "scriptPubKey": "76a914318d6d7e26e07a142a425a32ea917a30147d6c9788ac",
    "amount": 5.00000000,
    "confirmations": 100,
    "spendable": true,
    "solvable": true,
    "safe": true,
    "ps_rounds": -2
  }
]
```

*See also*

* [ListTransactions](/docs/core-api-ref-remote-procedure-calls-wallet#section-listtransactions): returns the most recent transactions that affect the wallet.
* [LockUnspent](/docs/core-api-ref-remote-procedure-calls-wallet#section-lockunspent): temporarily locks or unlocks specified transaction outputs. A locked transaction output will not be chosen by automatic coin selection when spending dash. Locks are stored in memory only, so nodes start with zero locked outputs and the locked output list is always cleared when a node stops or fails.

# ListWallets

The `listwallets` RPC returns a list of currently loaded wallets.

For full information on the wallet, use the `getwalletinfo` RPC.

*Parameters: none*

*Result*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of strings containing a list of currently loaded wallet files
→<br>Wallet | string | Required<br>(0 or more) | The name of a wallet file

*Example from Dash Core 0.14.1*

``` bash
dash-cli -testnet listwallets
```

Result:
``` json
[
  "wallet.dat"
]
```

*See also: none*

# LockUnspent

*Requires wallet support.*

The `lockunspent` RPC temporarily locks or unlocks specified transaction outputs. A locked transaction output will not be chosen by automatic coin selection when spending dash. Locks are stored in memory only, so nodes start with zero locked outputs and the locked output list is always cleared when a node stops or fails.

*Parameter #1---whether to lock or unlock the outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
Unlock | bool | Required<br>(exactly 1) | Set to `false` to lock the outputs specified in the following parameter.  Set to `true` to unlock the outputs specified.  If this is the only argument specified and it is set to `true`, all outputs will be unlocked; if it is the only argument and is set to `false`, there will be no change

*Parameter #2---the outputs to lock or unlock*

Name | Type | Presence | Description
--- | --- | --- | ---
Outputs | array | Optional<br>(0 or 1) | An array of outputs to lock or unlock
→<br>Output | object | Required<br>(1 or more) | An object describing a particular output
→ →<br>`txid` | string | Required<br>(exactly 1) | The TXID of the transaction containing the output to lock or unlock, encoded as hex in internal byte order
→ →<br>`vout` | number (int) | Required<br>(exactly 1) | The output index number (vout) of the output to lock or unlock.  The first output in a transaction has an index of `0`

*Result---`true` if successful*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool | Required<br>(exactly 1) | Set to `true` if the outputs were successfully locked or unlocked.  If the outputs were already locked or unlocked, it will also return `true`

*Example from Dash Core 0.12.2*

Lock two outputs:

``` bash
dash-cli -testnet lockunspent false '''
  [
    {
      "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
      "vout": 0
    },
    {
      "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
      "vout": 1
    }
  ]
'''
```

Result:

``` json
true
```

Verify the outputs have been locked:

``` bash
dash-cli -testnet listlockunspent
```

Result

``` json
[
  {
    "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
    "vout": 0
  },
  {
    "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
    "vout": 1
  }
]
```

Unlock one of the above outputs:

``` bash
dash-cli -testnet lockunspent true '''
[
  {
    "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
    "vout": 1
  }
]
'''
```

Result:

``` json
true
```

Verify the output has been unlocked:

``` bash
dash-cli -testnet listlockunspent
```

Result:

``` json
[
  {
    "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
    "vout": 0
  }
]
```

*See also*

* [ListLockUnspent](/docs/core-api-ref-remote-procedure-calls-wallet#section-listlockunspent): returns a list of temporarily unspendable (locked) outputs.
* [ListUnspent](/docs/core-api-ref-remote-procedure-calls-wallet#section-listunspent): returns an array of unspent transaction outputs belonging to this wallet.

# Move

*Requires wallet support.*

The `move` RPC moves a specified amount from one account in your wallet to another using an off-block-chain transaction.

{{WARNING}} `move` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

{{WARNING}} it's allowed to move more funds than are in an account,
giving the sending account a negative balance and giving the receiving
account a balance that may exceed the number of dash in the wallet
(or the number of dash in existence).

*Parameter #1---from account*

Name | Type | Presence | Description
--- | --- | --- | ---
From Account | string | Required<br>(exactly 1) | The name of the account to move the funds from

*Parameter #2---to account*

Name | Type | Presence | Description
--- | --- | --- | ---
To Account | string | Required<br>(exactly 1) | The name of the account to move the funds to

*Parameter #3---amount to move*

Name | Type | Presence | Description
--- | --- | --- | ---
Amount | number (dash) | Required<br>(exactly 1) | The amount of dash to move

*Parameter #4---an unused parameter*

Name | Type | Presence | Description
--- | --- | --- | ---
*Unused* | number (int) | Optional<br>(0 or 1) | This parameter is no longer used. If parameter #5 needs to be specified, this can be any integer

*Parameter #5---a comment*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment | string | Optional<br>(0 or 1) | A comment to assign to this move payment

*Result---`true` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool | Required<br>(exactly 1) | Set to `true` if the move was successful

*Example from Dash Core 0.12.2*

Move 1 dash from "doc test" to "test1", giving the transaction the
comment "Example move":

``` bash
dash-cli -testnet move "doc test" "test1" 0.1 0 "Example move"
```

Result:

``` json
true
```

*See also*

* [ListAccounts](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaccounts): lists accounts and their balances.
* [SendFrom](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendfrom): spends an amount from a local account to a dash address.
* [SendToAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendtoaddress): spends an amount to a given address.

# RemovePrunedFunds

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

*Requires wallet support.*

The `removeprunedfunds` RPC deletes the specified transaction from the wallet. Meant for use with pruned wallets and as a companion to importprunedfunds. This will effect wallet balances.

*Parameter #1---the raw transaction to import*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string<br>(hex) | Required<br>(exactly 1) | The hex-encoded id of the transaction you are removing

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | If the funds are removed from the wallet, JSON `null` will be returned

*Example from Dash Core 0.12.3*

``` bash
dash-cli removeprunedfunds bb7daff525b83fa6a847ab50bf7f8f14d6\
22761a19f69157b362ef3f25bda687
```

(Success: no result displayed.)

*See also*

* [ImportPrivKey](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the `dumpprivkey` RPC.
* [ImportPrunedFunds](/docs/core-api-ref-remote-procedure-calls-wallet#section-importprunedfunds): imports funds without the need of a rescan. Meant for use with pruned wallets.

# SendFrom

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `sendfrom` RPC spends an amount from a local account to a dash address.

{{WARNING}} `sendfrom` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---from account*

Name | Type | Presence | Description
--- | --- | --- | ---
From Account | string | Required<br>(exactly 1) | The name of the account from which the dash should be spent.  Use an empty string (\\") for the default account"

*Parameter #2---to address*

Name | Type | Presence | Description
--- | --- | --- | ---
To Address | string | Required<br>(exactly 1) | A P2PKH or P2SH address to which the dash should be sent

*Parameter #3---amount to spend*

Name | Type | Presence | Description
--- | --- | --- | ---
Amount | number (dash) | Required<br>(exactly 1) | The amount to spend in dash.  Dash Core will ensure the account has sufficient dash to pay this amount (but the transaction fee paid is not included in the calculation, so an account can spend a total of its balance plus the transaction fee)

*Parameter #4---minimum confirmations*

{{INCLUDE_SPEND_CONFIRMATIONS}}

*Parameter #5---whether to add the balance from transactions locked via InstantSend*

{{INCLUDE_ADD_LOCKED_PARAMETER}}

*Parameter #6---a comment*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment | string | Optional<br>(0 or 1) | A locally-stored (not broadcast) comment assigned to this transaction.  Default is no comment

*Parameter #7---a comment about who the payment was sent to*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment To | string | Optional<br>(0 or 1) | A locally-stored (not broadcast) comment assigned to this transaction.  Meant to be used for describing who the payment was sent to. Default is no comment

*Result---a TXID of the sent transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The TXID of the sent transaction, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

Spend 0.1 dash from the account "test" to the address indicated below
using only UTXOs with at least six confirmations, giving the
transaction the comment "Example spend" and labeling the spender
"Example.com":

``` bash
dash-cli -testnet sendfrom "test" \
            yhJays6zGUFKq1KS5V5WLbyk3cwCXyGrKd \
            0.1 \
            6 \
            false \
            "Example spend" \
            "Example.com"
```

Result:

``` text
cd64b9d55c63bf247f2eca32f978e340622107b607a46c422dabcdc20c0571fe
```

*See also*

* [SendToAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendtoaddress): spends an amount to a given address.
* [SendMany](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendmany): creates and broadcasts a transaction which sends outputs to multiple addresses.

# SendMany

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `sendmany` RPC creates and broadcasts a transaction which sends outputs to multiple addresses.

*Parameter #1---from account*

Name | Type | Presence | Description
--- | --- | --- | ---
From Account | string | Required<br>(exactly 1) | *Deprecated: will be removed in a later version of Dash Core*<br><br>The name of the account from which the dash should be spent.  Use an empty string (\\") for the default account. Dash Core will ensure the account has sufficient dash to pay the total amount in the *outputs* field described below (but the transaction fee paid is not included in the calculation, so an account can spend a total of its balance plus the transaction fee)"

*Parameter #2---the addresses and amounts to pay*

Name | Type | Presence | Description
--- | --- | --- | ---
Outputs | object | Required<br>(exactly 1) | An object containing key/value pairs corresponding to the addresses and amounts to pay
→<br>Address/Amount | string (base58) : number (dash) | Required<br>(1 or more) | A key/value pair with a base58check-encoded string containing the P2PKH or P2SH address to pay as the key, and an amount of dash to pay as the value

*Parameter #3---minimum confirmations*

{{INCLUDE_SPEND_CONFIRMATIONS}}

*Parameter #4--whether to add the balance from transactions locked via InstantSend*
{{INCLUDE_ADD_LOCKED_PARAMETER}}

*Parameter #5---a comment*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment | string | Optional<br>(0 or 1) | A locally-stored (not broadcast) comment assigned to this transaction.  Default is no comment

*Parameter #6---automatic fee subtraction*

Name | Type | Presence | Description
--- | --- | --- | ---
Subtract Fee From Amount | array | Optional<br>(0 or 1) | An array of addresses.  The fee will be equally divided by as many addresses as are entries in this array and subtracted from each address.  If this array is empty or not provided, the fee will be paid by the sender
→<br>Address | string (base58) | Optional (0 or more) | An address previously listed as one of the recipients.

*Parameter #7---use InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
Use InstantSend | bool | Optional<br>(0 or 1) | *Deprecated and ignored since Dash Core 0.14.1*

*Parameter #8---use PrivateSend*

Name | Type | Presence | Description
--- | --- | --- | ---
Use PrivateSend | bool | Optional<br>(0 or 1) | If set to `true`, use anonymized funds only (default: false).

*Parameter #9---confirmation target*

Name | Type | Presence | Description
--- | --- | --- | ---
`conf_target` | number (int) | Optional<br>(0 or 1) | Confirmation target (in blocks)

*Parameter #10---fee estimate mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`estimate_mode` | string | Optional<br>(0 or 1) |  The fee estimate mode, must be one of:<br>`UNSET`<br>`ECONOMICAL`<br>`CONSERVATIVE`<br>Default: `UNSET`

*Result---a TXID of the sent transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The TXID of the sent transaction, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

From the account *test1*, send 0.1 dash to the first address and 0.2
dash to the second address, with a comment of "Example Transaction".

``` bash
dash-cli -testnet sendmany \
  "test1" \
  '''
    {
      "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 0.1,
      "yhQrX8CZTTfSjKmaq5h7DgSShyEsumCRBi": 0.2
    } ''' \
  6       \
  false   \
  "Example Transaction"
```

Result:

``` text
a7c0194a005a220b9bfeb5fdd12d5b90979c10f53de4f8a48a1495aa198a6b95
```

*Example from Dash Core 0.12.2 (InstantSend)*

From the account *test1*, send 0.1 dash to the first address and 0.2
dash to the second address using InstantSend, with a comment of "Example Transaction".

``` bash
dash-cli -testnet sendmany \
  "test1" \
  '''
    {
      "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 0.1,
      "yhQrX8CZTTfSjKmaq5h7DgSShyEsumCRBi": 0.2
    } ''' \
  6       \
  false   \
  "Example Transaction"
  '''
    [""]
  '''     \
  true
```

Result:

``` text
3a5bbaa1a7aa3a8af45e8f1adf79528f99efc61052b0616d41b33fb8fb7af347
```

*Example from Dash Core 0.12.2 (PrivateSend)*

From the account *test1*, send 0.1 dash to the first address and 0.2
dash to the second address using PrivateSend, with a comment of "Example Transaction".

``` bash
dash-cli -testnet sendmany \
  "test1" \
  '''
    {
      "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 0.1,
      "yhQrX8CZTTfSjKmaq5h7DgSShyEsumCRBi": 0.2
    } ''' \
  6       \
  false   \
  "Example Transaction"
  '''
    [""]
  '''    \
  false  \
  true
```

Result:

``` text
43337c8e4f3b21bedad7765fa851a6e855e4bb04f60d6b3e4c091ed21ffc5753
```

*See also*

* [SendFrom](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendfrom): spends an amount from a local account to a dash address.
* [SendToAddress](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendtoaddress): spends an amount to a given address.
* [Move](/docs/core-api-ref-remote-procedure-calls-wallet#section-move): moves a specified amount from one account in your wallet to another using an off-block-chain transaction.

# SendToAddress

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `sendtoaddress` RPC spends an amount to a given address.

*Parameter #1---to address*

Name | Type | Presence | Description
--- | --- | --- | ---
To Address | string | Required<br>(exactly 1) | A P2PKH or P2SH address to which the dash should be sent

*Parameter #2---amount to spend*

Name | Type | Presence | Description
--- | --- | --- | ---
Amount | number (dash) | Required<br>(exactly 1) | The amount to spent in dash

*Parameter #3---a comment*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment | string | Optional<br>(0 or 1) | A locally-stored (not broadcast) comment assigned to this transaction.  Default is no comment

*Parameter #4---a comment about who the payment was sent to*

Name | Type | Presence | Description
--- | --- | --- | ---
Comment To | string | Optional<br>(0 or 1) | A locally-stored (not broadcast) comment assigned to this transaction.  Meant to be used for describing who the payment was sent to. Default is no comment

*Parameter #5---automatic fee subtraction*

Name | Type | Presence | Description
--- | --- | --- | ---
Subtract Fee From Amount | boolean | Optional<br>(0 or 1) | The fee will be deducted from the amount being sent. The recipient will receive less dash than you enter in the amount field. Default is `false`

*Parameter #6---use InstantSend*

Name | Type | Presence | Description
--- | --- | --- | ---
Use InstantSend | bool | Optional<br>(0 or 1) | *Deprecated and ignored since Dash Core 0.14.1*

*Parameter #7---use PrivateSend*

Name | Type | Presence | Description
--- | --- | --- | ---
Use PrivateSend | bool | Optional<br>(0 or 1) | If set to `true`, use anonymized funds only (default: false).

*Parameter #8---confirmation target*

Name | Type | Presence | Description
--- | --- | --- | ---
`conf_target` | number (int) | Optional<br>(0 or 1) | Confirmation target (in blocks)

*Parameter #9---fee estimate mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`estimate_mode` | string | Optional<br>(0 or 1) |  The fee estimate mode, must be one of:<br>`UNSET`<br>`ECONOMICAL`<br>`CONSERVATIVE`<br>Default: `UNSET`

*Result---a TXID of the sent transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The TXID of the sent transaction, encoded as hex in RPC byte order

*Example from Dash Core 0.12.2*

Spend 0.1 dash to the address below with the comment "sendtoaddress
example" and the comment-to "Nemo From Example.com":

``` bash
dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
  1.0 "sendtoaddress example" "Nemo From Example.com"
```

Result:

``` text
70e2029d363f0110fe8a0aa2ba7bd771a579453135568b2aa559b2cb30f875aa
```

*Example from Dash Core 0.12.2 (InstantSend)*

Spend 0.1 dash via InstantSend to the address below with the comment "sendtoaddress
example" and the comment-to "Nemo From Example.com":

``` bash
dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
  1.0 "sendtoaddress example" "Nemo From Example.com" false true
```

Result:

``` text
af002b9c931b5efb5b2852df3d65efd48c3b9ac2ba0ef8a4cf97b894f3ff08c2
```

*Example from Dash Core 0.12.2 (PrivateSend)*

Spend 0.1 dash via PrivateSend to the address below with the comment "sendtoaddress
example" and the comment-to "Nemo From Example.com":

``` bash
dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
  1.0 "sendtoaddress example" "Nemo From Example.com" false false true
```

Result:

``` text
949833bc49e0643f63e2afed1704ccccf005a93067a4e46165b06ace42544694
```

*Example from Dash Core 0.12.2 (InstantSend + PrivateSend)*

Spend 0.1 dash via InstantSend and PrivateSend to the address below with the
comment "sendtoaddressexample" and the comment-to "Nemo From Example.com":

``` bash
dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
  1.008 "sendtoaddress example" "Nemo From Example.com" false true true
```

Result:

``` text
ba4bbe29fa06b67d6f3f3a73e381627e66abe22e217ce329aefad41ea72c3922
```

*See also*

* [SendFrom](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendfrom): spends an amount from a local account to a dash address.
* [SendMany](/docs/core-api-ref-remote-procedure-calls-wallet#section-sendmany): creates and broadcasts a transaction which sends outputs to multiple addresses.
* [Move](/docs/core-api-ref-remote-procedure-calls-wallet#section-move): moves a specified amount from one account in your wallet to another using an off-block-chain transaction.

# SetAccount

*Requires wallet support.*

The `setaccount` RPC puts the specified address in the given account.

{{WARNING}} `setaccount` will be removed in a later version of Dash
Core.  Use the RPCs listed in the See Also subsection below instead.

*Parameter #1---a dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH or P2SH address to put in the account.  Must already belong to the wallet

*Parameter #2---an account*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of the account in which the address should be placed.  May be the default account, an empty string (\\")"

*Result---`null` if successful*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Set to JSON `null` if the address was successfully placed in the account

*Example from Dash Core 0.12.2*

Put the address indicated below in the "doc test" account.

``` bash
dash-cli -testnet setaccount \
    yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq "doc test"
```

(Success: no result displayed.)

*See also*

* [GetAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaccount): returns the name of the account associated with the given address.
* [ListAccounts](/docs/core-api-ref-remote-procedure-calls-wallet#section-listaccounts): lists accounts and their balances.
* [GetAddressesByAccount](/docs/core-api-ref-remote-procedure-calls-wallet#section-getaddressesbyaccount): returns a list of every address assigned to a particular account.

# SetPrivateSendAmount

The `setprivatesendamount` RPC sets the amount of DASH to be mixed with PrivateSend

*Parameter #1---amount to mix*

Name | Type | Presence | Description
--- | --- | --- | ---
Amount | int | Required<br>(exactly 1) | The number of DASH to mix (minimum: 2, maximum: 21,000,000)

*Result---`null` on success*

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet setprivatesendamount 2000
```

(Success: no result displayed.)

*See also:*

* [SetPrivateSendRounds](/docs/core-api-ref-remote-procedure-calls-wallet#section-setprivatesendrounds): sets the number of PrivateSend mixing rounds to use

# SetPrivateSendRounds

The `setprivatesendrounds` RPC sets the number of PrivateSend mixing rounds to use

*Parameter #1---number of mixing rounds to use*

Name | Type | Presence | Description
--- | --- | --- | ---
Rounds | int | Required<br>(exactly 1) | The number of mixing rounds to use (minimum: 1, maximum: 16)

*Result---`null` on success*

*Example from Dash Core 0.13.0*

``` bash
dash-cli -testnet setprivatesendrounds 4
```

(Success: no result displayed.)

*See also:*

* [SetPrivateSendAmount](/docs/core-api-ref-remote-procedure-calls-wallet#section-setprivatesendamount): sets the amount of DASH to be mixed with PrivateSend

# SetTxFee

*Requires wallet support.*

The `settxfee` RPC sets the transaction fee per kilobyte paid by transactions created by this wallet.

*Parameter #1---the transaction fee amount per kilobyte*

Name | Type | Presence | Description
--- | --- | --- | ---
Transaction Fee Per Kilobyte | number (dash) | Required<br>(exactly 1) | The transaction fee to pay, in dash, for each kilobyte of transaction data.  Be careful setting the fee too low---your transactions may not be relayed or included in blocks

*Result: `true` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool (true) | Required<br>(exactly 1) | Set to `true` if the fee was successfully set

*Example from Dash Core 0.12.2*

Set the transaction fee per kilobyte to 10,000 duffs.

``` bash
dash-cli -testnet settxfee 0.00010000
```

Result:

``` json
true
```

*See also*

* [GetWalletInfo](/docs/core-api-ref-remote-procedure-calls-wallet#section-getwalletinfo): provides information about the wallet.
* [GetNetworkInfo](/docs/core-api-ref-remote-procedure-calls-network#section-getnetworkinfo): returns information about the node's connection to the network.

# SignMessage

*Requires wallet support. Requires an unlocked wallet or an
unencrypted wallet.*

The `signmessage` RPC signs a message with the private key of an address.

*Parameter #1---the address corresponding to the private key to sign with*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | A P2PKH address whose private key belongs to this wallet

*Parameter #2---the message to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
Message | string | Required<br>(exactly 1) | The message to sign

*Result---the message signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base64) | Required<br>(exactly 1) | The signature of the message, encoded in base64.

*Example from Dash Core 0.12.2*

Sign a the message "Hello, World!" using the following address:

``` bash
dash-cli -testnet signmessage yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb "Hello, World!"
```

Result:

``` text
H4XULzfHCf16In2ECk9Ta9QxQPq639zQto2JA3OLlo3JbUdrClvJ89+A1z+Z9POd6l8LJhn1jGpQYF8mX4jkQvE=
```

*See also*

* [VerifyMessage](/docs/core-api-ref-remote-procedure-calls-utility#section-verifymessage): verifies a signed message.

# WalletLock

*Requires wallet support. Requires an unlocked wallet.*

The `walletlock` RPC removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call `walletpassphrase` again before being able to call any methods which require the wallet to be unlocked.

*Parameters: none*

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always set to JSON `null`

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet walletlock
```

(Success: nothing printed.)

*See also*

* [EncryptWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-encryptwallet): encrypts the wallet with a passphrase.  This is only to enable encryption for the first time. After encryption is enabled, you will need to enter the passphrase to use private keys.
* [WalletPassphrase](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrase): stores the wallet decryption key in memory for the indicated number of seconds. Issuing the `walletpassphrase` command while the wallet is already unlocked will set a new unlock time that overrides the old one.
* [WalletPassphraseChange](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrasechange): changes the wallet passphrase from 'old passphrase' to 'new passphrase'.

# WalletPassphrase

*Requires wallet support. Requires an encrypted wallet.*

The `walletpassphrase` RPC stores the wallet decryption key in memory for the indicated number of seconds. Issuing the `walletpassphrase` command while the wallet is already unlocked will set a new unlock time that overrides the old one.

{{WARNING}} if using this RPC on the command line, remember
that your shell probably saves your command lines (including the
value of the passphrase parameter).

*Parameter #1---the passphrase*

Name | Type | Presence | Description
--- | --- | --- | ---
Passphrase | string | Required<br>(exactly 1) | The passphrase that unlocks the wallet

*Parameter #2---the number of seconds to leave the wallet unlocked*

Name | Type | Presence | Description
--- | --- | --- | ---
Seconds | number (int) | Required<br>(exactly 1) | The number of seconds after which the decryption key will be automatically deleted from memory

*Parameter #3---unlock for PrivateSend mixing only*

Name | Type | Presence | Description
--- | --- | --- | ---
Mixing Only | bool | Optional<br>(0 or 1) | If `true`, the wallet will be locked for sending functions but unlocked for mixing transactions (default: false)

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always set to JSON `null`

*Example from Dash Core 0.12.2*

Unlock the wallet for 10 minutes (the passphrase is "test"):

``` bash
dash-cli -testnet walletpassphrase test 600
```

(Success: no result printed.)

Unlock the wallet for mixing transactions only for 10 minutes (the passphrase is "test"):

``` bash
dash-cli -testnet walletpassphrase test 600 true
```

(Success: no result printed.)

*See also*

* [EncryptWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-encryptwallet): encrypts the wallet with a passphrase.  This is only to enable encryption for the first time. After encryption is enabled, you will need to enter the passphrase to use private keys.
* [WalletPassphraseChange](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrasechange): changes the wallet passphrase from 'old passphrase' to 'new passphrase'.
* [WalletLock](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletlock): removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call `walletpassphrase` again before being able to call any methods which require the wallet to be unlocked.

# WalletPassphraseChange

*Requires wallet support.  Requires an encrypted wallet.*

The `walletpassphrasechange` RPC changes the wallet passphrase from 'old passphrase' to 'new passphrase'.

{{WARNING}} if using this RPC on the command line, remember
that your shell probably saves your command lines (including the
value of the passphrase parameter).

*Parameter #1---the current passphrase*

Name | Type | Presence | Description
--- | --- | --- | ---
Current Passphrase | string | Required<br>(exactly 1) | The current wallet passphrase

*Parameter #2---the new passphrase*

Name | Type | Presence | Description
--- | --- | --- | ---
New Passphrase | string | Required<br>(exactly 1) | The new passphrase for the wallet

*Result---`null` on success*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always set to JSON `null`

*Example from Dash Core 0.12.2*

Change the wallet passphrase from "test" to "example":

``` bash
dash-cli -testnet walletpassphrasechange "test" "example"
```

(Success: no result printed.)

*See also*

* [EncryptWallet](/docs/core-api-ref-remote-procedure-calls-wallet#section-encryptwallet): encrypts the wallet with a passphrase.  This is only to enable encryption for the first time. After encryption is enabled, you will need to enter the passphrase to use private keys.
* [WalletPassphrase](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletpassphrase): stores the wallet decryption key in memory for the indicated number of seconds. Issuing the `walletpassphrase` command while the wallet is already unlocked will set a new unlock time that overrides the old one.
* [WalletLock](/docs/core-api-ref-remote-procedure-calls-wallet#section-walletlock): removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call `walletpassphrase` again before being able to call any methods which require the wallet to be unlocked.

>>>>>>>> Removed RPCs

# EstimatePriority

{{WARNING}} **_Removed in Dash Core 0.14.0._**

The `estimatepriority` RPC was removed in Dash Core 0.14.0. This should not to be confused with the `prioritisetransaction` RPC which will remain supported for adding fee deltas to transactions.

*Parameter #1---how many blocks the transaction may wait before being included as a free high-priority transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
Blocks | number (int) | Required<br>(exactly 1) | The maximum number of blocks a transaction should have to wait before it is predicted to be included in a block based purely on its priority

*Result---the priority a transaction needs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (real) | Required<br>(exactly 1) | The estimated priority the transaction should have in order to be included within the specified number of blocks.  If the node doesn't have enough information to make an estimate, the value `-1` will be returned

*Examples from Dash Core 0.12.2*

``` bash
dash-cli estimatepriority 6
```

Result:

``` json
718158904.10958910
```

Requesting data the node can't calculate yet:

``` bash
dash-cli estimatepriority 100
```

Result:

``` json
-1
```

*See also*

* [EstimateFee](/docs/core-api-ref-remote-procedure-calls-utility#section-estimatefee): estimates the transaction fee per kilobyte that needs to be paid for a transaction to begin confirmation within a certain number of blocks.

# EstimateSmartPriority

{{WARNING}} **_Removed in Dash Core 0.14.0._**

The `estimatesmartpriority` RPC was removed in Dash Core 0.14.0. This should not to be confused with the `prioritisetransaction` RPC which will remain supported for adding fee deltas to transactions.

*Parameter #1---how many blocks the transaction may wait before being included as a free high-priority transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
Blocks | number (int) | Required<br>(exactly 1) | The maximum number of blocks a transaction should have to wait before it is predicted to be included in a block based purely on its priority

*Result---the priority a transaction needs*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | JSON Object containing estimate information
→<br>`priority` | number | Required<br>(exactly 1) | The estimated priority the transaction should be in order to be included within the specified number of blocks.  If the node doesn't have enough information to make an estimate, the value `-1` will be returned
→<br>`blocks` | number | Required<br>(exactly 1) | Block number where the estimate was found

*Examples from Dash Core 0.12.2*

``` bash
dash-cli estimatesmartpriority 6
```

Result:

``` json
{
  "priority": 718158904
  "blocks": 25
}
```

Requesting data the node can't calculate yet:

``` bash
dash-cli estimatesmartpriority 100
```

Result:

``` json
{
  "priority": -1,
  "blocks": 100
}
```

*See also*

* [EstimatePriority](/docs/core-api-ref-remote-procedure-calls-removed#section-estimatepriority): was removed in Dash Core 0.14.0.

# GetHashesPerSec

*Requires wallet support.*

{{WARNING_ICON}} The `gethashespersec` RPC was removed in Bitcoin Core 0.11.0 and is not part of Dash.

*See also*

* [Generate](/docs/core-api-ref-remote-procedure-calls-generating#section-generate): mines blocks immediately (before the RPC call returns).
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.

# GetWork

{{WARNING_ICON}} The `getwork` RPC was removed in Bitcoin Core 0.10.0. and is not part of Dash.

*See also*

* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.
* [SubmitBlock](/docs/core-api-ref-remote-procedure-calls-mining#section-submitblock): accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.

# GetGenerate

*Requires wallet support.*

**_Removed in Dash Core 0.12.3 / Bitcoin Core 0.13.0._**

The `getgenerate` RPC was removed in Dash Core 0.12.3.

*Parameters: none*

*Result---whether the server is set to generate blocks*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool | Required<br>(exactly 1) | Set to `true` if the server is set to generate blocks; set to `false` if it is not

*Example from Dash Core 0.12.2*

``` bash
dash-cli -regtest getgenerate
```

Result:

``` json
false
```

*See also*

* [Generate](/docs/core-api-ref-remote-procedure-calls-generating#section-generate): mines blocks immediately (before the RPC call returns).
* [GenerateToAddress](/docs/core-api-ref-remote-procedure-calls-generating#section-generatetoaddress): mines blocks immediately to a specified address.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [SetGenerate](/docs/core-api-ref-remote-procedure-calls-removed#section-setgenerate): was removed in Dash Core 0.12.3.

# MasternodeBroadcast

{{WARNING}} **_Removed in Dash Core 0.14.0._**

The `masternodebroadcast` RPC was removed in Dash Core 0.14.0.

*Parameter #1---masternode broadcast command*

Name | Type | Presence | Description
--- | --- | --- | ---
`command` | string (hex) | Required<br>(exactly 1) | The command to use:<br>`create-alias`<br>`create-all`<br>`decode`<br>`relay`

## MNB create-alias

The `masternodebroadcast create-alias` RPC creates single remote masternode broadcast message by assigned alias configured in `masternode.conf`.

*Parameter #2---masternode alias*

Name | Type | Presence | Description
--- | --- | --- | ---
`alias` | string | Required<br>(exactly 1) | The masternode alias for creating the broadcast message

*Result---broadcast message*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing result data
→<br>`alias` | string | Required<br>(exactly 1) | Alias of the masternode
→<br>`result` | string | Required<br>(exactly 1) | Result of broadcast message create attempt
→<br>`hex` | string (hex) | Required<br>(exactly 1) | Masternode broadcast data

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternodebroadcast create-alias MN01
```

Result:
``` json
{
  "alias": "MN01",
  "result": "successful",
  "hex": "010fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff00000000000000000000ffff2d20ed4c4e1f210267fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f24104341ab0d26ae967856213df205bf172418422a847f3a63941d8031234a64a143f5570a6010d2b5e1dff163c91316a65667f0ee1bfb0ff38edd0a695bea75de731411f8a9bf1e7818c7352c8a02bd31a4da1bb8d88e91c8a9c7151afc076b6a68f54c9087a981a780e6279e9d7b73940ee7aad65c28e4846573bffa74518443380dfde4d3c145a00000000401201000fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff69fc28f4772eaefd17cd1bab575aac752b5944ee3e7221df204b4d04000000004d3c145a00000000411bef1bdf25a500ae2af4052e8504e2f93ec365d5ed9d42e3c52b84714136060f9766068553c450a4b1c0b3d72740580f097f7e62c098addc55f71f016cfda24d7a0001000100"
}
```

## MNB create-all

The `masternodebroadcast create-all` RPC creates remote masternode broadcast messages for all masternodes configured in `masternode.conf`.

*Result---broadcast message(s)*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing result data
→<br>`overall` | string | Required<br>(exactly 1) | Summary of broadcast message creation success/failure
→<br>detail | object | Required<br>(exactly 1) | Object containing status details
→ →<br>status | object | Required<br>(1 or more) | Object containing status for each each masternode broadcast message creation attempt
→ → →<br>`alias` | string | Required<br>(exactly 1) | Alias of the masternode
→ → →<br>`result` | string | Required<br>(exactly 1) | Result - `successful` or `failed`
→ → →<br>`error` | string | Optional | Error message if failed
→<br>`hex` | string (hex) | Optional<br>(exactly 1) | Masternode broadcast data (if message(s) created successfully)

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternodebroadcast create-all
```

Result:
``` json
{
  "overall": "Successfully created broadcast messages for 1 masternodes, failed to create 0, total 1",
  "detail": {
    "status": {
      "alias": "MN01",
      "result": "successful"
    }
  },
  "hex": "010fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff00000000000000000000ffff2d20ed4c4e1f210267fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f24104341ab0d26ae967856213df205bf172418422a847f3a63941d8031234a64a143f5570a6010d2b5e1dff163c91316a65667f0ee1bfb0ff38edd0a695bea75de731411f555444bd95d98b8407ff1b8cc595a3d284c30b9bbaca488a949bc53be08ca1021724527f9a15e9307c7391d9ad563dcc9ced6ae621ae7d6fe3e3c3ba81dce795d143145a00000000401201000fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff914dff1cc3dfc0729bb1f4e3f070d65d1fa41072da5290a54d472d0400000000d143145a00000000411c628109c911ef330aaa789bd621f8c7975290d196beef3ecdaa1133302daccdaa3df82b1f16d753fef884ce3a3eb28a7b621233c14496a010bb49f247190651100001000100"
}
```

## MNB decode

The `masternodebroadcast decode` RPC decodes a masternode broadcast message (deserializes from a hex string to JSON).

*Parameter #2---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | The data (hex) of the masternode broadcast to decode

*Result---broadcast message(s)*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing result data
→<br>`outpoint` | string (hex) | Required<br>(exactly 1) | Masternode outpoint
→<br>`addr` | string | Required<br>(exactly 1) | Masternode IP address and port
→<br>`pubKeyCollateralAddress` | string (hex) | Required<br>(1 or more) | Masternode collateral public key address
→<br>`pubKeyMasternode` | string (hex) | Required<br>(exactly 1) | Masternode public key
→<br>`vchSig` | string (base64) | Required<br>(exactly 1) | Masternode signature
→<br>`sigTime` | int64_t | Required<br>(exactly 1) | Signature time as a Unix epoch
→<br>`protocolVersion` | int | Required<br>(exactly 1) | Dash protocol version
→<br>`nLastDsq` | int64_t | Required<br>(exactly 1) | Dsq count from the last `dsq` message from this node
→<br>lastPing | object | Required<br>(exactly 1) | Ping object (`mnp` message)
→ →<br>`outpoint` | string (hex) | Required<br>(exactly 1) | Masternode outpoint
→ →<br>`blockHash` | string (hex) | Required<br>(exactly 1) | Block hash from 12 blocks prior to the current tip
→ →<br>`sigTime` | int64_t | Required<br>(exactly 1) | Signature time as a Unix epoch
→ →<br>`vchSig` | string (base64) | Required<br>(exactly 1) | Masternode signature
→<br>`overall` | string | Required<br>(exactly 1) | Summary of broadcast message creation success/failure

*Example from Dash Core 0.12.2*
￼``` bash
masternodebroadcast decode 010fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c4\
8778a4fa6bd93fc8f60100000000ffffffff00000000000000000000ffff2d20ed4c4e1f2102\
67fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f24104341ab0d2\
6ae967856213df205bf172418422a847f3a63941d8031234a64a143f5570a6010d2b5e1dff16\
3c91316a65667f0ee1bfb0ff38edd0a695bea75de731411f8a9bf1e7818c7352c8a02bd31a4d\
a1bb8d88e91c8a9c7151afc076b6a68f54c9087a981a780e6279e9d7b73940ee7aad65c28e48\
46573bffa74518443380dfde4d3c145a00000000401201000fab7e86a6d7c483b836fe862c8a\
23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff69fc28f4772eaefd17cd1b\
ab575aac752b5944ee3e7221df204b4d04000000004d3c145a00000000411bef1bdf25a500ae\
2af4052e8504e2f93ec365d5ed9d42e3c52b84714136060f9766068553c450a4b1c0b3d72740\
580f097f7e62c098addc55f71f016cfda24d7a0001000100
```

Result:
``` json
{
  "36b753f9c8d328d405b8a909bbf4fd29c0d37aa48eae98fa1289b90e36e002c4": {
    "outpoint": "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1",
    "addr": "45.32.237.76:19999",
    "pubKeyCollateralAddress": "yY6AmGopsZS31wy1JLHR9P6AC6owFaXwuh",
    "pubKeyMasternode": "yj25teTD6yjcNpQC7inq72tDgsivG6xLZM",
    "vchSig": "H4qb8eeBjHNSyKAr0xpNobuNiOkcipxxUa/Adramj1TJCHqYGngOYnnp17c5QO56rWXCjkhGVzv/p0UYRDOA394=",
    "sigTime": 1511275597,
    "protocolVersion": 70208,
    "nLastDsq": 0,
    "lastPing": {
      "outpoint": "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1",
      "blockHash": "00000000044d4b20df21723eee44592b75ac5a57ab1bcd17fdae2e77f428fc69",
      "sigTime": 1511275597,
      "vchSig": "G+8b3yWlAK4q9AUuhQTi+T7DZdXtnULjxSuEcUE2Bg+XZgaFU8RQpLHAs9cnQFgPCX9+YsCYrdxV9x8BbP2iTXo="
    }
  },
  "overall": "Successfully decoded broadcast messages for 1 masternodes, failed to decode 0, total 1"
}
```

## MNB relay

The `masternodebroadcast relay` RPC relays a masternode broadcast message to the network.

*Parameter #2---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | The data (hex) of the masternode broadcast to relay

*Result---broadcast message(s)*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing result data
→<br>Hash | string (hex) | Required<br>(1 or more) | Masternode broadcast hash
→ →<br>`outpoint` | string (hex) | Required<br>(exactly 1) | Masternode outpoint
→ →<br>`addr` | string | Required<br>(exactly 1) | Masternode IP address and port
→ →<br>Result | string (hex) | Required<br>(exactly 1) | Result - `successful` or `failed`
→ → →<br>`error` | string | Optional | Error message if failed
→<br>`overall` | string | Required<br>(exactly 1) | Summary of broadcast message creation success/failure

*Example from Dash Core 0.12.2*
￼``` bash
masternodebroadcast relay 010fab7e86a6d7c483b836fe862c8a23f69aebadce7c58c4\
8778a4fa6bd93fc8f60100000000ffffffff00000000000000000000ffff2d20ed4c4e1f2102\
67fae84ef6aa6ab3d877b47932915a9b406566c873ea025986fc7e15a15fd2f24104341ab0d2\
6ae967856213df205bf172418422a847f3a63941d8031234a64a143f5570a6010d2b5e1dff16\
3c91316a65667f0ee1bfb0ff38edd0a695bea75de731411f8a9bf1e7818c7352c8a02bd31a4d\
a1bb8d88e91c8a9c7151afc076b6a68f54c9087a981a780e6279e9d7b73940ee7aad65c28e48\
46573bffa74518443380dfde4d3c145a00000000401201000fab7e86a6d7c483b836fe862c8a\
23f69aebadce7c58c48778a4fa6bd93fc8f60100000000ffffffff69fc28f4772eaefd17cd1b\
ab575aac752b5944ee3e7221df204b4d04000000004d3c145a00000000411bef1bdf25a500ae\
2af4052e8504e2f93ec365d5ed9d42e3c52b84714136060f9766068553c450a4b1c0b3d72740\
580f097f7e62c098addc55f71f016cfda24d7a0001000100
```

Result:
``` json
{
  "36b753f9c8d328d405b8a909bbf4fd29c0d37aa48eae98fa1289b90e36e002c4": {
    "outpoint": "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1",
    "addr": "45.32.237.76:19999",
    "36b753f9c8d328d405b8a909bbf4fd29c0d37aa48eae98fa1289b90e36e002c4": "successful"
  },
  "overall": "Successfully relayed broadcast messages for 1 masternodes, failed to relay 0, total 1"
}
```

*See also: none*

# SentinelPing

{{WARNING}} **_Removed in Dash Core 0.14.0._**

The `sentinelping` RPC was removed in Dash Core 0.14.0.

*Parameter #1---sentinel version*

Name | Type | Presence | Description
--- | --- | --- | ---
Version | string | Required<br>(exactly 1) | Sentinel version in the form 'x.x.x'

*Result---the message signature*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | bool | Required<br>(exactly 1) | Ping result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet sentinelping
```

Result:
``` json
true
```

*See also: none*

# SetGenerate

*Requires wallet support.*

**_Removed in Dash Core 0.12.3 / Bitcoin Core 0.13.0._**

The `setgenerate` RPC was removed in Dash Core 0.12.3.

*Parameter #1---enable/disable generation*

Name | Type | Presence | Description
--- | --- | --- | ---
`generate` | boolean | Required<br>(exactly 1) | Set to true to turn on generation, false to turn off.

*Parameter #2---processor limit*

Name | Type | Presence | Description
--- | --- | --- | ---
`genproclimit` | number (int) | Optional<br>(exactly 1) | Set the processor limit for when generation is on. Can be -1 for unlimited.

*Result---the generated block header hashes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Always JSON `null`

*Example from Dash Core 0.12.2*

Enable generation using 1 processor:

``` bash
dash-cli -testnet setgenerate 1
```

Result:

(Success: no result displayed. Process manager shows 100% CPU usage.)

*See also*

* [Generate](/docs/core-api-ref-remote-procedure-calls-generating#section-generate): mines blocks immediately (before the RPC call returns).
* [GenerateToAddress](/docs/core-api-ref-remote-procedure-calls-generating#section-generatetoaddress): mines blocks immediately to a specified address.
* [GetMiningInfo](/docs/core-api-ref-remote-procedure-calls-mining#section-getmininginfo): returns various mining-related information.
* [GetBlockTemplate](/docs/core-api-ref-remote-procedure-calls-mining#section-getblocktemplate): gets a block template or proposal for use with mining software.
