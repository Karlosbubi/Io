#include "Node.h"
#include <iostream>
using namespace std;

int getIndex(list<Node*>* list, Node* n)
{
    int counter = 0;
    for(auto i : *list)
    {
        if(i == n) return counter;
        counter++;
    }
    return -3;
}

bool besucht(list<Node*>* list, Node* n)
{
    for(auto i : *list)
    {
        if(i == n) return true;
    }
    return false;
}


float dijkstra(list<Node*>* liste, Node* start, Node* dest) {

    // Liste anlegen und alle Nodes mit unendlicher Distanz belegen
    int amount = liste->size();
    vector<double> distance;
    distance.resize(amount);
    for(int i = 0; i < amount; i++) distance[i] = 65000;
    distance[getIndex(liste, start)] = 0;

    // Liste anlegen für alle Vorgänger
    vector<Node*> previous = {};
    previous.resize(amount);
    for(auto i : previous) i = nullptr;

    // Liste anlegen, ob Node besucht wurde
    list<Node*> visited = {};
    for(auto i : visited) i = nullptr;


    //
    Node* current = start;
    Node* nextNode = nullptr;
    while(current != dest) // solange Ziel noch nicht erreicht
    {
        // Nachbar mit geringster Distanz suchen
        unsigned int amountNeighbours = current->getNeighbours().size();
        cout << amountNeighbours << endl;
        //nextNode = current->getNeighbour(0);
        int nextIndex = getIndex(liste, current);getIndex(liste, current);
        for(int i = 0; i < amountNeighbours; i++)
        {
            // Distanzen updaten, wenn sie kleiner sind als ihre aktuellen
            if((distance[getIndex(liste, current)] + current->getNeighbourWeight(i)) < distance[getIndex(liste, current->getNeighbour(i))]) {
                cout << distance[getIndex(liste, current)] << " + " << current->getNeighbourWeight(i) << " = " << distance[getIndex(liste, current)] + current->getNeighbourWeight(i) << endl;
                distance[getIndex(liste, current->getNeighbour(i))] = distance[getIndex(liste, current)] + current->getNeighbourWeight(i);
                previous[getIndex(liste, current->getNeighbour(i))] = current;
            }
        }
        
        // nächsten Node über Index bestimmen, wenn kleiner als aktuell
        int currentNeighbour = 0;
        nextIndex = getIndex(liste, current->getNeighbour(0));
        nextTry:
        for (int i = 0; i < amountNeighbours; i++){
            if(distance[getIndex(liste, current->getNeighbour(i))] < distance[getIndex(liste, current->getNeighbour(nextIndex))] && !besucht(&visited, current->getNeighbour(i))) {
                nextIndex = getIndex(liste, current->getNeighbour(i));
                currentNeighbour++;
            }
        }
        if(besucht(&visited, current->getNeighbour(nextIndex))){
            if(currentNeighbour < amountNeighbours){
                nextIndex = getIndex(liste, current->getNeighbour(currentNeighbour + 1));
                currentNeighbour++;
            }
            else{
            nextIndex = getIndex(liste, previous[getIndex(liste, current)]);
            goto ende;
            }
            goto nextTry;
        }

        ende:
        // markieren dass nächster Node mit niedrigster Distanz besucht wurde
        visited.push_back(current);

        // neuen Node wählen
        current = current->getNeighbour(nextIndex);
    }

    return distance[getIndex(liste, dest)];
}



int main()
{
    // Mannschaft
    Node* cr0n = new Node();
    Node* patrik = new Node();
    Node* bob = new Node();
    Node* alice = new Node();
    Node* kp = new Node();
    Node* kurt = new Node();
    Node* david = new Node();
    Node* korb = new Node();

    list<Node*> nodes = {};
    nodes.push_back(cr0n);
    nodes.push_back(patrik);
    nodes.push_back(bob);
    nodes.push_back(alice);
    nodes.push_back(kp);
    nodes.push_back(kurt);
    nodes.push_back(david);
    nodes.push_back(korb);

    // Pässe
    cr0n->newNeighbour(kurt, 8.5);
    cr0n->newNeighbour(patrik, 6);
    cr0n->newNeighbour(korb, 9);
    patrik->newNeighbour(cr0n, 8);
    patrik->newNeighbour(alice, 6);
    patrik->newNeighbour(kp, 2);
    patrik->newNeighbour(korb, 7.5);
    alice->newNeighbour(david, 5);
    alice->newNeighbour(korb, 5);
    david->newNeighbour(kp, 1.5);
    david->newNeighbour(korb, 4);
    kp->newNeighbour(david, 4);
    kp->newNeighbour(bob, 3);
    kp->newNeighbour(korb, 9);
    kurt->newNeighbour(bob, 5);
    kurt->newNeighbour(korb, 8);
    bob->newNeighbour(kurt, 6);
    bob->newNeighbour(korb, 7);

    // Dijkstra ausführen
    cout << dijkstra(&nodes, cr0n, korb) << endl;
}
