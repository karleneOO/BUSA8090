CREATE VIEW AllCompInfo AS select e.MemberID, m.FirstName, m.Lastname, e.Year FROM (Member m INNER JOIN Entry e ON m.MemberID = e.MemberID);
SELECT DISTINCT m.MemberID, m.FirstName, m.Lastname FROM AllCompInfo m WHERE NOT EXISTS (SELECT * FROM AllCompInfo e WHERE e.MemberID = m.MemberID AND e.Year = "2014");

