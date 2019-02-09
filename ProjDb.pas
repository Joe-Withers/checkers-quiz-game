unit ProjDb;
// ***********************************************
// description: This is a data module which contains all of the code that links
// to the databse.
// last modified: 2/jan/2014
// joe withers
// ***********************************************

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB , Vcl.Forms;

{uses
  SysUtils, Classes, ADODB, DB , Forms;}

type
  TDataModule1 = class(TDataModule)
  ADOCheckersDBCnn: TADOConnection;
  ADOQuery1: TADOQuery;
  ADOtblCheckerUser: TADOTable;
  ADOCommand1: TADOCommand;
  ADOtblCheckerQuestions: TADOTable;
    ADOConnectionExcel: TADOConnection;
    ADOTableUserReport: TADOTable;
    ADOQuery2: TADOQuery;

// creats an array of a record.
type
  QuestionDetail = record
  QId:  integer;
  QText: string;
end;
  tArrQuestion = array of QuestionDetail;

  // creats an array of a record.
type
  UserDetail = record
  UId:  integer;
  LoginName: string;
  UserName: string;
end;
  tArrUser = array of UserDetail;

  // creats a record.
type
  TPieSliceSize = record
  Davis:  integer;
  Curnock: integer;
  Evers: integer;
  Patterson: integer;
