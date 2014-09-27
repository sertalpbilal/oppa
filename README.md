oppa!
====

Optimization Performance Profiler Appliance (**oppa!**) is a toolbox of scripts to generate performance profile graphics for comparing optimization algorithms and software.

**oppa!** uses Elizabeth D. Dolan and Jorge J. More's proposed performance profile method.

Currently **oppa!** has scripts for following languages:

- Matlab

## How to use?

Copy the oppa.m file to the source folder of your data, or add oppa.m's path. Then call
```matlab
oppa(X);
```
for performance measure matrix `X`.

## Sample Code
```matlab
A=1+rand(100,10)*100;
A(A(:,:)>60)=inf;
oppa(A);
```
gives
following output:
![output](https://raw.githubusercontent.com/sertalpbilal/oppa/master/images/oppa_output.png)

## Test

In the test folder, run
`randtest`.

## References
Dolan, Elizabeth D., and Jorge J. Moré. "Benchmarking optimization software with performance profiles." Mathematical programming 91.2 (2002): 201-213.

## License
The MIT License 

