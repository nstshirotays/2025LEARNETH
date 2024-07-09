このコントラクトでは、OpenZeppelin（4行目）のERC721トークンコントラクト実装を使用します。

<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol" target="_blank">ERC721コントラクト</a>の実装を見てみましょう。ERC721標準で指定されている機能に加えて、このコントラクトには追加の機能も提供されています。

## MyToken
MyTokenと呼ばれる独自のコントラクトを作成します（7行目）。これは、OpenZeppelinの`ERC721`トークンコントラクト実装および`Ownable`から機能を継承します（7行目）。Ownableコントラクトモジュールを忘れた場合は、ERC20拡張セクションを確認してください。

このERC721実装では、EIPで指定されたIERC721Metadata拡張を利用しています。私たちのコントラクトは`name()`と`symbol()`関数を継承し、デプロイ時にその値を設定できるコンストラクタを持ちます（8行目）。この場合、デフォルト値を使用します。トークンの名前をコントラクト名と同じ`"MyToken"`とし、シンボルを`"MTK"`とします。

### Base URI
ERC721コントラクトでは、各トークンに独自のtokenIdを持つさまざまなトークンをミントできます。IERC721Metadataインターフェースで見たように、各トークンには通常、名前、説明、画像リンクなどのメタデータを保存するJSONファイルを指す`tokenURI`があります。コントラクトが複数のトークンをミントする場合、ERC721実装は通常、すべてのトークンに共通のURIをbase（`baseURI`）として使用し、それぞれの固有のtokenIdを末尾に連結して区別します。次の部分でこれがどのように見えるかを見てみましょう。

この例では、データをIPFSに保存しています — 次のセクションで詳しく説明します。baseURIは<a href="https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/" target="_blank">https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/</a>（11行目）です。
連結によって、id 0を持つトークンのtokenURIは<a href="https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/0" target="_blank">https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/0</a>となり、id 1を持つトークンのtokenURIは<a href="https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/1" target="_blank">https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/1</a>となります。

IPFSを使用している場合、「504 Gateway Time-out」エラーが発生した場合は、データが利用可能になるまで待って再試行する必要があるかもしれません。

### safeMint
`safemint`関数（14行目）を使用して、オーナーがコントラクトデプロイ後に専用のtokenIdを持つ新しいトークンを作成できるようにします。
`safemint`関数はOpenZeppelinのERC721実装の一部であり、`to`アドレスを持つアカウントに`tokenId`を持つトークンを安全にミントすることができます。アクセス制御のために、インポートしたOwnableアクセス制御コントラクトモジュールの`onlyOwner`修飾子を使用します（5行目）。

次のセクションでは、NFTのメタデータを作成し、ホストする方法を見ていきます。

## ⭐️ 課題
1. コントラクト名を`Geometry`に変更します。
2. トークン名を`Geometry`に変更します。
3. トークンのシンボルを`GEO`に変更します。
4. `_baseURI`を<a href="https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/" target="_blank">https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/</a>に変更します。
