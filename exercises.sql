select * from classwork order by package;

-- ex)1 Give the total number of recordings in this table
select count(r_version) from classwork;


-- ex)2 The number of packages listed in this table?
select count( distinct package) from classwork;

-- ex)3 How many times the package "Rcpp" was downloaded?
select count(package) as "Rcpp downloads" from classwork
    where package = 'Rcpp';

-- ex)4 How many recordings are from China ("CN")?
select count(country) as "China Recordsing" from classwork
where country = 'CN';

-- ex)5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package , count(package) from classwork
group by package
order by count(package);

-- ex)6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package, count(package) from classwork
where time between '09:00:00' and '11:00:00'
group by package
order by count(package) desc;

-- ex)7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(size) as "Recording Count" from classwork
where country = 'CN' or country = 'JP' or country = 'SG';

-- ex)8 Print the countries whose downloaded are more than the downloads from China ("CN")
select distinct country , count(country) from classwork
group by country
having count(country) > (select count(country)from classwork where country = 'CN');

-- ex)9 Print the average length of the package name of all the UNIQUE packages
select distinct package , char_length(package) from classwork;

-- ex)10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select distinct package , count(package) from classwork
group by package
order by count(package) desc
limit 1 offset 1;

-- ex)11 Print the name of the package whose download count is bigger than 1000.
select distinct package , count(package)  from classwork
group by package
having count(package) > 1000;

-- ex)12 The field "r_os" is the operating system of the users. -- Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
select distinct r_os, count(r_os) , count (r_version) from classwork
group by r_os, r_version
order by count(r_os) desc;


select round(100.0*(
    sum(case when )
    ))