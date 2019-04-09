{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}
{% assign filename="_includes/devdoc/dash-core/rpcs/rpcs/quorum.md" %}

##### Quorum
{% include helpers/subhead-links.md %}

<!--__-->

{% assign summary_quorum="provides a set of commands for quorums (LLMQs)." %}

{% autocrossref %}

*Added in Dash Core 0.14.0*

The `quorum` RPC {{summary_quorum}}

{% endautocrossref %}

###### Quorum<!--noref--> List
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> list` RPC displays a list of on-chain quorums.

*Parameter #1---quorum count*

{% itemplate ntpd1 %}
- n: "`count`"
  t: "number"
  p: "Optional<br>(0 or 1)"
  d: "Number of quorums to list (default: 10)"
{% enditemplate %}

*Result---a secret/public key pair*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Quorum list"

- n: "→<br>Quorum"
  t: "array"
  p: "Required<br>(1 or more)"
  d: "Array of quorum details"

- n: "→ →<br>Quorum Hash"
  t: "string (hex)"
  p: "Optional<br>(0 or more)"
  d: "A quorum hash"
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum list
{% endhighlight %}

Result:
{% highlight json %}
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
{% endhighlight %}

{% endautocrossref %}

###### Quorum<!--noref--> Info
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> info` RPC returns information about a specific quorums.

*Parameter #1---LLMQ Type*

{% itemplate ntpd1 %}
- n: "`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "[Type of quorums](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types) to list:<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85"
{% enditemplate %}

*Parameter #2---quorum hash*

{% itemplate ntpd1 %}
- n: "`quorumHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The block hash of the quorum"
{% enditemplate %}

*Parameter #3---secret key share*

{% itemplate ntpd1 %}
- n: "`includeSkShare`"
  t: "bool"
  p: "Optional<br>(0 or 1)"
  d: "Include the secret key share (default: `false`)"
{% enditemplate %}

*Result---information about a quorum*

{% itemplate ntpd1 %}
- n: "`result`"
  t: "object"
  p: "Required<br>(exactly 1)"
  d: "Quorum list"

- n: "→<br>`height`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "Block height of the quorum"

- n: "→<br>`quorumHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the quorum"

- n: "→<br>`minedBlock`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "The hash of the block that established the quorum"

- n: "→<br>`members`"
  t: "array"
  p: "Required<br>(exactly 1)"
  d: "An array containing quorum member details"

- n: "→ →<br>Member"
  t: "object"
  p: "Required<br>(1 or more)"
  d: "An object describing a particular member"

- n: "→ → →<br>`proTxHash`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "The masternode's Provider Registration transaction hash"

- n: "→ → →<br>`valid`"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "Indicates if the member is valid"

- n: "→ → →<br>`pubKeyShare`"
  t: "string"
  p: "Optional<br>(0 or 1)"
  d: "Member public key share"

- n: "→<br>`quorumPublicKey`"
  t: "string"
  p: "Required<br>(exactly 1)"
  d: "Quorum public key"

- n: "→<br>`secretKeyShare`"
  t: "string"
  p: "Optional<br>(exactly 1)"
  d: "Quorum secret key share"
{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum info 1 \
  0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a true
{% endhighlight %}

Result (truncated):
{% highlight json %}
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
{% endhighlight %}

{% endautocrossref %}


###### Quorum<!--noref--> DKGStatus
<!-- no subhead-links here -->

{% highlight bash %}
dash-cli -testnet quorum dkgstatus
{% endhighlight %}

Result:
{% highlight json %}
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1554817777,
  "timeStr": "2019-04-09 13:49:37",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a",
      "quorumHeight": 76728,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": 1,
      "weComplain": 0,
      "receivedContributions": 49,
      "receivedComplaints": 50,
      "receivedJustifications": 0,
      "receivedPrematureCommitments": 49
    }
  },
  "minableCommitments": {
  }
}
{% endhighlight %}

{% highlight bash %}
dash-cli -testnet quorum dkgstatus "" 1
{% endhighlight %}

Result (truncated):
{% highlight json %}
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1554817777,
  "timeStr": "2019-04-09 13:49:37",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a",
      "quorumHeight": 76728,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": [
        25
      ],
      "weComplain": [
      ],
      "receivedContributions": [
        0,
        1,
        2,
        3,
        47,
        48,
        49
      ],
      "receivedComplaints": [
        0,
        1,
        2,
        3,
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
        47,
        48,
        49
      ]
    }
  },
  "minableCommitments": {
  }
}
{% endhighlight %}


