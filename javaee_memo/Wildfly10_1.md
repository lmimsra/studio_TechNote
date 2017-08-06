# Wildfly10.1のセットアップメモ  
> ローカルにWildflyをインストールして実行するまでの作業メモ  

## 1.とりあえず動かす  
1. [Wildflyダウンロードページ](http://wildfly.org/downloads/) からFinalと書いてあるバージョン(Java EE7 Full & Web Distribution)をダウンロードする。今回はwildfly-10.1.0.Final.zipをダウンロードしたと仮定する
1. ダウンローしてきたファイルを好きな場所に展開するとwildfly-10.1.0.Finalのディレクトリができる。  
1. コマンドラインからwildfly-10.1.0.Final/binに移動して、そこにあるadd-user.sh、windowsであればadd-user.batを実行する  
```
$ ./add-user.sh
What type of user do you wish to add?
 a) Management User (mgmt-users.properties)
 b) Application User (application-users.properties)
(a): a <-aを選択
Enter the details of the new user to add.
Using realm 'ManagementRealm' as discovered from the existing property files.
Username : administrator　<-追加する名前を入力                             
The username 'administrator' is easy to guess
Are you sure you want to add user 'administrator' yes/no? yes
Password recommendations are listed below. To modify these restrictions edit the
 - The password should contain at least 8 characters, 1 alphabetic character(s), 1 digit(s), 1 non-alphanumeric symbol(s)
Password : *********　<-パスワードを入力
WFLYDM0101: Password should have at least 1 digit.
Are you sure you want to use the password entered yes/no? yes
Re-enter Password : *********　<-パスワードを再度入力
What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]:
About to add user 'administrator' for realm 'ManagementRealm'
Is this correct yes/no? yes
Added user 'administrator' to file '/Users/mmr/Server/wildfly-testServer/standalone/configuration/mgmt-users.properties'
Added user 'administrator' to file '/Users/mmr/Server/wildfly-testServer/domain/configuration/mgmt-users.properties'
Added user 'administrator' with groups  to file '/Users/mmr/Server/wildfly-testServer/standalone/configuration/mgmt-groups.properties'
Added user 'administrator' with groups  to file '/Users/mmr/Server/wildfly-testServer/domain/configuration/mgmt-groups.properties'
Is this new user going to be used for one AS process to connect to another AS process?
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? yes
To represent the user add the following to the server-identities definition <secret value="cGFzc3dvcmQ=" />
$
```
1. standalone.shまたはstandalone.batを実行  
1. http://localhost:8080 に接続してwildflyのトップ画面が出れば完了  

## 2.Datasourceを作成  
1. http://localhost:8080 から
