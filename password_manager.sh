#!/bin/bash

while true;
do
    echo 'パスワードマネージャーへようこそ！'
    echo '次の選択肢から入力してください(Add Password/Get Password/Exit): '
    read choice

    case $choice in ;
        'Add Password' )
            read -p 'サービス名を入力してください: ' service_name
            read -p 'ユーザー名を入力してください: ' user_name
            read -sp 'パスワードを入力してください: ' password

            echo $service_name:$user_name:$password >> passwords.txt
            echo 'パスワードの追加は成功しました' ;;
        'Get Password' )
            read -p 'サービス名を入力してください: ' service_name
                if [ -z $service_name ];
                then
                    echo 'そのサービスは登録されていません'
                else
                    echo 'サービス名: $service_name'
                    echo 'ユーザー名: $(grep "^$service_name:" passwords.txt | cut -d : - f2)'
                    echo 'パスワード: $(grep "^$service_name:" passwords.txt | cut -d : - f3)'
                fi ;;
        'Exit' )
            echo 'Thank you!' ;;
        *)
            echo '入力が間違えています。(Add Password/Get password/Exit)から入力してください。'
    esac
done

            
