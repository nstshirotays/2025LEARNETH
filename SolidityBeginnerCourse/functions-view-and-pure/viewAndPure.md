このセクションでは、ブロックチェーンの状態を変更しない関数の種類である*view*関数と*pure*関数について見ていきます。

### View関数
*View関数*は状態を変更しないことを約束します。

「以下の文は状態を変更すると見なされます：
1. ステート変数への書き込み。
2. イベントの発行。
3. 他のコントラクトの作成。
4. selfdestructの使用。
5. コールを介したEtherの送信。
6. viewまたはpureとマークされていない関数の呼び出し。
7. 低レベルのコールの使用。
8. 特定のオペコードを含むインラインアセンブリの使用。」

<a href="https://docs.soliditylang.org/en/latest/contracts.html#view-functions" target="_blank">Solidityのドキュメント</a>から引用。

`view`キーワードを使用してview関数を宣言できます。このコントラクトでは、`addToX`（8行目）がview関数です。この関数はパラメータ`y`を取り、そのパラメータとステート変数`x`の合計を返します。`x`を読み取りますが、変更はしません。

### Pure関数
*Pure関数*は、状態を変更も読み取りもしないことを約束します。

「上記の状態変更文に加えて、以下は状態を読み取ると見なされます：
1. ステート変数の読み取り。
2. `address(this).balance`または`<address>.balance`へのアクセス。
3. block、tx、msgのメンバーへのアクセス（`msg.sig`および`msg.data`は例外）。
4. pureとマークされていない関数の呼び出し。
5. 特定のオペコードを含むインラインアセンブリの使用。」

<a href="https://docs.soliditylang.org/en/latest/contracts.html#pure-functions" target="_blank">Solidityのドキュメント</a>から引用。

`pure`キーワードを使用してpure関数を宣言できます。このコントラクトでは、`add`（13行目）がpure関数です。この関数はパラメータ`i`と`j`を取り、それらの合計を返します。ステート変数`x`を読み取ることも変更することもありません。

Solidity開発では、計算コスト（ガスコスト）を節約するためにコードを最適化する必要があります。関数をviewやpureと宣言することでガスコストを節約し、コードの可読性を高め、保守しやすくすることができます。Pure関数は副作用がなく、同じ引数を渡すと常に同じ結果を返します。

<a href="https://www.youtube.com/watch?v=vOmXqJ4Qzbc" target="_blank">View関数とPure関数に関するビデオチュートリアルを見る</a>。

## ⭐️ 課題
`addToX2`という関数を作成し、パラメータ`y`を取り、そのパラメータとステート変数`x`の合計でステート変数`x`を更新してください。