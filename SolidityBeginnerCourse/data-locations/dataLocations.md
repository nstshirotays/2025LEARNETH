変数の値は、Solidityでは異なるデータ領域に格納できます：*memory*、*storage*、および*calldata*です。

前に述べたように、基本的なデータ型である`int, uint, bool, address`などの値型の変数は独立したコピーを格納しますが、参照型（配列、構造体、マッピング）の変数は値の場所（参照）を格納します。

関数で参照型を使用する場合、その値がどのデータ領域に格納されているかを指定する必要があります。関数の実行コストはデータ領域によって異なり、参照型からコピーを作成するにはガスがかかります。

### Storage
*storage*に格納された値は、ブロックチェーン上に永久に保存されるため、使用するのに高価です。

このコントラクトでは、ステート変数`arr`、`map`、および`myStructs`（5、6、10行目）はstorageに格納されます。ステート変数は常にstorageに格納されます。

### Memory
*memory*に格納された値は一時的にのみ保存され、ブロックチェーンには保存されません。これらは外部関数の実行中にのみ存在し、その後破棄されます。*storage*に格納された値よりも安価に使用できます。

このコントラクトでは、ローカル変数`myMemstruct`（19行目）およびパラメータ`_arr`（31行目）がmemoryに格納されます。関数パラメータは*memory*または*calldata*のデータ領域を持つ必要があります。

### Calldata
*calldata*は関数の引数を保存します。*memory*と同様に、*calldata*は外部関数の実行中にのみ一時的に保存されます。*memory*に格納された値とは異なり、*calldata*に格納された値は変更できません。*calldata*は使用するのに最も安価なデータ領域です。

このコントラクトでは、パラメータ`_arr`（35行目）が*calldata*のデータ領域を持ちます。配列`_arr`の最初の要素に新しい値を割り当てたい場合、`function g`（31行目）では可能ですが、`function h`（35行目）ではできません。これは、`function g`の`_arr`は*memory*のデータ領域を持ち、`function h`の`_arr`は*calldata*のデータ領域を持つためです。

### Memory to memory
*memory*から*memory*への代入は、コピーではなく参照を作成します。一方の変数の値を変更すると、同じデータを参照する他の変数の値も変更されます。

`function f`（12行目）内で*memory*のデータ領域を持つ新しい構造体`myMemStruct2`を作成し、それに`myMemStruct`（19行目）の値を割り当てた場合、`myMemStruct2`の変更は`myMemStruct`の値も変更します。

### Storage to local storage
*storage*から*local storage*への代入も、コピーではなく参照を作成します。

ローカル変数`myStruct`（17行目）の値を変更すると、ステート変数`myStructs`（10行目）の値も変更されます。

## Storageとmemory/calldata
*storage*と*memory*（または*calldata*）の間の代入は、参照ではなく独立したコピーを作成します。

`function f`（12行目）内で*memory*のデータ領域を持つ新しい構造体`myMemStruct3`を作成し、それに`myStruct`の値を割り当てた場合、`myMemStruct3`の変更はマッピング`myStructs`（10行目）に格納された値には影響しません。

冒頭で述べたように、コントラクトを作成する際にはガスコストを考慮する必要があります。そのため、可能な限りガスコストが最も少ないデータ領域を使用する必要があります。

## ⭐️ 課題
1. `function f`内で`myStruct`のメンバー`foo`の値を4に変更します。
2. `function f`内で*memory*のデータ領域を持つ新しい構造体`myMemStruct2`を作成し、それに`myMemStruct`の値を割り当てます。`myMemStruct2`のメンバー`foo`の値を1に変更します。
3. `function f`内で*memory*のデータ領域を持つ新しい構造体`myMemStruct3`を作成し、それに`myStruct`の値を割り当てます。`myMemStruct3`のメンバー`foo`の値を3に変更します。
4. `function f`が`myStruct`、`myMemStruct2`、および`myMemStruct3`を返すようにします。

ヒント：関数`f`の正しい戻り値の型を作成することを確認してください。