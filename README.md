# PISA Analysis – Stata Do-file

This repository contains a Stata `.do` file used to clean and analyze PISA data (2015, 2018, 2022) for my Master’s thesis. The analysis focuses on comparing student math, reading, and science scores between Victoria and other states using a difference-in-differences framework.

## Notes

- Raw PISA datasets are **not included**. They can be obtained from [ACER PISA Reports and Data](https://www.acer.org/au/pisa/reports-and-data).  
- Requires Stata 15 or later.  
- Requires the `pv` package, which can be installed in Stata with:  
  ```stata
  ssc install pv
