/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


:r .\SeedMVPConfigurationData.sql

:r .\SeedKnownStateEdgeCaseTestData.sql
:r .\SeedKnownStateFunctionalTestData.sql
:r .\SeedKnownStateBulkTestData.sql

-- connecting the players with teams for the current season
:r .\SeedKnownStateFunctionalTestData.Rosters.sql
-- connecting the players with teams to build historical data
:r .\SeedKnownStateBulkTestData.Rosters.sql