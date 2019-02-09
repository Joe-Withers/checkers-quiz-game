unit theGameClass;

interface

uses
  sysutils;

type
  TGame = class(Tobject)
  private
    mPlayersGo: integer;
    mMoveFromCheckerNum: integer;
    mMoveToCheckerNum: integer;
    mPlayerLogingOn: integer;
    mPlayer1Score:integer;
    mPlayer2Score:integer;
  public
    Procedure setWhichPlayersGo(playersGo: integer);
    function getWhichPlayersGo: integer;
    procedure setMoveFromChecker(MoveFromCheckerNum: integer);
    function getMoveFromChekerRow: integer;
    function getMoveFromChekerColumn: integer;
    procedure setMoveToChecker(MoveToCheckerNum: integer);
    function getMoveToChekerRow: integer;
    function getMoveToChekerColumn: integer;
    function MoveIsOneStep: boolean;
    function MoveIsTwoSteps: boolean;
    function isMoveFromSelected(): boolean;
    function getMoveFromCheker: integer;
    procedure setPlayer1Score(Player1Score: integer);
    function getPlayer1Score: integer;
    procedure setPlayer2Score(Player2Score: integer);
    function getPlayer2Score: integer;
  end;

implementation

function getColumnForChecker(checkerNumber: integer): integer;
// ***********************************************
// description: This function takes the checker number and calculates what
// column it will be in on the checkers board. Then passes that out as its
// result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  iColumn, x: integer;
begin
// an algorithm to give the column of the checker piece.
  x := checkerNumber mod 8;
  case x of
    1, 2, 3, 4:
      iColumn := x * 2;
    5, 6, 7:
      iColumn := (x * 2) - 9;
    0:
      iColumn := 7;
  end;
  result := iColumn;
end;

function getRowForChecker(checkerNumber: integer): integer;
// ***********************************************
// description: This function takes the checker number and calculates what
// row it will be in on the checkers board. Then passes that out as its
// result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
var
  iRow: integer;
begin
// an algorithm to get the row number from the checker piece number.
  iRow := ((checkerNumber - 1) div 4) + 1;
  result := iRow;
end;

Procedure TGame.setWhichPlayersGo(playersGo: integer);
// ***********************************************
// description: This procedure sets the variable mPlayersGo, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mPlayersGo := playersGo;
end;

function TGame.getWhichPlayersGo: integer;
// ***********************************************
// description: This function passes out the variable mPlayersGo as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := mPlayersGo;
end;

procedure TGame.setMoveFromChecker(MoveFromCheckerNum: integer);
// ***********************************************
// description: This procedure sets the variable mMoveFromCheckerNum, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mMoveFromCheckerNum := MoveFromCheckerNum;
end;

function TGame.getMoveFromCheker: integer;
// ***********************************************
// description: This function passes out the variable mMoveFromCheckerNum as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := mMoveFromCheckerNum;
end;

function TGame.getMoveFromChekerColumn: integer;
// ***********************************************
// description: This function passes out the column number of the checker number
// moving from as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := getColumnForChecker(mMoveFromCheckerNum);
end;

function TGame.getMoveFromChekerRow: integer;
// ***********************************************
// description: This function passes out the row number of the checker number
// moving from as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := getRowForChecker(mMoveFromCheckerNum);
end;

procedure TGame.setMoveToChecker(MoveToCheckerNum: integer);
// ***********************************************
// description: This procedure sets the variable mMoveToCheckerNum, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mMoveToCheckerNum := MoveToCheckerNum;
end;

function TGame.getMoveToChekerColumn: integer;
// ***********************************************
// description: This function passes out the colomn number of the checker number
// moving to as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := getColumnForChecker(mMoveToCheckerNum);
end;

function TGame.getMoveToChekerRow: integer;
// ***********************************************
// description: This function passes out the row number of the checker number
// moving to as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := getRowForChecker(mMoveToCheckerNum);
end;

function TGame.MoveIsTwoSteps: boolean;
// ***********************************************
// description: This function checks if the move is 2 spaces and in the forward
// direction.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// this first if statment is checking that the move from piece and move to piece
//are 2 spaces apart.
  if (((getColumnForChecker(mMoveToCheckerNum) - getColumnForChecker
    (mMoveFromCheckerNum)) = 2) or ((getColumnForChecker(mMoveFromCheckerNum) -
    getColumnForChecker(mMoveToCheckerNum)) = 2)) and
    (((getRowForChecker(mMoveToCheckerNum) -
    getRowForChecker(mMoveFromCheckerNum)) = 2) or
    ((getRowForChecker(mMoveFromCheckerNum) -
    getRowForChecker(mMoveToCheckerNum)) = 2)) then
    begin
    // runs if the move is 2 spaces.
    // checks that the move is in the forward direction for the player moving.
      if (mPlayersGo = 1) and (mMovetocheckerNum < mMoveFromCheckerNum) then
      // if the move is forward result = true.
        result := true
      else if (mPlayersGo = 2) and (mMovetocheckerNum > mMoveFromCheckerNum) then
      // if the move is forward result = true.
        result := true
      else
      // if the move is not forward result = false.
        result := false;
      end
  else
  // if the move is not 2 spaces result = false.
    result := false;
end;

function TGame.MoveIsOneStep: boolean;
// ***********************************************
// description: This function checks if the move is 1 space and in the forward
// direction.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
// this first if statment is checking if the move from piece and move to piece
//are 1 space apart.
  if (((getColumnForChecker(mMoveToCheckerNum) - getColumnForChecker
    (mMoveFromCheckerNum)) = 1) or ((getColumnForChecker(mMoveFromCheckerNum) -
    getColumnForChecker(mMoveToCheckerNum)) = 1)) and
    (((getRowForChecker(mMoveToCheckerNum) -
    getRowForChecker(mMoveFromCheckerNum)) = 1) or
    ((getRowForChecker(mMoveFromCheckerNum) -
    getRowForChecker(mMoveToCheckerNum)) = 1)) then
    begin
    // runs if the move is 1 space.
    // checks that the move is in the forward direction for the player moving.
      if (mPlayersGo = 1) and (mMovetocheckerNum < mMoveFromCheckerNum) then
      // if the move is forward result = true.
        result := true
      else if (mPlayersGo = 2) and (mMovetocheckerNum > mMoveFromCheckerNum) then
      // if the move is forward result = true.
        result := true
      else
      // if the move is not forward result = false.
        result := false;
    end
  else
  // if the move is not 1 space result = false.
    result := false;
end;

function TGame.isMoveFromSelected(): boolean;
// ***********************************************
// description: a function to check if a move from piece is selected.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  if mMoveFromCheckerNum = 0 then
  // returns false if piece is not slected.
    result := false
  else
  // returns true if piece is slected.
    result := true;
end;

procedure TGame.setPlayer1Score(Player1Score: integer);
// ***********************************************
// description: This procedure sets the variable mPlayer1Score, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mPlayer1Score := Player1Score;
end;

function TGame.getPlayer1Score: integer;
// ***********************************************
// description: This function passes out the variable mPlayer1Score as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := mPlayer1Score;
end;

procedure TGame.setPlayer2Score(Player2Score: integer);
// ***********************************************
// description: This procedure sets the variable mPlayer2Score, which
// is local to this module, to the value passed in.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mPlayer2Score := Player2Score;
end;

function TGame.getPlayer2Score: integer;
// ***********************************************
// description: This function passes out the variable mPlayer2Score as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := mPlayer2Score;
end;

end.
