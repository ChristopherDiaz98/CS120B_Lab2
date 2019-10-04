# Test file for Lab2_introToAVR


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Example test:
#test "PINA: 0x00, PINB: 0x00 => PORTC: 0"
# Set inputs
#setPINA 0x00
#setPINB 0x00
# Continue for several ticks
#continue 2
# Set expect values
#expectPORTC 0
# Check pass/fail
#checkResult

# Add tests below

test "PINA[3:0]: 0000, PORTC[3:0]: 0100"
setPINA 0x00
continue 2
expectPORTC 0x04
checkResult

test "PINA[3:0]: 0001, PORTC[3:0]: 0011"
setPINA 0x01
continue 2
expectPORTC 0x03
checkResult

test "PINA[3:0]: 0010, PORTC[3:0]: 0011"
setPINA 0x02
continue 2
expectPORTC 0x03
checkResult

test "PINA[3:0]: 0100, PORTC[3:0]: 0011"
setPINA 0x04
continue 2
expectPORTC 0x03
checkResult

test "PINA[3:0]: 1000, PORTC[3:0]: 0011"
setPINA 0x08
continue 2
expectPORTC 0x03
checkResult

test "PINA[3:0]: 0110, PORTC[3:0]: 0010"
setPINA 0x06
continue 2
expectPORTC 0x02
checkResult

test "PINA[3:0]: 1001, PORTC[3:0]: 0010"
setPINA 0x09
continue 2
expectPORTC 0x02
checkResult

test "PINA[3:0]: 1111, PORTC[3:0]: 0000"
setPINA 0x0F
continue 2
expectPORTC 0x00
checkResult


# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
