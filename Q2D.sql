SELECT m.MemberID, m.LastName, m.FirstName FROM Member m WHERE NOT EXISTS (SELECT * FROM Entry e1 WHERE NOT EXISTS (SELECT * FROM Entry e2 WHERE e2.MemberID = m.MemberID AND e1.Year = e2.Year));
