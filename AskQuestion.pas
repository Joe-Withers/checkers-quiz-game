unit AskQuestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, math, projDb,
  Vcl.Imaging.pngimage, Vcl.Menus,Gsetups;

{uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, math, projDb,
  pngimage, Menus,Gsetups;}

type
  TfrmAskQuestion = class(TForm)
    lblQuestion: TLabel;
    Shape1: TShape;
    lblTimeLeft: TLabel;
    PBTimeLeft: TProgressBar;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Panel1: TPanel;
    lblAnswer1: TLabel;
    lblAnswer2: TLabel;
    lblAnswer3: TLabel;
    imgA1: TImage;
    imgA3: TImage;
    imgA2: TImage;
    imgNotPicked: TImage;
    imgCorrect: TImage;
    imgIncorrect: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgA1Click(Sender: TObject);
    procedure imgA3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure imgA2Click(Sender: TObject);

  private
    { Private declarations }
    FCheckersDb: TDataModule1;
    correctAnswer:integer;
  public
    { Public declarations }
  end;

var
  frmAskQuestion: TfrmAskQuestion;

implementation

{$R *.dfm}

procedure TfrmAskQuestion.FormShow(Sender: TObject);
// ***********************************************
// description: selects a random question to ask and display's the question
// and possible answers.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
HowManyQuestions,n,Qid,i:integer;
x:boolean;
begin
// sets all the images to there default pictures (i.e not picked)
  imgA1.picture:=imgNotPicked.Picture;
  imgA2.picture:=imgNotPicked.Picture;
  imgA3.picture:=imgNotPicked.Picture;
// resets the global procedure setLastQuestionCorrect to its starting value (false)
  gsetups.setLastQuestionCorrect(false);
//sets the shape label and position bars colours
  shape1.brush.color:=clcream;
  lbltimeleft.color:=clcream;
  PBtimeleft.barcolor:=clGreen;
// sets the position bars starting position.
  PBtimeleft.Position:=30;
// sets the lable for the time remainings' caption to its start value.
  lbltimeleft.Caption:=inttostr(30);
// enables the timer which will start the countdown for the time to answer the question.
  timer1.Enabled:=true;
  lblQuestion.width:=346;
  lblAnswer1.width:=346;
  lblAnswer2.width:=346;
  lblAnswer3.width:=346;
// gets how many questions there are in the databse by calling the function
//from the database module called getHowmanyquestions.
  HowManyQuestions:=FCheckersDb.getHowmanyquestions;
// randomises a number between 1 and the number of questions stored in the database.
  n:=randomrange(1,HowManyQuestions);
// get's the question Id of the nth question
  Qid:=FCheckersDb.getNthQuestionId(n);
// calls anothere databse function which loads the Question details of the question
// with the QId selected.
  x:=FCheckersDb.loadQuestionDetails(Qid);
// sets the label for the question to the question text
  lblQuestion.Caption:=FCheckersDb.getQuestionText;

// this randomly arranges the 3 possible answers and puts the text in the
// corresponding labels
  i:=0;
  randomize;
  i:=randomrange(1,3);
  case i of
  1:
    begin
    lblAnswer1.Caption:=FCheckersDb.getAnswer1Text;
    lblAnswer2.Caption:=FCheckersDb.getAnswer2Text;
    lblAnswer3.Caption:=FCheckersDb.getAnswer3Text;
    end;
  2:
    begin
    lblAnswer3.Caption:=FCheckersDb.getAnswer3Text;
    lblAnswer2.Caption:=FCheckersDb.getAnswer1Text;
    lblAnswer1.Caption:=FCheckersDb.getAnswer2Text;
    end;
  3:
    begin
    lblAnswer3.Caption:=FCheckersDb.getAnswer1Text;
    lblAnswer1.Caption:=FCheckersDb.getAnswer3Text;
    lblAnswer2.Caption:=FCheckersDb.getAnswer2Text;
    end;
  end;

  correctAnswer:=i;
end;

procedure TfrmAskQuestion.imgA1Click(Sender: TObject);
// ***********************************************
// description: runs when answer 1 is selected (by clicking on the corresponding
// image). It checks to see whether it was answered correctly and visualy
// shows the user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// stops the timer (countdown) because a answer has been selected.
  timer1.Enabled:=false;
  if (correctAnswer = 1) then
    begin
    //Runs if answer 1 is correct
    // Sets the global procedure setLastQuestionCorrect to true so that the form
    // frmCheckers knows it has been answered correctly.
      gsetups.setLastQuestionCorrect(true);
      FCheckersDb.setQuestionCorrect(getUserAnsweringQuestion);
      imgA1.picture:=imgcorrect.Picture;
    end
  else
    begin
    //Runs if answer 1 is incorrect
    FCheckersDb.setQuestioninCorrect(getUserAnsweringQuestion);
    // changes the incorrect answers corresponding images to an image to
    // represent that it is incorrect, and the correct answers corresponding
    // image to an image representing it is correct.
      imgA1.picture:=imgIncorrect.Picture;
      imgA1.Refresh;
      sleep(1000);
      case CorrectAnswer of
        2:
        begin
        imgA2.picture:=imgcorrect.Picture;
        imgA3.picture:=imgincorrect.Picture;
        end;
        3:
        begin
        imgA3.picture:=imgcorrect.Picture;
        imgA2.picture:=imgincorrect.Picture;
        end;
    end;
  end;
  imgA1.Refresh;
  imgA2.Refresh;
  imgA3.Refresh;

  sleep(2000);
  frmAskQuestion.Close;


  end;

