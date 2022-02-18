--Either use this line in the query, or the 'WITH (NOLOCK)' - They do the same thing
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT
	Business,
	isnull(StreetNo,'') as StreetNo,
	Street,
	PostCode,
	SUM(f.Count) as FootfallCount
FROM Premises         p WITH (NOLOCK)
INNER JOIN Businesses b WITH (NOLOCK) on p.BusinessId = b.Id
INNER JOIN Footfall   f WITH (NOLOCK) on p.Id = f.PremisesId
GROUP BY Business, StreetNo, Street, PostCode
