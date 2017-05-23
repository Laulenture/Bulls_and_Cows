unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Emot: TEdit;
    LvotreMot: TLabel;
    LBulls: TLabel;
    LCows: TLabel;
    Ebulls: TEdit;
    Ecows: TEdit;
    Bgo: TButton;
    Breset: TButton;
    Bquit: TButton;
    EnbEssai: TEdit;
    EnbChar: TEdit;
    Mmots: TMemo;
    LaffMotDebug: TLabel;
    LlenMot: TLabel;
    LnbEssai: TLabel;
    procedure BgoClick(Sender: TObject);
    function checkEmot(Sender : TObject) : BOOLEAN;
    function checkLength(Sender : TObject) : BOOLEAN;
    procedure checkDefeat(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BresetClick(Sender: TObject);
    procedure reset(Sender: TObject);
    procedure checkBulls(Sender: TObject);
    procedure checkCows(Sender : TObject);
    procedure checkVictory(Sender: TObject);
    procedure setEssai(Sender : TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BquitClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;
  mot : STRING;
  nbEssai : INTEGER;

implementation

{$R *.dfm}

procedure TForm1.BgoClick(Sender: TObject);  //effectue le tour de jeu

begin
  if checkEmot(Sender) = true then  //v�rifie si ce que l'utilisateur � rentr� est valide, si oui il continue le tour de jeu, sinon il envoie un message
  begin
    IF checkLength(Sender) = true then   //renvoie true si le mot est de la bonne longeur, sinon le programme pr�viens l'utilisateur si son mot est trop longue ou court
      begin
        checkBulls(Sender);  //ici est calcul� le nombre de bulls
        checkCows(Sender);   //ici est calcul� le nombre de cows
        checkVictory(Sender);  //v�rifie les si conditions de victoires sont remplies
      end;
    end
  ELSE
    ShowMessage('Votre proposition contient des chiffre ou caract�re sp�ciaux');   //pr�viens l'utilisateur que ce qu'il a entrer n'est pas valide
end;

function TForm1.checkLength(Sender : TObject) : BOOLEAN;   //renvoie true si le mot est de la bonne longeur, sinon le programme pr�viens l'utilisateur si son mot est trop longue ou court

BEGIN
  if length(Emot.Text) <> length(mot) then
    begin
      if length(Emot.Text) < length(mot) then
        begin
          checkLength := false;
          ShowMessage('Votre proposition est trop courte');
        end
      ELSE
        begin
          checkLength := false;
          ShowMessage('Votre proposition est trop longue');
        end;
    end
  ELSE
    checkLength := true;
END;

procedure TForm1.setEssai(Sender : TObject);  //ici est d�fini le nombre d'�ssai que le joueur auras en fonction du nombre de charact�re du mot

begin
  case length(mot) of
    3 : EnbEssai.Text := '4';
    4 : EnbEssai.Text := '7';
    5 : EnbEssai.Text := '10';
    6 : EnbEssai.Text := '16';
    7 : EnbEssai.Text := '20';
  end;
end;

procedure TForm1.checkVictory(Sender: TObject);    //v�rifie les si conditions de victoires sont remplies

begin
  if strtoint(Ebulls.Text) = length(mot) then
    begin
      ShowMessage('F�licitation ! Vous avez gagn� !');
      reset(sender);
      Emot.text := '';
    end
  ELSE
    checkDefeat(Sender);
end;

procedure TForm1.checkDefeat(Sender: TObject);   //v�rifie si il y a d�faite

Begin
  EnbEssai.Text := inttostr(strtoint(EnbEssai.Text) - 1);
  if strtoint(EnbEssai.Text) = 0 then
  begin
    ShowMessage('Vous avez perdu(e)');
    reset(Sender);
  end;
End;

function TForm1.checkEmot(Sender : TObject) : BOOLEAN;    //renvoie true si le mot est valide (pas de chiffre ou cahact�re sp�

VAR
  i : INTEGER;

BEGIN
  Emot.Text := ansilowercase(Emot.Text);
  for i := 1 to length(mot) do
    begin
      if (ord(Emot.Text[i])<97) OR (ord(Emot.Text[i])>122) then
        checkEmot := false
      ELSE
        checkEmot := true;
    end;
END;

procedure TForm1.checkCows(Sender : TObject);  //ici est calcul� le nombre de cows

VAR
  i,j : INTEGER;

begin
  Ecows.Text := '0';
  for I := 1 to length(mot) do
    begin
      for j := 1 to length(mot) do
        begin
          if I <> j then
            begin
              if mot[i] = (Emot.Text[j]) then Ecows.Text := inttostr(strtoint(Ecows.Text)+ 1);
            end;
        end;
    end;
end;


procedure TForm1.checkBulls(Sender: TObject);  //ici est calcul� le nombre de bulls

VAR
  i : INTEGER;

begin
  Ebulls.Text := '0';
  for i := 1 to length(mot) do
  begin
    if mot[i] = (Emot.Text[i]) then
    begin
      Ebulls.Text := inttostr(strtoint(Ebulls.Text)+ 1);
    end;
  end;
end;

procedure TForm1.BquitClick(Sender: TObject);  //fait une demande de fermer le programme quand l'utilisateur clique sur le bouton, cela executera FormCloseQuery automatiquement
begin
  close;
end;

procedure TForm1.BresetClick(Sender: TObject);
begin
  if MessageDlg('Voulez vous vraiment recommencer le jeu ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then reset(Sender);

end;

procedure TForm1.reset(Sender: TObject);    //sert � mettre le jeu � z�ro soit � la fin d'une partie, d�marrage du programme ou sur demande de l'utilisateur
VAR
  i : INTEGER;

begin
    Mmots.Lines.LoadFromFile('mots.txt');  //le programme charge dans un memo la liste des mots possible, le fichier mots.txt se trouve dans le m�me dossier que l'�xecutable
    i:=random(Mmots.Lines.Count);    //la valeur de i est choisie al�atoirement
    mot := (Mmots.Lines[i]);    //puis est utilis� pour d�finir le mot que le joueur doit chercher
    EnbChar.Text := inttostr(length(mot));
    Ebulls.Text := '0';  //le nombre de bulls est mis � 0
    Ecows.Text := '0';   //le nombre de cows est mis � 0
    Emot.Text := '';     //le contenu de Emot est �ffac�
    setEssai(Sender);    //ici est d�fini le nombre d'�ssai que le joueur auras en fonction du nombre de charact�re du mot
    LaffMotDebug.Caption := mot;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);    //Lorsque une demande de fermer le programme est faire, le jeu demande confirmation � l'utilisateur
begin
  if MessageDlg('Voulez vous vraiment quitter ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    CanClose := true
  ELSE
    CanClose := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
//VAR

begin
  reset(Sender);   //� la cr�ation de Fomr1, reset est utilis� pour mettre � z�ro le jeu
end;

end.