{% highlight bash %}
dash-cli -testnet quorum dkgstatus "" 2
{% endhighlight %}

Result (truncated):
{% highlight json %}
{
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "time": 1554817777,
  "timeStr": "2019-04-09 13:49:37",
  "session": {
    "llmq_50_60": {
      "llmqType": 1,
      "quorumHash": "0000000003284177404622ea79491cb19855254627751cfbbb0035a62d17ab6a",
      "quorumHeight": 76728,
      "phase": 6,
      "sentContributions": true,
      "sentComplaint": true,
      "sentJustification": false,
      "sentPrematureCommitment": true,
      "aborted": false,
      "badMembers": [
        {
          "memberIndex": 25,
          "proTxHash": "ebf4b6337e25b975eb23ba6d113f94882196d7259749acaad952acf48025f590"
        }
      ],
      "weComplain": [
      ],
      "receivedContributions": [
        {
          "memberIndex": 0,
          "proTxHash": "5eccc0b9a1a2b8a9c3511cae98a664c377e8493c35cdd120e0d71f0b6b0f62c5"
        },
        {
          "memberIndex": 1,
          "proTxHash": "1e17ddf8748ed5e6696255da61922bd3985fd15a33fcb2d051cf84242e89f121"
        },
        {
          "memberIndex": 2,
          "proTxHash": "f1eb4ac02ab1acbace0a01328e204c4fd7dec5e53a72cccac7729c5802dbeaf4"
        },
        {
          "memberIndex": 3,
          "proTxHash": "a288f5de676eb63dee13a618d39bd6b07ad73e9ae40148202fc5b5f32e1b0bfb"
        },
        {
          "memberIndex": 47,
          "proTxHash": "1c3618f7228fc4b5e5694dd1be72b633e179b1c17e57d7380992ecb1af6e5fc1"
        },
        {
          "memberIndex": 48,
          "proTxHash": "8390acf4e1db828c53804b7cb2db81db0732239c0da51a7a923e4e1e073c2cb2"
        },
        {
          "memberIndex": 49,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        }
      ],
      "receivedComplaints": [
        {
          "memberIndex": 0,
          "proTxHash": "5eccc0b9a1a2b8a9c3511cae98a664c377e8493c35cdd120e0d71f0b6b0f62c5"
        },
        {
          "memberIndex": 1,
          "proTxHash": "1e17ddf8748ed5e6696255da61922bd3985fd15a33fcb2d051cf84242e89f121"
        },
        {
          "memberIndex": 2,
          "proTxHash": "f1eb4ac02ab1acbace0a01328e204c4fd7dec5e53a72cccac7729c5802dbeaf4"
        },
        {
          "memberIndex": 3,
          "proTxHash": "a288f5de676eb63dee13a618d39bd6b07ad73e9ae40148202fc5b5f32e1b0bfb"
        },
        {
          "memberIndex": 47,
          "proTxHash": "1c3618f7228fc4b5e5694dd1be72b633e179b1c17e57d7380992ecb1af6e5fc1"
        },
        {
          "memberIndex": 48,
          "proTxHash": "8390acf4e1db828c53804b7cb2db81db0732239c0da51a7a923e4e1e073c2cb2"
        },
        {
          "memberIndex": 49,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        }
      ],
      "receivedJustifications": [
      ],
      "receivedPrematureCommitments": [
        {
          "memberIndex": 0,
          "proTxHash": "5eccc0b9a1a2b8a9c3511cae98a664c377e8493c35cdd120e0d71f0b6b0f62c5"
        },
        {
          "memberIndex": 1,
          "proTxHash": "1e17ddf8748ed5e6696255da61922bd3985fd15a33fcb2d051cf84242e89f121"
        },
        {
          "memberIndex": 2,
          "proTxHash": "f1eb4ac02ab1acbace0a01328e204c4fd7dec5e53a72cccac7729c5802dbeaf4"
        },
        {
          "memberIndex": 3,
          "proTxHash": "a288f5de676eb63dee13a618d39bd6b07ad73e9ae40148202fc5b5f32e1b0bfb"
        },
        {
          "memberIndex": 47,
          "proTxHash": "1c3618f7228fc4b5e5694dd1be72b633e179b1c17e57d7380992ecb1af6e5fc1"
        },
        {
          "memberIndex": 48,
          "proTxHash": "8390acf4e1db828c53804b7cb2db81db0732239c0da51a7a923e4e1e073c2cb2"
        },
        {
          "memberIndex": 49,
          "proTxHash": "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
        }
      ],
      "allMembers": [
        "5eccc0b9a1a2b8a9c3511cae98a664c377e8493c35cdd120e0d71f0b6b0f62c5",
        "1e17ddf8748ed5e6696255da61922bd3985fd15a33fcb2d051cf84242e89f121",
        "f1eb4ac02ab1acbace0a01328e204c4fd7dec5e53a72cccac7729c5802dbeaf4",
        "a288f5de676eb63dee13a618d39bd6b07ad73e9ae40148202fc5b5f32e1b0bfb",
        "57795a35a3a127e817704b6b8ce64ac7f6afc49f0d0172c1e4125987c31dd1d7",
        "a6670caf2842a4ae5cb4bb78b3c10343456922b500693f6da043af541d58d9cb",
        "999d7bdf3c9247c61681148dafe7406c8407f0d07c4d699a1f501adc075248ca",
        "e34052172edc2f5ef68168e6fc66587bbae579687b1ffe2204800abee3d1040d",
        "8f1eb06abb7f1c9ee589e1a92b372516f401d96c35e24da5ff16268cb73802eb",
        "66c56c1c0b49cb13873f8322627417f57e02b4d8e4803f95726960a441998409",
        "422669636372bc785042c91eab3e08b727ae172d9cb7010e3c00192e81dead7a",
        "e9914229a74d9a517c095d82d8d5910d88b775d1fac666136181b319094fb776",
        "3f6f791ce3e28829a43c0cb5c95ffdfbfdb4463c5b180386e9bd955f43cb7440",
        "d567ac9cc7437848210365a0225271ec26a6a6c7d852544a6e9cbd40756075b3",
        "d469a3275751be369a457fa0cc7b39630ce9ced8af7bbcc7e958f6773c1c0ff6",
        "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
        "ad6c16051b50199247a64144498c745578f1259a7aa070d5360f9042fd86c44f",
        "596be0851532a66037744afa694e4de6485f326f4638e704db93cc726866cda3",
        "39ec834a6c7ac5ebf5fd885a271e2149099e87e89a9ea30f573b4b699b9399c6",
        "27a6ff2f188c6190d44b657f54bd831f57228f918cbb7fd6026f5cf5c443d496",
        "32e5ad5cf9a06eb13e0f65cb7ecde1a93ef24995d07355fac2ff05ebd5b9ddbf",
        "3a8738860323ed3868f0e4a26d852bbea4feb3850674e5ca1c27fa15d0b707b6",
        "4e60af72569f2922b1bd0dc630e38b3d0be8ec0960467a0aab45abe52696cbf3",
        "21c0923badd20f953360c586edfcbb1a830be83206e30b3f65765f7794f2a640",
        "8d2f4505922cb82f7ec601deeba318ca7ed2f47b89274792dc9001ab62112ef9",
        "ebf4b6337e25b975eb23ba6d113f94882196d7259749acaad952acf48025f590",
        "a28dbe8916ff45144efd8bec463cc9fa57604e6eba6e6a49329d61bd44d6963b",
        "ca6ffccd65d35bc6d31fd5ad79815c3d840ce65351a094484bcdc3f0d4ea3c63",
        "0fb12eef8c8736fc3e537a531facc6a6b445ea4394a008314d06684f4d43de1b",
        "374b30e042714cafd20e7e1d584611c8ca35317b1bfddc325c0da2d884990983",
        "136d0821dd4af5cae8cb5b03306c42dfebff3469539dd48c84e15ff865d2b1ab",
        "0ae0edf8d2e2e17f7bc4415a78bad97828de3ca94cb7ab1b108303b6f40c97f6",
        "14f2f481ca295a5bdb3e3d7f50ff87f205230609c53989da809420b874a17f34",
        "b1f19b9a0b254c4586c3446427333e1c3c99c1a724fa4ad1d38e45f88611e805",
        "3667fe83d6c334eae930252ca9bdd22d3eed1aee1c3b5b40d7244b98bea2c77b",
        "2b0be708179cabb17ab839d2e8c44a78aacec1409f5c54f9a265027207b73661",
        "cc7041c869c7c1c0bae7c137f0cda708ad492bc89c4b8f7a40a353d90335febf",
        "db85af3dad4d35c89f9c2ae0f932c70216b588611f3d250f71145a64cd0cc814",
        "bfded3caf1b068acce07ab235fc6823048bdaf1db3cfa6ad804f7e89039bfd59",
        "f51b426420ac4c518ad07c2bb03e434389337b4e2977d39233114d5e8ef21f69",
        "6f0bdd7034ce8d3a6976a15e4b4442c274b5c1739fb63fc0a50f01425580e17e",
        "944ac1d12972e795139af01657a2669a24aa581d496995889a4c8e31fe8b248f",
        "6a5be5c068a0be432b7db0772b25094a59ce1f433dd2df0d410511ac641c3768",
        "8cef1945dabb3d64084997145746d121ae932f54d772d8d753c4883559077f9c",
        "5720c99f699f7e5666520cadebb9b3db322f862a6163eb8ba6bb177e468867f4",
        "fa3b3b0d3522becb02ddd15dd075f3d6ecc6a5a50b43c6c9f6d4703a9a8509d5",
        "c0eddda2bfa98443feccc9bc8f7f8b4856243fd7edaedce25fc9a2320a697453",
        "1c3618f7228fc4b5e5694dd1be72b633e179b1c17e57d7380992ecb1af6e5fc1",
        "8390acf4e1db828c53804b7cb2db81db0732239c0da51a7a923e4e1e073c2cb2",
        "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
      ]
    }
  },
  "minableCommitments": {
  }
}
{% endhighlight %}

