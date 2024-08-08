// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.0 (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev EIPで定義されたERC20標準のインターフェース。
 */
interface IERC20 {
    /**
     * @dev 存在するトークンの総供給量を返します。
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev `account`が所有するトークンの量を返します。
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev 呼び出し元のアカウントから`recipient`へ`amount`トークンを移動します。
     *
     * 操作が成功したかどうかを示すブール値を返します。
     *
     * {Transfer} イベントを発行します。
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev `spender`が{transferFrom}を通じて所有者の代わりに使えるトークンの残りの数を返します。
     * これはデフォルトではゼロです。
     *
     * この値は{approve}や{transferFrom}が呼び出されると変わります。
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev 呼び出し元のトークンのうち`spender`の許容量を`amount`に設定します。
     *
     * 操作が成功したかどうかを示すブール値を返します。
     *
     * 重要: このメソッドで許容量を変更すると、古い許容量と新しい許容量が両方使用される可能性があるため、
     * トランザクションの順序によるリスクが生じます。この競合状態を軽減するための一つの解決策は、
     * 最初にspenderの許容量を0に減らし、その後に希望する値を設定することです:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * {Approval} イベントを発行します。
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev アローワンスメカニズムを使用して`sender`から`recipient`へ`amount`トークンを移動します。
     * `amount`は呼び出し元のアローワンスから控除されます。
     *
     * 操作が成功したかどうかを示すブール値を返します。
     *
     * {Transfer} イベントを発行します。
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev `value`トークンが一つのアカウント（`from`）から別のアカウント（`to`）へ移動されたときに発行されます。
     *
     * `value`がゼロである場合もあります。
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev {approve}の呼び出しによって`spender`のために所有者（`owner`）の許容量が設定されたときに発行されます。
     * `value`は新しい許容量です。
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
