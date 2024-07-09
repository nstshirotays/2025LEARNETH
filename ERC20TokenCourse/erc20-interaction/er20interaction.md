このセクションでは、ブラウザでコントラクトをデプロイし、その機能をテストします。

### 1. コントラクトのデプロイ
**1.1** Remix IDEの"Solidity compiler"モジュールでEduCoinコントラクトをコンパイルします。

**1.2** "Deploy & run transactions"モジュールで、コントラクト入力フィールドに"EduCoin"を選択し、"Deploy"ボタンをクリックします。常にコントラクトセレクタ入力フィールドで正しいコントラクトを選択することを確認してください。

**GIF** コンパイルとデプロイ:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_compileAndDeploy.gif?raw=true" alt="Compile and deploy contract" width="300"/>

### 2. 関数のテスト
IDEでトークンコントラクトの関数を展開します。

#### 2.1 Decimals
"decimals"ボタンをクリックしてdecimals()関数を呼び出します。
"18"が返されるはずです。

#### 2.2 名前
"name"ボタンをクリックしてname()関数を呼び出します。
"EduCoin"が返されるはずです。

#### 2.3 シンボル
"symbol"ボタンをクリックしてsymbol()関数を呼び出します。
"EDC"が返されるはずです。

#### 2.4 総供給量
"totalSupply"ボタンをクリックしてtotalSupply()関数を呼び出します。
1000000000000000000000 (1000*10**18)が返されるはずです。

**GIF** decimals, name, symbol, および totalSupply 関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_test_functions.gif?raw=true" alt="Test transfer function" width="300"/>

#### 2.5 Balance of
**2.5.1** サイドバーの"ACCOUNT"セクションに移動し、隣のコピーアイコンを使用して表示されたアドレスをコピーします。

**2.5.2** "balanceOf"関数ボタンの隣の入力フィールドにアドレスを貼り付け、ボタンをクリックします。
1000000000000000000000 (1000*10**18)が返されるはずです。

**GIF** balanceOf 関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_balanceOf.gif?raw=true" alt="Test transfer function" width="300"/>

#### 2.6 転送
EduCoinを1つのアカウントから2つ目のアカウントに転送します。

**2.6.1** サイドバーの"ACCOUNT"セクションに移動し、表示されたアドレスをクリックします。これによりドロップダウンが開きます。2番目に表示されたアドレス（アカウント2）を選択し、そのアドレスをコピーします。

**2.6.2** ドロップダウンを開いて最初のアカウント（アカウント1）を再度選択します。これは転送を行うために使用するアカウントです。

**2.6.3** "transfer"関数ボタンの隣の入力フィールドにアドレスを貼り付け、500000000000000000000と入力し、ボタンをクリックします。

**2.6.4** アカウント1とアカウント2の残高を確認すると、どちらも500000000000000000000の金額が返されるはずです。

**GIF** 転送関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_transfer.gif?raw=true" alt="Test transfer function" width="300"/>

#### 2.7 承認
次に、アカウント1がアカウント2に代わってトークンを使用することを許可します。

**2.7.1** "Account"セクションに移動し、アカウント1のアドレスをコピーし、再度アカウント2を選択します。

**2.7.2** approve関数にアカウント1のアドレスを入力し、spenderとして設定し、250000000000000000000の金額を設定します。

**GIF** approve 関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_approve.gif?raw=true" alt="Test approve function" width="300"/>

#### 2.8 アローワンス
"allowance"ボタンの隣にアカウント2のアドレスを所有者として、アカウント1をspenderとして入力し、ボタンをクリックします。
1000000000000000000000が返されるはずです。

**GIF** allowance 関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_allowance.gif?raw=true" alt="Test allowance function" width="300"/>

#### 2.9 TransferFrom
今度はアカウント1がアカウント2から自分のアカウントに250000000000000000000トークンを転送します。

**2.9.1** "ACCOUNT"セクションでアカウント1を選択します。

**2.9.2** "transferFrom"ボタンの隣にアカウント2のアドレスを送信者として入力し、アカウント1を受取人として、金額を250000000000000000000と入力し、ボタンをクリックします。

**2.9.3** アカウント2と1の残高を確認すると、250000000000000000000と750000000000000000000が返されるはずです。

**GIF** transferFrom 関数のテスト:
<img src="https://github.com/dacadeorg/remixMedia/blob/main/token-course/erc20/erc20_transferFrom.gif?raw=true" alt="Test transferFrom function" width="300"/>
