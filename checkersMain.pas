unit checkersMain;

interface
//home
uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.StdCtrls, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.GIFImg,
  Math, CheckersClass, theGameClass, Login, Vcl.Menus, Questions,
  Users, GsetUps, ProjDb, AskQuestion, UserReport, HouseReport;


//school
{uses
  Windows, Messages,
  SysUtils, Variants, Classes, Graphics,
  StdCtrls, Controls, Forms, Dialogs, jpeg, ExtCtrls,
  ComCtrls, GIFImg,
  Math, CheckersClass, theGameClass, Login, Menus, Questions,
  Users, GsetUps, ProjDb, AskQuestion, UserReport, HouseReport;}

//Variables Global to this form
var
  imgCheckersArray: array of TImage;
  PieceSelected: boolean;
  MyChecker: array of TChecker;
  MyGame: TGame;

type
  TfrmCheckers = class(TForm)
  imgBlue: TImage;
  imgGreen: TImage;
    imgYellow: TImage;
  imgRed: TImage;
  imgChecker: TImage;
  imgBoard: TImage;
  btnReset: TButton;
  imgSelected: TImage;
  lblPlayer1sGo: TLabel;
  lblPlayer2sGo: TLabel;
  MainMenu1: TMainMenu;
  Menu1: TMenuItem;
  Help1: TMenuItem;
  GameRules1: TMenuItem;
    btnMenuRestesGame: TMenuItem;
    btnMenuEndGame: TMenuItem;
    btnMenuAdmin: TMenuItem;
    btnMenuClose: TMenuItem;
  lblError1: TLabel;
    btnMenuUsers: TMenuItem;
    btnMenuQuestions: TMenuItem;
    GBPlayer1: TGroupBox;
  lblPointsWord1: TLabel;
  PBP1: TProgressBar;
  btnLoginP1: TButton;
  lblScoreP1: TLabel;
  lblUsernameP1: TLabel;
  lblSurnameP1: TLabel;
  lblForenameP1: TLabel;
  lblUserTypeP1: TLabel;
    GBPlayer2: TGroupBox;
  lblPointsWord2: TLabel;
  lblScoreP2: TLabel;
  PBP2: TProgressBar;
  btnLoginP2: TButton;
  Timer1: TTimer;
    lblDBStatus: TLabel;
  imgCheckerP2: TImage;
  imgCheckerP1: TImage;
  lblHouseP1: TLabel;
  lblHouseP2: TLabel;
  lblSurnameP2: TLabel;
  lblForenameP2: TLabel;
  lblUsernameP2: TLabel;
  lblUserTypeP2: TLabel;
  imgBlack: TImage;
    btnMenuStudentReport: TMenuItem;
    btnMenuHouseReport: TMenuItem;
  class
  procedure imgCheckersArrayClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure btnResetClick(Sender: TObject);
  procedure LoadCheckers();
  procedure imgSelectedClick(Sender: TObject);
  procedure btnLoginP1Click(Sender: TObject);
  procedure btnLoginP2Click(Sender: TObject);
  procedure btnMenuUsersClick(Sender: TObject);
  procedure btnMenuQuestionsClick(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure Timer1Timer(Sender: TObject);
  procedure btnMenuCloseClick(Sender: TObject);
  procedure btnMenuEndGameClick(Sender: TObject);
  procedure btnMenuRestesGameClick(Sender: TObject);
  procedure GameRules1Click(Sender: TObject);
  procedure btnMenuStudentReportClick(Sender: TObject);
  procedure btnMenuHouseReportClick(Sender: TObject);

  private
    { Private declarations }
    FCheckersDb: TDataModule1;
  public
    { Public declarations }
  end;

var
  frmCheckers: TfrmCheckers;


  implementation


{$R *.dfm}



procedure ClearBoard();
// ***********************************************
// Description: This clears the board
// All 32 checkers are set to a blank image
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
iCnt:integer;
begin
  frmCheckers.imgCheckerP1.Picture := frmCheckers.imgChecker.Picture;
  frmCheckers.imgCheckerP2.Picture := frmCheckers.imgChecker.Picture;
  for ICnt := 1 to 32 do
  begin
    imgCheckersArray[iCnt].Picture := frmCheckers.imgChecker.Picture;
  end;
end;

function CanPlayer2DoubleTake(itemSelected:integer): Boolean;
// ***********************************************
// Description: Player 2 has just made a move, test to see if player 2 can take
// again, if so then it's still that players turn
// last modified: 6/feb/2014
// joe withers
// ***********************************************
var
ChecknotPiece1,ChecknotPiece2,CheckForPiece1,CheckForPiece2:integer;
begin
  Result := false;
  //this case statment find the 2 peices that have to be occupied by the
  //other players piece for there to be a double take available.
  //and the 2 placesthat must be emppty for a double take to be available.
  case itemselected of
  10,11,18,19:
    begin
      CheckForPiece1 := itemselected+5;
      CheckForPiece2 := itemselected+4;
      ChecknotPiece1 := itemselected+9;
      ChecknotPiece2 := itemselected+7;
    end;
  9,17:
    begin
      CheckForPiece1 := itemselected+5;
      CheckForPiece2 := itemselected+5;
      ChecknotPiece1 := itemselected+9;
      ChecknotPiece2 := itemselected+9;
    end;
  12,20:
    begin
      CheckForPiece1 := itemselected+4;
      CheckForPiece2 := itemselected+4;
      ChecknotPiece1 := itemselected+7;
      ChecknotPiece2 := itemselected+7;
    end;
  16,24:
    begin
      CheckForPiece1 := itemselected+3;
      CheckForPiece2 := itemselected+3;
      ChecknotPiece1 := itemselected+7;
      ChecknotPiece2 := itemselected+7;
    end;
  14,15,22,23:
    begin
      CheckForPiece1 := itemselected+3;
      CheckForPiece2 := itemselected+4;
      ChecknotPiece1 := itemselected+7;
      ChecknotPiece2 := itemselected+9;
    end;
  13,21:
    begin
      CheckForPiece1 := itemselected+4;
      CheckForPiece2 := itemselected+4;
      ChecknotPiece1 := itemselected+9;
      ChecknotPiece2 := itemselected+9;
    end;
  25,26,27,28,29,30,31,32:
    begin
    //a double take is not possible from any of these positions.
    CheckForPiece1 := 0;
    end;
  end;
  //if a double take is not possible CheckForPiece1 is set to 0 in the case statment.
  if CheckForpiece1<>0 then
    begin
    //this the actual check that the piece required to be an opposing player
    //and the piece required to be empty
      if ((MyChecker[CheckForPiece1].getPlayerNum=1) and (MyChecker[CheckNotPiece1].getPlayerNum=0))
      or ((MyChecker[CheckForPiece2].getPlayerNum=1) and (MyChecker[CheckNotPiece2].getPlayerNum=0)) then
        result := true
      else
        Result := false;
    end
  else
    result := false;
end;

function CanPlayer1DoubleTake(itemSelected:integer): Boolean;
// ***********************************************
// Description: Player 1 has just made a move, test to see if player 1 can take
// again, if so then it's still that players turn
// last modified: 6/feb/2014
// joe withers
// ***********************************************

var
ChecknotPiece1,ChecknotPiece2,CheckForPiece1,CheckForPiece2:integer;
begin
  Result := false;
  //this case statment find the 2 peices that have to be occupied by the
  //other players piece for there to be a double take available.
  //and the 2 places that must be emppty for a double take to be available.
  case itemselected of
  10,11,18,19:
    begin
      CheckForPiece1 := itemselected-3;
      CheckForPiece2 := itemselected-4;
      ChecknotPiece1 := itemselected-7;
      ChecknotPiece2 := itemselected-9;
    end;
  9,17:
    begin
      CheckForPiece1 := itemselected-3;
      CheckForPiece2 := itemselected-3;
      ChecknotPiece1 := itemselected-7;
      ChecknotPiece2 := itemselected-7;
    end;
  12,20:
    begin
      CheckForPiece1 := itemselected-4;
      CheckForPiece2 := itemselected-4;
      ChecknotPiece1 := itemselected-9;
      ChecknotPiece2 := itemselected-9;
    end;
  16,24:
    begin
      CheckForPiece1 := itemselected-5;
      CheckForPiece2 := itemselected-5;
      ChecknotPiece1 := itemselected-9;
      ChecknotPiece2 := itemselected-9;
    end;
  14,15,22,23:
    begin
      CheckForPiece1 := itemselected-5;
      CheckForPiece2 := itemselected-4;
      ChecknotPiece1 := itemselected-9;
      ChecknotPiece2 := itemselected-7;
    end;
  13,21:
    begin
      CheckForPiece1 := itemselected-4;
      CheckForPiece2 := itemselected-4;
      ChecknotPiece1 := itemselected-7;
      ChecknotPiece2 := itemselected-7;
    end;
  1,2,3,4,5,6,7,8:
    begin
      //a double take is not possible from any of these positions.
      CheckForPiece1 := 0;
    end;
  end;
  //if a double take is not possible CheckForPiece1 is set to 0 in the case statment.
  if CheckForpiece1<>0 then
    begin
    //this the actual check that the piece required to be an opposing player
    //and the piece required to be empty
      if ((MyChecker[CheckForPiece1].getPlayerNum=2) and (MyChecker[CheckNotPiece1].getPlayerNum=0))
      or ((MyChecker[CheckForPiece2].getPlayerNum=2) and (MyChecker[CheckNotPiece2].getPlayerNum=0)) then
        result := true
      else
        Result := false;
    end
  else
    Result := false;
end;

Procedure DisplayCheckers();
// ***********************************************
// description: This procedure sets the checkers of the players to the colour of
// their house.
// last modified: 15/jan/2014
// joe withers
// ***********************************************
var
  iCnt:integer;
  sHouse1:string;
  sHouse2:string;
begin
  // Determine the colour or the players checker
  // House colours are:
  //    Curnock   = Green
  //    Evers     = Blue
  //    Davis     = Red
  //    Patterson = Gold / Yellow
  //    Clash     = Black


  sHouse1 := frmCheckers.lblHouseP1.caption;
  If sHouse1 = 'Curnock' then
  //if they are in curnock the checker is green
    frmCheckers.imgCheckerP1.Picture := frmCheckers.imgGreen.Picture
  Else if sHouse1 = 'Evers' then
  //if they are in evers the checker is blue
    frmCheckers.imgCheckerP1.Picture := frmCheckers.imgBlue.Picture
  Else if sHouse1 = 'Davis' then
  //if they are in davis the checker is red
    frmCheckers.imgCheckerP1.Picture := frmCheckers.imgRed.Picture
  Else if sHouse1 = 'Patterson' then
  //if they are in patterson the checker is gold/yellow
    frmCheckers.imgCheckerP1.Picture := frmCheckers.imgYellow.Picture
  Else
  //if they are in none of these houses the checker is black.
    frmCheckers.imgCheckerP1.Picture := frmCheckers.imgBlack.Picture;

  sHouse2:= frmCheckers.lblHouseP2.caption;
  If sHouse2 = 'Curnock' then
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgGreen.Picture
  Else if sHouse2 = 'Evers' then
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgBlue.Picture
  Else if sHouse2 = 'Davis' then
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgRed.Picture
  Else if sHouse2 = 'Patterson' then
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgYellow.Picture
  Else
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgBlack.Picture;


  // Cant have the same colours so change PLayer 2 to black
  if sHouse1 = sHouse2 then
    frmCheckers.imgCheckerP2.Picture := frmCheckers.imgBlack.Picture;



  for ICnt := 1 to 32 do
  begin
  // This then sets all the player 1 and the player 2  pieces to the same
  // colour as their checker peice set above.
  // It also sets all the other peices to blank images.
    case MyChecker[iCnt].getPlayerNum of
    0:imgCheckersArray[iCnt].Picture := frmCheckers.imgChecker.Picture;
    1:imgCheckersArray[iCnt].Picture := frmCheckers.imgCheckerP1.Picture;
    2:imgCheckersArray[iCnt].Picture := frmCheckers.imgCheckerP2.Picture;
    end;
  end;

end;

procedure ResetBoard();
// ***********************************************
// Description: This sets the player numbers to 0 , 1 or 2 depending on their positions.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
iCnt:integer;
begin
      for iCnt := 1 to 32 do
      Begin
        MyChecker[iCnt].setIsMoveFrom(false);
        MyChecker[iCnt].setIsMoveTo(false);
          case iCnt of
          1..12:
            MyChecker[iCnt].setPlayerNum(2);
          13..20:
            MyChecker[iCnt].setPlayerNum(0);
          21..32:
            MyChecker[iCnt].setPlayerNum(1);
          end;
         MyChecker[iCnt].reset();
        end;

 end;

procedure ResetGame();
// ***********************************************
// Description: resets the game to it original starting state.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
iCnt:integer;
begin
  ResetBoard; //sets which checker pieces are which player
  DisplayCheckers; // makes player 1 position the player 1 checker image etc.
  //reseting scores
  Mygame.setPlayer1Score(0);
  Mygame.setPlayer2Score(0);
  //reseting Progress bar
  frmCheckers.PBP1.Position := MyGame.getPlayer1Score;
  frmCheckers.PBP2.Position := MyGame.getPlayer2Score;
  //reseting the score label
  frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
  frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
  //seting player 1's label to visible and player 2's not visible as player 1's go is first.
  frmCheckers.lblPlayer1sGo.Visible := true;
  frmCheckers.lblPlayer2sGo.Visible := false;
  for iCnt := 1 to 32 do
      begin
        //sets all the checkers move from and move to status to false.
        MyChecker[iCnt].setIsMoveFrom(false);
        MyChecker[iCnt].setIsMoveTo(false);
      end;
end;

procedure gameEnd();
// ***********************************************
// Description: checks each players score to see who has one and also adds scores
// and games played to the database.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
user1id,user2id:integer;
x:boolean;
Username:string;
  I: Integer;
begin
  if MyGame.getPlayer1Score > mygame.getPlayer2Score then
    showmessage('****WINNER****'+#13#10+'***Player 1***')
  else if MyGame.getPlayer1Score < mygame.getPlayer2Score then
    showmessage('****WINNER****'+#13#10+'***Player 2***')
  else if MyGame.getPlayer1Score = mygame.getPlayer2Score then
    showmessage('****DRAW****');

// the label frmCheckers.lblUserNameP1.caption is 'Username: ' then the actual user name.
// this for loop extracts the username from the label and stores it in the local variable Username.
i:=0;
for I := 0 to (length(frmCheckers.lblUserNameP1.caption)-12) do
begin
username:=username + frmCheckers.lblUserNameP1.caption[i+12];
end;

  // passes in username to a databse procedure to get the User Id
  User1Id:=ProjDb.DataModule1.getUserIdforUsername(Username);
  // passes in the User id to set that users User Details.
  x:=ProjDb.DataModule1.loadUserDetails(User1Id);
  // adding the game details ( such as games played and score) to the database.
  ProjDb.DataModule1.setUserGameDetails(1,MyGame.getPlayer1Score,User1Id,Now);

username:='';

// repeats for player 2
i:=0;
for I := 0 to (length(frmCheckers.lblUserNameP2.caption)-12) do
begin
username:=username + frmCheckers.lblUserNameP2.caption[i+12];
end;

  User2Id:=ProjDb.DataModule1.getUserIdforUsername(Username);
  x:=ProjDb.DataModule1.loadUserDetails(User2Id);
  ProjDb.DataModule1.setUserGameDetails(1,MyGame.getPlayer2Score,User2Id,Now);

  resetGame;
end;

class procedure TfrmCheckers.imgCheckersArrayClick(Sender: TObject);
// ***********************************************
// Description: This procedure runs when you click on one of the images created
// as an array of images on run time.
// last modified: 4/jan/2014
// joe withers
// ***********************************************
var
username:string;
ItemSelected: byte;
ChecknotPiece1,ChecknotPiece2,ChecknotPiece3,ChecknotPiece4,CheckForPiece1,CheckForPiece2,CheckForPiece3,CheckForPiece4,score1,score2,piecetotake,pieceTaken,iCnt: integer;
moveToselectedCheckerRow,MoveToselectedCheckerColumn,
User1id,User2id,i,MoveFromselectedCheckerRow,MoveFromselectedCheckerColumn:integer;
x,Player2HasPiece,Player1HasPiece:boolean;
begin
  frmCheckers.lblerror1.caption := '';
  pieceSelected := false;
  //TImage(Sender).Tag is the tag of the
  //image which i set as i created the images
  itemselected := TImage(Sender).Tag;

  if MyGame.isMoveFromSelected then
  begin
  //a move from is selected and it is not the selected piece.
  //therefore this is a MOVE TO.

          //if it is going to be a take it finds the piece to take so it can check
          //that it is a piece.
          case itemselected of
          1,2,3,4,9,10,11,12,17,18,19,20,25,26,27,28:
          piecetoTake := (((myGame.getMoveFromCheker)+itemselected+1) div 2);
          5,6,7,8,13,14,15,16,21,22,23,24,29,30,31,32:
          piecetoTake := (((myGame.getMoveFromCheker)+itemselected-1) div 2);
          end;
    MyGame.setMoveToChecker(itemselected);
    // check that is is a move of one space to an empty space.
    if (MyGame.Moveisonestep)
    and (MyChecker[itemselected].getPlayerNum = 0) then
      begin
        //move is one space to an empty space
        MyChecker[itemselected].setPlayerNum(MyChecker[myGame.getMoveFromCheker].getPlayerNum);
        MyChecker[myGame.getMoveFromCheker].setPlayerNum(0);
        // checks whether or not they are moving to and end space
          if ((MyGame.getWhichPlayersGo=1) and (itemselected = 1))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 2))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 3))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 4))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 32))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 31))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 30))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 29)) then
            begin
            // they have moved to an end space so ther piece is taken off the board
            // and points are awarded
              MyChecker[myGame.getMoveFromCheker].setPlayerNum(0);
              MyChecker[itemselected].setPlayerNum(0);
                if MyGame.getWhichPlayersGo=1 then
                begin
                  MyGame.setPlayer1Score((MyGame.getPlayer1Score)+15);
                  frmCheckers.PBP1.Position := MyGame.getPlayer1Score;
                  frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
                end
                else if MyGame.getWhichPlayersGo=2 then
                begin
                  MyGame.setPlayer2Score((MyGame.getPlayer2Score)+15);
                  frmCheckers.PBP2.Position := MyGame.getPlayer2Score;
                  frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
                end;
            end;
        //sets the previous move from piece to false
        MyChecker[myGame.getMoveFromCheker].setIsMoveFrom(false);
        //displays the board with the changed cheker positions.
        displaycheckers;
        mygame.setMoveFromChecker(0);
        frmCheckers.imgSelected.sendtoback;
        frmCheckers.imgSelected.visible := false;
        // changes which players go it is.
          case MyGame.getWhichPlayersGo of
            1:begin
              MyGame.setWhichPlayersGo(2);
              frmCheckers.lblplayer1sgo.visible := false;
              frmCheckers.lblplayer2sgo.visible := true;
            end;
            2:begin
              MyGame.setWhichPlayersGo(1);
              frmCheckers.lblplayer1sgo.visible := true;
              frmCheckers.lblplayer2sgo.visible := false;
            end;
          end;
      end
      // if the move isnt one space it checks if it is 2 spaces.
      else if (MyGame.moveistwosteps)
      and (MyChecker[itemselected].getPlayerNum = 0)
      and (MyChecker[piecetoTake].getPlayerNum <> 0)
      and (MyChecker[piecetotake].getPlayerNum <> MyGame.getWhichPlayersGo) then
      begin
        // the move is two spaces and there is an opponents piece inbetween
        // with an empty move to space, therefore it is a valid move

        // getting the player having the go's username.
        if MyGame.getWhichPlayersGo=1 then
            begin
            username:='';
            i:=0;
              for I := 0 to (length(frmCheckers.lblUserNameP1.caption)-12) do
                begin
                  username:=username + frmCheckers.lblUserNameP1.caption[i+12];
                end;
            User1Id:=ProjDb.DataModule1.getUserIdforUsername(Username);
            // passes in the user Id to a procedure which sets a functions value to the user Id.
            // this is because the question form needs to know the user answering the question
            // for when is adds questions correct and questions incorrect to the database.
            // This also avoids using global variables.
            SetUserAnsweringQuestion(User1id);
            end
        else if MyGame.getWhichPlayersGo=2 then
          begin
          username:='';
          i:=0;
            for I := 0 to (length(frmCheckers.lblUserNameP2.caption)-12) do
              begin
                username:=username + frmCheckers.lblUserNameP2.caption[i+12];
              end;
          User2Id:=ProjDb.DataModule1.getUserIdforUsername(Username);
          SetUserAnsweringQuestion(User2id);
          end;
        // opens the form to ask the question. this form is opend modal meaning
        // the code from this form will not continue to run untill the form has been closed
        frmAskQuestion.showmodal;

        // give the player points if they got the question correct.
        if Gsetups.getlastQuestionCorrect = true then
        begin
            if MyGame.getWhichPlayersGo=1 then
                    begin
                      MyGame.setPlayer1Score((MyGame.getPlayer1Score)+20);
                      frmCheckers.PBP1.Position := MyGame.getPlayer1Score;
                      frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
                    end
                    else if MyGame.getWhichPlayersGo=2 then
                    begin
                      MyGame.setPlayer2Score((MyGame.getPlayer2Score)+20);
                      frmCheckers.PBP2.Position := MyGame.getPlayer2Score;
                      frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
                    end;
            end;

          // changes which players go it is.
          if MyGame.getWhichPlayersGo=1 then
                begin
                  MyGame.setPlayer1Score((MyGame.getPlayer1Score)+5);
                  frmCheckers.PBP1.Position := MyGame.getPlayer1Score;
                  frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
                end
                else if MyGame.getWhichPlayersGo=2 then
                begin
                  MyGame.setPlayer2Score((MyGame.getPlayer2Score)+5);
                  frmCheckers.PBP2.Position := MyGame.getPlayer2Score;
                  frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
                end;

        MyChecker[itemselected].setPlayerNum(MyChecker[myGame.getMoveFromCheker].getPlayerNum);
        MyChecker[myGame.getMoveFromCheker].setPlayerNum(0);
        // case statement finds the piece being taken
        case itemselected of
          1,2,3,4,9,10,11,12,17,18,19,20,25,26,27,28:
            pieceTaken := (((myGame.getMoveFromCheker)+itemselected+1) div 2);
          5,6,7,8,13,14,15,16,21,22,23,24,29,30,31,32:
            pieceTaken := (((myGame.getMoveFromCheker)+itemselected-1) div 2);
        end;
        MyChecker[pieceTaken].setPlayerNum(0);
        // checks if the move to space is an end space.
          if ((MyGame.getWhichPlayersGo=1) and (itemselected = 1))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 2))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 3))
          or ((MyGame.getWhichPlayersGo=1) and (itemselected = 4))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 32))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 31))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 30))
          or ((MyGame.getWhichPlayersGo=2) and (itemselected = 29)) then
            begin
            // it is an end space so the players piece is removed from the board
            // and they gain extra points
              MyChecker[myGame.getMoveFromCheker].setPlayerNum(0);
              MyChecker[itemselected].setPlayerNum(0);
                if MyGame.getWhichPlayersGo=1 then
                begin
                  MyGame.setPlayer1Score((MyGame.getPlayer1Score)+15);
                  frmCheckers.PBP1.Position := MyGame.getPlayer1Score;
                  frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
                end
                else if MyGame.getWhichPlayersGo=2 then
                begin
                  MyGame.setPlayer2Score((MyGame.getPlayer2Score)+15);
                  frmCheckers.PBP2.Position := MyGame.getPlayer2Score;
                  frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
                end;
            end;

        MyChecker[myGame.getMoveFromCheker].setIsMoveFrom(false);
        displaycheckers;
        mygame.setMoveFromChecker(0);
        frmCheckers.imgSelected.sendtoback;
        frmCheckers.imgSelected.visible := false;

            case MyGame.getWhichPlayersGo of
            1:begin
            // checks if player 1 can double take.
                if Canplayer1doubletake(itemSelected)=false then
                  begin
                  // if they cannot then it changes to player 2's turn.
                    MyGame.setWhichPlayersGo(2);
                    frmCheckers.lblplayer1sgo.visible := false;
                    frmCheckers.lblplayer2sgo.visible := true;
                  end;
                end;
            2:begin
            // checks if player 2 can double take.
                if CanPlayer2DoubleTake(itemSelected)=false then
                  begin
                  // if they can't then it changes to player 1's turn.
                    MyGame.setWhichPlayersGo(1);
                    frmCheckers.lblplayer1sgo.visible := true;
                    frmCheckers.lblplayer2sgo.visible := false;
                  end;
              end;
           end;
      end
      else // means it is an invalid move
        begin

          frmCheckers.lblerror1.caption := 'Invalid Move';

        end
    end
  else // means that it is not a move too but they are selecting which peice to move from.
  begin
    if (MyChecker[itemselected].getPlayerNum = MyGame.getWhichPlayersGo)
    and (frmCheckers.btnLoginP1.Caption = 'Log out')
    and (frmCheckers.btnLoginP2.Caption = 'Log out') then
      begin
        MyChecker[itemselected].setIsMoveFrom(true);
        MyGame.setMoveFromChecker(itemselected);
        // puts the image for when a piece is selected on top of the selected piece.
        frmCheckers.imgSelected.left := imgCheckersArray[itemselected].left;
        frmCheckers.imgSelected.top := imgCheckersArray[itemselected].top;
        frmCheckers.imgSelected.bringtofront;
        frmCheckers.imgSelected.visible := true;
      end;
  end;

