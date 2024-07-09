## ライブラリのデプロイ

前の章の**ライブラリ**は**コントラクト**と同じファイルにありましたが、それらは一緒にデプロイされず、異なるアドレスを持ちます。

ライブラリを使用するためには、呼び出すコントラクトがライブラリの**アドレス**を持っている必要があります。

しかし、ライブラリのアドレスは直接Solidityコードに指定されません。呼び出すコントラクトのコンパイル済みバイトコードには、ライブラリの**アドレス**が入る**プレースホルダー**が含まれています。

呼び出すコントラクトのデプロイ時に、Remixはコントラクトの**メタデータ**でライブラリのアドレスを探し、そのアドレスでプレースホルダーを更新します。

したがって、ライブラリを呼び出すコントラクトをデプロイする前に、コントラクトのメタデータ（別名**ビルドアーティファクト**）を生成し、メタデータファイルにライブラリのアドレスを入力する必要があります。

コントラクトのメタデータは**コンパイル時**に生成されます。

Remixを設定して**メタデータファイル**を生成しましょう。

 - アイコンパネルの設定アイコン ![settings](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/2_Generate_Metadata/settings.png "Settings") をクリックして設定モジュールに移動します。
 
 ![settings module](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/2_Generate_Metadata/remix_settings.png "Settings Module")

 - 最初のオプション`Generate contract metadata`にチェックを入れます。

# メタデータ（JSON）ファイルをコンパイルして生成します。

1. Solidityコンパイラを開きます ![Solidity Compiler](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/2_Generate_Metadata/remix_icon_solidity.png "Solidity Compiler")

2. `2_contractSimpleLibrary.sol`をコンパイルします。

3. ファイルエクスプローラーに切り替えます ![File Explorer](https://github.com/ethereum/remix-workshops/raw/master/DeployWithLibraries/2_Generate_Metadata/remix_file_explorer.png "File Explorer")

4. 新しく作成されたJSONファイルに移動します。
    - フォルダ内にあるはずです：

**browser/.learneth/DeployWithLibraries/2_Generate_Metadata/artifacts/**  
    
5. コントラクトから作成された新しいJSONファイルを選択します。コントラクトと**同じ名前**ですが、拡張子が**json**です：`sample.json`（ライブラリのメタデータ`contractSimpleLibrary.json`は選択しないでください）。

次のステップでは、メタデータファイルにいくつかの調整を加えます。
