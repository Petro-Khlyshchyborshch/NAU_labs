#include <iostream>
#include <vector>
#include <deque>
using namespace std;
struct node {
    node* prev;
    vector<int> way;
    node(node* pr, vector<int> l) {
        way = l;
        prev = pr;
    }
};
node* new_node(node* pr, vector<int> l) {
    return new node(pr,l);
}

int main() {
    int graph[][6] = {
        {0,2,6,0,8,4},
       {2,0,0,0,5,2},
       {6,0,0,3,10,3},
       {0,0,3,0,3,4},
       {8,5,10,3,0,3},
       {4,2,3,4,3,0},
    };
    vector<int>  p = { 0 };
    deque <node*> open;
    vector <node*> close;
    node* n= new_node(NULL, p);
    node* way = new_node(NULL, p);
    open.push_back(way);
   
    int k = 0;
    do {
          
        n = open.front();
        close.push_back(open.front());
        open.erase(open.begin());
        
        for (int i = 0; i < 6; i++) {
            k = 0;
            //якщо шляху немає, то переходимо до наступної
            if (graph[(int)n->way.back()][i] == 0) continue;
            //перевіряємо чи були уже в цій вершині
            for (int z = 0; z < n->way.size();z++) {
                if (n->way[z] == i) {
                    k = 1;
                    break;
                }
            }      
            if (k != 0) { continue; }
            //додаємо нову вершину
            vector<int> b = n->way;
            b.push_back(i);
            open.push_front(new_node(n,b));           
        }      
    } while (!open.empty());
    
    //знаходимо шлях всі шляхи що можуть завершуватись початковою вершиною
    for (auto node : close) {     
        if (graph[node->way.back()][0] != 0 and node->way.size()==6) {
            vector<int> b = node->way;
            b.push_back(0);
            close.push_back(new_node(n, b));
        }      
    }

    cout <<"All node:"<< endl;
    for (auto node : close) {
        for (auto i : node->way) {
            cout << i << " ";
        }
        cout << endl;
    }
    //Пошук мінімального шляху обходу всього графу
    int min = INT_MAX;
    node* min_node = n;
    int temp;
    for (auto node : close) {
        temp = 0;
        if (node->way.size() == 7) {
            for (int i = 0; i < node->way.size() - 1;i++) {
                temp += graph[node->way[i]][node->way[i+1]];
            }
            if (min > temp) {
                min = temp;
                min_node = node;
            }
        }
    }

    cout << "Minimal distans:" << min << endl;
    cout << "Minimal way: ";
    for (auto i : min_node->way) {
        cout << i << " ";
    }
 
    return 0;
}