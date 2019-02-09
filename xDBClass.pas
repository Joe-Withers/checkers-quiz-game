unit DBClass;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
// here
  TCheckersDb = class


  private
    { Private declarations }
    { JPW - needs to be moved to private and calling code changed }
    ADOCheckersDBCnn: TADOConnection;
    ADOtblCheckerUser: TADOTable;
    ADOCommand1: TADOCommand;
    ADOtblCheckerQuestions: TADOTable;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;

    errorMessage:string;
    mUserId:integer;
    mUserType:integer;
    mLoginName:String;
    mForeName:string;
    mPassword:string;
    mSurname:string;
    meMail:string;
    mHouseId:integer;
    mNoOfGamesPlayed:integer;
    mLastGamePlayedDate:Tdatetime;
    mLastLoginDate:Tdatetime;
    mPoints:integer;
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

  public

    { Public declarations }
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
    function getUserIdforEditUsers(LoginName :string) : integer;
    procedure setUserDetails(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    procedure setNoOfGamesPlayed(GamesPlayed: integer);
    procedure setLastGamePlayedDate(LastGamePlayed: TDateTime);
    procedure setLastLoginDate(LastLoginDate: TDateTime);
    procedure setPoints(Points: integer);
    procedure addNewUser(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    procedure deleteUser(UserId: integer);
    function loadQuestionDetails(QuestionId:integer) : Boolean;
    function getQuestionText(): string;
    function getAnswer1Text(): string;
    function getAnswer2Text(): string;
    function getAnswer3Text(): string;
    function addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
    function editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId:integer) :boolean;
    procedure deleteQuestion(QuestionId: integer);
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TCheckersDb.OpenDB() : boolean;
begin
result := true;
  try
    ADOCheckersDBCnn.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Joe\Documents\MyComputingProject\checkers.mdb;Persist Security Info=True';
    ADOCheckersDBCnn.Connected := true;
    except
    on E : Exception do
      begin
        errormessage := E.Message;
        result := false;
      end;
  end;


end;

function TCheckersDb.getLastErrorMessage() : string;
begin
  result := errormessage;
end;

function TCheckersDb.getUserIdforlogin(LoginName,Password:string) : integer;
var
  sSQL:string;
begin
//  sSQL := 'SELECT UserId FROM CheckerUser WHERE LoginName = ''' + LoginName + ''' AND UserPassword = ''' + password + '''' ;
//  ADOQuery2.SQL.Text := sSQL;
//  ADOQuery2.active := true;
//  ADOQuery2.first;
//  Result := (ADOQuery1.FieldByName('UserId')).AsInteger ;
//  ADOQuery2.active := false;
Result := 4;
end;

function TCheckersDb.getUserIdforEditUsers(LoginName:string) : integer;
var
  sSQL:string;
begin
  sSQL := 'SELECT UserId FROM CheckerUser WHERE LoginName = ''' + LoginName + '''';
  ADOQuery1.SQL.Text := sSQL;
  ADOQuery1.active := true;
  ADOQuery1.first;
  Result := (ADOQuery1.FieldByName('UserId')).AsInteger ;
  ADOQuery1.active := false;
end;

function TCheckersDb.loadUserDetails(UserId:integer) : Boolean;
var
  sSQL:string;
begin
  result := true;

  try
    sSQL := 'SELECT * FROM CheckerUser WHERE UserId = '+ inttostr(UserId);
    sSQL := 'SELECT CheckerUser.UserId, CheckerUser.UserType, '
    +'CheckerUser.LoginName, CheckerUser.UserPassword, '
    +'CheckerUser.ForeName, CheckerUser.Surname, CheckerUser.eMail, '
    +'CheckerUser.HouseId, CheckerUser.NoOfGamesPlayed, '
    +'CheckerUser.LastGamePlayedDate, CheckerUser.LastLoginDate, '
    +'CheckerUser.Points, House.HouseName '
    +'FROM House RIGHT JOIN CheckerUser ON House.HouseId = CheckerUser.HouseId '
    +'WHERE UserId = '+ inttostr(UserId);

    //TCheckersDb.ADOQuery1.active := False;
    ADOQuery1.SQL.Text := sSQL;
    ADOQuery1.active := true;
    ADOQuery1.first;

    mUserId := (ADOQuery1.FieldByName('UserId')).AsInteger ;
    mUserType := (ADOQuery1.FieldByName('UserType')).AsInteger ;
    mLoginName := (ADOQuery1.FieldByName('LoginName')).AsString ;
    mForeName := (ADOQuery1.FieldByName('ForeName')).AsString ;
    mPassword := (ADOQuery1.FieldByName('UserPassword')).AsString ;
    mSurname := (ADOQuery1.FieldByName('Surname')).AsString ;
    meMail := (ADOQuery1.FieldByName('eMail')).AsString ;
    mHouseId := (ADOQuery1.FieldByName('HouseId')).AsInteger ;
    mNoOfGamesPlayed := (ADOQuery1.FieldByName('NoOfGamesPlayed')).AsInteger ;
    mLastGamePlayedDate := (ADOQuery1.FieldByName('LastGamePlayedDate')).AsDateTime ;
    mLastLoginDate := (ADOQuery1.FieldByName('LastLoginDate')).AsDateTime ;
    mPoints := (ADOQuery1.FieldByName('Points')).AsInteger ;
    ADOQuery1.active := false;
  except
    on E : Exception do
      begin
        result := false;
        errormessage := E.Message;
      end;
  end;
end;

function TCheckersDb.loadQuestionDetails(QuestionId:integer) : Boolean;
var
  sSQL:string;
begin
  result := true;

  try
    sSQL := 'SELECT Qid, QuestionText '
    +'FROM Question WHERE QId = '+ inttostr(QuestionId);
    ADOQuery1.SQL.Text := sSQL;
    ADOQuery1.active := true;
    ADOQuery1.first;
    mQuestionId := (ADOQuery1.FieldByName('QId')).AsInteger ;
    mQuestionText := (ADOQuery1.FieldByName('QuestionText').AsString);
    ADOQuery1.active := false;

    sSQL := 'SELECT AnswerText, Aid, isCorrect FROM Answer WHERE QId = '+ inttostr(QuestionId)+ ' ORDER BY Aid ASC';
    ADOQuery1.SQL.Text := sSQL;
    ADOQuery1.active := true;
    ADOQuery1.first;
    if (not ADOQuery1.Eof) then
      begin
        mAnswer1 := (ADOQuery1.FieldByName('AnswerText')).AsString;
        mAnswer1Id := (ADOQuery1.FieldByName('Aid')).AsInteger ;
        mAnswer1Correct := (ADOQuery1.FieldByName('isCorrect')).AsBoolean ;
      end;

    if (not ADOQuery1.Eof) then
      begin
        ADOQuery1.next;
        mAnswer2 := (ADOQuery1.FieldByName('AnswerText')).AsString;
        mAnswer2Id := (ADOQuery1.FieldByName('Aid')).AsInteger ;
        mAnswer2Correct := (ADOQuery1.FieldByName('isCorrect')).AsBoolean;
      end;

    if (not ADOQuery1.Eof) then
      begin
        ADOQuery1.next;
        mAnswer3 := (ADOQuery1.FieldByName('AnswerText')).AsString;
        mAnswer3Id := (ADOQuery1.FieldByName('Aid')).AsInteger ;
        mAnswer3Correct := (ADOQuery1.FieldByName('isCorrect')).AsBoolean;
      end;

    ADOQuery1.active := false;
  except
    on E : Exception do
      begin
        result := false;
        errormessage := E.Message;
      end;
  end;
end;

function TCheckersDb.getPassword(): string;
begin
  Result := mPassword;
end;

function TCheckersDb.getUserId(): integer;
begin
  Result := mUserId;
end;

function TCheckersDb.getUserType(): integer;
begin
  Result := mUserType;
end;

function TCheckersDb.getLoginName(): string;
begin
  Result := mLoginName;
end;

function TCheckersDb.getForeName(): string;
begin
  Result := mForeName;
end;

function TCheckersDb.getSurname(): string;
begin
  Result := mSurname;
end;

function TCheckersDb.geteMail(): string;
begin
  Result := meMail;
end;

function TCheckersDb.getHouseId(): integer;
begin
  Result := mHouseId;
end;

function TCheckersDb.getNoOfGamesPlayed(): integer;
begin
  Result := mNoOfGamesPlayed;
end;

function TCheckersDb.getLastGamePlayedDate(): TDateTime;
begin
  Result := mLastGamePlayedDate;
end;

function TCheckersDb.getLastLoginDate(): TDateTime;
begin
  Result := mLastLoginDate;
end;

function TCheckersDb.getPoints(): integer;
begin
  Result := mPoints;
end;

procedure TCheckersDb.setUserDetails(sPassword, Forename, LoginName, surname, eMail: string; UserType, HouseId :integer);
var
  sSQL:string;
begin
  sSQL := 'UPDATE CheckerUser SET Forename = ''' + Forename + '''';
  sSQL := sSQL + ', UserPassword = ''' + sPassword + '''';
  sSQL := sSQL + ', LoginName = ''' + LoginName + '''';
  sSQL := sSQL + ', Surname = ''' + Surname + '''';
  sSQL := sSQL + ', eMail = ''' + eMail + '''';
  sSQL := sSQL + ', HouseId = ' + inttostr(HouseId);
  sSQL := sSQL + ', UserType = ' + inttostr(UserType);
  sSQL := sSQL + ' WHERE UserId = ' + inttostr(mUserId);

  ADOCommand1.CommandText  :=  sSQL;
  ADOCommand1.Execute;
end;

procedure TCheckersDb.addNewUser(sPassword, Forename, LoginName, surname, eMail: string; UserType, HouseId :integer);
var
  sSQL:string;
begin
  sSQL := 'INSERT INTO CheckerUser (Forename, UserPassword, LoginName, Surname, eMail, HouseId, UserType) ';
  sSQL := sSQL + 'VALUES (''' + Forename + ''',''' + sPassword + '''';
  sSQL := sSQL + ',''' + LoginName + '''';
  sSQL := sSQL + ',''' + Surname + '''';
  sSQL := sSQL + ',''' + eMail + '''';
  sSQL := sSQL + ',' + inttostr(HouseId);
  sSQL := sSQL + ',' + inttostr(UserType) + ')';
  ADOCommand1.CommandText  :=  sSQL;
  ADOCommand1.Execute;
end;

function TCheckersDb.addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
var
  sSQL:string;
  QuestionAlreadyExist:boolean;
begin
  QuestionAlreadyExist := false;
  ADOtblCheckerQuestions.first;
  while not ADOtblCheckerQuestions.eof do
    begin
      if ADOtblCheckerQuestions['QuestionText'] = Question then
        QuestionAlreadyExist := true;

      ADOtblCheckerQuestions.Next;
    end;

  if QuestionAlreadyExist = false then
  begin
    sSQL := 'INSERT INTO Question (QuestionText) ';
    sSQL := sSQL + 'VALUES (''' + Question + ''')';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'SELECT MAX(Qid) AS MAXQid FROM Question';
    ADOQuery1.SQL.Text := sSQL;
    ADOQuery1.active := true;
    ADOQuery1.first;
    mQuestionId := (ADOQuery1.FieldByName('MAXQId')).AsInteger ;
    ADOQuery1.active := false;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(mQuestionId) + ', true)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(mQuestionId) + ', false)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(mQuestionId) + ', false)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;
  end;
  result := QuestionAlreadyExist;
end;

procedure TCheckersDb.deleteUser(UserId: integer);
var
  sSQL:string;
begin
  sSQL := 'DELETE FROM CheckerUser WHERE UserId = ' + inttostr(UserId);
  ADOCommand1.CommandText  :=  sSQL;
  ADOCommand1.Execute;
end;

procedure TCheckersDb.deleteQuestion(QuestionId: integer);
var
  sSQL:string;
begin
  sSQL := 'DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
  ADOCommand1.CommandText  :=  sSQL;
  ADOCommand1.Execute;
  sSQL := 'DELETE FROM Question WHERE Qid = ' + inttostr(QuestionId);
  ADOCommand1.CommandText  :=  sSQL;
  ADOCommand1.Execute;
end;

function TCheckersDb.editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId: integer) :boolean;
var
  sSQL:string;
  QuestionAlreadyExist:boolean;
begin
  QuestionAlreadyExist := false;
  ADOQuery1.sql.Text := 'SELECT QuestionText FROM Question WHERE Qid <> '+inttostr(QuestionId);
  ADOQuery1.active := true;
  ADOQuery1.first;
  while not ADOQuery1.eof do
  begin
  if ADOQuery1['QuestionText'] = Question then
    QuestionAlreadyExist := true;
    ADOQuery1.Next;
  end;
  ADOQuery1.active := false;

  if QuestionAlreadyExist = false then
  begin
    sSQL := 'UPDATE Question SET QuestionText = ''' + Question + '''';
    sSQL := sSQL + 'Where Qid =' + inttostr(QuestionId);
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(QuestionId) + ', true)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(QuestionId) + ', false)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;

    sSQL := 'INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL := sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(QuestionId) + ', false)';
    ADOCommand1.CommandText  :=  sSQL;
    ADOCommand1.Execute;
  end;
  result := QuestionAlreadyExist;
end;

procedure TCheckersDb.setNoOfGamesPlayed(GamesPlayed: integer);
begin
  ADOQuery1.Active := false;
end;

procedure TCheckersDb.setLastGamePlayedDate(LastGamePlayed: TDateTime);
begin
  ADOQuery1.Active := false;
end;

procedure TCheckersDb.setLastLoginDate(LastLoginDate: TDateTime);
begin
  ADOQuery1.Active := false;
end;

procedure TCheckersDb.setPoints(Points: integer);
begin
  ADOQuery1.Active := false;
end;

function TCheckersDb.getQuestionText(): string;
begin
  Result := mQuestionText;
end;

function TCheckersDb.getAnswer1Text(): string;
begin
  Result := mAnswer1;
end;

function TCheckersDb.getAnswer2Text(): string;
begin
  Result := mAnswer2;
end;

function TCheckersDb.getAnswer3Text(): string;
begin
  Result := mAnswer3;
end;

end.
