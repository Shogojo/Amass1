#ifndef CELEVE_H
#define CELEVE_H
//ATTENTION LE CODE DOIT ETRE A L'INTERIEUR DES MACRO INSTRUCTIONS
using namespace std;


class CEleve
{
private:

    string NomEleve;
    string PrenomEleve;
    float TabNotes[4];
    float Moyenne;
    float Somme;

public:

    void SaisirNom();
    void SaisirPrenom();
    void SaisirNotes();
    void CalculerMoyenne();
    void AfficherInfos();

};

#endif // CELEVE_H
