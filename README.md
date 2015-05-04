# HatebloAccess

はてなブログのアクセス数をスクレイピングしてきて通知センターに通知するツール。

OSX専用。

## Installation

```
gem install specific_install
gem specific_install -l "https://github.com/blue1st/hateblo_access.git"
```

## Usage

引数にユーザIDとパスワードを指定すると、アクセス数をスクレイピングして通知。

```
$ hateblo_access notification --user_id=USER_ID --password=PASSWORD
```
