unit EditQuestions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEditQuestions = class(TForm)
    edtQuestion: TEdit;
    edtAnswer3: TEdit;
    edtAnswer2: TEdit;
    edtAnswer1: TEdit;
    lblAnswer3: TLabel;
    lblAnswer2: TLabel;
    lblAnswer1: TLabel;
    lblQuestion: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditQuestions: TfrmEditQuestions;

implementation

{$R *.dfm}

end.
