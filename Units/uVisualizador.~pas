unit uVisualizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TForm_Visualizador = class(TForm)
    RichEdit_Texto: TRichEdit;
    BitBtn_Substituir: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Visualizador: TForm_Visualizador;

implementation

{$R *.dfm}

procedure TForm_Visualizador.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Visualizador.FormKeyPress(Sender: TObject; var Key: Char);
begin

  case Key of
    #27:  Close; //Esc
  end;

end;

end.
