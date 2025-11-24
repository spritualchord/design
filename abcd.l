%{
#include <stdio.h>
%}

%%
"abcd" {
    FILE *fp = fopen("print_abcd.c", "w");
    if (!fp) {
        printf("Error creating file.\n");
        exit(1);
    }

    fprintf(fp, "#include <stdio.h>\n\n");
    fprintf(fp, "int main() {\n");
    fprintf(fp, "    char str[] = \"abcd\";\n");
    fprintf(fp, "    for (int i = 4; i > 0; i--) {\n");
    fprintf(fp, "        for (int j = 0; j < i; j++) {\n");
    fprintf(fp, "            printf(\"%%c\", str[j]);\n");
    fprintf(fp, "        }\n");
    fprintf(fp, "        printf(\"\\n\");\n");
    fprintf(fp, "    }\n");
    fprintf(fp, "    return 0;\n");
    fprintf(fp, "}\n");

    fclose(fp);
    printf("C program 'print_abcd.c' generated successfully.\n");
}
.|\n ;
%%

int main() {
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
