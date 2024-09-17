# wind-flux

Simply, we use all effective friction velocities derived from the instantaneous estimates of 10 m u-component and v-component hourly wind speeds of the ERA5-Land reanalysis product from 1950 to 2021 to infer sand flux based on the physics formulas of blown sand, and according to the existing studies (Gunn et al., 2021; Chanteloube et al., 2022; Gunn et al., 2022a; Gunn et al., 2022b), further improve the conceptual framework of sand flux, and simply define the flux potential (FP), resultant flux potential (RFP) and azimuthal flux potential (FP_N, FP_NNE, FP_NE, FP_NEE, FP_E, FP_EES, FP_ES, FP_ESS, FP_S, FP_SSW, FP_WS, FP_WWS, FP_W, FP_WWN, FP_NW and FP_NNW). 

Specifically, FP is the sum of FPs to all azimuths; RFP is the resultant flux potential, represents net sand transport potential under the different wind directions; RFD is the resultant flux direction, represents net trend of sand flux; FDV is flux directional variability, defined as the ratio of RFP/FP, represents that the wind comes from the same direction (approximate to 1) or many directions (approximate to 0); FP_azimuth represents the azimuthal flux potential, the sum of azimuthal flux potentials is flux potential (FP); RFP_N or RFP_E represent that FPs to all azimuths are projected to the due-north and due-east directions in order to solve the RFP, RFD and the final FDV. All fluxes are the bulk-volume flux, the units are m2 yr-1.

Main References

1 Guoshuai Li, Lihai Tan, Bao Yang, Tao Che, Guangcai Feng, Fredrik Charpentier Ljungqvist, Yayong Luo, Heqiang Du, Hui Zhao, Ying Zhang, Chunlin Huang, Ning Huang, Wenjun Tang, Rui Jin, Xin Li*. Site selection of desert solar farms based on heterogeneous sand flux. npj Climate and Atmospheric Science 7, 61 (2024).

Other references

2 Gunn, A., Wanker, M., Lancaster, N., Edmonds, D. A., Ewing, R. C. & Jerolmack, D. J. 2021. Circadian rhythm of dune-field activity. Geophysical Research Letters, 48, e2020GL090924.

3 Chanteloube, C., Barrier, L., Derakhshani, R., Gadal, C., Braucher, R., Payet, V., Léanni, L. & Narteau, C. 2022. Source-to-sink aeolian fluxes from arid landscape dynamics in the Lut Desert. Geophysical Research Letters, 49, e2021GL097342. 

4 Gunn, A., Casasanta, G., Di Liberto, L., Falcini, F., Lancaster, N. & Jerolmack, D. J. 2022a. What sets aeolian dune height? Nature Communications, 13, 2401. 

5 Gunn, A., East, A. & Jerolmack, D. J. 2022b. 21st-century stagnation in unvegetated sand-sea activity. Nature Communications, 13, 3670.
