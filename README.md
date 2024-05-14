Scripts for automating work in Active Directory

users_with_unexpired_pass.ps1

This script will search for accounts in OU=Organizational,DC=Domain Component,DC=ru that have the "PasswordNeverExpires" flag set. Then it will filter out accounts that are not in OU=Blocked and display information about the found accounts in the form of a table with the name, object class and DistinguishedName.

users_with_an_expiring_account.ps1


This script will search for users in OU=Organizational,DC=Domain Component,DC=ru whose account expires within the specified number of days ($daysToExpire). Then it will filter out accounts that are not in OU=Blocked and display information about the accounts found in the form of a table with the name, object class and account expiration date.