//if none of the checkers are player 1 then the variable Player1HasPiece
//is set to False
Player1HasPiece := False;
for iCnt := 1 to 32 do
  begin
    if MyChecker[iCnt].getPlayerNum=1 then
    Player1HasPiece := True;
  end;

//if none of the checkers are player 2 then the variable Player2HasPiece
//is set to False
Player2HasPiece := False;
for iCnt := 1 to 32 do
  begin
    if MyChecker[iCnt].getPlayerNum=2 then
    Player2HasPiece := True;
  end;

//if either of these variables are true then it ends the game.
if (Player2HasPiece=false) or (Player1HasPiece=false) then
begin
gameEnd;
end;

end;

procedure TfrmCheckers.imgSelectedClick(Sender: TObject);
// ***********************************************
// description: This runs when you click on the image which indicates a piece
// is selected. This simple sets that images' visiblity to false and sends it
// to the back, effectivley deselecting the piece from the view of the user.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
    MyChecker[myGame.getMoveFromCheker].setIsMoveFrom(false);
    mygame.setMoveFromChecker(0);
    // sends image to back and makes it invisible.
    frmCheckers.imgSelected.sendtoback;
    frmCheckers.imgSelected.visible := false;
end;


procedure TfrmCheckers.LoadCheckers();
// ***********************************************
// description: This procedure creats an array of TImage and sets all of its
// properties, such as size, position, tag etc.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  yCnt: Integer;
  xCnt: Integer;
  iCheckerCount: Integer;
  yRealStep: Single;
  xRealStep: Single;

  begin
  iCheckerCount := 0;
  SetLength(imgCheckersArray, 32);
  // xRealStep is set to the width of one square on the checkers board
  xRealStep := (imgBoard.Width / 8);
  // yRealStep is set to the hieght of one square on the checkers board
  yRealStep := (imgBoard.height / 8);

  //there are 4 checkers on each column (xCnt) and 8 columns (yCnt)
  for yCnt := 0 to 7 do
  begin
    for xCnt := 0 to 3 do
    begin
      inc(iCheckerCount);
      //creates a TImage imgCheckersArray[1..32]
      imgCheckersArray[iCheckerCount] := TImage.Create(self);
      //sets the tag of the image to iChcekersCount. This is so that on the
      //click event for one of these created images it can differentiate between
      //the different images and know which one has been clicked.
      imgCheckersArray[iCheckerCount].Tag := iCheckerCount;
      imgCheckersArray[iCheckerCount].stretch := true;
      //sets the onclick event for this image to imgCheckersArrayClick.
      imgCheckersArray[iCheckerCount].OnClick := imgCheckersArrayClick;
      imgCheckersArray[iCheckerCount].Transparent := false;
      //its parent is the form.
      imgCheckersArray[iCheckerCount].Parent := frmCheckers;
      // Make the checker a little smaller than the square (looks to big)
      imgCheckersArray[iCheckerCount].Width := Round(xRealStep -6);
      imgCheckersArray[iCheckerCount].height := Round(yRealStep -6);
      // Every alternate Row (Y) the column shifts over by 1 (the MOD 2 statement shifts it)
      imgCheckersArray[iCheckerCount].Left := (imgBoard.Left) + Round((xRealStep * (xCnt * 2)) + (((yCnt + 1) mod 2) * xRealStep)) + 3;
      // position top to bottom
      imgCheckersArray[iCheckerCount].Top := (imgBoard.Top) + Round(yRealStep * yCnt) + 2;

    end;
  end;
