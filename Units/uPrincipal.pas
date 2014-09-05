unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, Menus, StrUtils;

type
  TForm_Principal = class(TForm)
    RichEdit_SQL: TRichEdit;
    Label_SQL: TLabel;
    RichEdit_Variaveis: TRichEdit;
    Label_Variaveis: TLabel;
    RichEdit_Resultado: TRichEdit;
    Label_Resultado: TLabel;
    SpeedButton_Substituir: TSpeedButton;
    SpeedButton_Copiar: TSpeedButton;
    PopupMenu_OpcoesRichText: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Recortar1: TMenuItem;
    Copiar1: TMenuItem;
    Colar1: TMenuItem;
    N2: TMenuItem;
    Carrregararquivo1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton_SubstituirClick(Sender: TObject);
    procedure SpeedButton_CopiarClick(Sender: TObject);
    procedure RichEdit_ResultadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu_OpcoesRichTextPopup(Sender: TObject);
    procedure RichEdit_ResultadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Abrir1Click(Sender: TObject);
  private
    { Private declarations }
    procedure validaPreenchimentoCampos(pRichEdit: TRichEdit; pNomeCampo: String);
    procedure defineVariaveis(pRichEdit: TRichEdit);
    procedure buscaVariaveis(var pRichEditVariaveis: TRichEdit; var pRichEditSQL: TRichEdit);
    procedure substituiVariaveis(pRichEdit_SQL: TRichEdit; pRichEdit_Variaveis: TRichEdit; pRichEdit_Resultado: TRichEdit);
  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;
  arrayVariaveis: array of array of string;

implementation

uses TypInfo, uVisualizador;

{$R *.dfm}

procedure TForm_Principal.substituiVariaveis(pRichEdit_SQL: TRichEdit; pRichEdit_Variaveis: TRichEdit; pRichEdit_Resultado: TRichEdit);
begin
  ;
end;

procedure TForm_Principal.buscaVariaveis(var pRichEditVariaveis: TRichEdit; var pRichEditSQL: TRichEdit);
var
  contador: Integer;
  varNaoEncontradas: Array of String;

  retornoPos: Integer;

  function retornaVarNaoEncontradas(index: Integer): string;
  begin

    if index <= Length(varNaoEncontradas)-1 then
    begin
      if (index > 0) then
        Result:= Result + ', ';

      Result:= Result + varNaoEncontradas[index] + retornaVarNaoEncontradas(index+1);
    end;

  end;

begin
  varNaoEncontradas:= nil;
  contador:= 0;
  //varNaoEncontradas.

  defineVariaveis(pRichEditVariaveis);

  for contador:= 0 to (Length(arrayVariaveis)-1) do
  begin
    if RichEdit_SQL.FindText(arrayVariaveis[contador], 0, Length(RichEdit_SQL.Text), [stWholeWord]) = -1 then
    begin
      SetLength(varNaoEncontradas, Length(varNaoEncontradas)+1);
      varNaoEncontradas[Length(varNaoEncontradas)-1] := arrayVariaveis[contador];
    end;
  end;

  if Length(varNaoEncontradas) > 0 then
  begin
    if
      (Application.MessageBox(
        PWideChar
        (
        'N�o h� ao menos uma ocorr�ncia' +
          IfThen
          (
            (Length(varNaoEncontradas) = 1),
            ' da vari�vel ',
            ' das vari�veis '
          ) +
          'abaixo no campo de SQL:' +
          #13 + #13 +
          retornaVarNaoEncontradas(0) +
          #13 + #13 +
          'Deseja continuar mesmo assim?'
        ),

        'Confirma��o.',

        MB_YESNO + MB_ICONQUESTION) = mrNo)

        //CORRIGIR PROBLEMA NA IDENTIFICA��O DE VARI�VEIS SEM OCORR�NCIA
    then
    begin
      Abort;
    end;

  end;

end;

procedure TForm_Principal.defineVariaveis(pRichEdit: TRichEdit);
var
  contador: Integer;
  textoTemporario: String;
  linha: Integer;
  coluna: Integer;