###### Quorum<!--noref--> Sign
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> sign` RPC requests threshold-signing for a message.

*Parameter #1---LLMQ Type*

{% itemplate ntpd1 %}
- n: "`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "[Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85"
{% enditemplate %}

*Parameter #2---id*

{% itemplate ntpd1 %}
- n: "`id`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Signing request ID"
{% enditemplate %}

*Parameter #3---message hash*

{% itemplate ntpd1 %}
- n: "`msgHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Hash of the message to be signed"
{% enditemplate %}

*Result---status*

{% itemplate ntpd1 %}
- n: "result"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "True or false depending on success"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum sign 1 \
  "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234" "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
{% endhighlight %}

Result:
{% highlight json %}
false
{% endhighlight %}

{% endautocrossref %}

###### Quorum<!--noref--> HasRecSig
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> hasrecsig` RPC checks for a recovered signature for a previous threshold-signing message request.

*Parameter #1---LLMQ Type*

{% itemplate ntpd1 %}
- n: "`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "[Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85"
{% enditemplate %}

*Parameter #2---id*

{% itemplate ntpd1 %}
- n: "`id`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Signing request ID"
{% enditemplate %}

*Parameter #3---message hash*

{% itemplate ntpd1 %}
- n: "`msgHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Hash of the message to be signed"
{% enditemplate %}

