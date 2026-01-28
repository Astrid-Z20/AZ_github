WITH top_raters AS (
  SELECT u.name
  FROM Users u
  JOIN MovieRating m ON u.user_id = m.user_id
  GROUP BY u.user_id, u.name
  ORDER BY COUNT(*) DESC, u.name ASC
  LIMIT 1
),
top_avg AS (
  SELECT mo.title
  FROM Movies mo
  JOIN MovieRating m ON mo.movie_id = m.movie_id
  WHERE m.created_at >= '2020-02-01'
    AND m.created_at <  '2020-03-01'
  GROUP BY mo.movie_id, mo.title
  ORDER BY AVG(m.rating) DESC, mo.title ASC
  LIMIT 1
)
SELECT name  AS results FROM top_raters
UNION ALL
SELECT title AS results FROM top_avg;