end;

  private
    { Private declarations }
  public
    { Public declarations }
    function OpenDB() : Boolean;
    function getLastErrorMessage() : string;
    function getUserIdforlogin(LoginName,Password:string) : integer;
    function getUserIdforUsername(Username :string) : integer;
    function loadUserDetails(UserId:integer) : Boolean;
    function getUserId(): integer;
    function getUserType(): integer;
    function getLoginName(): string;
    function getForeName(): string;
    function getSurname(): string;
    function geteMail(): string;
    function getHouseName(): string;
    function getHouseId(): integer;
    function getNoOfGamesPlayed(): integer;
    function getLastGamePlayedDate(): TDateTime;
    function getLastLoginDate(): TDateTime;
    function getPoints(): integer;
    function getPassword(): string;
    procedure setUserDetails(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    procedure setUserGameDetails(GamesPlayed,points,Uid: integer; LastGameDate: TDateTime);
    procedure addNewUser(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
    function loadQuestionDetails(QuestionId:integer) : Boolean;
    function getQuestionText(): string;
    function getAnswer1Text(): string;
    function getAnswer2Text(): string;
    function getAnswer3Text(): string;
    function addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
    function editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId:integer) :boolean;
    procedure deleteQuestion(QuestionId: integer);
    procedure deleteUser(UserId: integer);
    function getQuestionList(): tArrQuestion;
    function getUserList(): tArrUser;
    function getHowManyQuestions(): integer;
    function getNthQuestionId(n:integer): integer;
    procedure setUserId(UserId:integer);
    function getUserIdFromEmail(Email:string) : integer;
    function DoesCheckersDatabaseExist() : boolean;
    function DoesBlankDatabaseExist() : boolean;
    function DeleteCheckersDatabase() : boolean;
    procedure CopyFile (fromFile, ToFile : string);
    function CreateTableUsers() : boolean;
    function CreateTableQuestions() : boolean;
    function CreateTableAnswers() : boolean;
    function CreateTableHouse() : boolean;
    function getCheckersDBname():string;
    function getBlankDBname():string;
    function closeDB() : boolean;
    function DoesUsernameExist(Username : string): boolean;
    procedure UserReportTable(OrderByField:string);
    procedure HouseReportTable();
    function getPieSliceSize() : TPieSliceSize;
    procedure setLastLoginDate(Uid : integer; LastLoginDate : TDateTime);
    procedure setQuestionCorrect(Uid:integer);
    procedure setQuestioninCorrect(Uid:integer);
  end;

var
  DataModule1: TDataModule1;
  mErrorMessage:string;
  mUserId:integer;
  mUserType:integer;
  mLoginName:String;
  mForeName:string;
  mPassword:string;
  mSurname:string;
  meMail:string;
  mHouseId:integer;
  mHouseName:string;
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
  mOrderByField:string;

    implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdataModule1.setQuestionCorrect(Uid:integer);
// ***********************************************
// description: when this is called it increments the number of Questions correctly
// answered stored in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
// This SQL code increments the QuestionsCorrect field in the database.
sCmd:='UPDATE CheckerUser SET QuestionsCorrect = (QuestionsCorrect+1) WHERE Userid = '+inttostr(Uid);
  ProjDb.DataModule1.ADOCommand1.CommandText := sCmd;
  // executes the SQL code using an ADO command.
  ProjDb.DataModule1.ADOCommand1.Execute;
end;

procedure TdataModule1.setQuestioninCorrect(Uid:integer);
// ***********************************************
// description: when this is called it increments the number of Questions Incorrectly
// answered stored in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
// This SQL code increments the QuestionsIncorrect field in the database.
sCmd:='UPDATE CheckerUser SET QuestionsinCorrect = (QuestionsinCorrect+1) WHERE Userid = '+inttostr(Uid);
  ProjDb.DataModule1.ADOCommand1.CommandText := sCmd;
  // executes the SQL code using an ADO command.
  ProjDb.DataModule1.ADOCommand1.Execute;
end;

function TdataModule1.getPieSliceSize() : TPieSliceSize;
// ***********************************************
// description: This function gets the total point each house has and calculates
// the degree's in a pie chart that will be and passes them out as a record of data.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
CurnockTOT,DavisTOT,EversTOT,PattersonTOT: integer;
CurnockDEG,DavisDEG,EversDEG,PattersonDEG:integer;
begin
// sets an ADO queries SQL text to SQL code which gives back the total points from
// a specific school house.
sSQL:='SELECT SUM(CheckerUser.points) AS Totalpoints FROM CheckerUser WHERE UserType = 2 AND HouseId = 1;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
// sets the variable CurnockTOT to the field 'Totalpoints' from the ADO query.
    CurnockTOT:=ProjDb.DataModule1.ADOQuery1.FieldByName('Totalpoints').AsInteger;

// sets an ADO queries SQL text to SQL code which gives back the total points from
// a specific school house.
sSQL:='SELECT SUM(CheckerUser.points) AS Totalpoints FROM CheckerUser WHERE UserType = 2 AND HouseId = 2;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
// sets the variable DavisTOT to the field 'Totalpoints' from the ADO query.
    DavisTOT:=ProjDb.DataModule1.ADOQuery1.FieldByName('Totalpoints').AsInteger;

// sets an ADO queries SQL text to SQL code which gives back the total points from
// a specific school house.
sSQL:='SELECT SUM(CheckerUser.points) AS Totalpoints FROM CheckerUser WHERE UserType = 2 AND HouseId = 3;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
// sets the variable EversTOT to the field 'Totalpoints' from the ADO query.
    EversTOT:=ProjDb.DataModule1.ADOQuery1.FieldByName('Totalpoints').AsInteger;

// sets an ADO queries SQL text to SQL code which gives back the total points from
// a specific school house.
sSQL:='SELECT SUM(CheckerUser.points) AS Totalpoints FROM CheckerUser WHERE UserType = 2 AND HouseId = 4;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
// sets the variable pattersonTOT to the field 'Totalpoints' from the ADO query.
    pattersonTOT:=ProjDb.DataModule1.ADOQuery1.FieldByName('Totalpoints').AsInteger;

// finds the degree's designateed to each house in a pie chart by taking the
// the total score of one house and dividing by the total score of all the
// houses, to get a fraction out of 1, and then multiplying by 360 (the degree's
// in a circle).
//Degree's Curnock
CurnockDEG:=((CurnockTOT*360) div (CurnockTOT+DavisTOT+EversTOT+PattersonTOT));
//Degree's Davis
DavisDEG:=((DavisTOT*360) div (CurnockTOT+DavisTOT+EversTOT+PattersonTOT));
//Degree's Evers
EversDEG:=((EversTOT*360) div (CurnockTOT+DavisTOT+EversTOT+PattersonTOT));
//Degree's Patterson
PattersonDEG:=((PattersonTOT*360) div (CurnockTOT+DavisTOT+EversTOT+PattersonTOT));

// sets the results.
result.Curnock:=CurnockDEG;
result.Davis:=DavisDEG;
result.Evers:=EversDEG;
result.Patterson:=PattersonDEG;
end;

procedure TdataModule1.HouseReportTable();
// ***********************************************
// description: changes the SQL text to show the correct data for the house
// report table
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// sets an ADO queries SQL text to SQL code which gives back the total points from
// a specific school house and the house name.
  sSQL:='SELECT House.HouseName, SUM(CheckerUser.points) AS ''Total points'' FROM CheckerUser, house WHERE CheckerUser.HouseID=House.HouseID AND CheckerUser.UserType = 2 GROUP BY House.HouseName;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
end;


procedure TdataModule1.UserReportTable(OrderByField:string);
// ***********************************************
// description: changes the SQL text to show the correct data for the User
// report table
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// sets the local variable mOrderByField to the data passed in.]to the procedure.
mOrderByField:=OrderByField;
// sets an ADO queries SQL text to SQL code which gives back the LoginName,
// Forename, Surname, Points, NoOfGamesPlayed, AverageScorePerGame
// and QuestionsCorrectPercentage and orders them by the variable mOrderByField.
sSQL:='SELECT LoginName, Forename, Surname, Points, NoOfGamesPlayed, ROUND(Points / NoOfGamesPlayed) ';
sSQL:=sSQL + 'AS AverageScorePerGame, ROUND((QuestionsCorrect * 100) / (QuestionsCorrect + QuestionsIncorrect)) AS QuestionsCorrectPercentage FROM CheckerUser WHERE UserType = 2 AND ((QuestionsCorrect + QuestionsinCorrect) > 0) ORDER BY '+OrderByField+' DESC;';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
end;

function TdataModule1.DoesUsernameExist(Username : string): boolean;
// ***********************************************
// description: This function compares the username passed into it to all the
// other usernames to check if it already exists.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
UserID:integer;
begin
// sets the result to false.
result:=false;
// sets the user ID to 0.
    UserId:=0;
    try
    // changes the SQL text of the query to give back any users with the passed
    //in username.
    sSQL:='SELECT UserId FROM CheckerUser WHERE LoginName = '''+Username+'''';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
    ProjDb.DataModule1.ADOQuery1.first;
    // gets the user ID for the username.NOTE: the user ID will still be 0 if a
    // user with the same username was not found.
    UserId:=ProjDb.DataModule1.ADOQuery1.FieldByName('UserId').AsInteger;
    if UserId>0 then
    // if the user ID is greater than 0 then a user with that username exists
    // and result = true.
    result:=true
    else
    // if the user ID is not greater than 0 then a user with that username
    // does not exist and result = false.
    result:=false;
    except on E : exception do
    begin
    // if there is an error then the user doesnt exist so result = false.
      Result:=false;
    end;
    end;
end;

function TDataModule1.getCheckersDBname():string;
// ***********************************************
// description: gets the path name of the checkers database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sFilePath,filename:string;
begin
// the local variable is set to the file path of the application
    sFilePath :=  ExtractFilePath(Application.ExeName);
    // gets rid of part of the file path
    sFilePath :=  StringReplace(sFilePath, '\win32\debug', '', [rfReplaceAll, rfIgnoreCase]);
    // adds the name of the database to the end to give the whole file path of the
    // database.
    filename:=sFilePath+'checkers.mdb';
    result:=filename;
end;

function TDataModule1.getBlankDBname():string;
// ***********************************************
// description: gets the path name of the checkers database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sFilePath,filename:string;
begin
// the local variable is set to the file path of the application.
    sFilePath :=  ExtractFilePath(Application.ExeName);
    // gets rid of part of the file path.
    sFilePath :=  StringReplace(sFilePath, '\win32\debug', '', [rfReplaceAll, rfIgnoreCase]);
    // adds the name of the database to the end to give the whole file path of the
    // database.
    filename:=sFilePath+'Blank.mdb';
    result:=filename;
end;

procedure TDataModule1.setUserId(UserId:integer);
// ***********************************************
// description: sets the variable mUserId to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mUserId:=UserId;
end;

function TDataModule1.getQuestionList() : tArrQuestion;
// ***********************************************
// description: gets an array of all the questions text and ID.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
QIext:string;
iCnt,jCnt:integer;
begin
  try
  // changes the SQL of a query to show all the questions text and ID ordered
  // by the QID.
    sSQL:='SELECT QId, QuestionText FROM Question ORDER BY QId ASC';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
    // startes at the first one.
    ProjDb.DataModule1.ADOQuery1.first;
    jCnt:=0;
    // uses a while loop to find how many questions there are stored in the database
    // and makes jCnt equal to it.
        while not ProjDb.DataModule1.ADOQuery1.Eof do
    begin
      Inc(jCnt);
      ProjDb.DataModule1.ADOQuery1.Next;
    end;
    // sets the length of the array of results to the amount of questions there are.
    SetLength(result, jCnt);
    iCnt := 0;
    // goes back to the first question
    ProjDb.DataModule1.ADOQuery1.first;
    while not ProjDb.DataModule1.ADOQuery1.Eof do
    begin
    //for each question it sets a result as its question text and ID.
      result[iCnt].QId := (ProjDb.DataModule1.ADOQuery1.FieldByName('QId')).AsInteger ;
      result[iCnt].QText := (ProjDb.DataModule1.ADOQuery1.FieldByName('QuestionText')).AsString;
      Inc(iCnt);
      ProjDb.DataModule1.ADOQuery1.Next;
    end;
    ProjDb.DataModule1.ADOQuery1.active:=false;
  except
    on E : Exception do
      begin
      // if there is an error it sets the variable mErrormessage to the error message.
        mErrormessage:=E.Message;
      end;

  end;
end;

function TDataModule1.getUserList() : tArrUser;
// ***********************************************
// description: gets an array of all the Users information.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
LoginName:string;
UserName:string;
jCnt,iCnt:integer;
begin
  try
  // sets the SQL textto get all the users UserId, LoginName, ForeName and Surname
  // where they are not a master account.
    sSQL:='SELECT UserId, LoginName, ForeName, Surname FROM CheckerUser WHERE UserType <> 0 ORDER BY LoginName ASC';
    ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
    ProjDb.DataModule1.ADOQuery1.active:=true;
    ProjDb.DataModule1.ADOQuery1.first;
    jCnt:=0;
    // uses a while loop to find how many users there are stored in the database
    // and makes jCnt equal to it.
    while not ProjDb.DataModule1.ADOQuery1.Eof do
    begin
      Inc(jCnt);
      ProjDb.DataModule1.ADOQuery1.Next;
    end;
    // sets the length of the array of results to the amount of questions there are.
    setlength(result ,jcnt);
    iCnt := 0;
    // goes back to the first question
    ProjDb.DataModule1.ADOQuery1.first;
    while not ProjDb.DataModule1.ADOQuery1.Eof do
    begin
    //for each user it sets a result as its UserId, LoginName, ForeName and Surname.
      result[iCnt].UId := (ProjDb.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
      result[iCnt].LoginName := (ProjDb.DataModule1.ADOQuery1.FieldByName('LoginName')).AsString;
      result[iCnt].UserName := (ProjDb.DataModule1.ADOQuery1.FieldByName('ForeName')).AsString;
      result[iCnt].UserName := result[iCnt].UserName + ' ' + (ProjDb.DataModule1.ADOQuery1.FieldByName('Surname')).AsString;
      Inc(iCnt);
      ProjDb.DataModule1.ADOQuery1.Next;
    end;
    ProjDb.DataModule1.ADOQuery1.active:=false;
  except
    on E : Exception do
      begin
      // if there is an error it sets the variable mErrormessage to the error message.
        mErrormessage:=E.Message;
      end;

  end;
end;

function TDataModule1.OpenDB() : boolean;
// ***********************************************
// description: sets up a connection tothe database and opens it.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  sFilePath:string;
  sConnection:string;
begin
  try
    Result:=True;
    // sets the connection string for ADO command.
    sConnection := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=' + getCheckersDBname+ ';Persist Security Info=True';
    ProjDb.DataModule1.ADOCheckersDBCnn.Close;
    ProjDb.DataModule1.ADOCheckersDBCnn.LoginPrompt := False;
    ProjDb.DataModule1.ADOCheckersDBCnn.ConnectionString := sConnection;
    if (NOT ProjDb.DataModule1.ADOCheckersDBCnn.Connected) then
      ProjDb.DataModule1.ADOCheckersDBCnn.Open;
    Result:=True;
    except on E:Exception do
        begin
        // if an error occurs(the database does not connect, the result = false.
          Result:=False;
        end;
    end;
end;

function TDataModule1.closeDB():boolean;
// ***********************************************
// description: closes the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
result:=true;
try
ProjDb.DataModule1.ADOCheckersDBCnn.Close;
except
on E : exception do
begin
// if there is an error closing the database the result = false.
  result:=false;
end;

end;
end;

function TDataModule1.getLastErrorMessage() : string;
// ***********************************************
// description: passes out the last error message as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result:=mErrormessage;
end;

function TDataModule1.getUserIdforlogin(LoginName,Password:string) : integer;
// ***********************************************
// description: gets the user ID for the user with the username and password
// passed into the function.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// sets the SQL text to select the user ID for the username password combo.
sSQL:='SELECT UserId FROM CheckerUser WHERE LoginName = ''' + LoginName + ''' AND UserPassword = ''' + password + '''' ;
ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
ProjDb.DataModule1.ADOQuery1.active:=true;
ProjDb.DataModule1.ADOQuery1.first;
// sets the result to the userID.
Result:=(ProjDb.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
ProjDb.DataModule1.ADOQuery1.active:=false;
end;

function TDataModule1.getUserIdforUsername(Username :string) : integer;
// ***********************************************
// description: gets the userID from a users username.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// sets the SQL text to select the user ID for the username.
sSQL:='SELECT UserId FROM CheckerUser WHERE LoginName = ''' + Username + '''';
ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
ProjDb.DataModule1.ADOQuery1.active:=true;
ProjDb.DataModule1.ADOQuery1.first;
// sets the result to the userID.
Result:=(ProjDb.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
ProjDb.DataModule1.ADOQuery1.active:=false;
end;

function TDataModule1.loadUserDetails(UserId:integer) : Boolean;
// ***********************************************
// description: makes some local variables values become the users details
// assosiated with the user ID passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
result:=true;
try
// sets the SQL text to select the user details frnthe user with the User ID passed
// into the function.
sSQL:='SELECT CheckerUser.UserId, CheckerUser.UserType, '
+'CheckerUser.LoginName, CheckerUser.UserPassword, '
+'CheckerUser.ForeName, CheckerUser.Surname, CheckerUser.eMail, '
+'CheckerUser.HouseId, CheckerUser.NoOfGamesPlayed, '
+'CheckerUser.LastGamePlayedDate, CheckerUser.LastLoginDate, '
+'CheckerUser.Points, House.HouseName '
+'FROM House RIGHT JOIN CheckerUser ON House.HouseId = CheckerUser.HouseId '
+'WHERE UserId = '+ inttostr(UserId);
ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
ProjDb.DataModule1.ADOQuery1.active:=true;
ProjDb.DataModule1.ADOQuery1.first;
// sets the local (to the module) variables to there corresponding values from
// the database
  mUserId:=(ProjDb.DataModule1.ADOQuery1.FieldByName('UserId')).AsInteger ;
  mUserType:=(ProjDb.DataModule1.ADOQuery1.FieldByName('UserType')).AsInteger ;
  mLoginName:=(ProjDb.DataModule1.ADOQuery1.FieldByName('LoginName')).AsString ;
  mForeName:=(ProjDb.DataModule1.ADOQuery1.FieldByName('ForeName')).AsString ;
  mPassword:=(ProjDb.DataModule1.ADOQuery1.FieldByName('UserPassword')).AsString ;
  mSurname:=(ProjDb.DataModule1.ADOQuery1.FieldByName('Surname')).AsString ;
  meMail:=(ProjDb.DataModule1.ADOQuery1.FieldByName('eMail')).AsString ;
  mHouseId:=(ProjDb.DataModule1.ADOQuery1.FieldByName('HouseId')).AsInteger ;
  mHouseName:=(ProjDb.DataModule1.ADOQuery1.FieldByName('HouseName')).AsString ;
  mNoOfGamesPlayed:=(ProjDb.DataModule1.ADOQuery1.FieldByName('NoOfGamesPlayed')).AsInteger ;
  mLastGamePlayedDate:=(ProjDb.DataModule1.ADOQuery1.FieldByName('LastGamePlayedDate')).AsDateTime ;
  mLastLoginDate:=(ProjDb.DataModule1.ADOQuery1.FieldByName('LastLoginDate')).AsDateTime ;
  mPoints:=(ProjDb.DataModule1.ADOQuery1.FieldByName('Points')).AsInteger ;
  ProjDb.DataModule1.ADOQuery1.active:=false;
except
  on E : Exception do
    begin
    // if theres an error the result = false and the local variable mErrormessage
    // becomes the error message.
      result:=false;
      mErrormessage:=E.Message;
    end;
end;
end;


function TDataModule1.loadQuestionDetails(QuestionId:integer) : Boolean;
// ***********************************************
// description: makes some local variables become the question and answers text
// and question and answers ID's assosiated with the question ID passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
result:=true;
try
// sets the SQL text to select the Question ID and Question text assosiated with the
// Question ID.
sSQL:='SELECT Qid, QuestionText '
+'FROM Question WHERE QId = '+ inttostr(QuestionId);
ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
ProjDb.DataModule1.ADOQuery1.active:=true;
ProjDb.DataModule1.ADOQuery1.first;
// sets the local variable to the relevant fields.
  mQuestionId:=(ProjDb.DataModule1.ADOQuery1.FieldByName('QId')).AsInteger ;
  mQuestionText:=(ProjDb.DataModule1.ADOQuery1.FieldByName('QuestionText').AsString);
ProjDb.DataModule1.ADOQuery1.active:=false;
// sets the SQL text to select all the answers text, ID and IsCorrect fields
// assosiated with the question ID.
sSQL:='SELECT AnswerText, Aid, isCorrect FROM Answer WHERE QId = '+ inttostr(QuestionId)+ ' ORDER BY Aid ASC';
ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
ProjDb.DataModule1.ADOQuery1.active:=true;
// selects the first one.
ProjDb.DataModule1.ADOQuery1.first;
// if it isnt already the end of file
if (not ProjDb.DataModule1.ADOQuery1.Eof) then
begin
// sets the local variable to the relevant fields for the first answer.
mAnswer1:=(ProjDb.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
mAnswer1Id:=(ProjDb.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
mAnswer1Correct:=(ProjDb.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean ;
end;
// if it still isnt the end of file
if (not ProjDb.DataModule1.ADOQuery1.Eof) then
begin
// goes to the next answer.
  ProjDb.DataModule1.ADOQuery1.next;
  // sets the local variable to the relevant fields for the second answer.
  mAnswer2:=(ProjDb.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
  mAnswer2Id:=(ProjDb.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
  mAnswer2Correct:=(ProjDb.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean;
end;
// if it still isnt the end of file
if (not ProjDb.DataModule1.ADOQuery1.Eof) then
  begin
  // goes to the next answer.
    ProjDb.DataModule1.ADOQuery1.next;
    // sets the local variable to the relevant fields for the third answer.
    mAnswer3:=(ProjDb.DataModule1.ADOQuery1.FieldByName('AnswerText')).AsString;
    mAnswer3Id:=(ProjDb.DataModule1.ADOQuery1.FieldByName('Aid')).AsInteger ;
    mAnswer3Correct:=(ProjDb.DataModule1.ADOQuery1.FieldByName('isCorrect')).AsBoolean;
  end;

  ProjDb.DataModule1.ADOQuery1.active:=false;

  except
  on E : Exception do
    begin
    // if theres an error the result = false and the local variable mErrormessage
    // becomes the error message.
      result:=false;
      mErrormessage:=E.Message;
    end;
end;
end;

function TDataModule1.getPassword(): string;
// ***********************************************
// description: a function to get the last user details loaded password.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mPassword;
end;

function TDataModule1.getUserId(): integer;
// ***********************************************
// description: a function to get the last user details loaded User ID.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mUserId;
end;

function TDataModule1.getUserType(): integer;
// ***********************************************
// description: a function to get the last user details loaded User Type.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mUserType;
end;

function TDataModule1.getLoginName(): string;
// ***********************************************
// description: a function to get the last user details loaded Login Name (Username).
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mLoginName;
end;

function TDataModule1.getForeName(): string;
// ***********************************************
// description: a function to get the last user details loaded forename.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mForeName;
end;

function TDataModule1.getSurname(): string;
// ***********************************************
// description: a function to get the last user details loaded surname.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mSurname;
end;

function TDataModule1.geteMail(): string;
// ***********************************************
// description: a function to get the last user details loaded E-mail address.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=meMail;
end;

function TDataModule1.getHouseId(): integer;
// ***********************************************
// description: a function to get the last user details loaded House ID.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mHouseId;
end;


function TDataModule1.getHouseName(): string;
// ***********************************************
// description: a function to get the last user details loaded House name.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mHouseName;
end;

function TDataModule1.getNoOfGamesPlayed(): integer;
// ***********************************************
// description: a function to get the last user details loaded number of games played.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mNoOfGamesPlayed;
end;

function TDataModule1.getLastGamePlayedDate(): TDateTime;
// ***********************************************
// description: a function to get the last user details loaded Last Game Played Date.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mLastGamePlayedDate;
end;

function TDataModule1.getLastLoginDate(): TDateTime;
// ***********************************************
// description: a function to get the last user details loaded Last Login Date.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mLastLoginDate;
end;

function TDataModule1.getPoints(): integer;
// ***********************************************
// description: a function to get the last user details loaded Points.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mPoints;
end;

procedure TDataModule1.setUserDetails(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
// ***********************************************
// description: this procedure edits a users details in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// the SQL code updates the user with the user ID passed in, to the user information
// also passed in to the procedure.
  sSQL:='UPDATE CheckerUser SET Forename = ''' + Forename + '''';
  sSQL:=sSQL + ', UserPassword = ''' + sPassword + '''';
  sSQL:=sSQL + ', LoginName = ''' + LoginName + '''';
  sSQL:=sSQL + ', Surname = ''' + Surname + '''';
  sSQL:=sSQL + ', eMail = ''' + eMail + '''';
  sSQL:=sSQL + ', HouseId = ' + inttostr(HouseId);
  sSQL:=sSQL + ', UserType = ' + inttostr(UserType);
  sSQL:=sSQL + ' WHERE UserId = ' + inttostr(mUserId);
  ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
  // executes the SQL command.
  ProjDb.DataModule1.ADOCommand1.Execute;

end;

procedure TDataModule1.addNewUser(sPassword,Forename,LoginName,surname,eMail: string; UserType,HouseId :integer);
// ***********************************************
// description: this procedure adds a new user to the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
begin
// the SQL code adds a new user with the user information passed in to the procedure.
  sSQL:='INSERT INTO CheckerUser (Forename, UserPassword, LoginName, Surname, eMail, HouseId, UserType) ';
  sSQL:=sSQL + 'VALUES (''' + Forename + ''',''' + sPassword + '''';
  sSQL:=sSQL + ',''' + LoginName + '''';
  sSQL:=sSQL + ',''' + Surname + '''';
  sSQL:=sSQL + ',''' + eMail + '''';
  sSQL:=sSQL + ',' + inttostr(HouseId);
  sSQL:=sSQL + ',' + inttostr(UserType) + ')';
  ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
  // executes the SQL command.
  ProjDb.DataModule1.ADOCommand1.Execute;

end;

function TDataModule1.addNewQuestion(Question,Answer1,Answer2,Answer3: string) : boolean;
// ***********************************************
// description: this procedure adds a new question to the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sSQL:string;
QuestionAlreadyExist:boolean;
begin
  QuestionAlreadyExist:=false;
  ProjDb.DataModule1.ADOtblCheckerQuestions.close;
  ProjDb.DataModule1.ADOtblCheckerQuestions.open;
  ProjDb.DataModule1.ADOtblCheckerQuestions.first;
  // while it isnt the end of the file it checks if there is a question that is
  // the same as the question being added.
  while not ProjDb.DataModule1.ADOtblCheckerQuestions.eof do
    begin
      if ProjDb.DataModule1.ADOtblCheckerQuestions['QuestionText'] = Question then
      // if there is the QuestionAlreadyExist = true.
        QuestionAlreadyExist:=true;
        ProjDb.DataModule1.ADOtblCheckerQuestions.Next;
    end;
    ProjDb.DataModule1.ADOtblCheckerQuestions.close;
  if QuestionAlreadyExist = false then
    begin
    // runs this if the question doesnt already exist.
    // adds the new question into the database
      sSQL:='INSERT INTO Question (QuestionText) ';
      sSQL:=sSQL + 'VALUES (''' + Question + ''')';
      ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
      ProjDb.DataModule1.ADOCommand1.Execute;
      //gets that question ID.
      sSQL:='SELECT MAX(Qid) AS MAXQid FROM Question';
      ProjDb.DataModule1.ADOQuery1.SQL.Text:=sSQL;
      ProjDb.DataModule1.ADOQuery1.active:=true;
      ProjDb.DataModule1.ADOQuery1.first;
      mQuestionId:=(ProjDb.DataModule1.ADOQuery1.FieldByName('MAXQId')).AsInteger ;
      ProjDb.DataModule1.ADOQuery1.active:=false;
      // adds answer 1 into the databse linking it with the correct question ID.
      sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
      sSQL:=sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(mQuestionId) + ', true)';
      ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
      ProjDb.DataModule1.ADOCommand1.Execute;
      // adds answer 2 into the databse linking it with the correct question ID.
      sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
      sSQL:=sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(mQuestionId) + ', false)';
      ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
      ProjDb.DataModule1.ADOCommand1.Execute;
      // adds answer 3 into the databse linking it with the correct question ID.
      sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
      sSQL:=sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(mQuestionId) + ', false)';
      ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
      ProjDb.DataModule1.ADOCommand1.Execute;
    end;
    // the result to the boolean value of QuestionAlreadyExist because if the
    // question already existed then it wasnt added to the database and
    // QuestionAlreadyExist was set to true, therefore the result will be true,
    // else if the question and answers where added QuestionAlreadyExist was
    // set to false so the result will be false.
    result:=QuestionAlreadyExist;
end;

procedure TDataModule1.deleteQuestion(QuestionId: integer);
// ***********************************************
// description: deletes a question and its answers from the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  sSQL:string;
begin
// deletes all the answers assosiated with the question ID of the question being
// deleted.
  sSQL:='DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
  ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
  ProjDb.DataModule1.ADOCommand1.Execute;
// deletes the question assosiated with the question ID of the question being
// deleted.
  sSQL:='DELETE FROM Question WHERE Qid = ' + inttostr(QuestionId);
  ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
  ProjDb.DataModule1.ADOCommand1.Execute;
end;

procedure TDataModule1.deleteUser(UserId: integer);
// ***********************************************
// description: deletes a user from the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  sSQL:string;
begin
// deletes the user where there user ID = the user ID passed into the procedure.
  sSQL := 'DELETE FROM CheckerUser WHERE UserId = ' + inttostr(UserId);
  ProjDb.DataModule1.ADOCommand1.CommandText  :=  sSQL;
  ProjDb.DataModule1.ADOCommand1.Execute;
end;

function TDataModule1.editQuestion(Question,Answer1,Answer2,Answer3: string; QuestionId: integer) :boolean;
// ***********************************************
// description: edits a question in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  sSQL:string;
  QuestionAlreadyExist:boolean;
begin
  QuestionAlreadyExist:=false;
  // sets the SQL text to select the questions text where the Question ID
  // doesnt = the Question ID passed in (the question being edited).
  ProjDb.DataModule1.ADOquery1.sql.Text:='SELECT QuestionText FROM Question WHERE Qid <> '+inttostr(QuestionId);
  ProjDb.DataModule1.ADOquery1.active:=true;
  ProjDb.DataModule1.ADOquery1.first;
  // goes through all the questions in the query.
  while not ProjDb.DataModule1.ADOquery1.eof do
  begin
  // checks all the other questions that their question text is not the same as
  // the questions Question text that is being edited.
    if ProjDb.DataModule1.ADOquery1['QuestionText'] = Question then
    // if there is a duplicate of question text then QuestionAlreadyExist = true.
      QuestionAlreadyExist:=true;
    ProjDb.DataModule1.ADOquery1.Next;
  end;
  ProjDb.DataModule1.ADOquery1.active:=false;

  if QuestionAlreadyExist = false then
  begin
  // runs if the question text isnt duplicated.
    sSQL:='UPDATE Question SET QuestionText = ''' + Question + '''';
    sSQL:=sSQL + 'Where Qid =' + inttostr(QuestionId);
    ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
    ProjDb.DataModule1.ADOCommand1.Execute;
    // deletes the original answers
    sSQL:='DELETE FROM Answer WHERE Qid = ' + inttostr(QuestionId);
    ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
    ProjDb.DataModule1.ADOCommand1.Execute;
    // adds the new (edited) answer 1
    sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL:=sSQL + 'VALUES (''' + Answer1 + ''',' + inttostr(QuestionId) + ', true)';
    ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
    ProjDb.DataModule1.ADOCommand1.Execute;
    // adds the new (edited) answer 2
    sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL:=sSQL + 'VALUES (''' + Answer2 + ''',' + inttostr(QuestionId) + ', false)';
    ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
    ProjDb.DataModule1.ADOCommand1.Execute;
    // adds the new (edited) answer 3
    sSQL:='INSERT INTO Answer (AnswerText,Qid,isCorrect) ';
    sSQL:=sSQL + 'VALUES (''' + Answer3 + ''',' + inttostr(QuestionId) + ', false)';
    ProjDb.DataModule1.ADOCommand1.CommandText := sSQL;
    ProjDb.DataModule1.ADOCommand1.Execute;
  end;
    // the result to the boolean value of QuestionAlreadyExist because if the
    // question already existed then it wasnt added to the database and
    // QuestionAlreadyExist was set to true, therefore the result will be true,
    // else if the question and answers where added QuestionAlreadyExist was
    // set to false so the result will be false.
  result:=QuestionAlreadyExist;
end;

procedure TDataModule1.setUserGameDetails(GamesPlayed,points,Uid: integer; LastGameDate : TDateTime);
// ***********************************************
// description: updates the users Games Played, points and Last Game Date.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCommand:string;
begin
// mPoints (the users current points) is increases by points (a value passed into
// the procedure).
mPoints:=mPoints+points;
// mNoOfGamesPlayed (the users current number of games played) is increases by
// GamesPlayed (a value passed into the procedure).
mNoOfGamesPlayed:=mNoOfGamesPlayed+GamesPlayed;
// changes the the command text to update the users details Games Played points
// and Last Game Played.
sCommand:='UPDATE CheckerUser SET points = ' + inttostr(mpoints);
sCommand:=sCommand+', NoOfGamesPlayed = ' + inttostr(mNoOfGamesPlayed);
sCommand:=sCommand+', LastGamePlayedDate = ''' + Datetostr(LastGameDate)+'''';
sCommand:=sCommand+' WHERE Userid = '+inttostr(Uid);
ProjDb.DataModule1.ADOcommand1.commandtext:=sCommand;
// executes the command.
ProjDb.DataModule1.ADOcommand1.execute;
end;

procedure TDataModule1.setLastLoginDate(Uid : integer; LastLoginDate : TDateTime);
// ***********************************************
// description: sets a users last login date
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCommand:string;
begin
// makes the command text update the LastLoginDate ,for the User ID passed in, to
// the date passed in.
sCommand:='UPDATE CheckerUser SET';
sCommand:=sCommand+' LastLoginDate = ''' + Datetostr(LastLoginDate)+'''';
sCommand:=sCommand+' WHERE Userid = '+inttostr(Uid);
ProjDb.DataModule1.ADOcommand1.commandtext:=sCommand;
// executes the command.
ProjDb.DataModule1.ADOcommand1.execute;
end;

function TDataModule1.getQuestionText(): string;
// ***********************************************
// description: passes out the Question text of the last question details loaded.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mQuestionText;
end;

function TDataModule1.getAnswer1Text(): string;
// ***********************************************
// description: passes out Answer 1's text of the last question details loaded.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mAnswer1;
end;

function TDataModule1.getAnswer2Text(): string;
// ***********************************************
// description: passes out Answer 2's text of the last question details loaded.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mAnswer2;
end;

function TDataModule1.getAnswer3Text(): string;
// ***********************************************
// description: passes out Answer 3's text of the last question details loaded.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result:=mAnswer3;
end;

function TDataModule1.getHowManyQuestions(): integer;
// ***********************************************
// description: passes out how many questions are in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
i:integer;
begin
i:=1;
ProjDb.DataModule1.ADOtblCheckerQuestions.close;
ProjDb.DataModule1.ADOtblCheckerQuestions.open;
// goes to the first record in the table.
ProjDb.DataModule1.ADOtblCheckerQuestions.First;
// repeates the while loop until it is the end of the file.
while not ProjDb.DataModule1.ADOtblCheckerQuestions.Eof do
begin
// incraments i each time.
inc(i);
ProjDb.DataModule1.ADOtblCheckerQuestions.Next;
end;
// result = i (i.e the number of questions in the database).
result:=i;
ProjDb.DataModule1.ADOtblCheckerQuestions.close;
end;

function TDataModule1.getNthQuestionId(n:integer): integer;
// ***********************************************
// description: gets the Question ID of the Nth Question.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
i:integer;
begin
ProjDb.DataModule1.ADOtblCheckerQuestions.close;
ProjDb.DataModule1.ADOtblCheckerQuestions.open;
// points to the first record
ProjDb.DataModule1.ADOtblCheckerQuestions.First;
if n>1 then
begin
// uses a for loop to get to the Nth Question
  for I := 1 to (n-1) do
  begin
    ProjDb.DataModule1.ADOtblCheckerQuestions.next;
  end;
end;
// the result = the selected Questions ID.
result:=ProjDb.DataModule1.ADOtblCheckerQuestions['QID'];
ProjDb.DataModule1.ADOtblCheckerQuestions.close;

end;

function TDataModule1.getUserIdFromEmail(Email:string) : integer;
// ***********************************************
// description: Gets a users User ID from there E-mail.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
try
// sets the SQL text to select the User ID where the fiel eMail = the email
// address passed into the function.
ProjDb.DataModule1.ADOquery1.sql.Text:='SELECT Userid FROM CheckerUser WHERE eMail = '''+Email+'''';
ProjDb.DataModule1.ADOquery1.active:=true;
ProjDb.DataModule1.ADOquery1.first;
// the result = the user ID.
Result:=ProjDb.DataModule1.ADOquery1.FieldByName('Userid').AsInteger;
Result:=ProjDb.DataModule1.ADOquery1.FieldByName('Userid').AsInteger;
except
// an exeption will occure if the E-mail cannot be found, and the result is set
// to 0.
result:=0;
end;
end;

function TDataModule1.DoesCheckersDatabaseExist() : boolean;
// ***********************************************
// description: Checks to see if the database exists
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sFilePath,fileName : string;
begin
// calls a function to get the file path name.
fileName := getCheckersDbname;

if FileExists(fileName) then
// The file path name exist.
result:=true
else
// The file path name does not exist.
result:=false;
end;

function TDataModule1.DoesBlankDatabaseExist() : boolean;
// ***********************************************
// description: checks if the blank database exists.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sFilePath,fileName : string;
begin
// calls a function to get the file path name.
fileName := getBlankDBname;

if FileExists(fileName) then
// The file path name exist.
result:=true
else
// The file path name does not exist.
result:=false;
end;

function TDataModule1.DeleteCheckersDatabase() : boolean;
// ***********************************************
// description: deletes checkers.mdb database (this is incase it is corrupt)
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sFilePath,fileName : string;
begin
// calls a function to get the file path name.
fileName := getCheckersDBname;
  // calls a function to delete the file.
  if DeleteFile(fileName) then
  // The file has been deleted.
  result:=true
  else
  // The file has not been deleted.
  result:=false;
end;

procedure TDataModule1.CopyFile (fromFile, ToFile : string);
// ***********************************************
// description: writing the blank database file which has had tables added to
// it through DDL to a Checkers.mdb file.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  SourceF, DestF: TFileStream;
begin
// the SourceF is the file being copied
  SourceF:= TFileStream.Create(fromFile, fmOpenRead);
// the DestF is the file being created.
  DestF:= TFileStream.Create(ToFile, fmCreate);
  // copies one file (SourceF) to another (DestF).
  DestF.CopyFrom(SourceF, SourceF.Size);
  SourceF.Free;
  DestF.Free;
end;

function TDataModule1.CreateTableUsers(): boolean;
// ***********************************************
// description: Uses DDL to create the table CheckerUser in the database, with one
// master user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
// calls the procedure openDB.
openDB;
try
// deletes the table CheckerUser
ProjDb.DataModule1.ADOcommand1.CommandText := 'DROP TABLE [CheckerUser];';
ProjDb.DataModule1.ADOcommand1.Execute;
except
on E : Exception do
begin
mErrormessage:=E.Message;
end;
end;
result:=true;
try
// creates the table CheckerUser with all the correct fields using DDL.
sCmd := 'CREATE TABLE CheckerUser (UserId AutoIncrement PRIMARY KEY, ';
sCmd := sCmd + 'UserType SmallInt NULL, ';
sCmd := sCmd + 'LoginName Text(20) NULL, ';
sCmd := sCmd + 'UserPassword Text(20) NULL, ';
sCmd := sCmd + 'ForeName Text(30) NULL, ';
sCmd := sCmd + 'Surname Text(30) NULL, ';
sCmd := sCmd + 'eMail Text(40) NULL, ';
sCmd := sCmd + 'HouseId SmallInt NULL, ';
sCmd := sCmd + 'NoOfGamesPlayed SmallInt NULL, ';
sCmd := sCmd + 'LastGamePlayedDate DateTime NULL, ';
sCmd := sCmd + 'LastLoginDate DateTime NULL, ';
sCmd := sCmd + 'QuestionsCorrect Int NULL, ';
sCmd := sCmd + 'QuestionsIncorrect Int NULL, ';
sCmd := sCmd + 'Points Int NULL);';
ProjDb.DataModule1.ADOcommand1.CommandText := sCmd;
ProjDb.DataModule1.ADOcommand1.Execute;
// makes the HouseID field a foriegn key.
ProjDb.DataModule1.ADOcommand1.CommandText := 'CREATE INDEX indexCheckerUser_HouseId ON CheckerUser (HouseId ASC);';
ProjDb.DataModule1.ADOcommand1.Execute;
// Uses an ADO command to add a master user to the table.
sCmd := 'INSERT INTO CheckerUser ';
sCmd := sCmd + '(UserType, LoginName, UserPassword, ForeName, Surname, eMail, ';
sCmd := sCmd + 'NoOfGamesPlayed, LastGamePlayedDate, LastLoginDate, Points) ';
sCmd := sCmd + 'VALUES ';
sCmd := sCmd + '(1, ''admin'', ''admin'', ''A'', ''Teacher'', ''a.teacher@e-mail.com'', ';
sCmd := sCmd + '0, Null, Null, 0)';

ProjDb.DataModule1.ADOcommand1.CommandText := sCmd;
ProjDb.DataModule1.ADOcommand1.Execute;

except
on e : exception do
begin
// if theres an error the result = false and the local variable mErrormessage
// becomes the error message.
result:=false;
mErrormessage:=E.Message;
end;
end;
// calls the procedure closeDB.
closeDB;
end;

function TDataModule1.CreateTableQuestions() : boolean;
// ***********************************************
// description: Uses DDL to create the table Question in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
// calls the procedure openDB.
openDB;
try
// deletes the table Question.
ProjDb.DataModule1.ADOcommand1.CommandText := 'DROP TABLE [Question];';
ProjDb.DataModule1.ADOcommand1.Execute;

   except
     on E : Exception do
     begin
      mErrormessage:=E.Message;
     end;
   end;

 result:=true;

try
// creates the table Question with all the correct fields using DDL.
sCmd := 'CREATE TABLE Question (QId AutoIncrement PRIMARY KEY, ';
sCmd := sCmd + 'QuestionText Text(255) NULL, ';
sCmd := sCmd + 'UserIdAsked smallInt NULL, ';
sCmd := sCmd + 'IsAnsweredCorrectly bit NULL);';
ProjDb.DataModule1.ADOcommand1.CommandText := sCmd;
ProjDb.DataModule1.ADOcommand1.Execute;
// makes the UserIDAsked field a foriegn key.
ProjDb.DataModule1.ADOcommand1.CommandText := 'CREATE INDEX indexQuestion_UserIdAsked ON Question (UserIdAsked ASC);';
ProjDb.DataModule1.ADOcommand1.Execute;

except
on E : Exception do
begin
// if theres an error the result = false and the local variable mErrormessage
// becomes the error message.
  result:=false;
   mErrormessage:=E.Message;
end;

end;
// calls the procedure closeDB.
closeDB;
end;

function TDataModule1.CreateTableAnswers() : boolean;
// ***********************************************
// description: Uses DDL to create the table Answer in the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
// calls the procedure openDB.
openDB;
try
// deletes the table Answer.
ProjDb.DataModule1.ADOcommand1.CommandText := 'DROP TABLE [Answer];';
ProjDb.DataModule1.ADOcommand1.Execute;
except
on e : exception do
begin
result:=false;
mErrormessage:=E.Message;
end;
end;
result:=true;
try
// creates the table Answer with all the correct fields using DDL.
sCmd := 'CREATE TABLE Answer (Aid AutoIncrement PRIMARY KEY, ';
sCmd := sCmd + 'AnswerText Text(255) NULL, ';
sCmd := sCmd + 'isCorrect Bit NULL, ';
sCmd := sCmd + 'Qid SmallInt NULL);';
ProjDb.DataModule1.ADOcommand1.CommandText := sCmd;
ProjDb.DataModule1.ADOcommand1.Execute;
// makes the Qid field a foriegn key.
ProjDb.DataModule1.ADOcommand1.CommandText := 'CREATE INDEX indexAnswer_Qid ON Answer (Qid ASC);';
ProjDb.DataModule1.ADOcommand1.Execute;
except
on e : exception do
begin
// if theres an error the result = false and the local variable mErrormessage
// becomes the error message.
result:=false;
mErrormessage:=E.Message;
end;
end;
// calls the procedure closeDB.
closeDB;
end;

function TDataModule1.CreateTableHouse() : boolean;
// ***********************************************
// description:
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
sCmd:string;
begin
openDB;
try
// deletes the table House.
ProjDb.DataModule1.ADOcommand1.CommandText := 'DROP TABLE [House];';
ProjDb.DataModule1.ADOcommand1.Execute;
except
on e : exception do
begin
mErrormessage:=E.Message;
end;
end;
result:=true;
try
// creates the table House with all the correct fields using DDL.
sCmd := 'CREATE TABLE House (HouseId AutoIncrement PRIMARY KEY, ';
sCmd := sCmd + 'HouseName text(20) NULL);';
ProjDb.DataModule1.ADOcommand1.CommandText := sCmd;
ProjDb.DataModule1.ADOcommand1.Execute;
except
on e : exception do
begin
// if theres an error the result = false and the local variable mErrormessage
// becomes the error message.
result:=false;
mErrormessage:=E.Message;
end;
end;
// calls the procedure closeDB.
closeDB;
end;

end.
