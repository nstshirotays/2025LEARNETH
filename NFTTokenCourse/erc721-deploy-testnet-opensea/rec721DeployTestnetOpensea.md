このセクションでは、Metamask（Ethereumウォレット）を使用してEthereumブロックチェーンのRinkebyテストネットにコントラクトをデプロイし、NFTをミントし、NFTマーケットプレイスのOpenSeaで確認する方法を学びます。

### 1. Metamaskのインストール
**1.1** <a href="https://metamask.io/" target="_blank">metamask.io</a>にアクセスします。

**1.2** ダウンロードボタンをクリックし、次にブラウザ（例：Chrome）用のインストールボタンをクリックして、ブラウザに拡張機能を追加します。

**1.3** 説明に従ってウォレットを作成します。

### 2. Rinkeby用のテストネットトークンを取得
トランザクションをテストネットで行うためには、Ethereumのテストネットトークンが必要です。

**2.1** Metamaskを"Ethereum Mainnetwork"から"Rinkeby Test Network"に切り替えます。

**2.2** <a href="https://faucet.paradigm.xyz/" target="_blank">https://faucet.paradigm.xyz/</a>にアクセスし、アカウントのアドレスを入力してテストネットETHを請求します。その他のRopstenファウセットとして<a href="https://faucet.paradigm.xyz/" target="_blank">https://faucet.paradigm.xyz/</a>や<a href="https://app.mycrypto.com/faucet" target="_blank">https://app.mycrypto.com/faucet</a>も利用できます。詳細については<a href="https://ethereum.org/en/developers/docs/networks/#testnet-faucets" target="_blank">ethereum.org</a>にリストされているファウセットを確認してください。

### 3. コントラクトのデプロイ
**3.1** Remix IDEの"DEPLOY & RUN TRANSACTIONS"モジュールで"ENVIRONMENT"として"Injected Web3"を選択します。アカウントに接続するかどうか確認するメッセージが表示されるので、確認します。その後、"Injected Web3"の下にRinkebyネットワークのバッジが表示されるはずです。

**3.2** トークンコントラクトをデプロイし、Metamaskでトランザクションを確認します。

**3.3** コントラクトが"Deployed Contracts"セクションに表示されるはずです。

### 4. NFTのミント
**4.1** IDEでコントラクトを展開し、関数のボタンが表示されるようにします。

**4.2** `safeMint`ボタンの隣の入力フィールドを展開します。"to:"入力フィールドにRemixに接続されているアカウントのEthereumアドレスを入力します。"tokenID:"入力フィールドに"0"を入力します。"transact"をクリックします。

**4.3** Metamaskで"assets"をクリックし、"Import tokens"リンクをクリックして、コントラクトのアドレスを入力フィールドに貼り付けます。小数点を0に設定します。

これで、Metamaskの"Assets"ビューにトークンコントラクトのシンボル（例：GEO）が表示されるはずです。このトークンの1つを持っていることになります。

### 5. OpenSeaでNFTを確認
<a href="https://opensea.io/" target="_blank">OpenSea</a>は、最も人気のあるNFTオンラインマーケットプレイスの1つです。OpenSeaではテストネット上の資産も確認できます。<a href="https://testnets.opensea.io/" target="_blank">https://testnets.opensea.io/</a>をご覧ください。

**5.1** <a href="https://testnets.opensea.io/login" target="_blank">https://testnets.opensea.io/login</a>にアクセスします。

**5.2** Metamaskウォレットで接続します。接続後、OpenSeaのアカウントビュー<a href="https://testnets.opensea.io/account" target="_blank">https://testnets.opensea.io/account</a>にリダイレクトされ、NFTが表示されるはずです。NFTの画像をクリックすると、名前、説明、プロパティ（属性）も確認できます。

このコースを無事に修了し、Solidity開発の基本に慣れたら、Learnethのリソースを使って自分のNFTオークションコントラクトを作成する方法を学び、学習を続けましょう。