end;

procedure TfrmCheckers.btnMenuRestesGameClick(Sender: TObject);
// ***********************************************
// description: Resets the game. Scores not counted.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
buttonselected:integer;
begin
//Checks they want to reset the game.
buttonSelected := MessageDlg('Are You Sure you want to Reset the game? Your score will not be counted.',mtCustom, [mbYes,mbNo,mbCancel], 0);
if buttonSelected = mrYes then
  begin
  MyGame.setWhichPlayersGo(1);
  //if they click yes it runs the procedure ResetGame.
    resetGame;
  end;
end;

procedure TfrmCheckers.btnMenuEndGameClick(Sender: TObject);
// ***********************************************
// description: Resets the game. Scores counted.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
ButtonSelected:integer;
begin
//Checks they want to end the game.
buttonSelected := MessageDlg('Are You Sure you want to end the game?',mtCustom, [mbYes,mbNo,mbCancel], 0);
if buttonSelected = mrYes then
  begin
  MyGame.setWhichPlayersGo(1);
  //if they click yes it runs the procedure gameend.
    gameend;
  end;
end;

procedure TfrmCheckers.btnMenuQuestionsClick(Sender: TObject);
// ***********************************************
// description: Shows the admin form frmQuestions
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
setUserValidated(false);
// SetUserLoggingOn(3) means it is a admin logging on.
SetUserLoggingOn(3);
// opens up the frmLogin for the user to enter their user details.
frmLogin.ShowModal;
// if they are validated then it shows the form frmQuestions.
  if getUserValidated = true then
      begin
        frmQuestions.showmodal;
      end;
