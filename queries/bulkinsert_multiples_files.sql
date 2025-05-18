USE ONE_BILLION_CHALLENGE;

DECLARE @TB_FILE AS TABLE (ID INT IDENTITY(1,1), FILE_TXT VARCHAR(255));

INSERT INTO	@TB_FILE
	(FILE_TXT)
VALUES
	('measurements_part_aa.txt'),
	('measurements_part_ab.txt'),
	('measurements_part_ac.txt'),
	('measurements_part_ad.txt'),
	('measurements_part_ae.txt'),
	('measurements_part_af.txt'),
	('measurements_part_ag.txt'),
	('measurements_part_ah.txt'),
	('measurements_part_ai.txt'),
	('measurements_part_aj.txt');

DECLARE
	@ID INT = 1,
	@MAX INT = (SELECT COUNT(*) FROM @TB_FILE),
	@FILE_TXT VARCHAR(255),
	@SQL NVARCHAR(MAX);

WHILE @ID <= @MAX
BEGIN

	SELECT @FILE_TXT = FILE_TXT FROM @TB_FILE WHERE ID = @ID;

	PRINT('Importando arquivo: '+@FILE_TXT+'...');

	SET @SQL = '
		BULK INSERT measurements_bulk_part
		FROM ''C:\'+@FILE_TXT+'''
		WITH (
			DATAFILETYPE = ''char'',
			CODEPAGE = ''65001'',
			FIELDTERMINATOR = '';'',
			ROWTERMINATOR = ''0x0a'',
			TABLOCK,
			FIRSTROW = 1
		);
	';

	EXEC sp_executesql @sql;

	SET @ID = @ID + 1;

END;