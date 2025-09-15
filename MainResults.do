**Setup
clear all
set more off
capture log close
* cd  
log using "MAIN.log", replace



*******************************************************
* 1. Data Preparation
*******************************************************

***************
* 2015 Dataset
***************

use pisa2015, clear

* Rename Variables
* Math
foreach i of numlist 1/10 {
    local old = "PV`i'MATH"
    local new = "pv`i'math"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Science
foreach i of numlist 1/10 {
    local old = "PV`i'SCIE"
    local new = "pv`i'scie"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Reading
foreach i of numlist 1/10 {
    local old = "PV`i'READ"
    local new = "pv`i'read"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Weights
foreach i of numlist 1/80 {
    local old = "W_FSTURWT`i'"
    local new = "w_fsturwt`i'"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

rename W_FSTUWT w_fstuwt


// Control variables
rename INDIG indig
rename ST011Q04TA device
rename State state
rename ST022Q01TA langtest
rename CNTSCHID schid
rename ESCS escs
gen male = ST004D01T == 2
gen immig = IMMIG != 1
gen metro = Geoloc_3 == 1
gen enghome = langtest == 1


gen no_device = (device == 2)
label define device_lbl 0 "Has Device" 1 "No Device"
label values no_device device_lbl


// Add year
gen year = 2015

// Add DiD variables
gen post = year == 2022
gen victoria = state == 3
gen wa = state == 6
gen sa = state == 5
gen tas = state == 7
gen qld = state == 4
gen nsw = state == 2
gen treat = victoria * post

gen placebopost = year == 2018 


keep year post victoria treat wa sa tas placebopost qld nsw ///
     pv1math pv2math pv3math pv4math pv5math ///
     pv6math pv7math pv8math pv9math pv10math ///
	pv1read pv2read pv3read pv4read pv5read ///
	pv6read pv7read pv8read pv9read pv10read ///
	pv1scie pv2scie pv3scie pv4scie pv5scie ///
	pv6scie pv7scie pv8scie pv9scie pv10scie ///	
     metro no_device immig male state enghome schid indig w_fstuwt ///
     w_fsturwt1-w_fsturwt80  escs

save pisa2015_clean.dta, replace


***************
* 2018 Dataset
***************
use pisa2018, clear

* Rename Variables
* Math
foreach i of numlist 1/10 {
    local old = "PV`i'MATH"
    local new = "pv`i'math"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Science
foreach i of numlist 1/10 {
    local old = "PV`i'SCIE"
    local new = "pv`i'scie"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Reading
foreach i of numlist 1/10 {
    local old = "PV`i'READ"
    local new = "pv`i'read"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Weights
foreach i of numlist 1/80 {
    local old = "W_FSTURWT`i'"
    local new = "w_fsturwt`i'"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

rename W_FSTUWT w_fstuwt


// Control variables
rename Indig indig
rename ST011Q04TA device
rename State state
rename ST022Q01TA langtest
rename SCHID schid
rename ESCS escs
gen male = ST004D01T == 2
gen immig = IMMIG != 1
gen metro = Geoloc_3 == 1
gen enghome = langtest == 1

gen no_device = (device == 2)
label define device_lbl 0 "Has Device" 1 "No Device"
label values no_device device_lbl

// Add DiD variables
gen post = year == 2022
gen victoria = state == 3
gen wa = state == 6
gen sa = state == 5
gen tas = state == 7
gen qld = state == 4
gen nsw = state == 2
gen treat = victoria * post

gen placebopost = year == 2018 


keep year post victoria treat wa sa tas placebopost qld nsw ///
     pv1math pv2math pv3math pv4math pv5math ///
     pv6math pv7math pv8math pv9math pv10math ///
	pv1read pv2read pv3read pv4read pv5read ///
	pv6read pv7read pv8read pv9read pv10read ///
	pv1scie pv2scie pv3scie pv4scie pv5scie ///
	pv6scie pv7scie pv8scie pv9scie pv10scie ///	
     metro no_device immig male state enghome schid indig w_fstuwt ///
     w_fsturwt1-w_fsturwt80  escs

save pisa2018_clean.dta, replace

***************
* 2022 Dataset
***************
use pisa2022, clear

* Rename Variables
* Math
foreach i of numlist 1/10 {
    local old = "PV`i'MATH"
    local new = "pv`i'math"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Science
foreach i of numlist 1/10 {
    local old = "PV`i'SCIE"
    local new = "pv`i'scie"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Reading
foreach i of numlist 1/10 {
    local old = "PV`i'READ"
    local new = "pv`i'read"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

* Weights
foreach i of numlist 1/80 {
    local old = "W_FSTURWT`i'"
    local new = "w_fsturwt`i'"
    capture confirm variable `old'
    if !_rc {
        rename `old' `new'
    }
}

rename W_FSTUWT w_fstuwt


// Control variables
rename Indig indig
rename ST250Q02JA device
rename State state
rename ST022Q01TA langtest
rename SCHID schid
rename ESCS escs
gen male = ST004D01T == 2
gen immig = IMMIG != 1
gen metro = ASGS_3 == 1
gen enghome = langtest == 1


gen no_device = (device == 2)
label define device_lbl 0 "Has Device" 1 "No Device"
label values no_device device_lbl


// Add DiD variables
gen post = year == 2022
gen victoria = state == 3
gen wa = state == 6
gen sa = state == 5
gen tas = state == 7
gen qld = state == 4
gen nsw = state == 2
gen treat = victoria * post

gen placebopost = year == 2018 


keep year post victoria treat wa sa tas placebopost qld nsw ///
     pv1math pv2math pv3math pv4math pv5math ///
     pv6math pv7math pv8math pv9math pv10math ///
	pv1read pv2read pv3read pv4read pv5read ///
	pv6read pv7read pv8read pv9read pv10read ///
	pv1scie pv2scie pv3scie pv4scie pv5scie ///
	pv6scie pv7scie pv8scie pv9scie pv10scie ///	
     metro no_device immig male state enghome schid indig w_fstuwt ///
     w_fsturwt1-w_fsturwt80   escs

save pisa2022_clean.dta, replace


***************
* Combining the Datasets
***************
// Combining the datasets (15,18,22)
use pisa2015_math_clean.dta, clear
append using pisa2018_math_clean.dta
append using pisa2022_math_clean.dta


						 
drop if missing(year, post, victoria, treat, wa, sa ,tas , metro, escs,no_device, immig ,male ,state ,enghome ,schid ,indig)	


save pisa_15_18_22.dta, replace



// Combining the datasets (15,18)
use pisa2015_math_clean.dta, clear
append using pisa2018_math_clean.dta


drop if missing(year, post, victoria, treat, wa, sa ,tas , metro, escs,no_device, immig ,male ,state ,enghome ,schid ,indig)	
		 
						 
save pisa_15_18.dta, replace

// Combining the datasets (18,22)
use pisa2018_math_clean.dta, clear
append using pisa2022_math_clean.dta
 
drop if missing(year, post, victoria, treat, wa, sa ,tas , metro, escs,no_device, immig ,male ,state ,enghome ,schid ,indig)	
		 
						 
save pisa_18_22.dta, replace

***************
* Baseline Regression
***************
clear
use pisa_18_22
keep if (victoria == 1 | sa == 1) & metro == 1
pv, pv(pv*math) weight(w_fstuwt) brr rw(w_fsturwt*) fays(0.5): ///
    reg @pv i.victoria##i.post [aw=@w]

***************
* With Controls
***************
pv, pv(pv*math) weight(w_fstuwt) brr rw(w_fsturwt*) fays(0.5): ///
    reg @pv i.victoria##i.post enghome  male escs immig  indig  no_device    [aw=@w]


***************
* Robustness: Alternative Dependent Variables
***************
clear
use pisa_18_22
keep if (victoria == 1 | sa == 1) & metro == 1

*** Science
pv, pv(pv*scie) weight(w_fstuwt) brr rw(w_fsturwt*) fays(0.5): ///
    reg @pv i.victoria##i.post enghome  male escs immig  indig  no_device    [aw=@w]

*** Reading
pv, pv(pv*read) weight(w_fstuwt) brr rw(w_fsturwt*) fays(0.5): ///
    reg @pv i.victoria##i.post enghome  male escs immig  indig  no_device    [aw=@w]



***************
* Robustness: Tasmania as Alternative Control
***************
clear
use pisa_18_22
keep if (victoria == 1 | tas == 1) & metro == 1

pv, pv(pv*math) weight(w_fstuwt) brr rw(w_fsturwt*) fays(0.5): ///
    reg @pv i.victoria##i.post enghome  male escs immig  indig  no_device    [aw=@w]

