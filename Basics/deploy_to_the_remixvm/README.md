前の章では、コントラクトをコンパイルしました。つまり、SolidityコードがEthereum Virtual Machine (EVM)のバイトコードの小さなチャンクに変換されました。

次に、そのコードをテストブロックチェーンにデプロイします。

1. Deploy and Runアイコンをクリックします ![deploy & run icon](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/deploy_to_the_remixvm/images/run.png "deploy & run icon")。

2. **Environment**プルダウンから**Remix VM**のいずれかを選択します。

4. Deployボタン（または拡張ビューでのtransactボタン）をクリックします。

5. コンパイルしたコントラクトをRemix VMにデプロイしました。Remix VMはブラウザウィンドウ内で動作するシミュレートされたブロックチェーンです。Remix VMはシンプルで高速なテストチェーンです。各トランザクションを承認する必要がないため、それほど現実的ではありません。

6. このデプロイトランザクションの詳細を確認するには、ターミナルをチェックしてください。

Remixを使用して他の公開EVMチェーンにデプロイすることもできます。そのためには、異なる**Environment**（例えばInjected Provider）に接続する必要があります。Injected ProviderはRemixをブラウザウォレット（MetaMaskなど）に接続します。このチュートリアルの最後に公開ネットワークへのデプロイを試みます。しかし、その前に、デプロイされたコントラクトの関数とどのようにやり取りするかをカバーします。