end;

procedure TfrmCheckers.btnMenuStudentReportClick(Sender: TObject);
// ***********************************************
// description: Shows the admin form frmUserReport
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
setUserValidated(false);
// SetUserLoggingOn(3) means it is a admin logging on.
SetUserLoggingOn(3);
// opens up the frmLogin for the user to enter their user details.
frmLogin.ShowModal;
// if they are validated then it shows the form frmUserReport.
  if getUserValidated = true then
  begin
    frmUserReport.showmodal;
  end;
end;

procedure TfrmCheckers.Timer1Timer(Sender: TObject);
// ***********************************************
// description: This runs as soon as the application is started and checks
// everything with the database is ok and it has a valid connection to it.
// NOTE: I had to run this code after the forms had been created and not on form
// form create because it connects to the database in this code.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  bRtn: Boolean;
  buttonSelected:integer;
begin
// disables the timer straight away so that there is no repeating of the procedure.
 Timer1.enabled:=false;

if (FCheckersDb.DoesCheckersDatabaseExist = false) then
  begin
      if (FCheckersDb.DoesBlankDatabaseExist = true) then
        begin
        // informs the user that the database file cannot be found and asks if they would
        // like a new blank database to be created (with all the tables and fields, and one master user).
        buttonSelected := MessageDlg('The file ' + FCheckersDB.getCheckersDBname + ' cannot be found, would you like a new blank database',mtCustom, [mbYes,mbNo], 0);
          if buttonSelected = mrYes then
            begin
            // runs if the user does want a new database created.
            //copy the blank database and create's a new one.
              FCheckersDb.CopyFile(FcheckersDB.getBlankDBname,FCheckersDB.getCheckersDBname);
            //puts all the correct tables in the databse.
              bRtn:=FCheckersDb.CreateTableUsers;
              bRtn:=FCheckersDb.CreateTableQuestions;
              bRtn:=FCheckersDb.CreateTableAnswers;
              bRtn:=FCheckersDb.CreateTableHouse;
              showmessage('A new database has been created'+#10#13+'   Username: admin'+#10#13+'   Password: admin');
            end
            else
            begin
            // runs if the user doesnt want a new database created.
              showmessage('Unable to continue without a '+FCheckersDB.getCheckersDBname+' file'+#10#13+'***For assisstance call your teacher***');
            // closes the application
              halt(0);
            end;
        end
        else
        begin
        // this runs if neither the actual database or the blank database can be found
        showmessage('Database is missing, check that checkers.mdb is saved in the same folder as this application');
        // closes the application
        halt(0);
        end;
  end;

  // NOTE: Have to do this after the form is visible otherwise get an exeption
  // runs a function in the database module which sets the connection string.
  bRtn := FCheckersDb.opendb();

  if bRtn = True then
    begin
      lblDBStatus.caption := 'Success, connected to database';
      lblDBStatus.font.color := clgreen;
    end
  else
    begin
      lblDBStatus.caption := 'Error, database error or missing';
      lblDBStatus.font.color := clred;
      // the file is 'possibly' corrupt so inform the user and close the application.
      showmessage('The file '+FCheckersDB.getCheckersDBname+' appears corrupt, please repair or delete this file and re-open this application');
      halt(0);
    end
end;

procedure TfrmCheckers.btnMenuUsersClick(Sender: TObject);
// ***********************************************
// description: shows the form frmUsers
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// SetUserLoggingOn(3) means it is a admin logging on.
setUserValidated(false);
// opens up the frmLogin for the user to enter their user details.
SetUserLoggingOn(3);
// if they are validated then it shows the form frmUserReport.
frmLogin.ShowModal;
  if getUserValidated = true then
      begin
        frmUsers.showmodal;
      end;
end;

procedure LoadCheckerClass();
// ***********************************************
// description: creates an array of the class TChecker
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  iCnt: Integer;
begin
  SetLength(MyChecker, 32);
  for iCnt := 1 to 32 do
  begin
  //creates MyChecker[1..32] of TChecker
    MyChecker[iCnt] := TChecker.Create;
  end;
end;


procedure TfrmCheckers.btnResetClick(Sender: TObject);
// ***********************************************
// description: Resets the checkers board
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  buttonselected: Integer;
begin
// if both players are logged in.
  if (btnLoginP1.Caption = 'Log out') and (btnLoginP2.Caption = 'Log out') then
    begin
      // checks they want to log out
      buttonSelected := MessageDlg('Are You Sure you want to end the game?',mtCustom, [mbYes,mbNo,mbCancel], 0);
      if buttonSelected = mrYes then
        begin
        //set the players go to player 1
        MyGame.setWhichPlayersGo(1);
        // calls the procedure gameend.
          gameEnd;
        end;
    end;
end;

procedure TfrmCheckers.btnMenuCloseClick(Sender: TObject);
// ***********************************************
// description: closes the application.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmCheckers.close;
end;

procedure TfrmCheckers.btnLoginP1Click(Sender: TObject);
// ***********************************************
// description: Player 1 Logs in or logs out if already logged in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
buttonselected:integer;
begin
  if btnLoginP1.Caption = 'Log out' then
    begin
    // runs if player 1 is already logged on.
    // checks if they want to log out.
        buttonSelected := MessageDlg('Are You Sure you want to Log Out, Any Unsaved game will not be counted',mtCustom, [mbYes,mbNo,mbCancel], 0);
        if buttonSelected = mrYes then
         begin
         // runs if user want's to log out.
         // runs procedure clearboard and resets the form.
          clearboard;
          btnReset.Visible := false;
          lblPlayer1sGo.Visible := false;
          lblPlayer2sGo.Visible := false;
          MyGame.setPlayer1Score(0);
          frmCheckers.lblScoreP1.caption := inttostr(MyGame.getPlayer1Score);
          lblUsernameP1.caption := '';
          lblForenameP1.caption := '';
          lblSurnameP1.caption := '';
          lblUserTypeP1.caption := '';
          lblHouseP1.caption := '';
          PBP1.Position:=0;
          btnLoginP1.Caption := 'Login';
         end;
    end
  else
    begin
    // runs if player 1 isnt logged in and is therefor logging in.
    setUserValidated(false);
    //SetUserLoggingOn(1) means player 1 is logging on.
      SetUserLoggingOn(1);
      FCheckersDb.setUserId(0);
      //validates user logging on using frmLogin
      frmLogin.ShowModal;
      if getUserValidated =true then
          begin
          // runs if the login has been validated
            btnLoginP1.caption := 'Log out';
            // sets label lblUsernameP1s' caption to Username : 'Their Username'
            lblUsernameP1.caption := 'Username : ' + FCheckersDb.getLoginName;
            // sets label lblForenameP1s' caption Forename : 'Their Forename'
            lblForenameP1.caption := 'Forename : ' + FCheckersDb.getForename;
            // sets label lblSurnameP1s' caption Surname : 'Their Surname'
            lblSurnameP1.caption := 'Surname : ' + FCheckersDb.getSurname;
            // sets label lblHouseP1 to the school house name the user's in.
            lblHouseP1.caption := FCheckersDb.getHouseName;
            lblHouseP1.tag := FCheckersDb.getHouseId;
            // sets label lblUserTypeP1 to the User type of that user.
            case FCheckersDb.getUserType of
              0:lblUserTypeP1.caption := '***Master***';
              1:lblUserTypeP1.caption := '***Admin***';
              2:lblUserTypeP1.caption := '***Student***';
            end;

            if btnLoginP2.Caption = 'Log out' then
            begin
             // runs if player 2 is logged in
             // call the procedure resetGame.
              resetGame;
              btnReset.Visible := true;
              lblPlayer1sGo.Visible := true;
              lblPlayer2sGo.Visible := false;
            end;
        end;

  end;

end;

procedure TfrmCheckers.btnLoginP2Click(Sender: TObject);
// ***********************************************
// description: Player 2 Logs in or logs out if already logged in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
buttonselected:integer;
begin

  if btnLoginP2.Caption = 'Log out' then
    begin
    // runs if player 2 is already logged on.
    // checks if they want to log out.
        buttonSelected := MessageDlg('Are You Sure you want to Log Out, Any Unsaved game will not be counted',mtCustom, [mbYes,mbNo,mbCancel], 0);
        if buttonSelected = mrYes then
         begin
         // runs if user want's to log out.
         // runs procedure clearboard and resets the form.
          clearboard;
          btnReset.Visible := false;
          lblPlayer1sGo.Visible := false;
          lblPlayer2sGo.Visible := false;
          MyGame.setPlayer2Score(0);
          frmCheckers.lblScoreP2.caption := inttostr(MyGame.getPlayer2Score);
          lblUsernameP2.caption := '';
          lblForenameP2.caption := '';
          lblSurnameP2.caption := '';
          lblUserTypeP2.caption := '';
          lblHouseP2.caption := '';
          PBP2.Position:=0;
          btnLoginP2.Caption := 'Login';
         end;
    end
  else
    begin
    // runs if player 2 isnt logged in and is therefor logging in.
    setUserValidated(false);
    FCheckersDb.setUserId(0);
    //SetUserLoggingOn(2) means player 2 is logging on.
      setUserLoggingOn(2);
      //validates user logging on using frmLogin
      frmLogin.ShowModal;
        if getUserValidated =true then
            begin
            // runs if the login has been validated
              btnLoginP2.caption := 'Log out';
              // sets label lblUsernameP2s' caption to Username : 'Their Username'
              lblUsernameP2.caption := 'Username : ' + FCheckersDb.getLoginName;
              // sets label lblForenameP2s' caption Forename : 'Their Forename'
              lblForenameP2.caption := 'Forename : ' + FCheckersDb.getForename;
              // sets label lblSurnameP2s' caption Surname : 'Their Surname'
              lblSurnameP2.caption := 'Surname : ' + FCheckersDb.getSurname;
              // sets label lblHouseP2 to the school house name the user's in.
              lblHouseP2.caption := FCheckersDb.getHouseName;
              lblHouseP2.tag := FCheckersDb.getHouseId;
            // sets label lblUserTypeP2 to the User type of that user.
              case FCheckersDb.getUserType of
                0:lblUserTypeP2.caption := '***Master***';
                1:lblUserTypeP2.caption := '***Admin***';
                2:lblUserTypeP2.caption := '***Student***';
              end;
              if btnLoginP1.Caption = 'Log out' then
              begin
             // runs if player 1 is logged in
             // call the procedure resetGame.
                resetGame;
                btnReset.Visible := true;
                lblPlayer1sGo.Visible := true;
                lblPlayer2sGo.Visible := false;
              end;
        end;
    end;
end;

procedure TfrmCheckers.FormClose(Sender: TObject; var Action: TCloseAction);
// ***********************************************
// description: when the program is closed it gives the user a warning and an
// option to stop it from closing.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  buttonselected: Integer;
begin
  buttonSelected := MessageDlg('Are You Sure you want to Exit, Any Unsaved game''s will not be counted',mtCustom, [mbYes,mbNo,mbCancel], 0);
  if buttonSelected <> mrYes then
    begin
    // stops the program closing.
      Action := caNone;
    end;
end;


procedure TfrmCheckers.FormCreate(Sender: TObject);
// ***********************************************
// description: sets up the main form
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  I: Integer;
  yRealStep: Single;
  xRealStep: Single;
begin
// maximises the window
  frmCheckers.WindowState := wsMaximized;
  // centers the board
  imgboard.Left:=((frmCheckers.Width div 2)-(imgboard.Width div 2));
  // positions GBPlayer1, GBPlayer2, lblPlayer1sGo, lblPlayer2sGo and lblDBStatus
  GBPlayer1.Left:=((imgboard.Left-GBPlayer1.Width)-30);
  GBPlayer2.Left:=((imgboard.Left+imgboard.Width)+30);
  lblPlayer1sGo.Left:=GBPlayer1.Left;
  lblPlayer2sGo.Left:=GBPlayer2.Left;
  lblDBStatus.Left:=imgboard.Left;
  // Calls the procedure LoadCheckersClass
  LoadCheckerClass;
  // Calls the procedure LoadCheckers
  LoadCheckers;
  // Calls the procedure ResetBoard
  Resetboard;
  // Makes an instance of the class TGame
  MyGame := TGame.Create  ;
  mygame.setMoveFromChecker(0);
  MyGame.setWhichPlayersGo(1);
  frmCheckers.visible := True;

  // sets the size of the image imgSelected
  xRealStep := (imgBoard.Width / 8);
  yRealStep := (imgBoard.height / 8);
  imgselected.Width := Round(xRealStep -6);
  imgselected.height := Round(yRealStep -6);

end;



procedure TfrmCheckers.GameRules1Click(Sender: TObject);
// ***********************************************
// description: shows a message box with the game rules.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
s:string;
begin
//creates a string which is the game rule
s:='***GAME RULE''S***'+ #13#10 +'Each Player Takes it in turns to Move thier Piece. ';
s:=s+'You can only move your piece diagonaly by one space at a time, unless you are taking the other players piece. ';
s:=s+ #13#10 +'You can take the other player if it has a piece one space from one of your pieces and there is a empty square behind it.';
s:=s+ #13#10 +'If you can take again imidiatly after a take you can have another go to take again.';
showmessage(s);
end;

procedure TfrmCheckers.btnMenuHouseReportClick(Sender: TObject);
// ***********************************************
// description: shows the form frmHouseReport
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
frmHouseReport.showmodal;
end;

end.
