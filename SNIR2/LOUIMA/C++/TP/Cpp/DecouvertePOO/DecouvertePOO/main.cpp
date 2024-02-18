
/*
 Nom fichier :DecouvertePOO
 Description :
 Date :07/09/2020
 version : 1
 Auteur : Louima
 */

//ETAPE 1
#include <iostream>


int main()
{
    std::string nomDuClient = "Nelson ";
    std::string message = "Bonjour, M. " + nomDuClient;
    message += '.';

    std::cout << message << std::endl;

    return (0);
}

