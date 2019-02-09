unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, Variants, Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ProjDb;

{uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ProjDb;}

type
  TfrmUsers = class(TForm)
  LBUsers: TListBox;
  btnNewUser: TButton;
  btnRefreshUserList: TButton;
  lblUsers: TLabel;
  pnlUserView: TPanel;
  lblHouse: TLabel;
  lblSurname: TLabel;
  lblEmail: TLabel;
  lblUsername: TLabel;
  lblForename: TLabel;
  Label1: TLabel;
  Label2: TLabel;
  vwEmail: TLabel;
  vwHouse: TLabel;
  vwUsername: TLabel;
  vwSurname: TLabel;
  vwForename: TLabel;
  vwUserType: TLabel;
  Label9: TLabel;
  btnEditUser: TButton;
  btnDeleteUser: TButton;
  pnlUserAddEdit: TPanel;
  Label10: TLabel;
  Label11: TLabel;
  Label12: TLabel;
  Label13: TLabel;
  Label14: TLabel;
  Label15: TLabel;
  Label16: TLabel;
  Label23: TLabel;
  btnSaveEditUser: TButton;
  CBOHouse: TComboBox;
  edtEmail: TEdit;
  edtLoginName: TEdit;
  edtSurname: TEdit;
  edtForename: TEdit;
  cbAdmin: TCheckBox;
  pnlUserGameInfo: TPanel;
    lblGamesPlayed: TLabel;
  Label4: TLabel;
    lblScore: TLabel;
  Label6: TLabel;
    lblLastLogin: TLabel;
  Label17: TLabel;
  lblPassword: TLabel;
  edtPassword: TEdit;
  btnCancel: TButton;
  pnlAddUser: TPanel;
  Label8: TLabel;
  Label18: TLabel;
  Label19: TLabel;
  Label20: TLabel;
  Label21: TLabel;
  Label22: TLabel;
  Label24: TLabel;
  Label25: TLabel;
  Label26: TLabel;
  CBAddHouse: TComboBox;
  edtAddEmail: TEdit;
  edtAddUsername: TEdit;
  edtAddSurname: TEdit;
  edtAddForename: TEdit;
  CBAddUserType: TCheckBox;
  edtAddPassword: TEdit;
  btnCancelAddUser: TButton;
  btnAddUser: TButton;
  btnClose: TButton;
    btnClearUsers: TButton;
  procedure btnRefreshUserListClick(Sender: TObject);
  procedure LBUsersClick(Sender: TObject);
  procedure btnDeleteUserClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure btnEditUserClick(Sender: TObject);
  procedure btnCancelClick(Sender: TObject);
  procedure btnSaveEditUserClick(Sender: TObject);
  procedure btnNewUserClick(Sender: TObject);
  procedure btnAddUserClick(Sender: TObject);
  procedure btnCancelAddUserClick(Sender: TObject);
  procedure btnCloseClick(Sender: TObject);
  procedure RefreshUsersList();
    procedure btnClearUsersClick(Sender: TObject);

  private
    { Private declarations }
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

{$R *.dfm}

procedure resetViewPanel();
// ***********************************************
// Description: changes the labels text on the view panel
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  frmUsers.vwForename.caption := 'Forename';
  frmUsers.vwSurname.caption := 'Surname';
  frmUsers.vwUserName.caption := 'Username';
  frmUsers.vwEmail.caption := 'Email';
  frmUsers.vwHouse.Caption := 'House';
  frmUsers.vwUserType.Caption := 'User Type';
  frmUsers.lblLastLogin.Caption:= 'Last Login Date';
  frmUsers.lblScore.Caption := 'Points';
  frmUsers.lblGamesPlayed.Caption := 'Games Played';
end;

procedure resetAddPanel();
// ***********************************************
// Description: resets all the edit boxes and combo box on the add panel to
// there starting states.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmUsers.cbAddUserType.Checked:=false;
frmUsers.edtAddPassword.text:='';
frmUsers.edtAddForename.text:='';
frmUsers.edtAddUsername.text:='';
frmUsers.edtAddsurname.text:='';
frmUsers.edtAddeMail.text:='';
frmUsers.CBAddHouse.itemindex:=-1;
end;

procedure resetEditPanel();
// ***********************************************
// Description: resets all the edit boxes and combo box on the add panel to
// there starting states.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmUsers.cbAdmin.Checked:=false;
frmUsers.edtPassword.text:='';
frmUsers.edtForename.text:='';
frmUsers.edtLoginName.text:='';
frmUsers.edtsurname.text:='';
frmUsers.edteMail.text:='';
frmUsers.CBOHouse.itemindex:=-1;
end;

