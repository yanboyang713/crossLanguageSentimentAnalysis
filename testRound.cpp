#include <math.h>
#include <iostream>
using namespace std;
int main(int argc, char *argv[])
{
    float val = 37.777779;

    float rounded_down = floorf(val * 100) / 100;   /* Result: 37.77 */
    float nearest = roundf(val * 100) / 100;  /* Result: 37.78 */
    float rounded_up = ceilf(val * 100) / 100;      /* Result: 37.78 */
    cout << nearest << endl;
    return 0;
}