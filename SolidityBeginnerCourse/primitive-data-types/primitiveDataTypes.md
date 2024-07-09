このセクションでは、Solidityの基本データ型、その宣言方法、およびその特性を紹介します。

### bool
データをブール型として宣言するには、キーワード`bool`を使用します。ブール値は`true`または`false`の値を持つことができます。

### uint
`uint`および`uint8`から`uint256`までのキーワードを使用して*符号なし整数型*を宣言します（例えば、-12のように符号を持ちません）。Uintsは正の整数またはゼロで、8ビットから256ビットの範囲があります。`uint`型は`uint256`と同じです。

### int
`int`および`int8`から`int256`までのキーワードを使用して整数型を宣言します。整数は正の値、負の値、またはゼロを持つことができ、8ビットから256ビットの範囲があります。`int`型は`int256`と同じです。

### address
`address`型の変数は、20バイトの値を保持します。これはEthereumアドレスのサイズです。また、コントラクトからイーサを受け取ることができる特別な種類のEthereumアドレスである`address payable`もあります。

これらのデータ型にはすべてデフォルト値があります（29行目のコントラクトに示されています）。

これらのデータ型、および*Fixed Point Numbers*、*Byte Arrays*、*Strings*などの詳細については、<a href="https://docs.soliditylang.org/en/latest/types.html" target="_blank">Solidityのドキュメント</a>をご覧ください。

このコースの後半では、**Mappings**、**Arrays**、**Enums**、および**Structs**のようなデータ構造についても学びます。

<a href="https://www.youtube.com/watch?v=8Tj-Th_S7NU" target="_blank">基本データ型に関するビデオチュートリアルを見る</a>。

## ⭐️ 課題
1. `public`な`address`型の新しい変数`newAddr`を作成し、利用可能な変数`addr`と異なる値を設定します。
2. `public`な変数`neg`を作成し、負の数を設定します。型を決定します。
3. 最小の`uint`サイズ型および最小の`uint`値を持つ`public`な新しい変数`newU`を作成します。

ヒント: コントラクト内の他のアドレスを確認するか、インターネットでEthereumアドレスを検索してください。