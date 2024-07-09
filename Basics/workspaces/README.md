## ワークスペースは別々のプロジェクトを整理するのに役立ちます。

Remixを初めて使用する場合、**default_workspace**という名前のワークスペースがファイルエクスプローラーに読み込まれます。

![](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/interface_introduction/images/default_workspace.png)

**default_workspace**にはcontractsフォルダーに3つのSolidity (.sol)ファイルがあります。Remixには他にも多くのテンプレートがあります。テンプレートをロードすると、それがワークスペースに入ります。ワークスペース間を移動するには、ファイルエクスプローラーの上部にあるセレクトボックスを使用します。

![](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/interface_introduction/images/select-box.png)

しかし、ワークスペースはテンプレートだけのためのものではありません。リポジトリをRemixにクローンすると、ファイルはワークスペースに配置されます。

新しいワークスペースを作成しましょう。

1. ファイルエクスプローラーの上部でハンバーガーアイコン（横3本線）をクリックします。このメニューにあるコマンドとツールを読みます。

2. **+ Create**（最初の選択肢）を選択します。

3. 表示されるモーダルで、テンプレートの1つを選択します。

![hamburger](https://raw.githubusercontent.com/ethereum/remix-workshops/master/Basics/workspaces/images/popup.png)

このポップアップメニューでは、リポジトリをクローンできることに注意してください。Gitリポジトリの管理はDGitプラグインで行います。また、ポップアップメニューの3つのワークフローの選択肢を使ってGithubアクションを作成することもできます。
