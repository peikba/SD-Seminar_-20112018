Set-ExecutionPolicy RemoteSigned
# Import the module for the  cmdLet
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\130\Service\NavAdminTool.ps1'
# Publish app to database
Publish-NAVApp -ServerInstance DynamicsNAV130W1 -Path "C:\Users\Peikba\Desktop\D. E. Veloper_SD Seminar_1.0.0.0.app" `
               -SkipVerification
# Install in tenant
Install-NAVApp -ServerInstance DynamicsNAV130W1 -Name "SD Seminar"
# Uninstall the app - Delete the data
Uninstall-NAVApp  -ServerInstance DynamicsNAV130W1 -Name "SD Seminar" # -DoNotSaveData 
# Remove the app from the database - but keep the tables
Unpublish-NAVApp -ServerInstance DynamicsNAV130W1 -Name "SD Seminar" 
# Synchronize the objekts in theh tenant
Sync-NAVTenant -ServerInstance DynamicsNAV130W1
# Remove the tables if the app is gone
Sync-NAVApp -ServerInstance DynamicsNAV130W1 -Name "SD Seminar" -Mode Clean

