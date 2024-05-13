# Поиск учетных записей в OU=Organizational Unit,DC=Domain Component,DC=ru, у которых установлен флаг "PasswordNeverExpires"
 $accounts = Search-ADAccount -SearchBase "OU=Organizational Unit,DC=Domain Component,DC=ru" -PasswordNeverExpires | 
# Отфильтровываем учетные записи, которые не находятся в OU=Blocked
 Where-Object { $_.DistinguishedName -notlike '*OU=Blocked*' }
# Выводим информацию о найденных учетных записях в виде таблицы с указанием имени, класса объекта и DistinguishedName
 $accounts | Format-Table Name, ObjectClass, DistinguishedName -AutoSize