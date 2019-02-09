unit HouseReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, math,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ProjDB;

type

  TfrmHouseReport = class(TForm)
    ImgPieChart: TImage;
    DBGridHouseReport: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure ShowPieChart();
    procedure FormCreate(Sender: TObject);



  private
    { Private declarations }
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmHouseReport: TfrmHouseReport;

implementation

{$R *.dfm}

procedure DrawPieSlice(const Canvas: TCanvas; const Center: TPoint; const Radius: Integer; const StartDegrees, StopDegrees: Double);
// ***********************************************
// description: This procedure uses constants passed in to draw a pie chart
// using bitmap manipulation.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
const
  Offset = 0;  {to make 0 degrees start to the right}
var
  X1, X2, X3, X4: Integer;
  Y1, Y2, Y3, Y4: Integer;
begin
// this code was found in various places online, and it the pie property of the
// canvas to create a section of the pie chart.
  X1 := Center.X - Radius;
  Y1 := Center.Y - Radius;
  X2 := Center.X + Radius;
  Y2 := Center.Y + Radius;

  X3 := Center.X + Round(Radius * Cos(degtorad(Offset + StartDegrees)));
  Y3 := Center.y - Round(Radius * Sin(DegToRad(Offset + StartDegrees)));
  X4 := Center.X + Round(Radius * Cos(DegToRad(Offset + StopDegrees)));
  Y4 := Center.y - Round(Radius * Sin(DegToRad(Offset + StopDegrees)));
  Canvas.Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
end;




procedure TfrmHouseReport.ShowPieChart();
// ***********************************************
// description: This procedure sets up the properties of the bitmap and bitmap
// canvas and calls the procedure DrawPieSlice to draw the pie chart.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  Center: TPoint;
  Bitmap: TBitmap;
  Radius: Integer;
  XPos:   Integer;
  PieSliceSizes:TDataModule1.TPieSliceSize;
begin
  Bitmap := TBitmap.Create;
  try
    PieSliceSizes:=FCheckersDB.getPieSliceSize;
    // sets the bitmap width and height to the width and height of the image.
    Bitmap.Width  := ImgPieChart.Width;
    Bitmap.Height := ImgPieChart.Height;
    Bitmap.PixelFormat := pf24bit;
    // the radius equals half of the smallest dimension.
    if Bitmap.Width < Bitmap.Height then
      begin
        Radius := Bitmap.Width div 2;
      end
    else
      begin
        Radius := Bitmap.Height div 2;
      end;
    Center := Point(Radius, Radius);
    Bitmap.Canvas.Pen.Color := clwhite;

    Bitmap.Canvas.Pen.Width := 2;
    // sets the canvas brush color before drawing a pie slice using the procedure
    // DrawPieSlice.
    // I used paint to get the hex number for the Red.
    Bitmap.Canvas.Brush.Color := $342D86;
    DrawPieSlice (Bitmap.Canvas, Center, Radius, 0, PieSliceSizes.Davis);
    // I used paint to get the hex number for the Green.
    Bitmap.Canvas.Brush.Color := $31A841;
    DrawPieSlice (Bitmap.Canvas, Center, Radius, (PieSliceSizes.Davis+1), (PieSliceSizes.Davis+PieSliceSizes.Curnock+1));
    // I used paint to get the hex number for the Blue.
    Bitmap.Canvas.Brush.Color := $B0612B;
    DrawPieSlice (Bitmap.Canvas, Center, Radius, (PieSliceSizes.Davis+PieSliceSizes.Curnock+2), (PieSliceSizes.Davis+PieSliceSizes.Curnock+PieSliceSizes.Evers+2));
    // I used paint to get the hex number for the Yellow.
    Bitmap.Canvas.Brush.Color := $1FE3EC;
    DrawPieSlice (Bitmap.Canvas, Center, Radius, (PieSliceSizes.Davis+PieSliceSizes.Curnock+PieSliceSizes.Evers+3), (PieSliceSizes.Davis+PieSliceSizes.Curnock+PieSliceSizes.Evers+PieSliceSizes.Patterson+4));

    XPos := Trunc(Radius * 2.2);

    Bitmap.Canvas.Brush.Color := clwhite;
    // This writes the house names on the canvas in color as a key for the pie
    // slices.
    Bitmap.Canvas.Font.Color := $342D86;  // Red
    Bitmap.canvas.TextOut(XPos, 20,'Davis');

    Bitmap.Canvas.Font.Color := $31A841;  // Green
    Bitmap.canvas.TextOut(XPos, 40, 'Curnock');

    Bitmap.Canvas.Font.Color := $B0612B;  // Blue
    Bitmap.canvas.TextOut(XPos, 60, 'Evers');

    Bitmap.Canvas.Font.Color := $1FE3EC;  // Yellow
    Bitmap.canvas.TextOut(XPos, 80, 'Patterson');
    // sets the image imgPieChart's picture graphic to the bitmap.
    ImgPieChart.Picture.Graphic := Bitmap;
  finally
    Bitmap.Free;
  end;

end;

procedure TfrmHouseReport.FormCreate(Sender: TObject);
// ***********************************************
// description: Positions the form in the center of the screen
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmHouseReport.Position:=PoScreenCenter;
end;

procedure TfrmHouseReport.FormShow(Sender: TObject);
// ***********************************************
// description: This procedure sorts out the DBGrid and changes the titles of
// some of the columns.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// calls the procedure ShowPieChart
ShowPieChart;
// Call a databse procedure which changes the Queries SQL so the DBGrid shows
// the correct information.
FCheckersDb.HouseReportTable;
// changes some of the DBGrid's columns' titles and widths.
DBGridHouseReport.Columns[0].Title.caption:='House Name';
DBGridHouseReport.Columns[1].Title.caption:='Total Score';
DBGridHouseReport.Columns[0].Width:=100;
DBGridHouseReport.Columns[1].Width:=100;
end;
end.
