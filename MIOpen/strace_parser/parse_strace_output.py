
import pathlib
import argparse
import sys


DEBUG_FLAG=False


#with open("/home/master/ashutosh/onlyopenclose_test.txt") as file:
#write_file = open("onlyopenclose_test_without_errors.txt","w")
# open a file for writing

def ParseAndWork( readfile, writefile):

    write_file = open(writefile,"w")
    with open(readfile) as file:
        n=0
        for line in file:
            if ((") = -1 ")  in line ):
                  n = n + 1
                  print(f" Found {n}th line = [{line}] ")
            else:
                write_file.write(f"{line}")

    write_file.close()


#ParseAndWork("onlyopenclose_test.txt","onlyopenclose_test_without_errors.txt")

def parseOpenlinetogetfd(line):
    #linewithoutnewline=line.strip()
    linewithoutnewline=line.strip("\n").strip()
    n = len(linewithoutnewline) - 1
    word=""
    while n >= 0:
        if '=' == linewithoutnewline[n]:
            break
        else:
            word = linewithoutnewline[n] + word
        
        n -= 1

    if n < 0:
        return -1

    word=word.strip()
    return int(word)


def parseCloselinetogetfd(line):
    #linewithoutnewline=line.strip()
    linewithoutnewline=line.strip("\n").strip()
    n = len(linewithoutnewline) - 1
    word=""
    start = False
    while n >= 0:
        if ')' == linewithoutnewline[n]:
            start = True
        elif '(' == linewithoutnewline[n]:
            start = False
            break
        else:
            if start == True:
                word = linewithoutnewline[n] + word

        n -= 1

    if n < 0:
        return -1

    word=word.strip()
    return int(word)


def MakeTheBackTrace(file):

    BT=[]
    #line = file.readline().strip("\n")
    line = file.readline()
    while line:
        if True == DEBUG_FLAG:
           print(line)

        if (" > /")  in line  or ("> unexpected_backtracing_error") in line or ("> [stack]()") in line:
            BT.insert(0,line)
        else:
            Readnew=False
            break
        #line = file.readline().strip("\n")
        line = file.readline()
    
    return BT, line, Readnew


def ParseAndCollectStackTrace(readfile):

    FdStackDictionary={}
    #write_file = open(writefile,"w")
    with open(readfile,"r") as file:
        n=0
        try:
            line = file.readline().strip("\n")
            while line:
                if True == DEBUG_FLAG:
                    print(line)

                Readnew=True
                if "openat" in line:
                    #Parse for Open
                    #Check if Open failed
                    if ((") = -1 ")  in line ):
                        n = n + 1
                        if True == DEBUG_FLAG:
                            print(f" Found failure in open {n}th time.  LOG == [{line}] ")
                        #discard this call stack as open failed.
                        backtrace,line,Readnew=MakeTheBackTrace(file)
                    #Open succeeded
                    else:
                        #check the FD allocated
                        gotfd = parseOpenlinetogetfd(line)
                        if gotfd <= 0:
                            raise RuntimeError(f"Fd returned parseOpenlinetogetfd less than or equal to zero = {gotfd}")
                        #collect the stack with this one
                        backtrace,line,Readnew=MakeTheBackTrace(file)
                        FdStackDictionary[gotfd]=backtrace
                elif "close" in line:
                    gotfd = parseCloselinetogetfd(line)
                    if gotfd <= 0:
                        raise RuntimeError(f"Fd returned parseCloselinetogetfd is less than or equal to zero = {gotfd}")
                    FdStackDictionary.pop(gotfd)
                    #discard this call stack as close stack is not required.
                    backtrace,line,Readnew=MakeTheBackTrace(file)
                else:#should never come here
                    print(f" Exception , this is not handelled.  This is not expected  <================  {line} \n\n" )
                    #raise RuntimeError("Unexpected LINE ")
                if Readnew:
                    line = file.readline().strip("\n")
                
        except StopIteration:
            pass

    return FdStackDictionary


#ParseAndCollectStackTrace("miopenfd.txt")


def printBT(BTList):
    n=len(BTList) - 1
    while n >= 0:
        #oneline=BTList[n]
        print(BTList[n].strip("\n").strip())
        n -= 1



def main():
    # The script expect a search folder as parameter. It finds all ELF files and updates RPATH
    argparser = argparse.ArgumentParser(
            usage='usage: %(prog)s  <fileToParse>',
            description='Find the backTraces of the left out FDs which are not closed. \n',
            add_help=False,
            prog='parse_strace_output.py')
    argparser.add_argument('fileToParse',
            nargs='?', type=pathlib.Path, default=None,
            help='file name with or without path ')
    argparser.add_argument('-h', '--help',
            action='store_true', dest='help',
            help='Display this information')
    args = argparser.parse_args()
    if args.help or not args.fileToParse:
        argparser.print_help()
        sys.exit(0)
    
    OpenFdsBTDict=ParseAndCollectStackTrace(args.fileToParse)
    for key in OpenFdsBTDict:
        print(f" fd={key}  is opened by :\n")
        printBT(OpenFdsBTDict[key])
        print("\n")

    print("\n\n  Dumping Table of FD and the Driving Component")
    for key in OpenFdsBTDict:
        component = OpenFdsBTDict[key][0].strip("\n").strip()
        print(f" fd={key}\t\t  : \t {component}")

    print("\n\n")






if __name__ == "__main__":
    main()