procedure TfrmUsers.RefreshUsersList();
// ***********************************************
// Description: Refreshes the users list box.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  UsersName:string;
  LoginName:string;
  UserId:integer;
  iCnt:integer;
  tArrUsers:TDataModule1.tArrUser;
begin
// clears the list box.
  frmUsers.LBUsers.Items.Clear;
  // calls a function from the database module which sends back an array of a
  // record containing  the users loginname, the users name and the user ID.
  tArrUsers := FCheckersDb.getUserList();

for iCnt := Low(tArrUsers) to High(tArrUsers) do
  begin
  // for each record its sets local variables to the results and then adds the data
  // to the List box.
    LoginName := tArrUsers[iCnt].LoginName;
    UsersName := tArrUsers[iCnt].UserName;
    UserId := tArrUsers[iCnt].UId;
    frmUsers.LBUsers.Items.Addobject(LoginName + '  [' + UsersName + ']',TObject(UserId));
  end;
end;


procedure TfrmUsers.btnCancelAddUserClick(Sender: TObject);
// ***********************************************
// Description: cancels adding a user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// resets the list box item index to -1 (its default state).
LBUsers.ItemIndex:=-1;
// resets the panels.
resetViewPanel;
resetAddPanel;
// changes the panels visible.
pnlUserAddEdit.Visible := false;
pnlUserview.Visible := true;
pnlAddUser.Visible := false;
// sets all of the edit boxes on the add panels colour to clwindow.
edtAddPassword.Color:=clwindow;
edtAddForename.Color:=clwindow;
edtAddUsername.Color:=clwindow;
edtAddsurname.Color:=clwindow;
edtAddeMail.Color:=clwindow;
CBAddHouse.Color:=clwindow;
end;

procedure TfrmUsers.btnCancelClick(Sender: TObject);
// ***********************************************
// Description: cancels editing a user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// resets the list box item index to -1 (its default state).
LBUsers.ItemIndex:=-1;
// resets the panels.
resetEditPanel;
resetViewPanel;
// changes the panels visible.
pnlUserAddEdit.Visible := false;
pnlUserview.Visible := true;
pnlAddUser.Visible := false;
// sets all of the edit boxes on the edit panels colour to clwindow.
edtPassword.Color:=clwindow;
edtForename.Color:=clwindow;
edtLoginName.Color:=clwindow;
edtsurname.Color:=clwindow;
edteMail.Color:=clwindow;
CBOHouse.Color:=clwindow;
end;

procedure TfrmUsers.btnCloseClick(Sender: TObject);
// ***********************************************
// Description: closes the form frmUsers.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  frmUsers.Close;
end;

procedure TfrmUsers.btnDeleteUserClick(Sender: TObject);
// ***********************************************
// Description: delets the selected user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
buttonselected:integer;
begin
// checks with the user.
  buttonSelected := MessageDlg('Are You Sure you want to Delete this user?',mtCustom, [mbYes,mbNo,mbCancel], 0);
  if buttonSelected = mrYes then
    begin
    // runs if the user clickes yes to delete the user.
    // checks a user is selected.
      if LBUsers.ItemIndex>=0 then
        begin
        // runs if a user is selected.
        // passed the user ID into a databse procedure which deletes the user
        // from the database.
          FCheckersDb.deleteUser(FCheckersDb.getUserId);
          ShowMessage('User has been deleted');
        end;
        // refreshes the user list box.
      RefreshUsersList;
      // sets the combo box to -1.
      LBUsers.ItemIndex:=-1;
      // resets the view panel.
      resetViewPanel;
    end
    else
    begin
    // runs if user clicks no to delete user.
      showmessage('User has NOT been deleted');
    end;
end;

procedure TfrmUsers.btnEditUserClick(Sender: TObject);
// ***********************************************
// Description: changes which panels are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  pnlUserAddEdit.Visible := true;
  pnlUserview.Visible := false;
  pnlAddUser.Visible := false;
end;

procedure TfrmUsers.btnNewUserClick(Sender: TObject);
// ***********************************************
// Description: changes which panels are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  pnlAddUser.Visible := true;
  pnlUserview.Visible := false;
  pnlUserAddEdit.Visible := false;
end;

procedure TfrmUsers.btnRefreshUserListClick(Sender: TObject);
// ***********************************************
// Description: refreshes the user list box.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  RefreshUsersList;
end;

procedure TfrmUsers.btnSaveEditUserClick(Sender: TObject);
// ***********************************************
// Description: edits a users details.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  Uid,UType,buttonselected:integer;
  DoesUsernameExist:boolean;
