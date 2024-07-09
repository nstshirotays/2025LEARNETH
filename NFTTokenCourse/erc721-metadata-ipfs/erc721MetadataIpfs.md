このセクションでは、メタデータを作成し、分散型の方法で保存します。

IPFS（InterPlanetary File System）は、ファイルを分散型で保存するためのピアツーピアネットワークです。Pinata.cloudは、ユーザーがIPFSネットワーク上でファイルを簡単にホストできるピニングサービスです。

私たちは画像と、そのメタデータが含まれるJSONファイルをIPFSにホストしたいと思います。

### 画像フォルダを作成
この例では、3つのトークンのメタデータを作成します。以下のように、3つの画像を作成してフォルダに保存します。

```
geo-img
├── geo_1.png
├── geo_2.png
├── geo_3.png
```

### Pinataに登録
これらの画像をどこかにホストし、それらをトークンのメタデータで参照できるようにしたいと思います。分散型の方法でこれを行い、Pinataを使用してIPFSにホストします。

まず、Pinataにアカウントが必要です。<a href="https://app.pinata.cloud/register" target="_blank">Pinata.cloud</a>にアクセスし、アカウントを作成します。Pinataでは無料で最大1GBのデータをアップロードできます。

サインアップが完了すると、Pin Managerビューにいるはずです。

<img src="https://i.imgur.com/yKpD65m.png" alt="Pin Manager Pinata" width="300"/>

### 画像をIPFSにアップロード
アップロードボタンをクリックして、画像が入ったフォルダをアップロードします。
フォルダをアップロードすると、フォルダ名とそれに関連付けられたCID（コンテンツ識別子）が表示されます。フォルダの内容が変更されると、CIDも変更されます。

IPFS上でフォルダにアクセスするには、このアドレス "https://ipfs.io/ipfs/" にCIDを追加します。現在の例では、次のURLを使用してフォルダにアクセスできます：
<a href="https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P" target="_blank">
    https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P
</a>

特定の画像にアクセスするには、次のURLを使用します：
<a href="https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_1.png" target="_blank">
    https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_1.png
</a>

### JSONファイルを作成
次に、3つのJSONファイルを保存するフォルダを作成します。
```
geo-json
├── 0
├── 1
├── 2
```

JSONファイルの中に、トークンのメタデータ（名前、説明、画像など）を作成します。
画像のURLには、IPFS上の画像のURLを使用します。必要に応じて追加データを追加できます。この例では、各トークンに一意の属性を追加しました。

最初のトークンのJSONは次のようになります：
```
{
    "name": "Geometry#0",
    "description": "Geometry is an NFT collection for educational purposes.",
    "image": "https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_1.png
",
    "attributes": [
        { "trait_type": "background", "value": "cyan" },
        { "trait_type": "color", "value": "red" },
        { "trait_type": "shape", "value": "circle" }
    ]
}
```

次のトークンのJSONは次のようになります：
```
{
    "name": "Geometry#1",
    "description": "Geometry is an NFT collection for educational purposes.",
    "image": "https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_2.png",
    "attributes": [
        { "trait_type": "background", "value": "magenta" },
        { "trait_type": "color", "value": "green" },
        { "trait_type": "shape", "value": "square" }
    ]
}
```

この例では、フォルダ名を「geo-json」としました。このフォルダの中に3つのJSONファイルがあります。最初のJSONファイルは「0」、2番目のJSONファイルは「1」、3番目のJSONファイルは「2」となっています。

JSONファイルにはファイル拡張子がなく、対応するtokenIdsと同じ名前にしてください。
pinata.cloudのピンマネージャでアップロードボタンをクリックし、JSONファイルが入ったフォルダをアップロードします。

IPFS上でフォルダにアクセスするには、このアドレス "https://ipfs.io/ipfs/" にCIDを追加します。
現在の例では、次のURLを使用してフォルダにアクセスできます：
<a href="https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp" target="_blank">
    https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp
</a>
これがbaseURIとなります。

特定のJSONファイルにアクセスするには、スラッシュとトークンIDを追加します。次のURLを使用します：
<a href="https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/0" target="_blank">
    https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/0
</a>

コントラクトでは、baseURIを自分のbaseURIに置き換えます。この例では、baseURIは次のURLで構成されます。
"https://ipfs.io/ipfs/"、JSONファイルを含むCID、および末尾のスラッシュ"/"。

個々のtokenURIは、トークンIDをbaseURIに追加することによって作成されます。これは、上記の例でJSONファイルにアクセスするために手動で行ったのと同じです。
