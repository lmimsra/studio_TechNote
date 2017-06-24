# JavaEEの書き方文書  
基本的にこの書き方でお願いします
```html
<body>
<ui:composition template="/templates/layout.xhtml">
    <ui:define name="title"></ui:define>　←タブに表示されるこのページのタイトル
    <ui:define name="page_title"></ui:define>　←ページ内に表示されるタイトル
    <ui:define name="content">
        表示するページ本体を記述
    </ui:define>
</ui:composition>
</body>

```
