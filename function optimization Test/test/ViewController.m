//
//  ViewController.m
//  test
//
//  Created by Ashis Laha on 25/02/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray * test = [NSMutableArray arrayWithObjects:@4, @6, @2, @2, @6, @6, @1, nil];
    int n = solution1(test);
    printf(n);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int solution(NSMutableArray *A) {
    int N = [A count];
    int result = 0;
    int i, j;
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            if ([[A objectAtIndex: i] intValue] == [[A objectAtIndex: j] intValue])
                if (abs(i - j) > result)
                    result = abs(i - j);
    return result;
}

int solution1(NSMutableArray *A) {
    int N = [A count];
    int result = 0;
    int i = 0 ;
    int j = N-1;
    
    while (i<j) {
        if ([[A objectAtIndex: i] intValue] == [[A objectAtIndex: j] intValue]) {
            result = (j - i);
            break;
        } else {
            i++;
            j--;
        }
    }
    return result;
}

@end
