

# dukecolor

A list of palettes from Duke University Style Guide

### Installation

```r
install.packages("dukecolor")
```

Or development version:

```r
devtools::install_github("chuvanan/dukecolor")
```

### Usage

```r
library("dukecolor")

# See all palettes
names(duke_palettes)
# [1] "PrimaryBlues"   "SecondaryBlues" "SecondaryColor" "Neutrals"
```

#### Primary Blues


```r
duke_palette("PrimaryBlues")
```

![](figures/primary_blues.png)


#### Secondary Blues

```r
duke_palette("SecondaryBlues")
```

![](figures/secondary_blues.png)


#### Secondary Color Options

```r
duke_palette("SecondaryColor")
```

![](figures/secondary_color.png)


#### Neutrals

```r
duke_palette("Neutrals")
```

![](figures/neutrals.png)


### Demo

![](figures/mtcars.png)
