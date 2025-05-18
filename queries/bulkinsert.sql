BULK INSERT measurements_bulk
FROM 'C:\measurements.txt'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    BATCHSIZE = 100000,
    FIRSTROW = 1
);