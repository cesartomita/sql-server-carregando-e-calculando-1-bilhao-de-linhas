CREATE NONCLUSTERED INDEX IDX_tation_name_in_measurements
ON measurements_oledb (station_name)
INCLUDE (measurements);