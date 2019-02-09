unit Questions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, ProjDb;

  {uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, ProjDb;}

type
  TfrmQuestions = class(TForm)
  btnCloseForm: TButton;
  pnlEditQuestion: TPanel;
  Label10: TLabel;
  Label23: TLabel;
  btnSaveEditQuestion: TButton;
  btnCancelEditUser: TButton;
  btnRefreshUserList: TButton;
  btnNewUser: TButton;
  lblUsers: TLabel;
  Label1: TLabel;
  btnDeleteQuestion: TButton;
  Label2: TLabel;
  PnlAddQuestion: TPanel;
  Label3: TLabel;
  Label4: TLabel;
  Label5: TLabel;
  Label6: TLabel;
  btnSaveAddQuestion: TButton;
  btnCancelAdd: TButton;
  edtQ: TRichEdit;
  edtA1: TRichEdit;
  edtA2: TRichEdit;
  edtA3: TRichEdit;
  edtAddQ: TRichEdit;
  edtAddA1: TRichEdit;
  edtAddA2: TRichEdit;
  edtAddA3: TRichEdit;
    LBQuestions: TListBox;
  procedure btnRefreshUserListClick(Sender: TObject);
  procedure LBQuestionsClick(Sender: TObject);
  procedure btneditClick(Sender: TObject);
  procedure btnNewUserClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure btnSaveAddQuestionClick(Sender: TObject);
  procedure btnSaveEditQuestionClick(Sender: TObject);
  procedure btnDeleteQuestionClick(Sender: TObject);
  procedure btnCancelEditUserClick(Sender: TObject);
  procedure btnCancelAddClick(Sender: TObject);
  procedure RefreshQuestionsList();
    procedure btnCloseFormClick(Sender: TObject);

//type
//  QuestionDetail = record
//  QId:  integer;
//  QText: string;
//end;


  private
//  FCheckersDb: TCheckersDb;
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmQuestions: TfrmQuestions;

implementation

{$R *.dfm}

procedure TfrmQuestions.RefreshQuestionsList();
// ***********************************************
// Description: This procedure refreshes the list of questions in the list box.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  QuestionText:string;
  QuestionId:integer;
  iCnt:integer;
  tArrQuestions:TDataModule1.tArrQuestion;
begin
// Clears the list box.
  frmQuestions.LBQuestions.Items.Clear;
// gets an array of all the questions.
  tArrQuestions := FCheckersDb.getQuestionList();
// writes each question into the list box 1 by 1 using a for loop.
for iCnt := Low(tArrQuestions) to High(tArrQuestions) do
  begin
    QuestionText := tArrQuestions[iCnt].QText;
    QuestionId := tArrQuestions[iCnt].QId;
    // this adds an item object which is the Question ID corresponding to to
    // question text.
    frmQuestions.LBQuestions.Items.Addobject(QuestionText,TObject(QuestionId));
  end;
end;

procedure TfrmQuestions.btnCancelAddClick(Sender: TObject);
// ***********************************************
// Description: changes the panels that are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  pnlEditQuestion.Visible := false;
  pnlAddQuestion.Visible := false;
end;

procedure TfrmQuestions.btnCancelEditUserClick(Sender: TObject);
// ***********************************************
// Description: changes the panels that are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  pnlEditQuestion.Visible := false;
  pnlAddQuestion.Visible := false;
end;

procedure TfrmQuestions.btnCloseFormClick(Sender: TObject);
// ***********************************************
// Description: Closes the form.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmQuestions.Close;
end;

procedure TfrmQuestions.btnDeleteQuestionClick(Sender: TObject);
// ***********************************************
// Description: This procedure deletes a selected question.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// passes the tag property of edtQ which is set to the same as the Question ID.
// The procedure called deletes the question from the database.
  FCheckersDb.deleteQuestion(edtQ.Tag);
  // changes the panels that are visible.
  pnlEditQuestion.Visible := false;
  pnlAddQuestion.Visible := false;
  // calls the procedure refreshQuestionsList.
  refreshQuestionsList;
end;

procedure TfrmQuestions.btneditClick(Sender: TObject);
// ***********************************************
// Description: changes the panels that are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  pnlEditQuestion.Visible := true;
  pnlAddQuestion.Visible := false;
end;

procedure TfrmQuestions.btnNewUserClick(Sender: TObject);
// ***********************************************
// Description: changes the panels that are visible.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  btnDeleteQuestion.Visible := false;
  pnlEditQuestion.Visible := false;
  pnlAddQuestion.Visible := true;
end;

