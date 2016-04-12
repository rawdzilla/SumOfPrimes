//
//  PrimesSumViewController.m
//  PrimesSums
//
//  Created by Robert Wendel on 4/10/16.
//  Copyright © 2016 Robert Wendel. All rights reserved.
//

#import "PrimesSumViewController.h"

@interface PrimesSumViewController ()
@property (nonatomic, weak) IBOutlet UILabel *sumOfPrimes;
@property (nonatomic, weak) IBOutlet UITextField *addThePrimes;
@end

@implementation PrimesSumViewController

bool checkIfPrime(int candidateprime)
{
    
    if (candidateprime == 1 ) return true;
    if (candidateprime == 2) return true;
    //    if (candidateprime == 3) return true;
    
    for (int i = 2; i< candidateprime; i++)
    {
        if (candidateprime%i == 0 ) {
            return false;
        }
    }
    
    return true;
}

int sumOfPrime(int candidateprime)
{
    
    int sumPrimes=0;
    
    for (int i = 1; i< candidateprime; i++)
    {
        if (checkIfPrime(i) )  sumPrimes += i;
    }
    sumPrimes+=candidateprime;
    return sumPrimes;
}


- (IBAction)SumPrimes:(id)sender {
}

- (IBAction) showSumOfPrimes:(id) sender
{
    int candidatePrime = _addThePrimes.text.intValue;
    bool isPrime = checkIfPrime(candidatePrime);
    if(isPrime) {
        int sumOfPrimesCalc = sumOfPrime(candidatePrime);
        self.sumOfPrimes.text= [NSString stringWithFormat:@"%i",sumOfPrimesCalc];
    }
    else
    self.sumOfPrimes.text= [NSString stringWithFormat:@"%i",0];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{


    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) self.sumOfPrimes.text=@"0";
    return self;
}

@end
