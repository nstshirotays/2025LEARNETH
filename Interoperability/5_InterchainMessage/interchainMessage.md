このセクションでは、「Hello World」メッセージを2つのブロックチェーン間で送信するコントラクトを作成します。

## コンストラクタ

まず、関数の`constructor`を作成します。これにより、前のセクションで説明した`Gateway`および`Gas Service`コントラクトを設定できます。

コントラクトをデプロイする際に、Ethereum Sepolia用の`Gateway`と`GasService`のアドレスを引数として渡します。これらのアドレスは、Gateway用が`0xe432150cce91c13a887f7D836923d5597adD8E31`、Gas Service用が`0xbE406F0189A0B4cf3A05C286473D23791Dd44Cc6`です。

完全なAxelarアドレスのリストについては、
<a href="https://docs.axelar.dev/resources/contract-addresses/testnet" target="_blank">こちら</a>をご覧ください。

## インターチェーンメッセージの送信

コンストラクタがインターチェーントランザクションをトリガーするために必要なAxelarアドレスを設定したので、次はこのトランザクションをトリガーする`setRemoteValue()`関数を作成します。

この関数は次の3つのパラメータを取ります：

1. `_destinationChain`: トランザクションが送信されるチェーン
2. `_destinationAddress`: トランザクションが実行されるデスティネーションチェーン上のアドレス
3. `_message`: デスティネーションチェーンに渡されるメッセージ

まず、`require`文を使用して`msg.value`が値を含んでいることを確認します。この`msg.value`は`GasService`の支払いに使用されます。資金が送信されていない場合、トランザクションは実行できないため、トランザクションを元に戻します。

次に、渡された`_message`をエンコードします。`_message`は`string`型として設定されていますが、Axelarはこのメッセージを`bytes`型として受け取ることを期待しているため、`string`から`bytes`への変換には`abi.encode()`を使用します。

メッセージがエンコードされたので、`GasService`および`Gateway`と対話を開始します。

インターチェーントランザクション全体の支払いを行うために、`GasService`の`payNativeGasForContractCall`関数をトリガーします。

この関数には、GasServiceセクションで説明したパラメータが必要です。このトランザクションの`sender`はこのコントラクトであり、`address(this)`です。`destinationChain`と`destinationAddress`は、この関数のパラメータから渡すことができます。`payload`は先ほどエンコードしたメッセージです。最後に、返金アドレスを指定する必要があります。これはこの関数をトリガーするアドレスである`msg.sender`にできます。

この関数をトリガーすると、Axelar経由でソースチェーンからデスティネーションチェーンへのトランザクションを正常に送信できます。しかし、最後のステップがまだ完了していません。

### デスティネーションチェーンでのメッセージ受信

デスティネーションチェーンでは、インバウンドインターチェーントランザクションを受信し、`AxelarExecutable`の`\_execute()`関数で処理する必要があります。

`\_execute()`関数は`AxelarExecutable`コントラクトで定義されているため、この関数を定義する際には`override`キーワードを含める必要があります。

この関数は次の三つのパラメータを取ります：

1. `_sourceChain`: トランザクションが発信されたブロックチェーン
2. `_sourceAddress`: トランザクションが送信されたソースチェーン上のアドレス
3. `_payload`: ソースチェーンから送信されたメッセージ

このコントラクトで最初に行うべきことは、送信された`message`にアクセスすることです。メッセージは`string`型から`bytes`型に変換されて送信されました。メッセージを`bytes`型から`string`型に戻すには、`_payload`を`abi.decode()`に渡し、`_payload`を`string`型にデコードすることを指定します。これでメッセージが文字列として返されます。

メッセージが`string`型として取得できたので、`sourceChain`と`sourceAddress`のストレージ変数をそれぞれ`_sourceChain`と`_sourceAddress`に設定し、渡されたデータを簡単に参照できるようにします。また、`sourceAddress`とデコードしたメッセージを含む`Executed`イベントを発生させることもできます。

これで、デスティネーションチェーンでインターチェーントランザクションを処理できるようになりました。

このコントラクトと対話するには、少なくとも2つのブロックチェーンにデプロイし、一つのチェーンから`setRemoteValue()`を呼び出して、別のチェーンで`\_execute()`関数が自動的にトリガーされるようにします。デスティネーションチェーンで`sourceChain`および`sourceAddress`変数をクエリして、インターチェーン実行が正しく機能したことを確認できます。

インターチェーントランザクションの完全なステップバイステップを確認するには、<a href="https://testnet.axelarscan.io" target="_blank">Axelarscan（テストネット）ブロックエクスプローラー</a>を参照してください。
