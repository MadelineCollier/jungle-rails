
# Jungle
A mini e-commerce application built during week 6 of Lighthouse Labs' 8-week Web Development Bootcamp. Introduced as an unfamiliar existing code-base with feature requests and bug fixes, to learn to navigate the Rails 4.2 framework.

Includes persistent data-storage with postgreSQL, carts, payments with stripe, and partitioned admin permissions.

## Finished Product
![Products Homepage](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Products%20Homepage.png?raw=true)
![My Cart](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Cart.png?raw=true)
![Payments with stripe](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Payments%20With%20Stripe.png?raw=true)
![Search products by category](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Search%20Products%20By%20Category%20-%20Furniture.png?raw=true)
![Admin Categories](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Admin:Categories.png?raw=true)
![Admin Products](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Admin:Products.png?raw=true)
![Sign Up](https://github.com/MadelineCollier/jungle-rails/blob/master/docs/Sign%20Up.png?raw=true)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
