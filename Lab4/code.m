#{
ITIL Lab: 4
Submission by:-
 -> Akash Agrawal(201551090)
 -> Mayank Padhi(201551092)
#}
clear all;
close all;

# Develop Huffman Encoder Scheme

#{
a = [0.0575, 0.0128, 0.0263, 0.0285, 0.0913, 0.0173, 0.0133, 0.0313, 0.0599, 0.0006, 0.0084, 0.0335, 0.0235, 0.0596, 0.0689, 0.0192, 0.0008, 0.0508, 0.0567, 0.0706, 0.0334, 0.0069, 0.0119, 0.0073, 0.0164, 0.0007, 0.1928];
p = sort(a);
#}

# Huffman Encode input string
encoder = ["001"; "0000"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"; "00"];
rawStr = input("Enter string to encode\n", "s");
for i = 1:1:size(rawStr)(1,2)
	switch (rawStr(1, i))
		case "a"
			printf("%s", encoder(1, 1:1:end))
		case "b"
			printf("%s", encoder(2, 1:1:end))
		case "c"
			printf("%s", encoder(3, 1:1:end))
		case "d"
			printf("%s", encoder(4, 1:1:end))
		case "e"
			printf("%s", encoder(5, 1:1:end))
		case "f"
			printf("%s", encoder(6, 1:1:end))
		case "g"
			printf("%s", encoder(7, 1:1:end))
		case "h"
			printf("%s", encoder(8, 1:1:end))
		case "i"
			printf("%s", encoder(9, 1:1:end))
		case "j"
			printf("%s", encoder(10, 1:1:end))
		case "k"
			printf("%s", encoder(11, 1:1:end))
		case "l"
			printf("%s", encoder(12, 1:1:end))
		case "m"
			printf("%s", encoder(13, 1:1:end))
		case "n"
			printf("%s", encoder(14, 1:1:end))
		case "o"
			printf("%s", encoder(15, 1:1:end))
		case "p"
			printf("%s", encoder(16, 1:1:end))
		case "q"
			printf("%s", encoder(17, 1:1:end))
		case "r"
			printf("%s", encoder(18, 1:1:end))
		case "s"
			printf("%s", encoder(19, 1:1:end))
		case "t"
			printf("%s", encoder(20, 1:1:end))
		case "u"
			printf("%s", encoder(21, 1:1:end))
		case "v"
			printf("%s", encoder(22, 1:1:end))
		case "w"
			printf("%s", encoder(23, 1:1:end))
		case "x"
			printf("%s", encoder(24, 1:1:end))
		case "y"
			printf("%s", encoder(25, 1:1:end))
		case "z"
			printf("%s", encoder(26, 1:1:end))
		case "-"
			printf("%s", encoder(27, 1:1:end))
		otherwise
			printf("mofo")
	endswitch
endfor