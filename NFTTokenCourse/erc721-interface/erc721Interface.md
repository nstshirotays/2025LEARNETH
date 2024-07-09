ERC721は、Ethereumブロックチェーン上で非代替性トークン（NFT）を管理するためのトークンコントラクトの標準です。

各非代替性トークンは一意であり、互換性がありません。NFTは、アート、コレクション品、不動産などのユニークなデジタルおよび物理資産の所有権を表すために使用されます。

ERC721トークン標準について詳しく知りたい場合は、その<a href="https://eips.ethereum.org/EIPS/eip-721" target="_blank">Ethereum改良提案</a>の仕様をご覧ください。

## インターフェース
ERC721標準はERC20標準よりも複雑で、オプションの拡張機能を備えています。ERC721準拠のコントラクトは、最低限、ERC721およびERC165インターフェースを実装する必要があります。このセクションではこれらを見ていきます。

このインターフェース（11行目）は、<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol" target="_blank">OpenZeppelin</a>が提供するオープンソースのコントラクトライブラリの一部です。

## 基本的なIERC721関数
ERC721標準に準拠したコントラクトは、以下の関数を実装する必要があります：

### balanceOf
`balanceOf`関数（30行目）は、`owner`アドレスを持つアカウントが所有するトークンの数を返します。

### ownerOf
`ownerOf`関数（39行目）は、`tokenId`を持つトークンを保持するアカウントの`owner`アドレスを返します。

### safeTransferFrom
`safeTransferFrom`関数（55行目）は、`tokenId`を持つトークンの所有権を`from`アドレスから`to`アドレスに転送します。

`safeTransferFrom`関数（137行目）は、55行目の`safeTransferFrom`関数とほぼ同じですが、この関数には非空のペイロード`data`があります。

スマートコントラクトがトークン転送を受け取る場合は、ERC721TokenReceiverインターフェースを実装する必要があります。これにより、コントラクトがERC721トークン転送を処理できるようになり、トークンが処理できないコントラクトにロックされるのを防ぎます。

### transferFrom
`transferFrom`関数（55行目）は、`tokenId`を持つトークンの所有権を`from`アドレスから`to`アドレスに転送します。

**可能な限りsafeTransferFromを使用することをお勧めします。**
`transferFrom`関数は安全ではありません。なぜなら、受信者のスマートコントラクトがERC721TokenReceiverインターフェースを実装しており、ERC721トークンを処理できるかどうかを確認しないからです。

## 高度なIERC721関数
### approve
`approve`関数（94行目）は、`to`アドレスを持つアカウントに、関数を呼び出したアカウントに代わって`tokenId`を持つトークンを管理する権限を与えます。

### getApproved
`getApproved`関数（103行目）は、`tokenId`を持つトークンを管理することが承認されているアカウント（返り値`operator`）のアドレスを返します。

### setApprovalForAll
`setApprovalForAll`関数（115行目）は、指定されたアドレス（入力パラメータ`operator`）を持つアカウントに、関数を呼び出したアカウントのすべてのトークンを管理する権限（`_approved`）を設定します。

### isApprovedForAll
`isApprovedForAll`関数（103行目）は、`operator`アドレスを持つアカウントが、`owner`アドレスを持つアカウントのすべてのトークンを管理することが承認されている場合にboolean trueを返します。

## IERC721イベント
ERC721コントラクトは、次のイベントを発生させる必要があります：

### Transfer
`Transfer`イベント（15行目）は、`tokenId`を持つトークンが`from`アドレスから`to`アドレスに転送されるときに発生させる必要があります。

### Approval
`Approval`イベント（20行目）は、`owner`アドレスを持つアカウントが、`spender`アドレスを持つアカウントに代わって`tokenId`を持つトークンを管理することを承認するときに発生させる必要があります。

### ApprovalForAll
`ApprovalForAll`イベント（25行目）は、`owner`アドレスを持つアカウントが、`operator`アドレスを持つアカウントにすべてのトークンを管理する権限を与えるか取り消すときに発生させる必要があります。

## IERC165
ERC721インターフェースに加えて、ERC721準拠のコントラクトはERC165インターフェースも実装する必要があります。

ERC165インターフェースを実装することで、コントラクトは特定のインターフェースのサポートを宣言できます。あるコントラクトが別のコントラクトとやり取りしたい場合、そのコントラクトがこのインターフェースをサポートしているかどうかを確認してからトランザクション（例：トークンの送信）を行うことができます。

ここでのIERC721インターフェースは、IERC165インターフェースからインポート（6行目）および継承（11行目）されています。

以下は、ERC165インターフェースの<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/IERC165.sol" target="_blank">OpenZeppelinの実装</a>の例です：


```
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
```

例えば、ERC721インターフェースのERC165識別子はEIP721で指定されている通り“0x80ac58cd”です。インターフェース識別子の計算方法やERC165の詳細については、その<a href="https://eips.ethereum.org/EIPS/eip-165" target="_blank">改良提案</a>をご覧ください。

## その他のインターフェース
安全な転送を受け入れるためには、<a href="https://eips.ethereum.org/EIPS/eip-721#specification" target="_blank">IERC721TokenReceiver</a>インターフェースを実装する必要があります。

EIP721では、ERC721コントラクトのための2つのオプションの拡張が指定されています：

IERC721Enumerableは、コントラクトがそのトークンの完全なリストを公開し、それらを発見可能にすることを可能にします。

IERC721Metadataは、コントラクトがトークンに追加情報を関連付けることを可能にします。この詳細については次のセクションで詳しく見ていきます。
