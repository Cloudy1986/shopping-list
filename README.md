# Shopping list

## User stories

```
As a user
I want to view my shopping list
So that I can remind myself what I need whilst I'm out shopping
```

```
As a user
I want to add an item to my shopping list
So that I can remember it later when I'm out shopping
```

```
As a user
I want to delete an item from my shopping list
So that I can forget about items I no longer need
```

```
As a user
I want to update an item on my shopping list
So that I can change my shopping list if I change my mind about an item
```

## Set up databases

To set up the development database:
1. `psql`
2. `CREATE DATABASE shopping_list;`
3. `\c shopping_list;`
4. `CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(50));`
