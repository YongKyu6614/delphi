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
    // �� ��(����)���� ����ϴ� ������ �Լ��� ����
    function GetNameMsg(AName: string): string;

    function GetAgeMsg(AName: string; AAge: Integer): string;
    { TODO :
        (2-1) GetUserInfoMsg �Լ��� ����
          �Ķ����: �̸�(����), ����(����), ���ڿ���(Boolean)
          ��ȯ��: ���ڿ�(�޽���)
        (2-2) �Լ� ���� �� Ctrl + Shift + C�� ���� ������ ����
    }
    function GetUserInfoMsg(AName: string; AAge: Integer; IsMan: Boolean): string;

  public
    // �ٸ� ���ֿ��� ������ �� �ִ� ������ �Լ� ����
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function TForm2.GetNameMsg(AName: string): string;
var
  Msg: string;
begin
  Msg := '�ȳ��ϼ���. ';
  Msg := Msg + AName + '��';

  Result := Msg;
end;



function TForm2.GetAgeMsg(AName: string; AAge: Integer): string;
var
  Msg, Adult: string;
begin
  Msg := GetNameMsg(AName); // �λ縻 ǥ�ô� ����
  Msg := Msg + #13#10;      // ���� ��������(�ϸ� ĳ��������)

  if AAge >= 20 then
    Adult:= '����'
    else
    Adult :='�̼���' ;

  Msg:= Msg + AName+ '���� '+ IntToStr(AAge)+'���� '+ Adult +'�Դϴ�.';

{ TODO :
    (1) Msg ������ '(AName)���� (AAge)���� (����/�̼���)�Դϴ�.' �޽��� �߰�
        if ���� �̿��� 20�� �̻�(>=)�� ��� �������� �Ǵ�
        ���ڿ��� ������ ����(���ϱ�) �ϼ���.
        ������ ���ڷ� ��ȯ(IntToStr)�ϼ���.
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
    (2) �λ縻 + ���ο��� Ȯ�� + ����Ȯ�� �޽�����
        ��ȯ�ϴ� �Լ�(GetUserInfoMsg)�� �ۼ��ϼ���
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
      Msg := Msg + AName + '���� �����Դϴ�.';
    end
  else
    begin
      isMan := false;
      Msg := Msg + AName + '���� �����Դϴ�.';
    end;
    Msg := GetNameMsg(AName); // �λ縻 ǥ�ô� ����
  Msg := Msg + #13#10;      // ���� ��������(�ϸ� ĳ��������)

  if AAge >= 20 then
    Adult:= '����'
    else
    Adult :='�̼���' ;

  Msg:= Msg + AName+ '���� '+ IntToStr(AAge)+'���� '+ Adult +'�Դϴ�.';
    Result := Msg;

 end;
 { TODO :
  (2-2) GetUserInfoMsg �Լ��� �����ο���
    �λ縻 + ���ο��� Ȯ�� + ����Ȯ�� �޽����� ��ȯ�ϵ��� �ۼ��ϼ���.
    �̹� ������ GetNameMsg, GetAgeMsg ���� �����ϼ���.
}


end.