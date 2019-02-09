unit CheckersClass;
// ***********************************************
// description: An array of this class is created at run time. Each class
// represents a checker.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
interface

uses
sysutils;

type
 TChecker = class(Tobject)
   private
   mPlayerNum: byte;
   mIsMoveFrom: boolean;
   mIsMoveTo: boolean;
   public
   procedure setPlayerNum(playerNum:byte);
   Function getPlayerNum : byte;
   Procedure setIsMoveFrom(IsMoveFrom : boolean);
   function getIsMoveFrom : boolean;
   Procedure setIsMoveTo(IsMoveTo : boolean);
   Function getIsMoveTo : boolean;
   procedure Reset;
 end;

implementation


procedure TChecker.Reset();
// ***********************************************
// description: This procedure sets the variable misMoveFrom and misMoveTo, which
// are local to this module, to false.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  misMoveFrom := false;
  misMoveTo := false;
end;

procedure TChecker.setPlayerNum(playerNum:byte);
// ***********************************************
// description: Makes the local variable mPlayerNum equal to the value passed
// into the procedure.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mPlayerNum := PlayerNum;
end;

Function TChecker.getPlayerNum : byte;
// ***********************************************
// description: This function passes out the variable mPlayerNum as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  result := mPlayerNum;
end;

Procedure TChecker.setIsMoveFrom(IsMoveFrom : boolean);
// ***********************************************
// description: Makes the local variable mIsMoveFrom equal to the value passed
// into the procedure.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mIsMoveFrom := IsMoveFrom;
end;

function TChecker.getIsMoveFrom : boolean;
// ***********************************************
// description: This function passes out the variable mIsMoveFrom as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result := mIsMoveFrom;
end;

Procedure TChecker.setIsMoveTo(IsMoveTo : boolean);
// ***********************************************
// description: Makes the local variable mIsMoveTo equal to the value passed
// into the procedure.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  mIsMoveTo := IsMoveTo
end;

Function TChecker.getIsMoveTo : boolean;
// ***********************************************
// description: This function passes out the variable mIsMoveTo as its result.
// last modified: 2/jan/2014
// joe withers
// ***********************************************
begin
  Result := mIsMoveTo
end;


end.