procedure TfrmQuestions.btnRefreshUserListClick(Sender: TObject);
// ***********************************************
// Description: calls the procedure refreshQuestionsList.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  refreshQuestionsList;
end;


procedure TfrmQuestions.btnSaveAddQuestionClick(Sender: TObject);
// ***********************************************
// Description: This adds a question and 3 answers.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  QuestionExists:boolean;
begin
// checks for empty data.
  if (edtAddQ.Text<>'') and (edtAddA1.text<>'')
  and (edtAddA2.text<>'') and (edtAddA3.text<>'') then
    begin
    // runs if none of the data is empty.
    // calls the function addNewQuestion which returns true if the question exists
    // or adds the question to the database if it does not exist.
      QuestionExists := FCheckersDb.addNewQuestion(edtAddQ.Text,edtAddA1.text,edtAddA2.text,edtAddA3.text);
      if QuestionExists = false then
        begin
        // runs if the question does not exist.
        // sets all the edit boxes text to blank.
          edtAddQ.Text := '';
          edtAddA1.text := '';
          edtAddA2.text := '';
          edtAddA3.text := '';
          // changes the panels/buttons that are visible.
          pnlEditQuestion.Visible := false;
          pnlAddQuestion.Visible := false;
          btnDeleteQuestion.Visible :=  false;
        end
      else
      // runs if the question does exist.
        showmessage('Question Already Exists');
        // refreshes the list box containing the questions.
      refreshQuestionsList;
    end
  else
  // runs if 1 or more of the data fields where blank.
    showmessage('All fields must be filled in');
end;

procedure TfrmQuestions.btnSaveEditQuestionClick(Sender: TObject);
// ***********************************************
// Description: This edits a question/the answers.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  QuestionExists:boolean;
begin
// checks for empty data.
  if (edtQ.Text<>'') and (edtA1.text<>'')
  and (edtA2.text<>'') and (edtA3.text<>'') then
    begin
    // runs if none of the data is empty.
      // Call the function to update the question, will return false if ok and
      // will return true if the question already exists.
      QuestionExists := FCheckersDb.editQuestion(edtQ.Text, edtA1.text, edtA2.text, edtA3.text, edtQ.tag);
      if QuestionExists = false then
        begin
        // runs if the question does not exist.
        // sets all the edit boxes text to blank.
          edtQ.Text := '';
          edtA1.text := '';
          edtA2.text := '';
          edtA3.text := '';
          // changes the panels/buttons that are visible.
          pnlEditQuestion.Visible := false;
          pnlAddQuestion.Visible := false;
          btnDeleteQuestion.Visible := false;
        end
      else
      // runs if the question does exist.
        showmessage('Sorry but that Question already exists');
      // refreshes the list box containing the questions.
      refreshQuestionsList;
    end
  else
  // runs if 1 or more of the data fields where blank.
    showmessage('All fields must be filled in');
end;

procedure TfrmQuestions.FormShow(Sender: TObject);
// ***********************************************
// Description: resets the form to its starting state.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  // clear the text of the question controls
  edtAddQ.Text := '';
  edtAddA1.text := '';
  edtAddA2.text := '';
  edtAddA3.text := '';
  edtQ.Text := '';
  edtA1.text := '';
  edtA2.text := '';
  edtA3.text := '';
  // refreshes the list box containing the questions.
  RefreshQuestionsList;
end;

procedure TfrmQuestions.LBQuestionsClick(Sender: TObject);
// ***********************************************
// Description: this procedure runs when an item in the list box is clicked.
// The information about the item selected is then written into edit boxes.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  i:integer;
  bRtn:boolean;
  QId:integer;
begin
  // Hide/Show controls, user is loading a question
  // therefore we can edit or delete it (but not add)
  btndeleteQuestion.Visible := true;
  pnlEditQuestion.Visible := true;
  pnlAddQuestion.Visible := false;
  // this gets the Question ID of the questions by looking at the object for the
  // item selected from the List box.
  Qid := integer(LBQuestions.Items.Objects[LBQuestions.ItemIndex]);
  // Tell the database class to load a question
  bRtn := FCheckersDb.loadQuestionDetails(QId);
  frmQuestions.edtQ.tag := Qid;

  // Go get the question and answers from the Db Class
  // fill the text controls (text controls are RichText type
  // to allow multiple lines)
  frmQuestions.edtQ.Text := FCheckersDb.getQuestionText;
  frmQuestions.edtA1.Text := FCheckersDb.getAnswer1Text;
  frmQuestions.edtA2.Text := FCheckersDb.getAnswer2Text;
  frmQuestions.edtA3.Text := FCheckersDb.getAnswer3Text;
end;

end.
