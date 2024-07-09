# A Basic Generic Proxy Example

関連するソリディティファイル、**step4.sol**には、**ProxyContract**と**LogicContract**の2つのコントラクトがあります。

このシステムを使用するには、まずLogicContractをデプロイします。

その後、ProxyContractをデプロイする際に、ProxyContractのコンストラクタの引数としてLogicContractのアドレスを渡します。

ProxyContractは一度だけデプロイされます。

LogicContractのコードは20行目で呼び出されます。これは、LogicContractのコンテキストを保持したまま、delegate callで転送されます。

ロジックを変更する必要がある場合は、新しいLogicContractをデプロイし、setLogicContractAddressセッタ関数でそのアドレスを設定します。

*注意: ここで使用しているLogicContractはストレージを使用していません。ストレージを使用する必要がある場合、実装は少し複雑になります。これらのコントラクトはコンテキストを共有するためです。*
