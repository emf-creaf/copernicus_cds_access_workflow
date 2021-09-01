library(ecmwfr)
library(keyring)


wf_set_key(
  user   = "83761",
  key   = keyring::key_get('copernicus cds', username = '83761'),
  service = 'cds'
)

request <- list(
  format = "netcdf",
  product_type = "monthly_averaged_reanalysis",
  area = c(44, -10, 35, 4),
  time = "00:00",
  month = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"),
  year = c("1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021"),
  variable = c("10m_u_component_of_wind", "2m_dewpoint_temperature", "2m_temperature", "surface_net_solar_radiation", "total_precipitation"),
  dataset_short_name = "reanalysis-era5-land-monthly-means",
  target = "download.nc"
)


nc_file <- wf_request(
  user = "83761",
  request = request,   
  transfer = TRUE,  
  path = ".",
  verbose = TRUE
)


