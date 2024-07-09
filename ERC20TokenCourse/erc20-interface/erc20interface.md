ERC20（Ethereum Request for Comments 20）は、Ethereumブロックチェーン上でファンジブルトークンを管理するためのトークンコントラクトの標準です。

ファンジブルトークンは互いに等しく、同じ価値、挙動、および権利を持ちます。ファンジブルトークンは、ETHやBTCのような交換手段としてよく使用されますが、投票権や評価など他の用途もあります。

ERC20トークン標準について詳しく知りたい場合は、その<a href="https://eips.ethereum.org/EIPS/eip-20" target="_blank">Ethereum改善提案</a>の仕様を確認してください。

## インターフェース
ERC20トークンコントラクトの必要な機能の概要を理解するために、ERC20コントラクトと対話するインターフェースを見てみましょう。
このインターフェース（9行目）は、<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/token/ERC20/IERC20.sol" target="_blank">OpenZeppelin</a>が提供するオープンソースコントラクトライブラリの一部です。

## ERC20関数
ERC20標準に準拠するコントラクトは、次の6つの関数を実装する必要があります：

### totalSupply
`totalSupply`関数（13行目）は、利用可能なトークンの総量を返します。

### balanceOf
`balanceOf`関数（18行目）は、`account`アドレスを持つアカウントが所有するトークンの量を返します。

### transfer
`transfer`関数（27行目）は、`recipient`アドレスに`amount`のトークンを転送します。
この関数は**必ず**`Transfer`イベントを発生させ（以下参照）、送信者に十分なトークンがない場合は例外をスローする**べき**です。

### approve
`approve`関数（52行目）は、関数を呼び出すアカウントに代わって`spender`アドレスが`amount`のトークンを転送できるように許可を作成します。

### allowance
`allowance`関数（36行目）は、`owner`アドレスを持つアカウントに代わって`spender`アドレスが使用できるトークンの量を返します。

### transferFrom
`transferFrom`関数（63行目）は、`sender`アドレスに代わって`recipient`アドレスに`amount`のトークンを転送します。
この関数は**必ず**`Transfer`イベントを発生させます。

## ERC20イベント
ERC20コントラクトは、次の2つのイベントも発生させる必要があります：

### Transfer
`Transfer`イベント（71行目）は、`indexed from`アドレスから`indexed to`アドレスに`value`量のトークンが転送されるときに発生しなければなりません。パラメータ`from`と`to`は`indexed`されており、インデックス付きパラメータをフィルタとして使用してこれらのイベントを検索することができます。

### Approval
`Approval`イベント（77行目）は、`indexed owner`アカウントが`indexed spender`アカウントに代わって`value`量のトークンを転送することを承認したときに発生しなければなりません。

## ERC20オプション関数
必須の関数とイベントに加えて、ERC20標準にはインターフェースに実装されていない3つのオプション関数も指定されています：

### name
`function name() external view returns (string);`

トークンの名前を返します。

### symbol
`function symbol() external view returns (string);`

トークンのシンボルを返します。

### decimals
`function decimals() external view returns (uint8);`

トークンが使用する小数点以下の桁数を返します。

小数点以下の桁数を使用して、表示時にトークンを1.5 ETHのように任意の量に分割できるようにすることをお勧めします。EVM（Ethereum仮想マシン）は整数のみをサポートしています。そのため、ERC20標準はトークンの小数点以下の桁数を指定する機能を実装することを推奨しています。業界標準は18小数点です。
