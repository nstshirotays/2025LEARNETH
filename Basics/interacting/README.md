## デプロイされたコントラクトの関数にアクセスする

1. コントラクトが正常にデプロイされると、Deploy and Runプラグインの下部に表示されます。キャレットをクリックしてコントラクトを開きます - キャレットが下向きになります。
![deploy contract](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/interacting/images/instance.png "deployed contract")

2. このコントラクトには2つの関数があります。パラメータを個別に入力するには、changeOwnerの右側にあるキャレットをクリックします（下図の赤枠で囲まれた部分）。拡張ビューでは、各パラメータに入力ボックスがあります。
   
![deploy contract](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/interacting/images/deployed_open2.png "deployed contract")

このコントラクトが他のコントラクトをインポートしている場合、インポートされたコントラクトの関数もここに表示されます。いつかERC20コントラクトを試して、その多くの関数を確認してみてください。

3. 青いボタンの関数は**pure**または**view**関数です。これらはプロパティを読み取るか値を返すだけです。言い換えれば、何も保存しないため、無料（ガス代がかかりません）です。他の色の関数 - 通常はオレンジ（Remixのテーマによります）は情報を保存するため、ガスがかかります。これらは**トランザクション**を作成しています。

4. 2_Owner.solには**payable**関数がありません。もしあれば、ボタンの色は赤になります。Payable関数は、Etherを関数に送ることを許可します。Payable関数でETHを送るには、Deploy & Runモジュールの上部にある**value**フィールドに送信したい金額を入力します。

5. Remix VMでは、トランザクションを承認する必要はありません。より現実的なテスト環境やメインネットを使用する場合は、トランザクションを通過させるために承認する必要があります。トランザクションの承認にはガスがかかります。

6. 公開ネットワークの選択はRemixではなく、ブラウザウォレットで行います。Environmentタイトルの右側にプラグアイコンがあり、chainlist.orgにリンクしていて、相互作用したいチェーンの仕様を取得できます。
![chainlist](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/interacting/images/chainlist.png "chainlist")
