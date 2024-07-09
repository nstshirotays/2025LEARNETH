`Deploy & Run`モジュールに切り替えます。
![Run transaction](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/4_Linking_and_Deploying/images/remix_runtransaction.png "Run Transaction")

 - Remix VM Environmentを選択し、コンパイルされたコントラクトのリストから`sampleContract`コントラクトを選択します。

 - `Deploy`をクリックします。
 
 ターミナルに`creation of sample errored: <address> is not a valid address. Please check the provided address is valid.`のような出力が表示されます。
 これは予想通りです。**`autoDeployLib`をfalseに設定したため、Remixは有効なアドレスを期待していますが、`<address>`は有効なアドレスではありません。**

したがって、ライブラリをデプロイしてそのアドレスを取得する必要があります。

  - コンパイルされたコントラクトのリストからライブラリ`aLib`を選択し、`deploy`をクリックします。

    ![Choose aLib](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/4_Linking_and_Deploying/images/contract_alib.png "Choose aLib")

  - クリップボードアイコンをクリックしてライブラリのアドレスをコピーします。

    ![Copy lib1](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/4_Linking_and_Deploying/images/alib_copy.png "Copy")

  - コピーしたアドレスを**contract sample**のメタデータJSONに貼り付けます。

  - `Run transaction`モジュールで`sampleContract`コントラクトを再選択し、`deploy`をクリックします。

  - これでデプロイは成功するはずです。
