#include <list>
#include <vector>
using namespace std;

class Node
{
    private:
        list<Node*> neighbours;
        list<float> weight;

    public:
        Node() {}

        void newNeighbour(Node* newN, int newW) {
            neighbours.push_back(newN);
            weight.push_back(newW);
        }

        Node* getNeighbour(int n) {
            int counter = 0;
            for(auto i : neighbours)
            {
                if(counter == n) return i;
            }
            return nullptr;
        }

        float getNeighbourWeight(int n) {
            int counter = 0;
            for(auto i : weight)
            {
                if(counter == n) return i;
            }
            return -1;
        }

        list<Node*> getNeighbours()
        {
            return neighbours;
        }
};
