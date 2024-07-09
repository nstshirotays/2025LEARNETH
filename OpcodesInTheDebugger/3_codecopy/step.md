CODECOPYは、EVMによって実行される多くのオペコードの1つです。完全なオペコードのリストは、<a href="https://ethervm.io/" target="_blank">https://ethervm.io/</a> で確認できます。

CODECOPYは、**実行中のコード**（またはその一部）を`calldata`から`memory`にコピーします。

Solidityでの実装は次のようになります：**codecopy(t, f, s)** - コードの位置**f**から**s**バイトをメモリの位置**t**にコピーします。

すべてのコントラクトデプロイメントは、**CODECOPY**を使用します。