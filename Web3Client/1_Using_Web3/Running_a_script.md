## ブロックチェーンのクエリ

このチュートリアルでは、JavaScriptライブラリを使用してブロックチェーンにクエリを送信するスクリプトを実行します。

これは、RemixのGUIやEtherscanのようなブロックエクスプローラーを使用する代わりに、エディター内でスクリプトを使用し、ターミナルから実行することを意味します。

ブロックチェーンと対話するために最もよく使用されるJSライブラリは、web3.jsとethers.jsです。

まずは、シンプルなweb3.jsの例、`queryBlockNum.js`から始めましょう。

スクリプトのweb3.jsへの呼び出しは、try/catchブロックを含む自己実行型の非同期関数でラップされています。

現在のブロック番号をクエリするには、次のようにします：
`let blockNumber = await web3.eth.getBlockNumber()`

`web3`オブジェクトはRemixによって注入されることに注意してください。web3.jsの詳細については、彼らのドキュメントを参照してください。<a href="https://web3js.readthedocs.io/" target="_blank">https://web3js.readthedocs.io</a>.

web3.jsまたはethers.jsを使用するには、**Injected Web3**または**Web3 Provider**環境を**Deploy & Run**モジュールで選択する必要があります。スクリプトは現在JSVMでは動作しません。**試してみるとエラーが発生します。**

この例では、**Deploy & Run**モジュールで**Injected Web3**を選択し、Metamaskをインストールしておいてください。

ターミナルから`remix.execute()`を実行します。このコマンドは、`let blockNumber = await web3.eth.getBlockNumber()`という行を含む現在のJavaScriptファイルを実行します。

コンソールに、Metamaskが接続されているチェーンの現在のブロック番号が表示されるはずです。