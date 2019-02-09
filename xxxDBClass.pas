unit DBClass;

interface
//home
uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;
//school
{uses
  SysUtils, Classes, DB, ADODB; }

type
  TDataModule1 = class(TDataModule)
    ADOCheckersDBCnn: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOtblCheckerUser: TADOTable;
    ADOCommand1: TADOCommand;
    ADOtblCheckerQuestions: TADOTable;
    function OpenDB : boolean;
    function getLastErrorMessage : string;
    function getUserIdforlogin(LoginName,Password:string) : integer;
    function loadUserDetails(UserId:integer) : Boolean;
    function getUserId(): integer;
    function getUserType(): integer;
    function getLoginName(): string;
    function getForeName(): string;
    function getSurname(): string;
    function geteMail(): string;
    function getHouseId(): integer;
    function getNoOfGamesPlayed(): integer;
    function getLastGamePlayedDate(): TDateTime;
    function getLastLoginDate(): TDateTime;
    function getPoints(): integer;
    function getPassword(): string;
    function getUserIdforEditUsers(Username :string) : integer;
    procedure setUserDetails(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    procedure setNoOfGamesPlayed(GamesPlayed: integer);
    procedure setLastGamePlayedDate(LastGamePlayed: TDateTime);
    procedure setLastLoginDate(LastLoginDate: TDateTime);
    procedure setPoints(Points: integer);
    procedure addNewUser(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    function loadQuestionDetails(QuestionId:integer) : Boolean;
    function getQuestionText(): string;
    function getAnswer1Text(): string;
    function getAnswer2Text(): string;
    function getAnswer3Text(): string;
    function addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
    function editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId:integer) :boolean;
    procedure deleteQuestion(QuestionId: integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  errorMessage:string;
  mUserId:integer;
  UserType:integer;
  LoginName:String;
  ForeName:string;
  Password:string;
  Surname:string;
  eMail:string;
  HouseId:integer;
  NoOfGamesPlayed:integer;
  LastGamePlayedDate:Tdatetime;
  LastLoginDate:Tdatetime;
  Points:integer;
  mQuestionText:string;
  mQuestionId:integer;
  mAnswer1:string;
  mAnswer2:string;
  mAnswer3:string;
  mAnswer1Id:integer;
  mAnswer2Id:integer;
  mAnswer3Id:integer;
  mAnswer1Correct:boolean;
  mAnswer2Correct:boolean;
  mAnswer3Correct:boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


function TDataModule1.OpenDB() : boolean;
var
sPath:string;
begin
result:=true;
  try
    //sPath := ExtractFileDir(application.ExeName);
    DBClass.DataModule1.ADOCheckersDBCnn.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Joe\Documents\MyComputingProject\checkers.mdb;Persist Security Info=True';
    DBClass.DataModule1.ADOCheckersDBCnn.Connected:=true;
    except
    on E : Exception do
      begin
        errormessage:=E.Message;
        result:=false;
      end;
  end;


end;

function TDataModule1.getLastErrorMessage() : string;
begin
  result:=errormessage;
end;

function TDataModule1.getUserIdforlogin(LoginName,Password:string) : integer;
var
sSQL:string;
begin
sSQL:='SELECT UserId FROM CheckerUser WHERE LoginName = ''' + LoginName + ''' AND UserPassword = ''' + password + '''' ;
DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
DBClass.DataModule1.ADOQuery1.active:=true;
DBClass.DataModule1.ADOQuery1.first;
Result:=(DBClass.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
DBClass.DataModule1.ADOQuery1.active:=false;
end;

function TDataModule1.getUserIdforEditUsers(Username :string) : integer;
var
sSQL:string;
begin
sSQL:='SELECT UserId FROM CheckerUser WHERE LoginName = ''' + Username + '''';
DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
DBClass.DataModule1.ADOQuery1.active:=true;
DBClass.DataModule1.ADOQuery1.first;
Result:=(DBClass.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
DBClass.DataModule1.ADOQuery1.active:=false;
end;

function TDataModule1.loadUserDetails(UserId:integer) : Boolean;
var
sSQL:string;
begin
result:=true;
try

sSQL:='SELECT * FROM CheckerUser WHERE UserId = '+ inttostr(UserId);
sSQL:='SELECT CheckerUser.UserId, CheckerUser.UserType, '
+'CheckerUser.LoginName, CheckerUser.UserPassword, '
+'CheckerUser.ForeName, CheckerUser.Surname, CheckerUser.eMail, '
+'CheckerUser.HouseId, CheckerUser.NoOfGamesPlayed, '
+'CheckerUser.LastGamePlayedDate, CheckerUser.LastLoginDate, '
+'CheckerUser.Points, House.HouseName '
+'FROM House RIGHT JOIN CheckerUser ON House.HouseId = CheckerUser.HouseId '
+'WHERE UserId = '+ inttostr(UserId);
DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
DBClass.DataModule1.ADOQuery1.active:=true;
DBClass.DataModule1.ADOQuery1.first;
  mUserId:=(DBClass.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
  UserType:=(DBClass.DataModule1.ADOQuery1.FieldByName('UserType')).AsInteger ;
  LoginName:=(DBClass.DataModule1.ADOQuery1.FieldByName('LoginName')).AsString ;
  ForeName:=(DBClass.DataModule1.ADOQuery1.FieldByName('ForeName')).AsString ;
  Password:=(DBClass.DataModule1.ADOQuery1.FieldByName('UserPassword')).AsString ;
  Surname:=(DBClass.DataModule1.ADOQuery1.FieldByName('Surname')).AsString ;
  eMail:=(DBClass.DataModule1.ADOQuery1.FieldByName('eMail')).AsString ;
  HouseId:=(DBClass.DataModule1.ADOQuery1.FieldByName('HouseId')).AsInteger ;
  NoOfGamesPlayed:=(DBClass.DataModule1.ADOQuery1.FieldByName('NoOfGamesPlayed')).AsInteger ;
  LastGamePlayedDate:=(DBClass.DataModule1.ADOQuery1.FieldByName('LastGamePlayedDate')).AsDateTime ;
  LastLoginDate:=(DBClass.DataModule1.ADOQuery1.FieldByName('LastLoginDate')).AsDateTime ;
  Points:=(DBClass.DataModule1.ADOQuery1.FieldByName('Points')).AsInteger ;
DBClass.DataModule1.ADOQuery1.active:=false;
except
  on E : Exception do
    begin
      result:=false;
      errormessage:=E.Message;

    end;
end;
end;

function TDataModule1.loadQuestionDetails(QuestionId:integer) : Boolean;
var
sSQL:string;
begin
result:=true;
try
sSQL:='SELECT Qid, QuestionText '
+'FROM Question WHERE QId = '+ inttostr(QuestionId);
DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
DBClass.DataModule1.ADOQuery1.active:=true;
DBClass.DataModule1.ADOQuery1.first;
  mQuestionId:=(DBClass.DataModule1.ADOQuery1.FieldByName('QId')).AsInteger ;
  mQuestionText:=(DBClass.DataModule1.ADOQuery1.FieldByName('QuestionText').AsString);
DBClass.DataModule1.ADOQuery1.active:=false;

sSQL:='SELECT AnswerText, Aid, isCorrect FROM Answer WHERE QId = '+ inttostr(QuestionId)+ ' ORDER BY Aid ASC';
DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
DBClass.DataModule1.ADOQuery1.active:=true;
DBClass.DataModule1.ADOQuery1.first;
if (not DBClass.DataModule1.ADOQuery1.Eof) then
begin
mAnswer1:=(DBClass.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
mAnswer1Id:=(DBClass.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
mAnswer1Correct:=(DBClass.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean ;
end;
if (not DBClass.DataModule1.ADOQuery1.Eof) then
begin
DBClass.DataModule1.ADOQuery1.next;
mAnswer2:=(DBClass.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
mAnswer2Id:=(DBClass.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
mAnswer2Correct:=(DBClass.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean;
end;
if (not DBClass.DataModule1.ADOQuery1.Eof) then
begin
DBClass.DataModule1.ADOQuery1.next;
mAnswer3:=(DBClass.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
mAnswer3Id:=(DBClass.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
mAnswer3Correct:=(DBClass.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean;
end;
DBClass.DataModule1.ADOQuery1.active:=false;
except
  on E : Exception do
    begin
      result:=false;
      errormessage:=E.Message;

    end;
end;
end;

function TDataModule1.getPassword(): string;
begin
  Result:=Password;
end;

function TDataModule1.getUserId(): integer;
begin
  Result:=mUserId;
end;

function TDataModule1.getUserType(): integer;
begin
  Result:=UserType;
end;

function TDataModule1.getLoginName(): string;
begin
  Result:=LoginName;
end;

function TDataModule1.getForeName(): string;
begin
  Result:=ForeName;
end;

function TDataModule1.getSurname(): string;
begin
  Result:=Surname;
end;

function TDataModule1.geteMail(): string;
begin
  Result:=eMail;
end;

function TDataModule1.getHouseId(): integer;
begin
  Result:=HouseId;
end;

function TDataModule1.getNoOfGamesPlayed(): integer;
begin
  Result:=NoOfGamesPlayed;
end;

function TDataModule1.getLastGamePlayedDate(): TDateTime;
begin
  Result:=LastGamePlayedDate;
end;

function TDataModule1.getLastLoginDate(): TDateTime;
begin
  Result:=LastLoginDate;
end;

function TDataModule1.getPoints(): integer;
begin
  Result:=Points;
end;

procedure TDataModule1.setUserDetails(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
var
sSQL:string;
begin
  sSQL:='UPDATE CheckerUser SET Forename = ''' + Forename + '''';
  sSQL:=sSQL + ', UserPassword = ''' + sPassword + '''';
  sSQL:=sSQL + ', LoginName = ''' + LoginName + '''';
  sSQL:=sSQL + ', Surname = ''' + Surname + '''';
  sSQL:=sSQL + ', eMail = ''' + eMail + '''';
  sSQL:=sSQL + ', HouseId = ' + inttostr(HouseId);
  sSQL:=sSQL + ', UserType = ' + inttostr(UserType);
  sSQL:=sSQL + ' WHERE UserId = ' + inttostr(mUserId);

  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

end;

procedure TDataModule1.addNewUser(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
var
sSQL:string;
begin
  sSQL:='INSERT INTO CheckerUser (Forename, UserPassword, LoginName, Surname, eMail, HouseId, UserType) ';
  sSQL:=sSQL + 'VALUES (''' + Forename + ''',''' + sPassword + '''';
  sSQL:=sSQL + ',''' + LoginName + '''';
  sSQL:=sSQL + ',''' + Surname + '''';
  sSQL:=sSQL + ',''' + eMail + '''';
  sSQL:=sSQL + ',' + inttostr(HouseId);
  sSQL:=sSQL + ',' + inttostr(UserType) + ')';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

end;

function TDataModule1.addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
var
sSQL:string;
QuestionAlreadyExist:boolean;
begin
QuestionAlreadyExist:=false;
DBClass.DataModule1.ADOtblCheckerQuestions.first;
while not DBClass.DataModule1.ADOtblCheckerQuestions.eof do
begin
if DBClass.DataModule1.ADOtblCheckerQuestions['QuestionText'] = Question then
QuestionAlreadyExist:=true;
DBClass.DataModule1.ADOtblCheckerQuestions.Next;
end;
if QuestionAlreadyExist = false then
begin
  sSQL:='INSERT INTO Question (QuestionText) ';
  sSQL:=sSQL + 'VALUES (''' + Question + ''')';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='SELECT MAX(Qid) AS MAXQid FROM Question';
  DBClass.DataModule1.ADOQuery1.SQL.Text:=sSQL;
  DBClass.DataModule1.ADOQuery1.active:=true;
  DBClass.DataModule1.ADOQuery1.first;
  mQuestionId:=(DBClass.DataModule1.ADOQuery1.FieldByName('MAXQId')).AsInteger ;
  DBClass.DataModule1.ADOQuery1.active:=false;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(mQuestionId) + ', true)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(mQuestionId) + ', false)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(mQuestionId) + ', false)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;
end;
result:=QuestionAlreadyExist;
end;

procedure TDataModule1.deleteQuestion(QuestionId: integer);
var
sSQL:string;
begin
  sSQL:='DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;
  sSQL:='DELETE FROM Question WHERE Qid = ' + inttostr(QuestionId);
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;
end;

function TDataModule1.editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId: integer) :boolean;
var
sSQL:string;
QuestionAlreadyExist:boolean;
begin
QuestionAlreadyExist:=false;
DBClass.DataModule1.ADOquery1.sql.Text:='SELECT QuestionText FROM Question WHERE Qid <> '+inttostr(QuestionId);
DBClass.DataModule1.ADOquery1.active:=true;
DBClass.DataModule1.ADOquery1.first;
while not DBClass.DataModule1.ADOquery1.eof do
begin
if DBClass.DataModule1.ADOquery1['QuestionText'] = Question then
QuestionAlreadyExist:=true;
DBClass.DataModule1.ADOquery1.Next;
end;
DBClass.DataModule1.ADOquery1.active:=false;
if QuestionAlreadyExist = false then
begin
  sSQL:='UPDATE Question SET QuestionText = ''' + Question + '''';
  sSQL:=sSQL + 'Where Qid =' + inttostr(QuestionId);
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(QuestionId) + ', true)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(QuestionId) + ', false)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;

  sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
  sSQL:=sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(QuestionId) + ', false)';
  DBClass.DataModule1.ADOCommand1.CommandText := sSQL;
  DBClass.DataModule1.ADOCommand1.Execute;
end;
result:=QuestionAlreadyExist;
end;

procedure TDataModule1.setNoOfGamesPlayed(GamesPlayed: integer);
begin
DBClass.DataModule1.ADOQuery1.Active:=false;
end;

procedure TDataModule1.setLastGamePlayedDate(LastGamePlayed: TDateTime);
begin
DBClass.DataModule1.ADOQuery1.Active:=false;
end;

procedure TDataModule1.setLastLoginDate(LastLoginDate: TDateTime);
begin
DBClass.DataModule1.ADOQuery1.Active:=false;
end;

procedure TDataModule1.setPoints(Points: integer);
begin
DBClass.DataModule1.ADOQuery1.Active:=false;
end;

function TDataModule1.getQuestionText(): string;
begin
  Result:=mQuestionText;
end;

function TDataModule1.getAnswer1Text(): string;
begin
  Result:=mAnswer1;
end;

function TDataModule1.getAnswer2Text(): string;
begin
  Result:=mAnswer2;
end;

function TDataModule1.getAnswer3Text(): string;
begin
  Result:=mAnswer3;
end;

end.
