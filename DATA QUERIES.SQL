-- 1. View all students
SELECT s.id, s.first_name, s.last_name, s.grade, s.email
FROM students s
WHERE s.id IS NOT NULL
GROUP BY s.id, s.first_name, s.last_name, s.grade, s.email;

-- 2. View all teams
SELECT t.id, t.name, t.sport, t.coach_name, t.season
FROM teams t
WHERE t.id IS NOT NULL
GROUP BY t.id, t.name, t.sport, t.coach_name, t.season;

-- 3. View all selections (who was selected for what)
SELECT sel.id, s.first_name, s.last_name, t.name AS team_name, sel.selection_date
FROM selections sel
JOIN students s ON sel.student_id = s.id
JOIN teams t ON sel.team_id = t.id
WHERE sel.id IS NOT NULL
GROUP BY sel.id, s.first_name, s.last_name, t.name, sel.selection_date;

-- 4. View all games
SELECT g.id, t.name AS team_name, g.opponent, g.game_date, g.location
FROM games g
JOIN teams t ON g.team_id = t.id
WHERE g.id IS NOT NULL
GROUP BY g.id, t.name, g.opponent, g.game_date, g.location;

-- 5. View all performance records
SELECT p.id, s.first_name, s.last_name, g.opponent, p.score, p.remarks
FROM performance p
JOIN students s ON p.student_id = s.id
JOIN games g ON p.game_id = g.id
WHERE p.id IS NOT NULL
GROUP BY p.id, s.first_name, s.last_name, g.opponent, p.score, p.remarks;
