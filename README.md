The `csvtabular` package for LaTeX
==================================

The `csvtabular` package makes it easier to create tables from CSV files.
It uses the `csvsimple` package to build the table and styles it with
`booktabs`.

Usage
=====

Options
------------------
The optional parameters are specified as key-value pairs in square brackets.

### `breaks`
This option takes a number or a list of numbers as an argument. If specified
with _n_ numbers, the macro will produce _n + 1_ `tabular`s by splitting
the input after the lines with numbers given in the argument.
For example, to break the output into three `tabular`s of 20 rows, assuming
the first row is used as a header, use `breaks={21,41}`.
Note that the last `tabular` will contain all the remaining rows, so if the
input file is longer than 61 lines, the last `tabular` will be longer than
the previous.

The default is an empty list, which means no splitting will occur.

### `spacer`
When the `breaks` option is used, this controls the separators inserted
after each break. The separator does not need to be a space.
The separator is not inserted after the last `tabular`.
If the `breaks` option is not specified, this option does nothing.

The default value is empty, which outputs the tabulars in adjacent position
(ie. with no spacing between them, appearing as one object),
when the tabulars fit into a single line.

### `position`
This is the optional position argument passed to the resulting `tabular`.
Its value can be `t`, `c` or `b` (see the `tabular` environment).

Examples
========

Create a simple table from a CSV file:

```
\begin{table}[htp]
	\csvtable
		{measurement-capacity.csv}          % CSV file name
		{c c c}                             % column definitions
		{$\theta$ & $R$ & $C$}              % table header
		{\csvcoli & \csvcolii &\csvcoliii}  % table line
\end{table}
```

Create a CSV table and break it after lines 18 and 35. This will produce three
consecutive tabulars separated by `\quad`:

```
\begin{table}[htp]
	\csvtable[breaks={18,35}, spacer=\quad]
		{measurement-capacity.csv}          % CSV file name
		{c c c}                             % column definitions
		{$\theta$ & $R$ & $C$}              % table header
		{\csvcoli & \csvcolii &\csvcoliii}  % table line
\end{table}
```
