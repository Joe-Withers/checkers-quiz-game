program CheckersComp;

uses
  Forms,
  checkersMain in 'checkersMain.pas' {frmCheckers},
  CheckersClass in 'CheckersClass.pas',
  theGameClass in 'theGameClass.pas',
  LogIn in 'LogIn.pas' {frmLogin},
  Users in 'Users.pas' {frmUsers},
  GsetUps in 'GsetUps.pas',
  Questions in 'Questions.pas' {frmQuestions},
  AskQuestion in 'AskQuestion.pas' {frmAskQuestion},
  ProjDb in 'ProjDb.pas' {DataModule1: TDataModule},
  UserReport in 'UserReport.pas' {frmUserReport},
  HouseReport in 'HouseReport.pas' {frmHouseReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCheckers, frmCheckers);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmUserReport, frmUserReport);
  Application.CreateForm(TfrmHouseReport, frmHouseReport);
  //Application.CreateForm(TCheckersDb, TCheckersDb);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmUsers, frmUsers);
  Application.CreateForm(TfrmQuestions, frmQuestions);
  Application.CreateForm(TfrmAskQuestion, frmAskQuestion);
  Application.Run;
end.
