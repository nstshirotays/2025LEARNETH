メタデータ拡張はオプションです。これにより、ERC721トークンに追加情報を付加することができます。名前、シンボル、およびURI（Uniform Resource Identifier）を指定して、JSON形式でさらに多くの情報を追加できるファイルを指し示すことができます。

## ERC721メタデータ関数

### name
`name`関数（16行目）は、トークンコレクションの名前を返します。トークンコレクションとは、ERC721トークンコントラクト実装で作成されたすべてのトークンを指します。このコレクション内のすべてのトークンは、トークンIDに関係なくこの名前を持ちます。

### symbol
`symbol`関数（21行目）は、トークンコレクションのシンボルを返します。

### tokenURI
`tokenURI`関数（26行目）は、`tokenId`を持つトークンのURIを返します。この場合、コレクション全体のURIではなく、コレクション内の個々のトークンのURIです。

## ERC721メタデータJSONスキーマ
`tokenURI`が指し示すファイルは、<a href="https://eips.ethereum.org/EIPS/eip-721#specification" target="_blank">EIP-721</a>で指定されているメタデータJSONスキーマに準拠している必要があります。

 
```
{
    "title": "Asset Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this NFT represents"
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this NFT represents"
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
        }
    }
}
```
ルート要素はオブジェクト型でなければなりません。このルートオブジェクトには、キーがname、description、およびimageであり、すべて文字列型のプロパティを持つべきです。

ERC721標準は非常に柔軟であり、`tokenURI`は必ずしもJSONドキュメントを指し示す必要はなく、JSONはすべてのプロパティを持つ必要もなく、追加のプロパティを持つことがよくあります。