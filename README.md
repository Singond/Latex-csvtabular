The `csvtabular` package for LaTeX
==================================

The `csvtabular` package makes it easier to create tables from CSV files.
It uses the `csvsimple` package to build the table and styles it with
`booktabs`.

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
