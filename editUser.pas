unit editUser;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, Variants, Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ProjDb;

type
  TfrmEditUser = class(TForm)
  edtForename: TEdit;
  edtSurname: TEdit;
  edtLoginName: TEdit;
  edtEmail: TEdit;
  edtPassword: TEdit;
  cbAdmin: TCheckBox;
  lblForename: TLabel;
  lblPassword: TLabel;
  lblUsername: TLabel;
  lblEmail: TLabel;
  lblSurname: TLabel;
  CBOHouse: TComboBox;
  lblHouse: TLabel;
  btnEdit: TButton;
  btnCancel: TButton;
  procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
//  FCheckersDb: TCheckersDb;
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmEditUser: TfrmEditUser;
  //MyDBClass: TDataModule1;
  //MyDBClass: DBClass.TDataModule1;
implementation

//uses
{$R *.dfm}

procedure TfrmEditUser.btnEditClick(Sender: TObject);
var
Uid,UType:integer;
begin
  if CBAdmin.Checked = false then
    UType:=2
  else
    UType:=1;
    Uid:=FCheckersDb.getUserIdforUsername(edtLoginName.Text);
    FCheckersDb.loadUserDetails(Uid);
    FCheckersDb.setUserDetails(edtPassword.Text,edtForename.Text,edtLoginName.Text,edtsurname.Text,edteMail.Text,UType,CBOHouse.ItemIndex);
  end;
end.
