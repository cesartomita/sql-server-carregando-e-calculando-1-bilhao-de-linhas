bcp ONE_BILLION_CHALLENGE.dbo.measurements_bcp IN "C:\measurements.txt" ^
-S DESKTOP-DA9MA40 -U <seu-usuario> -P <sua-senha> ^
-C 65001 -c -t ";" -r "0x0a" -b 100000 ^
-e "C:\bcp_errors.txt" -a 65535 -m 1000 ^