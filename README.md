# Run the application

Just run 

```bash
docker compose up
```

Access this page: `http://localhost:8000/student-management/index.jsp`

## Using psql to check the data

To access psql to check the database in the command line from Windows Powershell just run the following command:

```bash
docker exec -it postgresql psql -h localhost -p 5432 -d postgres -U postgres
```

Then run:

```sql
SELECT * FROM students;
```
