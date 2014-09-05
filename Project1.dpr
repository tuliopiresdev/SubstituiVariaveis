program Project1;

uses
  Forms,
  uPrincipal in 'Units\uPrincipal.pas' {Form_Principal},
  uVisualizador in 'Units\uVisualizador.pas' {Form_Visualizador};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.CreateForm(TForm_Visualizador, Form_Visualizador);
  Application.Run;
end.
