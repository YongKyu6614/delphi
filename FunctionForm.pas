unit FunctionForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    edtName: TEdit;
    Button1: TButton;
    edtAge: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Button3: TButton;
    rdoMan: TRadioButton;
    rdoWoman: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    // 이 폼(유닛)에서 사용하는 변수와 함수를 선언
    function GetNameMsg(AName: string): string;

    function GetAgeMsg(AName: string; AAge: Integer): string;
    { TODO :
        (2-1) GetUserInfoMsg 함수를 선언
          파라메터: 이름(문자), 나이(숫자), 남자여부(Boolean)
          반환값: 문자열(메시지)
        (2-2) 함수 선언 후 Ctrl + Shift + C를 눌러 구현부 생성
    }
    function GetUserInfoMsg(AName: string; AAge: Integer; IsMan: Boolean): string;

  public
    // 다른 유닛에서 참조할 수 있는 변수와 함수 선언
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function TForm2.GetNameMsg(AName: string): string;
var
  Msg: string;
begin
  Msg := '안녕하세요. ';
  Msg := Msg + AName + '님';

  Result := Msg;
end;



function TForm2.GetAgeMsg(AName: string; AAge: Integer): string;
var
  Msg, Adult: string;
begin
  Msg := GetNameMsg(AName); // 인사말 표시는 재사용
  Msg := Msg + #13#10;      // 한줄 내려쓰기(일명 캐리지리턴)

  if AAge >= 20 then
    Adult:= '성인'
    else
    Adult :='미성년' ;

  Msg:= Msg + AName+ '님은 '+ IntToStr(AAge)+'세로 '+ Adult +'입니다.';

{ TODO :
    (1) Msg 변수에 '(AName)님은 (AAge)세로 (성인/미성년)입니다.' 메시지 추가
        if 문을 이용해 20세 이상(>=)인 경우 성인으로 판단
        문자열과 변수를 조합(더하기) 하세요.
        정수는 문자로 변환(IntToStr)하세요.
  }

  Result := Msg;


end;


procedure TForm2.Button1Click(Sender: TObject);
var
  Name, Msg: string;
begin
  Name := edtName.Text;

  Msg := GetNameMsg(Name);

  ShowMessage(Msg);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Name, Msg: string;
  Age: Integer;
begin
  Name := edtName.Text;
  Age := StrToInt(edtAge.Text);

  Msg := GetAgeMsg(Name, Age);

  ShowMessage(Msg);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  Name, Msg: string;
  Age: Integer;
  IsMan: Boolean;
begin
  Name := edtName.Text;
  Age := StrToInt(edtAge.Text);
  IsMan := rdoMan.Checked;

{ TODO :
    (2) 인사말 + 성인여부 확인 + 성별확인 메시지를
        반환하는 함수(GetUserInfoMsg)를 작성하세요
  Msg := GetUserInfoMsg(Name, Age, IsMan);
}

  Msg := GetUserInfoMsg(Name, Age, IsMan);
  ShowMessage(Msg);
end;
function TForm2.GetUserInfoMsg(AName: string; AAge: Integer; IsMan: Boolean): string;

var
 Msg,Adult: String;

 begin
    Msg := GetNameMsg(AName);
  Msg := Msg + #13#10;

   if rdoMan.Checked then
    begin
      isMan := true;
      Msg := Msg + AName + '님은 남자입니다.';
    end
  else
    begin
      isMan := false;
      Msg := Msg + AName + '님은 여자입니다.';
    end;
    Msg := GetNameMsg(AName); // 인사말 표시는 재사용
  Msg := Msg + #13#10;      // 한줄 내려쓰기(일명 캐리지리턴)

  if AAge >= 20 then
    Adult:= '성인'
    else
    Adult :='미성년' ;

  Msg:= Msg + AName+ '님은 '+ IntToStr(AAge)+'세로 '+ Adult +'입니다.';
    Result := Msg;

 end;
 { TODO :
  (2-2) GetUserInfoMsg 함수의 구현부에는
    인사말 + 성인여부 확인 + 성별확인 메시지를 반환하도록 작성하세요.
    이미 구현된 GetNameMsg, GetAgeMsg 등을 재사용하세요.
}


end.
