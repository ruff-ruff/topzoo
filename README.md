# Topzoo

Topzoo is a Rails animal catalog where users can choose up to three favorite
animals and browse the community popularity ranking.

## Local setup

This project uses Ruby on Rails 8 and MySQL. Set the MySQL credentials in
`config/database.yml` (or use `DATABASE_URL`), then run:

```sh
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
```

Open `http://localhost:3000`. Guests can browse the catalog and popularity
pages. Create an account to select favorites.

## Route map

| Page | Route | Access |
| --- | --- | --- |
| Catalog | `/animals` | Everyone |
| Popular animals | `/popular` | Everyone |
| Animal details | `/animals/:id` | Everyone |
| My favorites | `/favorites` | Signed-in users |
| Log in / register | `/login`, `/register` | Everyone |
| Add/edit animals | `/animals/new`, `/animals/:id/edit` | Admins |
| Users | `/users` | Admins |

## Development authentication note

The current classroom prototype compares the entered password with the stored
value directly so the route and interface flow can be demonstrated. This is
not safe for production. Before deployment, replace it with a password-hashing
solution and signed password-reset tokens.
