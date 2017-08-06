# JavaEE Mavenプロジェクトの時のメモ  
> あくまで個人ようなので内容雑ですがあしからず
> 設定も一部個人の設定が混じっているので設定の参考程度にお願いします

## mavenプロジェクトを作る
### intellijでmavenプロジェクトを作る  
archetypeはwebappのアーキタイプあたりで作れば大体は自動生成でやってくれる　　
## 最低限のディレクトリ構成とファイル  
足りない部分があるので追加していく
```
/project-root
|--.idea(自動生成)
|--(プロジェクト名)iml(自動生成)
|--pom.xml(設定file)
|--src
   |--main
      |--java(以下Javaコードを置く)
      |--resources(DB接続情報などを置く)
      |--webapp(以下webに出されるファイルを置く)
         |--WEB-INF
         |  |--faces_config.xml
         |  |--web.xml
         |
         |--index.xhtml
         |--resources
            |--javascript
            |--css
            |--images
```
### 設定ファイルの例
- pom.xml  

```pom.xml
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>(プロジェクト作った時に指定)</groupId>
  <artifactId>(プロジェクト作った時に指定)</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>javaee-art Maven Webapp</name>
  <url>http://maven.apache.org</url>
    <!-- 以下必要に応じて使うライブラリを追加していく -->
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.jboss.spec</groupId>
      <artifactId>jboss-javaee-web-7.0</artifactId>
      <version>1.0.0.Final</version>
      <type>pom</type>
      <scope>import</scope>
    </dependency>
    <dependency>
      <groupId>javax</groupId>
      <artifactId>javaee-web-api</artifactId>
      <version>7.0</version>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>javax.enterprise</groupId>
      <artifactId>cdi-api</artifactId>
      <version>1.2</version>
      <scope>provided</scope>
    </dependency>
  </dependencies>
  <build>
    <finalName>(任意の名前)</finalName>
    <plugins>
      <!-- Set to compile using JDK 8 -->
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.1</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
          <encoding>UTF-8</encoding>
        </configuration>
      </plugin>
      <plugin>
        <artifactId>maven-war-plugin</artifactId>
        <version>2.3</version>
        <configuration>
          <failOnMissingWebXml>false</failOnMissingWebXml>
        </configuration>
      </plugin>
    </plugins>
  </build>

</project>

```

- faces_config.xml  

```faces_config.xml
<?xml version="1.0" encoding="UTF-8"?>
<faces-config version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/javaee"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-facesconfig_2_2.xsd">

</faces-config>
```
- web.xml  

```web.xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
<display-name>Archetype Created Web Application</display-name>

<!-- JSF用 -->
<context-param>
  <param-name>javax.faces.PROJECT_STAGE</param-name>
  <param-value>Development</param-value>
</context-param>
<servlet>
  <servlet-name>Faces Servlet</servlet-name>
  <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
  <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
  <servlet-name>Faces Servlet</servlet-name>
  <url-pattern>/faces/*</url-pattern>
</servlet-mapping>

<session-config>
  <session-timeout>30</session-timeout>
</session-config>

<welcome-file-list>
  <welcome-file>/faces/index.xhtml</welcome-file>
</welcome-file-list>

</web-app>
```

## intellijでhelloworldまでの流れ  

1. mavenプロジェクトを立ち上げる  
1. 上のファイル構成に変更  
1. 右側にあるmavenのメニューからcompile→packageの順で実行  
1. メニューの"Run"項目から"EditConfigurations"を選択  
1. +を押してJBossServerを追加、wildFlyのディレクトリを選択  
1. Deploymentタブを表示し、 "Deploy ato the server startup"項目にExternalSourseで"/projectRoot/target/.warのファイルを追加
1. Runを実行し表示がされれば終了  

※ プロジェクトの雛形がアレアバ１、２、は飛ばしても良い  

### レイアウトの指定をメモ  
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
