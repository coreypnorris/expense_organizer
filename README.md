##Expense Organizer

####This is an app for organizing your expenses. It's built using Ruby with  PSQL on the back end.

To use this program you'll need Ruby and PSQL installed on your machine. [Here's a link to help you install Ruby](http://www.learnhowtoprogram.com/lessons/installing-ruby) and [here's a link to help you install Postgres](http://www.learnhowtoprogram.com/lessons/installing-postgres). When you have Ruby and Postgres installed, open Postgres in your terminal and enter the following commands.

* create database expense_organizer;
* \c expense_organizer
* CREATE TABLE categories (id serial PRIMARY KEY, name varchar);
* CREATE TABLE expenses (id serial PRIMARY KEY, description varchar, amount float, date varchar);
* CREATE TABLE category_expenses (id serial PRIMARY KEY, category_id integer, expense_id integer);
* CREATE DATABASE expense_organizer_test WITH TEMPLATE expense_organizer;

Finally, download the zip file and navigate to the file in your terminal. Then run `ruby user_interface.rb` to bring up the user interface.

We built this project while we were students at [Epicodus](http://www.epicodus.com/). [This exercise](http://www.learnhowtoprogram.com/lessons/expense-organizer) was meant to introduce us to using SQL databases in our Ruby programs.
