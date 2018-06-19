#include <bits/stdc++.h>
#include <iostream>
using namespace std;
int median(int[], int, int);
int IQR(int[], int);

// Driver Function
int main()
{
    int a[] = { 1, 19, 7, 6, 5, 9, 12, 27, 18, 2, 15 };
    int n = sizeof(a)/sizeof(a[0]);
    cout << IQR(a, n);
    return 0;
}
// Function to give index of the median
int median(int a[], int l, int r)
{
    int n = r - l + 1;
    n = (n + 1) / 2 - 1;
    return n + l;
}

// Function to calculate IQR
int IQR(int a[], int n)
{
    sort(a, a + n);

    // Index of median of entire data
    int mid_index = median(a, 0, n);

    // Median of first half
    int Q1 = a[median(a, 0, mid_index)];

    // Median of second half
    int Q3 = a[median(a, mid_index + 1, n)];

    // IQR calculation
    return (Q3 - Q1);
}
