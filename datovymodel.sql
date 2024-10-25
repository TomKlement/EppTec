-- schéma zde -> https://dbdiagram.io/d/EppTec-671b5d7e97a66db9a33ec707

SELECT clients.id, clients.name, clients.surname FROM clients
JOIN accounts ON clients.id = accounts.owner_id 
JOIN balances ON accounts.account_id = balances.account_id
WHERE  balances.snapshot_date = '2024-09-30'
GROUP BY clients.id
HAVING SUM(balances.principal_balance) > c


SELECT clients.id, clients.name, clients.surname, balances.current_balance FROM clients
JOIN accounts ON clients.id = accounts.owner_id 
JOIN balances ON accounts.account_id = balances.account_id
WHERE  balances.date = '2024-09-30'
GROUP BY clients.id, clients.name, clients.surname
ORDER BY balances.current_balance DESC
LIMIT 10;
 