begin
// sets all the edit box colors to clwindow.
edtPassword.Color:=clwindow;
edtForename.Color:=clwindow;
edtLoginName.Color:=clwindow;
edtsurname.Color:=clwindow;
edteMail.Color:=clwindow;
CBOHouse.Color:=clwindow;
// checks if the username is changed.
if vwUsername.Caption <> edtLoginName.Text then
// if it has been changed it calls a function from the database module which
//checks that another user doesnt currently occupy the username the user is
//changing to (all usernames must be unique).
// doesUsernameExist is false if the username doesnt exist and true if it does.
DoesUsernameExist:=FCheckersDB.DoesUsernameExist(edtLoginName.Text)
else
// if the username hasnt been changed doesUsernameExist = false.
doesUsernameExist:=false;
// checks if the username doesnt exist and all the details have been filled in.
if (DoesUsernameExist=false)
and (edtPassword.Text<>'')
and (edtForename.text<>'')
and (edtLoginName.Text<>'')
and (edtsurname.Text<>'')
and (edteMail.Text<>'')
and (((CBOHouse.itemindex+1)= 1)
or ((CBOHouse.itemindex+1)= 2)
or ((CBOHouse.itemindex+1)= 3)
or ((CBOHouse.itemindex+1)= 4)) then
begin
// checks the user wants to edit the user.
  buttonSelected := MessageDlg('Are You Sure you want to Edit this user?',mtCustom, [mbYes,mbNo,mbCancel], 0);
  if buttonSelected = mrYes then
    begin
    // runs if the user clicks yes.
    // checks if the combo box is checked.
      if CBAdmin.Checked = false then
      // if not then UType = 2 (non Admin).
        UType := 2
      else
      // if so then UType = 1 (Admin).
        UType := 1;
      // calls a function from the database module which gets the user ID for the
      // user being edited.
      Uid := FCheckersDb.getUserIdforUsername(vwUsername.Caption);
      FCheckersDb.loadUserDetails(Uid);
      // calls a function from the database module which changes the data of the user
      // to the new edited data.
      FCheckersDb.setUserDetails(edtPassword.Text,edtForename.Text,edtLoginName.Text,edtsurname.Text,edteMail.Text,UType,(CBOHouse.ItemIndex+1));
      showmessage('User Updated');
      // changes which panels are visible
      pnlUserAddEdit.Visible := false;
      pnlUserview.Visible := true;
      // refreshes the user list box.
      RefreshUsersList;
      LBUsers.ItemIndex:=-1;
      // resets the edit and view panels.
      resetEditPanel;
      resetViewPanel;
    end
    else
    begin
    // runs if user says no to edit user.
      showmessage('User has not been changed');
    end;
end
else
  begin
  // runs if the username already exists.
    showmessage('The Login Name must be unique and there must be no blank fields');
    // changes the color of edit boxes with blank fields to clred.
        if (DoesUsernameExist=true) then
          edtLoginName.color:=clRed;
        if (edtPassword.Text='') then
          edtPassword.Color:=clRed;
        if (edtForename.text='') then
          edtForename.Color:=clRed;
        if (edtLoginName.Text='') then
          edtLoginName.Color:=clRed;
        if (edtsurname.Text='') then
          edtsurname.Color:=clRed;
        if (edteMail.Text='') then
          edteMail.Color:=clRed;
        if CBOHouse.itemindex<0 then
          CBOHouse.Color:=clRed;
  end;
end;

procedure TfrmUsers.btnClearUsersClick(Sender: TObject);
// ***********************************************
// Description: deletes all the users and scores (excluding the master account).
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
bRtn:boolean;
buttonselected: Integer;
begin
// checks with the user.
  buttonSelected := MessageDlg('Are You Sure you want to to delete all the current users and scores',mtCustom, [mbYes,mbNo,mbCancel], 0);
  if buttonSelected = mrYes then
    begin
    // if they click yes it calls a function from the database module which
    // deletes all the users.
      bRtn:=FCheckersDB.CreateTableUsers;
    end;
end;

procedure TfrmUsers.btnAddUserClick(Sender: TObject);
// ***********************************************
// Description: adds a new user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  UType:integer;
  DoesUsernameExist:boolean;
