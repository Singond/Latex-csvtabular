The `csvtabular` package for LaTeX
==================================

The `csvtabular` package makes it easier to create tables from CSV files.
It uses the `csvsimple` package to build the table and styles it with
`booktabs`.

Requirements
============

This package requires the following packages to be installed on your system:

- `booktabs`
- `csvsimple`
- `forloop`
- `pgffor`
- `ifthen`
- `xkeyval`

Installing
==========
Copy the contents of `src` directory into your `TEXMFHOME/tex/latex/<any-dir>`.
A Make target is provided which can do this automatically. Simply run
`make install` in the project root.

Usage
=====
The package provides a single macro called `\csvtabular`.

Arguments
---------
This macro takes five mandatory arguments:

1. filename
2. columns definition
3. table header
4. table line
5. table column

### Filename
This is the path to the CSV file to be read.

### Definition of columns
This is the standard argument to the `tabular` environment, which specifies
the individual columns. See the `tabular` environment for details.

### Table header
A header to be printed at the top of every table.

### Table line
This is the `command list` argument to the `\csvreader` macro from the
`csvsimple` package. This is where each data row of the table is built.
For details see the manual of `csvsimple`.

### Table footer
A footer to be printed at the bottom of every table. It can be empty.

Options
-------
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

### `from`
The zero-based index of the first line in the CSV file to be present in
the output. Lines before this number are ignored. This number must be smaller
than the first break specified in the `breaks` option.

Leaving this option unspecified is equal to setting it to `1` (if the header
line is being ignored), or `0` (if the header line is not being ignored).

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
		{}                                  % table footer
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
		{}                                  % table footer
\end{table}
```