begin
  arrayVariaveis:= nil;
  contador:= 1;
  linha:= 0;
  coluna:= 0;

  textoTemporario:= pRichEdit.Text;

  while not (contador >= (Length(pRichEdit.Text))) do
  begin
    if (textoTemporario[contador] in [':', '&']) then
    begin

      //Continuar desenvolvimento de Matriz para guardar na primeira coluna as vari�veis e na segunda, os valores.
      {Exemplo:
      Var     | Val
      :teste    'valor'
      }

      SetLength(arrayVariaveis[linha], Length(arrayVariaveis[linha])+1);
      SetLength(arrayVariaveis, Length(arrayVariaveis)+1);
      while not (textoTemporario[contador] in [' ', #13, #0]) do
      begin
        arrayVariaveis[Length(arrayVariaveis)-1]:= arrayVariaveis[Length(arrayVariaveis)-1] + textoTemporario[contador];
        Inc(contador);
      end;

      SetLength(arrayVariaveis[], Length(arrayVariaveis)+1);
      while not (textoTemporario[contador] in [' ', #13, #0]) do
      begin
        arrayVariaveis[Length(arrayVariaveis)-1]:= arrayVariaveis[Length(arrayVariaveis)-1] + textoTemporario[contador];
        Inc(contador);
      end;
    end;
    Inc(contador);
  end;

  if (Length(arrayVariaveis) = 0) then
  begin
    Application.MessageBox('N�o h� vari�veis declaradas na se��o de vari�veis!', 'Erro!', MB_OK + MB_ICONERROR);
    Abort;
  end;

end;

procedure TForm_Principal.validaPreenchimentoCampos(pRichEdit: TRichEdit; pNomeCampo: String);
begin
  if (pRichEdit.Text = EmptyStr) then
  begin
    ShowMessage('Preecha o campo' + ' ' + pNomeCampo + '.');
    pRichEdit.SetFocus;
    Abort;
  end;
end;

procedure TForm_Principal.FormKeyPress(Sender: TObject; var Key: Char);
begin

  case Key of
    #27:  Close; //Esc
  end;

end;

procedure TForm_Principal.SpeedButton_SubstituirClick(Sender: TObject);
begin

  //Passo 1: Verificar se os campos nevess�rios est�o preenchidos
  validaPreenchimentoCampos(RichEdit_Variaveis, Label_Variaveis.Caption);
  validaPreenchimentoCampos(RichEdit_SQL, Label_SQL.Caption);

  //Passo 2: Identifica/define as vari�veis em mem�ria e busca no RichEdit de SQL por pelo menos uma ocorr�ncia de cada vari�vel
  buscaVariaveis(RichEdit_Variaveis, RichEdit_SQL);

  substituiVariaveis(RichEdit_SQL, RichEdit_Variaveis, RichEdit_Resultado);
  //varificaVariaveis(RichEdit_SQL, Label_SQL.Caption);

  //PASSO 3: VERIFICAR SE TODAS AS VARI�VEIS DOS DOIS CAMPOS S�O CAMPAT�VEIS (NOME IGUAIS, QUANTIDADE IGUAL)
  //PASSO 4: DEFINIR AS VARI�VEIS COMO PALAVRAS-CHAVE A SEREM BUSCADAS
  //PASSO 5: SUBSTITUIR O TEXTO EM UMA VARI�VEL SEPARADA E JOGAR O RESULTADO NO 3� RICHEDIT
end;

procedure TForm_Principal.SpeedButton_CopiarClick(Sender: TObject);
begin
  ;
end;

procedure TForm_Principal.RichEdit_ResultadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  textoTemporario: TStrings;
begin
  SpeedButton_Copiar.Enabled:= RichEdit_Resultado.Text <> EmptyStr;
end;

procedure TForm_Principal.PopupMenu_OpcoesRichTextPopup(Sender: TObject);
begin

  PopupMenu_OpcoesRichText.Items.Find('Carrregar arquivo').Enabled:= ActiveControl <> RichEdit_Resultado;
  PopupMenu_OpcoesRichText.Items.Find('Colar').Enabled:= ActiveControl <> RichEdit_Resultado;
  
end;

procedure TForm_Principal.RichEdit_ResultadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if ((ssCtrl in Shift) and ((Key = 86) or (Key = 118))) then
    Abort;

end;

procedure TForm_Principal.Abrir1Click(Sender: TObject);
begin
  Form_Visualizador:= nil;
  Form_Visualizador:= TForm_Visualizador.Create(Self);
  Form_Visualizador.RichEdit_Texto.Text:= (ActiveControl as TRichEdit).Text;
  Form_Visualizador.ShowModal;

  if Form_Visualizador.ModalResult = mrOk then
    (ActiveControl as TRichEdit).Text:= Form_Visualizador.RichEdit_Texto.Text;
end;

end.
