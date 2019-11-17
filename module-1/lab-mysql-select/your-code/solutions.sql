-- Challenge 1
CREATE VIEW Challenge_1 AS
select authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on titles.pub_id = publishers.pub_id
ORDER BY AUTHOR_ID DESC;

-- Challenge 2
CREATE VIEW Challenge_2 AS
select authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, COUNT(titles.title_id) AS TITLE_COUNT
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on titles.pub_id = publishers.pub_id
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY AUTHOR_ID DESC;

-- Challenge 3
WITH grouped_qty AS
(
select title_id, sum(qty) AS g_qty
from sales
GROUP BY title_id
)
select authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, sum(grouped_qty.g_qty) AS TOTAL
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join grouped_qty on grouped_qty.title_id = titleauthor.title_id
GROUP BY  authors.au_id
ORDER BY TOTAL Desc
LIMIT 3
;

-- Challenge 4
WITH grouped_qty AS
(
select title_id, sum(qty) AS g_qty
from sales
GROUP BY title_id
)
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, sum(grouped_qty.g_qty) AS TOTAL
from authors
left JOIN titleauthor on titleauthor.au_id = authors.au_id
left JOIN grouped_qty on grouped_qty.title_id = titleauthor.title_id
group by authors.au_id
ORDER by TOTAL DESC;
