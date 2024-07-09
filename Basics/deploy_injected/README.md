1. **MetaMask**などのブラウザウォレットを持っていない場合は、今すぐダウンロードしてインストールしてください。

2. ブラウザでMetaMaskアイコンをクリックします。サインインして、Ephemeryテストネットワークを選択します。ウォレットの設定を更新して**テストネットワーク**が表示されるようにする必要があるかもしれません。代わりに、RemixのDeploy & Runトランザクションモジュールに移動し、ENVIRONMENTセクションでEphemeryを選択することもできます。

3. 公開テストネットワーク用のテストETHを取得するのはしばしば面倒です。Ephemeryは毎月リフレッシュされる公開ネットワークなので、テストETHの取得は簡単です。こちらがいくつかの<a href="https://github.com/ephemery-testnet/ephemery-resources?tab=readme-ov-file#faucets" target="_blank">Ephemeryファウセット</a>へのリンクです。

![](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/deploy_injected/images/testnet.png)

Sepoliaはリフレッシュされないもう一つの人気のあるテストネットなので、デプロイメントは永続しますが、Sepoliaファウセットは使いにくいです。

ブラウザウォレットでメインネットやリアルETHが必要なネットワークを選択していないことを確認してください。Deploy & RunモジュールのEnvironmentセレクトボックスの下には、ネットワークのIDと、人気のあるチェーンの場合はその名前が表示されます。以下の場合はSepoliaです。

![](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/deploy_injected/images/sepolia.png)

5. **CONTRACT**セレクトボックスで2_Owner.solが選択肢として表示されていることを確認し、**Deploy**ボタンをクリックします。

**CONTRACT**セレクトボックスが空の場合は、2_Owner.solを**エディタ**でアクティブなファイルにしてから**Solidity Compiler**に移動して再度コンパイルする必要があります。

6. `Deploy`ボタンを押すと、ブラウザウォレットのポップアップが表示され、トランザクションの支払いを求められます。このチェーンに適したETHを持っている場合は、このトランザクションを承認してください。ターミナルの出力を確認します。ブロックが検証されると、Deploy & Runの下部に**デプロイされたインスタンス**が表示されます。

これでこのチュートリアルは完了です。Remix IDEでスマートコントラクトを開き、コンパイルし、デプロイし、操作する経験を積みました。
