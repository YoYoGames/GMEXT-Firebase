/// @description Non-fatal crash

randomize();

var b; 
b[0] = 1
b[1] = 2

// In this section we simulate one of 5 kinds of errors that will be catched by
// the "exception_unhandled_handler" function which records the exception to be sent
// to the Crashlytics server.
switch(irandom_range(0,4))
{
	case 0:
		c = 12345 + "Hi"
	break

	case 1:
		c = 54321 + "HEllo"
	break

	case 2:
		c = a
	break

	case 3:
		c = b[2]
	break

	case 4:
		for(var a=-5 ; a<5 ; a++)// crash on a = 0
			c = 13/a
	break
}

