. (Join-Path $PSScriptRoot ExtractHL7script.ps1)

#begin by removing existing data
$deletetables = "-- Delete existing HL7 mappings
DELETE HL7_FIELD_MAPPINGS
DELETE HL7_GROUP
DELETE HL7_LINKEDTABLES
DELETE HL7_MAPS
DELETE HL7_MAPTABLE
DELETE HL7_MESSAGES
DELETE HL7_MESSAGE_EVENTS
DELETE HL7_SEGMENT
DELETE HL7_SEGMENTTABLES
"

$deletetables | Out-File -FilePath a.sql -Force

Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_FIELD_MAPPINGS" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_GROUP" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_LINKEDTABLES" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_MAPS" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_MAPTABLE" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_MESSAGES" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_MESSAGE_EVENTS" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_SEGMENT" | out-file -Append -FilePath a.sql 
Convert-QueryDataToSQL -ServerInstance benvm -Database NSW_LHD_BASEDB_V1 -Query "select * from dbo.HL7_SEGMENTTABLES" | out-file -Append -FilePath a.sql 

