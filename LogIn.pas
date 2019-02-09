unit LogIn;

interface
//home
uses
  SysUtils, Variants, Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, GsetUps, ProjDb, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP;
//school
{uses
  SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs,
  StdCtrls, GsetUps, ProjDb, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP;}

type
  TfrmLogin = class(TForm)
    pnlLogIn: TPanel;
    edtUsername: TEdit;
    btnCancel: TButton;
    edtPassword: TEdit;
    btnLogin: TButton;
    lblForgottenLogin: TLabel;
    lblPassword: TLabel;
    lblUsername: TLabel;
    pnlforgoten: TPanel;
    btnSendEmail: TButton;
    edtEmail: TEdit;
    lblEmail: TLabel;
    Label1: TLabel;
    pnlEmailSent: TPanel;
    lblEmailSent: TLabel;
    lblM1: TLabel;
    lblClick: TLabel;
    lblM2: TLabel;
    btnLoginPanel: TButton;
    Button2: TButton;
    Email: TIdSMTP;
  procedure btnLoginClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure btnCancelClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure lblForgottenLoginClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure btnLoginPanelClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lblClickClick(Sender: TObject);

  private
    { Private declarations }
    FCheckersDb: TDataModule1;
    iUserId:integer;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCancelClick(Sender: TObject);
// ***********************************************
// description: Cancels the Login operation.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
FCheckersDb.SetUserId(0);
frmLogin.close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
// ***********************************************
// description: This procedure validates the user details entered.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  bRtn:Boolean;

  iUserType:integer;
begin
// passes the entered username and password into a databse procedure which gives
// back the userID if that user exists.
  iUserId := FCheckersDb.getUserIdForlogin(edtUsername.Text,edtPassword.Text);
  // uses the UserID to load the user details of that user to variables in the
  // database module.
  bRtn := FCheckersDb.LoaduserDetails(iUserId);
  // gets the userType from a function in the databse module.
  iUserType := FCheckersDb.getUserType();
  if (getUserLoggingOn = 1) or (getUserLoggingOn = 2) then
    begin
    // This runs if it is a non admin logging on.
      if iUserId = 0 then
        begin
        // runs if the username and password combination can not be found in the
        // databse.
        // sets setUserValidated to false (User is not validated)
          setUserValidated(false);
          showmessage('Not a valid User');
        end
      else
      begin
        // runs if the username and password combination can be found in the
        // databse.
        // sets the user logging in's lastlogin date to the current date
        FCheckersDb.setLastLoginDate(iUserId,now);
        // sets setUserValidated to true (User is validated)
        setUserValidated(true);
        frmLogin.Close;
      end;
    end
  else if (getUserLoggingOn = 3) then
    begin
    // will run if an admin is logging on.
      if (iUserId = 0) then
        begin
        // runs if the username and password combination can not be found in the
        // databse.
        // sets setUserValidated to false (User is not validated)
          setUserValidated(false);
          showmessage('Not a valid User');
        end
      else
        begin
          if (iUserType = 1) or (iUserType = 0) then
            begin
            // runs if the user type for the user logging in is 1 or 0 (admin or master).
            // sets the user logging in's lastlogin date to the current date
              FcheckersDB.setLastLoginDate(iUserId,now);
              // sets setUserValidated to true (User is validated).
              setUserValidated(true);
              frmLogin.Close;
            end
          else
            begin
        // runs if the user type for the user logging in is NOT 1 or 0 (admin or master).
              // sets setUserValidated to false (User is not validated)
              setUserValidated(false);
              showmessage('You cannot access admin settings');
            end;
        end;
    end;

end;

procedure TfrmLogin.btnLoginPanelClick(Sender: TObject);
// ***********************************************
// description: Changes which panel is visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
pnlForgoten.Visible:=false;
pnlLogin.Visible:=true;
pnlEmailSent.Visible:=false;
end;

procedure TfrmLogin.btnSendEmailClick(Sender: TObject);
// ***********************************************
// description: sends an email with the users details assosiated with the E-mail
// address entered.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
Uid:integer;
bRtn:boolean;
Password,emailtext1,LoginName:string;
begin
uid:=0;
// gets the userID for the Email entered
Uid:=FCheckersDb.getUserIdFromEmail(edtEmail.Text);
if Uid = 0 then
begin
// runs if the email address entered cannot be found in the database.
edtemail.Text:='';
showmessage('E-mail not in database');
end
else
begin
pnlForgoten.Visible:=false;
pnlLogin.Visible:=false;
pnlEmailSent.Visible:=true;
// uses the UserID to load the user details of that user to variables in the
// database module.
bRtn := FCheckersDb.LoaduserDetails(Uid);
// gets the users username
LoginName:=FCheckersDb.getLoginName;
// gets the users password
password:=FCheckersDb.getPassword;
emailtext1 := 'Hello,' + #13#10#13#10;
emailtext1 := emailtext1 + 'You have received this email in response to your request for forgotten login informstion ';
emailtext1 := emailtext1 + 'for the Checkers Quiz.  The following account is registered against this email address.'+#13#10#13#10;
emailtext1 := emailtext1 + #9 + 'Login Name:' + #9 + LoginName + #13#10;
emailtext1 := emailtext1 + #9 + 'Password:  ' + #9 + Password + #13#10#13#10;
emailtext1 := emailtext1 + 'Please do not reply to this automated email, the account is NOT monitored.'+#13#10#13#10;
emailtext1 := emailtext1 + 'Kind Regards'+#13#10;
emailtext1 := emailtext1 + 'Checkers Admin';
// calls a global procedure which sends the Email.
bRtn:=sendEmail(edtEmail.Text,'Checker Revision Game Account Details',emailtext1);
if bRtn = false then
showmessage('Error sending E-mail Please Try Again or Ask your teacher for assistance.'+#13#10+'This error may have occured because the E-mail address used for your account is incorrect. To solve this problem get an Admin to check that the E-mail address associated with your account is correct');
end;
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
// ***********************************************
// description: Changes which panel is visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
pnlForgoten.Visible:=false;
pnlLogin.Visible:=true;
pnlEmailSent.Visible:=false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
// ***********************************************
// description: positions the form in the centre of the screen.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmLogin.Position:=PoScreenCenter;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
// ***********************************************
// description: resets the form to its starting state.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
pnlForgoten.Visible:=false;
pnlLogin.Visible:=true;
pnlEmailSent.Visible:=false;
    edtUsername.SetFocus;
    edtUsername.Text:='';
    edtPassword.Text:='';
    edtEmail.Text:='';
    iUserId:=0;
end;

procedure TfrmLogin.lblClickClick(Sender: TObject);
// ***********************************************
// description: Changes which panel is visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
pnlForgoten.Visible:=true;
pnlLogin.Visible:=false;
pnlEmailSent.Visible:=false;
edtEmail.Text:='';
end;

procedure TfrmLogin.lblForgottenLoginClick(Sender: TObject);
// ***********************************************
// description: Changes which panel is visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
pnlForgoten.Visible:=true;
pnlLogin.Visible:=false;
pnlEmailSent.Visible:=false;
end;

end.