begin
// sets all the edit box colors to clwindow.
edtAddPassword.Color:=clwindow;
edtAddForename.Color:=clwindow;
edtAddUsername.Color:=clwindow;
edtAddsurname.Color:=clwindow;
edtAddeMail.Color:=clwindow;
CBAddHouse.Color:=clwindow;
// calls a database function which checks if the username already exists.
DoesUsernameExist:=FCheckersDB.DoesUsernameExist(edtAddUsername.Text);
// checks if the username doesnt exist and all the details have been filled in.
if (DoesUsernameExist=false)
and (edtAddPassword.Text<>'')
and (edtAddForename.text<>'')
and (edtAddUsername.Text<>'')
and (edtAddsurname.Text<>'')
and (edtAddeMail.Text<>'')
and (((CBAddHouse.itemindex+1)= 1)
or ((CBAddHouse.itemindex+1)= 2)
or ((CBAddHouse.itemindex+1)= 3)
or ((CBAddHouse.itemindex+1)= 4)) then
begin
  // checks if the combo box is checked.
  if CBAddUserType.Checked = false then
  // if not then UType = 2 (non Admin)
    UType := 2
  else
  // if so then UType = 1 (Admin).
    UType := 1;
 // calls a database procedure that adds the new user to the database.
  FCheckersDb.addNewUser(edtAddPassword.Text,edtAddForename.text,edtAddUsername.Text,edtAddsurname.Text,edtAddeMail.Text,UType,(CBAddHouse.itemindex+1));
  // changes which panels are visible.
  pnlUserAddEdit.Visible := false;
  pnlUserview.Visible := true;
  pnlAddUser.Visible := false;
  // refreshes the user list box.
  RefreshUsersList;
  // sets the list box item index equal to -1
  LBUsers.ItemIndex:=-1;
  // resets the add and view panels.
  resetAddPanel;
  resetViewPanel;
end
else
begin
// runs if the username already exists.
  showmessage('To Add a New user they must have a unique Login Name and no fields missing');
  // all the blank fields will turn clred.
          if (DoesUsernameExist=true) then
          edtAddUsername.color:=clRed;
        if (edtAddPassword.Text='') then
          edtAddPassword.Color:=clRed;
        if (edtAddForename.text='') then
          edtAddForename.Color:=clRed;
        if (edtAddUsername.Text='') then
          edtAddUsername.Color:=clRed;
        if (edtAddsurname.Text='') then
          edtAddsurname.Color:=clRed;
        if (edtaddeMail.Text='') then
          edtAddeMail.Color:=clRed;
        if CBAddHouse.itemindex<0 then
          CBAddHouse.Color:=clRed;
end;
end;

procedure TfrmUsers.FormShow(Sender: TObject);
// ***********************************************
// Description: sets everything on the form to its starting state.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  RefreshUsersList;
  LBUsers.ItemIndex:=-1;
  resetViewPanel;
end;

procedure TfrmUsers.LBUsersClick(Sender: TObject);
// ***********************************************
// Description: fills in the users details into labels and edit boxes when
// a user is clicked in the list box.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  Uid:integer;
  bRtn:boolean;
begin
// gets the user ID from the items objects, which is set to the user ID when
// added to the list box.
  Uid := integer(LBUsers.Items.Objects[LBUsers.ItemIndex]);
  bRtn := FCheckersDb.loadUserDetails(Uid);
  // changes the text/captions of the edit boxes/labels to the users details.
  frmUsers.vwForename.caption := FCheckersDb.getForeName;
  frmUsers.vwSurname.caption := FCheckersDb.getSurname;
  frmUsers.vwUserName.caption := FCheckersDb.getLoginName;
  frmUsers.vwEmail.caption := FCheckersDb.getEmail;
  frmUsers.vwHouse.Caption := inttostr(FCheckersDb.getHouseId);
  frmUsers.edtForename.text := FCheckersDb.getForeName;
  frmUsers.edtSurname.text := FCheckersDb.getSurname;
  frmUsers.edtLoginName.text := FCheckersDb.getLoginName;
  frmUsers.edtEmail.text := FCheckersDb.getEmail;
  frmUsers.edtPassword.text := FCheckersDb.getPassword;
  frmUsers.CBOHouse.ItemIndex := FCheckersDb.getHouseId-1;
  frmUsers.lblLastLogin.Caption:= datetostr(FCheckersDb.getLastLoginDate);
  frmUsers.lblScore.Caption := inttostr(FCheckersDb.getPoints);
  frmUsers.lblGamesPlayed.Caption := inttostr(FCheckersDb.getNoOfGamesPlayed);
  case FCheckersDb.getUserType of
  1:
    begin
      frmUsers.cbAdmin.Checked := true;
      frmUsers.vwUserType.Caption := 'Admin';
    end;
  2:
    begin
      frmUsers.cbAdmin.Checked := false;
      frmUsers.vwUserType.Caption := 'Student';
    end;
  end;
end;

end.
