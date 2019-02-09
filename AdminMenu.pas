unit AdminMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Users;
//school
{uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Users; }

type
  TfrmAdminMenu = class(TForm)
    btnUsers: TButton;
    btnQuestions: TButton;
    procedure btnUsersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminMenu: TfrmAdminMenu;

implementation

{$R *.dfm}

procedure TfrmAdminMenu.btnUsersClick(Sender: TObject);
begin
frmUsers.showmodal;
end;

end.
