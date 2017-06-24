# Foundation.cssの使い方メモ  
詳細は[公式](http://foundation.zurb.com/sites/docs/v/5.5.3/#)をみてください
## レイアウトの仕様  
### サイズの種類  
Foundation6のレイアウトは画面サイズごとに準備されている  
?は数字が入る、今回はPCなのでlargeを使用  
- small-?  
スマホサイズ(640px以下)を対象にしたサイズ  
- medium-?  
タブレットサイズ(641~1024px)を対象にしたサイズ  
- large-?  
PCサイズ(1025px以上)を対象にしたサイズ  

### カラム分け  
画面全体を１２分割して考える横に入りきらない分はカラム落ちで次の行に表示される  
|-----5-----|--------7--------|  
上記のように分ける場合は下のように書く  

```html
<div class="row">
  <div class="columns large-5">medium-8</div>
  <div class="columns large-7">medium-4</div>
</div>
```

これ以外にもカラムを入れ子にすればいろいろな分け方が可能

## ボタン  
ボタンも選択次第で様々なデザインがデフォルトで使えるが、JSF独特な書き方とは合わないところがあるので注意  
```html
<a href="#" class="button tiny">Tiny Button</a>
<a href="#" class="button small">Small Button</a>
<a href="#" class="button">Default Button</a>
<a href="#" class="button disabled">Disabled Button</a>
<a href="#" class="button large">Large Button</a>
<a href="#" class="button expand">Expanded Button</a> ※使用不可
<!-- Radius Classes -->
<a href="#" class="button round">Round Button</a> ※使用不可
<a href="#" class="button radius">Radius Button</a> ※使用不可

<!-- Color -->
<a href="#" class="button">Default Button</a>
<a href="#" class="button success">Success Button</a>
<a href="#" class="button secondary">Secondary Button</a>
<a href="#" class="button alert">Alert Button</a>
<a href="#" class="button info">Info Button</a>　※あまり色が変わらない
<a href="#" class="button disabled">Disabled Button</a>
```
