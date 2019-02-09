unit UserReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ProjDB, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmUserReport = class(TForm)
    Label2: TLabel;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    RGOrderBy: TRadioGroup;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RGOrderByClick(Sender: TObject);
    procedure customizingDBGrid(OrderByField:string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmUserReport: TfrmUserReport;

implementation

{$R *.dfm}

procedure TfrmUserReport.customizingDBGrid(OrderByField:string);
// ***********************************************
// description: customizes the titles and size of the DBGrid.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// runs a database procedure that changes the SQL so it shows the relevant details
// for the user reprt table.
// the OrderByField passed into the procedure is the field that the DBGrid will
// be ordered by.
FCheckersDb.UserReportTable(OrderByField);
// changes the titles of the DBGrid.
DBGrid1.Columns[0].Title.caption:='Login Name';
DBGrid1.Columns[1].Title.caption:='Forename';
DBGrid1.Columns[2].Title.caption:='Surname';
DBGrid1.Columns[3].Title.caption:='Total Score';
DBGrid1.Columns[4].Title.caption:='Games Played';
DBGrid1.Columns[5].Title.caption:='Average Score per game';
DBGrid1.Columns[6].Title.caption:='Correct Answers (%)';
// Chnages the width of the columns of the DBGrid.
DBGrid1.Columns[0].Width:=100;
DBGrid1.Columns[1].Width:=100;
DBGrid1.Columns[2].Width:=150;
DBGrid1.Columns[3].Width:=75;
DBGrid1.Columns[4].width:=100;
DBGrid1.Columns[5].Width:=150;
DBGrid1.Columns[6].Width:=150;
end;

procedure TfrmUserReport.FormCreate(Sender: TObject);
// ***********************************************
// description: sets the form position to the centre of the screen.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmUserReport.Position:=PoScreenCenter;
end;

procedure TfrmUserReport.FormShow(Sender: TObject);
// ***********************************************
// description:
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
orderbyfield:string;
begin
// sets the radio groups item index to 1.
RGOrderBy.ItemIndex:=1;
// calls the procedure CustomizingDBGrid ordering the DBGrid by the field points.
CustomizingDBGrid('Points');
end;

procedure TfrmUserReport.RGOrderByClick(Sender: TObject);
// ***********************************************
// description: This changes how the DBGrid is ordered.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// the order by feild is dependant on the RGOrderBy Item selected.
if RGOrderBy.ItemIndex = 0 then
begin
// calls the procedure customizingDBGrid ordering by (Points / NoOfGamesPlayed)
customizingDBGrid('(Points / NoOfGamesPlayed)');
end
else if RGOrderBy.ItemIndex = 1 then
begin
// calls the procedure customizingDBGrid ordering by Points
customizingDBGrid('Points');
end
else if RGOrderBy.ItemIndex = 2 then
begin
// calls the procedure customizingDBGrid ordering by
// ((QuestionsCorrect * 100) / (QuestionsCorrect + QuestionsIncorrect))
customizingDBGrid('((QuestionsCorrect * 100) / (QuestionsCorrect + QuestionsIncorrect))');
end

end;

end.
