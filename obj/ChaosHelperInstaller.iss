[Setup]
AppName=ChaosHelper Installer
AppVersion=1.0
AppPublisher=ChaosHelper Team
DefaultDirName=C:\Games\Decal Plugins\chaoshelper
DefaultGroupName=ChaosHelper
AllowNoIcons=yes
OutputDir=..\DEPLOY\
OutputBaseFilename=ChaosHelperSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
CreateAppDir=yes
DirExistsWarning=no
DisableDirPage=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\DEPLOY\ChaosHelper.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\DEPLOY\chaoshelper.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\DEPLOY\chaoshelper_config.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\DEPLOY\main.layout"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\DEPLOY\test_colored_config.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\DEPLOY\test_colored_layout.layout"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{cm:UninstallProgram,ChaosHelper}"; Filename: "{uninstallexe}"

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
end;