procedure TfrmAskQuestion.imgA3Click(Sender: TObject);
// ***********************************************
// description: runs when answer 3 is selected (by clicking on the corresponding
// image). It checks to see whether it was answered correctly and visualy
// shows the user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// stops the timer (countdown) because a answer has been selected.
  timer1.Enabled:=false;
  if (correctAnswer = 3) then
    begin
    //Runs if answer 3 is correct
    // Sets the global procedure setLastQuestionCorrect to true so that the form
    // frmCheckers knows it has been answered correctly.
      gsetups.setLastQuestionCorrect(true);
      FCheckersDb.setQuestionCorrect(getUserAnsweringQuestion);
      imgA3.picture:=imgCorrect.Picture;
    end
  else
    begin
    //Runs if answer 3 is incorrect
    FCheckersDb.setQuestioninCorrect(getUserAnsweringQuestion);
    // changes the incorrect answers corresponding images to an image to
    // represent that it is incorrect, and the correct answers corresponding
    // image to an image representing it is correct.
    imgA3.picture:=imginCorrect.Picture;
    imgA3.Refresh;
    sleep(1000);
    case CorrectAnswer of
      2:
      begin
      imgA2.picture:=imgCorrect.Picture;
      imgA1.picture:=imginCorrect.Picture;
      end;
      1:
      begin
      imgA1.picture:=imgCorrect.Picture;
      imgA2.picture:=imginCorrect.Picture;
      end;
    end;
  end;
  imgA1.Refresh;
  imgA2.Refresh;
  imgA3.Refresh;
  sleep(2000);
  frmAskQuestion.Close;
end;


procedure TfrmAskQuestion.imgA2Click(Sender: TObject);
// ***********************************************
// description: runs when answer 2 is selected (by clicking on the corresponding
// image). It checks to see whether it was answered correctly and visualy
// shows the user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// stops the timer (countdown) because a answer has been selected.
timer1.Enabled:=false;
if (correctAnswer = 2) then
begin
//Runs if answer 2 is correct
// Sets the global procedure setLastQuestionCorrect to true so that the form
// frmCheckers knows it has been answered correctly.
gsetups.setLastQuestionCorrect(true);
FCheckersDb.setQuestionCorrect(getUserAnsweringQuestion);
imgA2.picture:=imgCorrect.Picture;
end
else
begin
//Runs if answer 2 is incorrect
FCheckersDb.setQuestioninCorrect(getUserAnsweringQuestion);
// changes the incorrect answers corresponding images to an image to
// represent that it is incorrect, and the correct answers corresponding
// image to an image representing it is correct.
  imgA2.picture:=imginCorrect.Picture;
  imgA2.Refresh;
  sleep(1000);
case CorrectAnswer of
1:
begin
imgA1.picture:=imgCorrect.Picture;
imgA3.picture:=imginCorrect.Picture;
end;
3:
begin
imgA3.picture:=imgCorrect.Picture;
imgA1.picture:=imginCorrect.Picture;
end;
end;
end;
  imgA1.Refresh;
  imgA2.Refresh;
  imgA3.Refresh;
  sleep(2000);
  frmAskQuestion.Close;
end;

procedure TfrmAskQuestion.Timer1Timer(Sender: TObject);
// ***********************************************
// description: a timer procedure which runs through every second. It is used
// to count down the timer for how long left the user has to answer the question.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// decreases the number shown by the label showing how many seconds left to answer by 1.
lbltimeleft.Caption:=inttostr(strtoint(lbltimeleft.Caption)-1);
// decreases the position bars position by 1.
PBtimeleft.Position:=(PBtimeleft.Position-1);
if lbltimeleft.Caption=inttostr(10) then
begin
// when the timer gets down to 10 second the colors of the shape, position bar
//and label change color.
shape1.brush.color:=clYellow;
PBtimeleft.barcolor:=clYellow;
lbltimeleft.color:=clYellow;
end;
if lbltimeleft.Caption=inttostr(5) then
begin
// when the timer gets down to 5 second the colors of the shape, position bar
//and label change color.
shape1.brush.color:=clred;
PBtimeleft.barcolor:=clred;
lbltimeleft.color:=clred;
end;
if lbltimeleft.Caption=inttostr(0) then
begin
// when the timer reaches 0 the timer is disable and the form is closed because
// they did not answer it in time.
  timer1.Enabled:=false;
  frmAskQuestion.Close;
end;
end;



end.

