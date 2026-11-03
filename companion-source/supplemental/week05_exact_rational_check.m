exact_difference = sym(1)/3 - sym("3333333333333333/10000000000000000");
disp(exact_difference);
assert(isAlways(exact_difference == sym(1)/(3*sym(10)^16)));
