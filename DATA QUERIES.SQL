-- 1. View all students
SELECT s.id, s.first_name, s.last_name, s.grade, s.email
FROM students s;

-- Delete a student by ID
DELETE FROM students WHERE id = 1;

-- 2. View all teams
SELECT t.id, t.name, t.sport, t.coach_name, t.season
FROM teams t;

-- Delete a team by ID
DELETE FROM teams WHERE id = 1;

-- 3. View all selections (who was selected for what)
SELECT sel.id, s.first_name, s.last_name, t.name AS team_name, sel.selection_date
FROM selections sel
JOIN students s ON sel.student_id = s.id
JOIN teams t ON sel.team_id = t.id;

-- Delete a selection by ID
DELETE FROM selections WHERE id = 1;

-- 4. View all games
SELECT g.id, t.name AS team_name, g.opponent, g.game_date, g.location
FROM games g
JOIN teams t ON g.team_id = t.id;

-- Delete a game by ID
DELETE FROM games WHERE id = 1;

-- 5. View all performance records
SELECT p.id, s.first_name, s.last_name, g.opponent, p.score, p.remarks
FROM performance p
JOIN students s ON p.student_id = s.id
JOIN games g ON p.game_id = g.id;

-- Delete a performance record by ID
DELETE FROM performance WHERE id = 1;

-- 6. List all teams a specific student has been selected for
SELECT t.name AS team_name, t.sport, t.season
FROM selections sel
JOIN teams t ON sel.team_id = t.id
WHERE sel.student_id = 101;

-- Delete all selections for a specific student
DELETE FROM selections WHERE student_id = 101;

-- 7. Find the average score of each student across all games
SELECT s.first_name, s.last_name, AVG(p.score) AS average_score
FROM performance p
JOIN students s ON p.student_id = s.id
GROUP BY s.id, s.first_name, s.last_name;

-- Delete all performance records with NULL score
DELETE FROM performance WHERE score IS NULL;

-- 8. Get top-performing students (score > 20) in a specific game
SELECT s.first_name, s.last_name, p.score
FROM performance p
JOIN students s ON p.student_id = s.id
WHERE p.game_id = 12 AND p.score > 20;

-- Delete performance entries below a threshold for a game
DELETE FROM performance WHERE game_id = 12 AND score <= 20;

-- 9. List all upcoming games for a specific team
SELECT g.opponent, g.game_date, g.location
FROM games g
WHERE g.team_id = 5 AND g.game_date > CURRENT_DATE
ORDER BY g.game_date;

-- Delete past games for a specific team
DELETE FROM games WHERE team_id = 5 AND game_date < CURRENT_DATE;

-- 10. Count how many students are selected for each team
SELECT t.name AS team_name, COUNT(sel.student_id) AS total_selected
FROM selections sel
JOIN teams t ON sel.team_id = t.id
GROUP BY t.id, t.name
ORDER BY total_selected DESC;

-- Delete all selections for a team
DELETE FROM selections WHERE team_id = 1;
