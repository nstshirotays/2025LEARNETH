ERC20標準は、コントラクトに必要な機能とオプションの機能を記述するだけですが、追加の機能を追加することもできます。

このセクションでは、OpenZeppelinの拡張機能を使用して、トークンの焼却や鋳造、コントラクトの一時停止機能を追加しました。

もちろん、自分でERC20トークンコントラクトの実装や拡張を作成し、それをコントラクトにインポートすることもできます。しかし、OpenZeppelinのコントラクトはセキュリティ専門家によって監査されており、望む機能を追加するための素晴らしい方法です。

### 鋳造可能（Mintable）
鋳造（ミント）機能は、コントラクトの作成者がデプロイ後に追加のトークンを鋳造（作成）することを可能にします（22行目）。この関数には、トークンを鋳造するアドレスと鋳造すべきトークンの量が入力パラメータとして必要です。

`mint()`を他のコントラクトからインポートする必要はありません。なぜなら、mint関数はすでにOpenZeppelinの<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol" target="_blank">ERC20コントラクト</a>実装の一部だからです。ここでは、所有者に特定の関数への排他的アクセスを提供する基本的なアクセス制御メカニズムを提供するコントラクトモジュールである`Ownable`（7行目）をインポートします。このコントラクトでは、`mint`関数に継承された`onlyOwner`修飾子を追加し（22行目）、この関数へのアクセスを"所有者"に制限します。

このコントラクトは、<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol" target="_blank">Ownableコントラクト</a>から、owner()、transferOwnership()、renounceOwnership()などの追加関数を継承してアクセス管理を行います。

### 焼却可能（Burnable）
"ERC20Burnable"をインポートし（5行目）、その関数を継承することで（9行目）、このコントラクトではトークンホルダーが自分のトークンや許可されたトークンを破棄することができます。詳細については、<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Burnable.sol" target="_blank">ERC20Burnableコントラクト</a>をご覧ください。

### 一時停止可能（Pausable）
"Pausable"コントラクトモジュール（6行目と9行目）を使用すると、所有者はコントラクトを一時停止（14行目）および再開（18行目）することができます。一時停止状態では、トークンの転送ができなくなり、緊急時に役立つことがあります。詳細については、<a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/Pausable.sol" target="_blank">Pausableコントラクト</a>をご覧ください。

OpenZeppelinの<a href="https://docs.openzeppelin.com/contracts/4.x/wizard" target="_blank">Contract Wizard</a>を使用すると、追加の機能を簡単に追加できます。

このコースを無事に完了したら、次のステップとしてLearneth NFTコースに挑戦してみてください。

## ⭐️ 課題
1. デプロイ後にアカウントにトークンを鋳造してみてください。`totalSupply()`および`balanceOf()`を呼び出して正しい実行を確認します。
2. トークンを焼却し、その後に`totalSupply()`および`balanceOf()`を呼び出して正しい実行を確認します。
3. 一時停止機能をテストするために、所有者アカウントを使用してコントラクトを一時停止し、別のアカウントで転送を試みます。トランザクションは実行されず、"Pausable: paused"という例外を投げるはずです。
