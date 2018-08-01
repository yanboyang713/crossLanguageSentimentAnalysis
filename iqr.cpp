#include <bits/stdc++.h>
#include <iostream>
using namespace std;
float median(float[], int, int);
float IQRfunction(float[], float, float &, float &, float &);

// Driver Function
int main()
{
    float a[] = { 14, 6, 13, 17, 1, 12, 9, 18 };
    float n = sizeof(a)/sizeof(a[0]);
    float Q2 = 0;//median
    float Q3 = 0;
    float Q1 = 0;
    float IQR = IQRfunction(a, n, Q1, Q2, Q3);
    cout << "IQR = " << IQR << endl;
    cout << "Q1 = " << Q1 << endl;
    cout << "Q3 = " << Q3 << endl;
    cout << "median = " << Q2 << endl;
    cout << "upper extreme: " << Q3 + 1.5 * IQR << endl;
    cout << "lower extreme: " << Q1 - 1.5 * IQR << endl;
    return 0;
}
// Function to give index of the median
float median(float a[], int l, int r)
{
    int n = r - l + 1;
    n = (n + 1) / 2 - 1;
    return n + l;
}

// Function to calculate IQR
float IQRfunction(float a[], float n, float & Q1In, float & Q2In, float & Q3In)
{
    sort(a, a + n);

    // Index of median of entire data
    int mid_index = median(a, 0, n);
    Q2In = a[mid_index];

    // Median of first half
    float Q1 = a[median(a, 0, mid_index)];
    Q1In = Q1;
    // Median of second half
    float Q3 = a[median(a, mid_index + 1, n)];
    Q3In = Q3;
    // IQR calculation
    return (Q3 - Q1);
}
