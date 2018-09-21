#! /usr/bin/env python

import os
import random

def main():

    if os.path.isfile('/home/bod/python/code/insults.txt'):
        insults = 'yes'
        file = open('/home/bod/python/code/insults.txt', 'r')
        list = file.readlines()
    else:
        insults = "no"

    print "Welcome to guess the number\n==========================="
    print "\nI'm thinking of a number, you have to guess what it is.\n"

    num = random.randrange(100)
    guess = ""

    while guess != num:
        guess = int(raw_input("Take a guess: "))
        if guess < num:
            if insults == "yes":
                print random.choice(list)
            print "Guess higher next time\n"
        elif guess > num:
            if insults == "yes":
                print random.choice(list)
            print "Guess lower next time\n"
    print "!!***CONGRATULATIONS***!!"
    raw_input()
    if insults == "yes":
        file.close()

main()  
