# Epicodus Library

This program allows a user to sign in and create books, checkout books and review the books history.

### Installing

Installation is quick and easy! First you can open this link <!--HEROKU LINK HERE--> to see the webpage in action live online. Or you can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browswer. The standard localhost for Sinatra is port 4567

## Built With

* Ruby
* Browser: Chrome or Safari
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* SQL
* PG

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
| Web App accepts text, symbols and symbols as input | input: a$$  | output: a$$  |
| web app connects to databases to store info | input: book title, author name  | output: book id, book title, author name |
| allows user to create new book | input: book title, author name | output: book id, book title, author name |
| allows user to checkout book | input: select book | output: add record of checkout |
| allows user to review book record | input: select book | output: check out yyyy,mm,dd |
| allows patron to see personal checkout history | index | output: list checked out books |
| allows patron to sign in | login input: 'Kai' | output: logged in as 'Kai', record reflect 'Kai's' checkouts |
<!-- |  |  |  | -->

## Authors

* Kat Gifford & Kai de Rochemont

## License

MIT

Copyright © 2017 Kat Gifford & Kai de Rochemont
