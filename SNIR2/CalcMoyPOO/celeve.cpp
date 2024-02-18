#include <iostream>
#include "celeve.h"
using namespace std;

//Ecrire ici les définitions des méthodes :




void CEleve::SaisirNom()
{
    cout << "Saisir le nom de l'eleve : ";
    cin >> NomEleve;
}


void CEleve::SaisirPrenom()
{
    cout << "Saisir le prenom de l'eleve : ";
    cin >> PrenomEleve;
}


void CEleve::SaisirNotes()
{
    int index_TabNotes;
    cout << "Saisir les notes de l'eleve : ";
    for(index_TabNotes=0; index_TabNotes < 4; index_TabNotes++)
    {
        cin >> TabNotes[index_TabNotes];
    }
}


void CEleve::CalculerMoyenne()
{
    int index_TabNotes;
    for(index_TabNotes= 0 ; index_TabNotes < 4; index_TabNotes++)
    {
        Somme+=TabNotes[index_TabNotes];
    }
    Somme=(Somme/4);
}


void CEleve::AfficherInfos()
{
    cout << "La moyenne est de " << Somme << endl;
}
