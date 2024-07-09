*Ether*（ETH）は暗号通貨です。*Ether*は、Ethereumネットワークを使用するための手数料を支払うためにも使用され、アドレスに*Ether*を送信する形式でのトランザクションやEthereumアプリケーションとのやり取りに使用されます。

### Etherの単位
*Ether*の単位を指定するには、リテラル番号に`wei`、`gwei`、または`ether`のサフィックスを追加します。

#### `wei`
*Wei*は*Ether*の最小単位で、暗号学者[Wei Dai](https://en.wikipedia.org/wiki/Wei_Dai)にちなんで名付けられました。サフィックスのない*Ether*数値は`wei`として扱われます（7行目）。

#### `gwei`
1 `gwei`（ギガウェイ）は、1,000,000,000（10^9）`wei`に相当します。

#### `ether`
1 `ether`は、1,000,000,000,000,000,000（10^18）`wei`に相当します（11行目）。

<a href="https://www.youtube.com/watch?v=ybPQsjssyNw" target="_blank">EtherとWeiに関するビデオチュートリアルを見る</a>。

## ⭐️ 課題
1. `oneGWei`という名前の`public`な`uint`を作成し、1 `gwei`に設定します。
2. `isOneGWei`という名前の`public`な`bool`を作成し、1 `gwei`と10^9の比較演算の結果を設定します。

ヒント: コントラクトで`gwei`と`ether`がどのように記述されているかを確認してください。

