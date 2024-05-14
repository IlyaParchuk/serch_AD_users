# Устанавливаем переменную $daysToExpire, которая указывает количество дней до истечения учетной записи
$daysToExpire = 7

# Получаем текущую дату
 $currentDate = Get-Date

# Вычисляем дату, когда учетные записи истекут
 $expireDate = $currentDate.AddDays($daysToExpire)

# Поиск учетных записей в OU=Organizational,DC=Domain Component,DC=ru, у которых учетная запись истекает в течение $daysToExpire дней
 $accounts = Get-ADUser -Filter { AccountExpirationDate -le $expireDate } -SearchBase "OU=Organizational,DC=Domain Component,DC=ru" | 
# Отфильтровываем учетные записи, которые не находятся в OU=Blocked
 Where-Object { $_.DistinguishedName -notlike '*OU=Blocked*' }

# Выводим информацию о найденных учетных записях в виде таблицы с указанием имени, класса объекта и даты истечения учетной записи
 $accounts | Format-Table Name, ObjectClass, AccountExpirationDate -AutoSize
