unit GsetUps;
// ***********************************************
// description: This Unit Stores Global procedures that can be called from
// any other unit.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
interface
uses
  sysUtils,IdMessage, IdSMTP, IdSSLOpenSSL, IdGlobal, IdExplicitTLSClientServerBase;


var
  UserLoggingOn:integer;
  Player1score:integer;
  Player2score:integer;
  UserValidadte:boolean;
  mQuestionCorrect:boolean;
  mUid:integer;
  procedure SetUserAnsweringQuestion(Uid : integer);
  Function getUserAnsweringQuestion() : integer;
  procedure SetUserLoggingOn(a : integer);
  Function getUserLoggingOn() : integer;
  procedure SetPlayer1Score(a : integer);
  Function getPlayer1Score() : integer;
  procedure SetPlayer2Score(a : integer);
  Function getPlayer2Score() : integer;
  procedure setUserValidated(a : boolean);
  Function getUserValidated() : boolean;
  Function getLastQuestionCorrect():boolean;
  procedure setLastQuestionCorrect(AnsweredCorrect:boolean);
  function sendEmail(Recipients,Subject,Body: string) : boolean;

implementation

procedure SetUserAnsweringQuestion(Uid : integer);
// ***********************************************
// description: This procedure sets the variable mUid, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
mUid:=Uid;
end;

Function getUserAnsweringQuestion() : integer;
// ***********************************************
// description: This function passes out the variable mUid as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
result:=mUid;
end;


function sendEmail(Recipients,Subject,Body: string) : boolean;
// ***********************************************
// description: This function sends an email using SMTP (Simple Mail Transfer
// Protocol).
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  SMTP: TIdSMTP;
  Email: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
// The result starts as true.
result:=true;
// Creates a TIdSMTP, TIdMessage and TIdSSLIOHandlerSocketOpenSSL.
  SMTP := TIdSMTP.Create(nil);
  Email := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  try
    SSLHandler.MaxLineAction := maException;
    SSLHandler.SSLOptions.Method := sslvTLSv1;
    SSLHandler.SSLOptions.Mode := sslmUnassigned;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;

    // sets the TIdSMTP's IO Handler to the TIdSSLIOHandlerSocketOpenSSL created.
    SMTP.IOHandler := SSLHandler;
    // uses Gmails SMTP servers
    SMTP.Host := 'smtp.gmail.com';
    // sets the port to number 587.
    SMTP.Port := 587;
    // Uses a email set up specifically for the checkers game
    // Idealy these values should be read from the database.
    SMTP.Username := 'checkerquiz1@gmail.com';
    SMTP.Password := 'CheckersQuiz1';
    SMTP.UseTLS := utUseExplicitTLS;

    Email.From.Address := 'checkersquiz@gmail.com';
    // sets the emails recipient to the variable 'Recipients' passed into to
    // function
    Email.Recipients.EmailAddresses := Recipients;
    // sets the emails subject to the variable 'Subject' passed into to
    // function
    Email.Subject := Subject;
    // sets the emails body to the variable 'Body' passed into to
    // function
    Email.Body.Text := Body;

    // connects to the SMTP server
    SMTP.Connect;
    // sends the email
    SMTP.Send(Email);
    // Disconnects to the SMTP server
    SMTP.Disconnect;
  except
  on E : Exception do
    begin
    // if an error occurs while sending the email then the result of the function
    // is set to false.
      result:=false;
    end;
  end;
  // free's the TIdSMTP, TIdMessage and TIdSSLIOHandlerSocketOpenSSL.
  SMTP.Free;
  Email.Free;
  SSLHandler.Free;




end;

procedure setLastQuestionCorrect(AnsweredCorrect:boolean);
// ***********************************************
// description: This procedure sets the variable mQuestionCorrect, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
mQuestionCorrect:=AnsweredCorrect;
end;

Function getLastQuestionCorrect():boolean;
// ***********************************************
// description: This function passes out the variable mQuestionCorrect as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
result:=mQuestionCorrect;
end;

procedure SetUserLoggingOn(a : integer);
// ***********************************************
// description: This procedure sets the variable UserLoggingOn, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  UserLoggingOn := a;
end;

Function getUserLoggingOn() : integer;
// ***********************************************
// description: This function passes out the variable UserLoggingOn as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := UserLoggingOn;
end;

procedure SetPlayer1Score(a : integer);
// ***********************************************
// description: This procedure sets the variable Player1score, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Player1score := a;
end;

Function getPlayer1Score() : integer;
// ***********************************************
// description: This function passes out the variable Player1Score as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := Player1Score;
end;

procedure SetPlayer2Score(a : integer);
// ***********************************************
// description: This procedure sets the variable Player2score, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Player2score := a;
end;

Function getPlayer2Score() : integer;
// ***********************************************
// description: This function passes out the variable Player2Score as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := Player2Score;
end;

procedure setUserValidated(a : boolean);
// ***********************************************
// description: This procedure sets the variable UserValidadte, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  UserValidadte := a;
end;

Function getUserValidated() : boolean;
// ***********************************************
// description: This function passes out the variable UserValidadte as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := UserValidadte;
end;

end.
