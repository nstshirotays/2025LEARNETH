このセクションでは、コントラクトがEtherを送受信する方法について学びます。

### Etherの送信
Etherを転送するには、`transfer()`、`send()`、および`call()`の3つのオプションがあります。

#### transfer
`<address payable>.transfer(uint256 amount)`
- `transfer()`は失敗時に例外を投げます。
- 固定の2300ガスを使用します。

`transfer()`の例は、`SendEther`コントラクトの35行目にあります。
**`transfer()`の使用は推奨されなくなりました。**

#### send
`<address payable>.send(uint256 amount) returns (bool)`
- `send()`は失敗時にfalseを返します。
- 固定の2300ガスを使用します。

`send()`の例は、`SendEther`コントラクトの41行目にあります。
**`send()`の使用は推奨されなくなりました。**

#### call
`<address>.call(bytes memory) returns (bool, bytes memory)`
- `call()`は失敗時にfalseを返します。
- 最大量のガスを転送しますが、これは調整可能です。

`call()`の例は、`SendEther`コントラクトの48行目にあります。
Etherを転送する場合、現在は`call()`の使用が推奨されています。

`transfer()`および`send()`が導入された理由は、転送されるガスを2300に制限することで再入攻撃から守るためでした。この量ではストレージを変更する再入呼び出しを行うのに不十分です。

前のセクションで説明したように、Ethereum上の各操作には特定のコストが関連しています。特定の操作は時間とともにコストが増加し、それに伴い関連するガスコストも増加します。操作のガスコストが変更される可能性がある場合、`transfer()`や`send()`のようなハードコーディングされたガス量を使用するのは適切ではありません。

そのため、Etherを送信する場合は`transfer()`の代わりに`call()`が推奨されます。

このトピックについて詳しくは、[Consensysのブログ投稿](https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/)をご覧ください。

### 再入攻撃
再入攻撃は、関数が信頼できないコントラクトに外部呼び出しを行い、攻撃者が元の関数が実行を終了する前に再帰的に呼び出しを行うときに発生します。この方法で、攻撃者は資金を抜き取り、データを意図しない方法で操作できます。

再入攻撃を防ぐために、すべての状態変更は外部コントラクトを呼び出す前に行う必要があります。これを[Checks-Effects-Interactionsパターン](https://docs.soliditylang.org/en/latest/security-considerations.html#re-entrancy)とも呼びます。

再入を防ぐもう一つの方法は、再入呼び出しをチェックして拒否する*Reentrancy Guard*を使用することです。修飾子セクションのコントラクトや、[Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/ReentrancyGuard.sol)のガス効率の良いバージョンでその例を見ることができます。

### Etherの受信
関数を呼び出すことなくコントラクトがEtherを受け取ることを可能にするには、`receive`関数（22行目）または`fallback`関数（25行目）を作成する必要があります。そうしないと、Etherは拒否され、コントラクトは例外を投げます。

`receive`関数は空のcalldataでの呼び出し時に実行され（例：`send()`または`transfer()`による単純なEther転送）、`fallback`関数はcalldataがある呼び出し時に実行されます。`receive`関数が存在せず、`fallback`関数が存在する場合、空のcalldataでの呼び出しも`fallback`関数を使用します。

### Payable関数修飾子
`payable`関数修飾子は、関数がEtherを受け取ることを許可します。

`receive`関数（22行目）は`payable`である必要があります。`payable`修飾子を削除すると、コンパイラからエラーが発生します。`fallback`関数（25行目）から`payable`修飾子を削除するとコンパイルはされますが、Etherを受け取ることはできません。`sendViaTransfer`、`sendViaSend`、および`sendViaCall`関数（33行目、38行目、45行目）もEtherを受け取るためには`payable`である必要があります。

### Payableアドレス
Solidityは、アドレスデータ型に2つの異なるフレーバーを区別します：`address`と`address payable`です。

- `address`: 20バイトの値を保持します。
- `address payable`: 20バイトの値を保持し、メンバーを介してEtherを受け取ることができます：`transfer`および`send`。

`sendViaTransfer`および`sendViaSend`関数（33行目および38行目）のパラメータ型を`payable address`から`address`に変更すると、`transfer()`（35行目）や`send()`（41行目）を使用できなくなります。

[Ether送信に関するビデオチュートリアルを見る](https://www.youtube.com/watch?v=_5vGaqgzlG8)。

## ⭐️ 課題
Etherを受け取り、受取人が引き出せる慈善コントラクトを作成します。

1. `Charity`という名前のコントラクトを作成します。
2. `address`型の`owner`という名前のパブリックステート変数を追加します。
3. パラメータや関数コードなしでパブリックかつ`payable`な`donate`関数を作成します。
4. コントラクトの総残高を`owner`アドレスに送信するパブリックな`withdraw`関数を作成します。

ヒント: あるアカウントからコントラクトをデプロイし、別のアカウントからEtherを送信してコントラクトをテストします。その後、`withdraw`関数を実行します。

