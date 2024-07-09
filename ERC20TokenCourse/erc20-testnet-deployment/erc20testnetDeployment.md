このセクションでは、Metamask（Ethereumウォレット）を使用して、コントラクトをEthereumブロックチェーンのテストネットにデプロイします。このテストネットは実際のブロックチェーン（メインネット）と非常によく似ていますが、トランザクションの支払いに実際のETHを必要としません。

### 1. Metamaskのインストール
**1.1** <a href="https://metamask.io/" target="_blank">metamask.io</a>にアクセスします。

**1.2** ダウンロードボタンをクリックし、ブラウザ（例：Chrome）用にインストールをクリックして、拡張機能をブラウザに追加します。

**1.3** 指示に従ってウォレットを作成します。

### 2. テストネットトークンの取得
テストネットでトランザクションを行うためには、Ethereumテストネットトークンが必要です。これらは*ファウセット*と呼ばれるものから受け取ることができます。

**2.1** Metamaskのネットワークを切り替えるには、"Ethereum Mainnetwork"のドロップダウンをクリックし、"Ropsten Test Network"を選択します。テストネットワークが表示されない場合は、"Show/hide"リンクをクリックし、設定で"Show test networks"を有効にします。

**2.2** <a href="https://faucet.ropsten.be/" target="_blank">https://faucet.ropsten.be/</a>にアクセスし、アカウントのアドレスを入力してテストネットETHを請求します。他のRopstenファウセットとしては、<a href="https://faucet.paradigm.xyz/" target="_blank">https://faucet.paradigm.xyz/</a>や<a href="https://app.mycrypto.com/faucet" target="_blank">https://app.mycrypto.com/faucet</a>も利用できます。詳細については、<a href="https://ethereum.org/en/developers/docs/networks/#testnet-faucets" target="_blank">ethereum.org</a>に掲載されているファウセットを参照してください。

### 3. デプロイ
EduCoinコントラクトがコンパイルされていることを確認します。

**3.1.** Remix IDEの"DEPLOY & RUN TRANSACTIONS"モジュールで、"ENVIRONMENT"の下にある"Injected Web3"を選択します。アカウントの接続を求められるので、確認します。

**3.2** EduCoinコントラクトをデプロイし、Metamaskでトランザクションを確認します。

**3.3** コントラクトは"Deployed Contracts"セクションに表示されるはずです。コントラクトのアドレスをコピーします。

**3.4** Metamaskで、アセットをクリックし、"Import tokens"リンクをクリックし、コントラクトのアドレスを入力フィールドに貼り付けます。

これでウォレットに1000 EDCの残高が表示されるはずです。

### 4. トランザクションの作成
**4.1** Metamaskウォレットのアイデンティコン（アドレスの視覚表現）をクリックし、2番目のアカウント（Account 2）を作成します。

**4.2** Account 2のアドレスをコピーします。

**4.3** 最初のアカウント（Account 1）に切り替え、Account 2に250 EDCを送信します。Account 1とAccount 2の残高を確認します。Account 2にトークンをインポートするには、トークンアドレスを再度追加する必要があるかもしれません。また、このアカウントでトランザクションを行うにはテストETHが必要です。

Remixでコントラクトを表示し、Account 1とAccount 2のアドレスを使用して`balanceOf`関数を呼び出すことで、アカウント残高も確認できます。
