-- Challenge 1
CREATE VIEW Challenge_1 AS
select authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on titles.pub_id = publishers.pub_id
