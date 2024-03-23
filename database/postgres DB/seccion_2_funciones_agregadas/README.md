# Funciones de agregación y filtrado

> Nota: popular la tabla con la query del archivo __usertabla-populate.sql__

- `BETWEEN`:
```sql
SELECT
    first_name,
    last_name,
    follewer
FROM
    users
WHERE
    follewer BETWEEN 1000 AND 2000
ORDER BY
    follewer asc;
```

- `COUNT`,`MIN`, `MAX`, `AVG`,`SUM`, `ROUND`:
```sql
SELECT
    COUNT(*) as total_users,
    MIN(follewer) as min_follewer,
    MAX(follewer) as max_follewer,
    ROUND( AVG(follewer) ) as avg_follewer,
    SUM(follewer) / COUNT(*) as avg_manual
FROM
    users;
```

- `GROUP BY`:
```sql
SELECT
    COUNT(*),
    follewer
FROM
    users
WHERE
    followers = 4 OR follewer = 4999
GROUP BY
    follewer;
```

- `HAVING`:
> Nota: `HAVING` se utiliza para filtrar los resultados de las funciones de agregación, ya que `WHERE` no puede utilizarse con funciones de agregación.

```sql
SELECT
    COUNT(*),
    country
FROM
    users
GROUP BY
    country
HAVING
    COUNT(*) > 5;
```

- `DISTINCT`:
```sql
SELECT
    DISTINCT country
FROM
    users;
```
