import sys
from separateFileByRank import separateFileByRank

#main function
def main():
    # separate origin file by rank
    runSeparateFileByRank = input ("Do you want to separate origin file by rank: Y/n ")
    if runSeparateFileByRank == 'Y' or runSeparateFileByRank == 'y':
        separateRank = separateFileByRank()
        separateRank.main()

if __name__ == "__main__":
  main()