*Result---status*

{% itemplate ntpd1 %}
- n: "result"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "True or false depending on success"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum hasrecsig 1 \
 "1746e9e82fde8bbda5407551f22b63794894cef0f761ba43f58fd9a9654ff205" "1746e9e82fde8bbda5407551f22b63794894cef0f761ba43f58fd9a9654ff205"
{% endhighlight %}

Result:
{% highlight json %}
false
{% endhighlight %}

{% endautocrossref %}

###### Quorum<!--noref--> IsConflicting
<!-- no subhead-links here -->

{% autocrossref %}

The `quorum<!--noref--> isconflicting` RPC checks if there is a conflict for a threshold-signing message request.

*Parameter #1---LLMQ Type*

{% itemplate ntpd1 %}
- n: "`llmqType`"
  t: "number"
  p: "Required<br>(exactly 1)"
  d: "[Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85"
{% enditemplate %}

*Parameter #2---id*

{% itemplate ntpd1 %}
- n: "`id`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Signing request ID"
{% enditemplate %}

*Parameter #3---message hash*

{% itemplate ntpd1 %}
- n: "`msgHash`"
  t: "string (hex)"
  p: "Required<br>(exactly 1)"
  d: "Hash of the message to be signed"
{% enditemplate %}

*Result---status*

{% itemplate ntpd1 %}
- n: "result"
  t: "bool"
  p: "Required<br>(exactly 1)"
  d: "True or false depending on success"

{% enditemplate %}

*Example from Dash Core 0.14.0*

{% highlight bash %}
dash-cli -testnet quorum isconflicting 1 \
 "1746e9e82fde8bbda5407551f22b63794894cef0f761ba43f58fd9a9654ff205" "1746e9e82fde8bbda5407551f22b63794894cef0f761ba43f58fd9a9654ff205"
{% endhighlight %}

Result:
{% highlight json %}
false
{% endhighlight %}

{% endautocrossref %}

{% autocrossref %}

*See also: none*

{% endautocrossref %}
