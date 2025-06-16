# Initial assessment of vegetation impacts after the Eureka fire

This repository contains the input data and outputs for an initial assessment of vegetation impacts after the Eureka Fire, as documented in the Quarto notebook (`eureka_fire_exploration.qmd`) and the rendered HTML report, published [here on RPubs](https://rpubs.com/mzomer/1322857). This exploratory analysis helps characterize burn severity, vegetation types within the burned area, and varying fire history across the fire perimeter to support validation of the [Fire Severity Tool](https://storage.googleapis.com/fire-recovery-web/prod/fireSeverity.html) from the Schmidt Center for Data Science and Environment (DSE) and to inform post-fire reporting.

---

## 📂 Repository Structure

```plaintext
📂 eureka_fire_eda
├── inputs/
│   ├── jotrgeodata.gpkg                                      Vegetation polygons (layer: JOTR_VegPolys)
│   ├── refined_rbr.tif                                       Refined Relative Burn Ratio (RBR) raster
│   ├── HistFires_JOTR_MOJA/                                  Historic fires shapefile and related files
│   ├── 2025-05-27_strip_8121430_composite_file_format.tif    Pre-burn PlanetScope image
│   ├── 2025-06-09_strip_8121430_composite_file_format.tif    Post-burn PlanetScope image
│
├── outputs/
│   ├── fire_perimeter/                     Extracted Eureka fire boundary (optional export)
│   ├── veg_burned_summary.csv              Vegetation type area inside fire boundary
│   ├── severity_veg_summary.csv            Fire severity stats by vegetation type
│   ├── severity_fire_history.csv           Severity stats by intersecting historic fires
│   ├── severity_veg_firehist.csv           Severity stats by veg type & fire history
│
├── eureka_fire_exploration_files/
│   ├── figure-html/                        Auto-generated figures used in HTML
│   ├── libs/                               Supporting JS/CSS for interactive widgets
│
├── eureka_fire_exploration.qmd             Main Quarto analysis notebook
├── eureka_fire_exploration.html            Rendered HTML report (same content as RPubs version)
├── NDVI_planetscope.R                      Additional script for pre/post-burn NDVI from PlanetScope
├── README.md                               Project description & instructions
```

## 📑 About This Analysis

### Fire severity analysis

This initial assessment explores the Relativized Burn Ratio (RBR) for the Eureka Fire (Joshua Tree National Park, June 2025), including:

- Fire burn severity across the entire fire perimeter
- Vegetation types (area and percentage) burned
- Fire burn severity summarized by vegetation type
- Fire burn severity by fire history (noting that much of the area also burned in 2006)
- Fire burn severity jointly by vegetation type and fire history

### PlanetScope analysis

This auxillary analysis investigates pre- and post-burn NDVI baed on PlanetScope satellite images. The images used are four-band images (RGB-IR) that were harmonized (by Planet) using Sentinel-2

Caveat: The main goal of this analysis was to investigate *spatial* differences in NDVI across the burn perimeter. Since the two images were taken my two different satellites, the *temporal* comparison across images would require further bencharking beyond the scope of this study. 
