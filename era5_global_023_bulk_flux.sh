#!/bin/bash
for ((y=1940; y<=2022;++y))
do
   echo $y 

#"$((y))"01
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"01.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"01.nc era5_U_"$((y))"01.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_hourly_10m_v_component_of_wind_"$((y))"01.nc era5_A_"$((y))"01.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"01.nc era5_Ufv_"$((y))"01.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"01.nc era5_Uefv_"$((y))"01.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"01.nc era5_qb_"$((y))"01.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"01.nc era5_A_"$((y))"01.nc era5_A_ifthen_"$((y))"01.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"01.nc era5_qa_"$((y))"01.nc
#delete intermediate result 
rm -f era5_U_"$((y))"01.nc
rm -f era5_A_"$((y))"01.nc
rm -f era5_Ufv_"$((y))"01.nc
rm -f era5_Uefv_"$((y))"01.nc
rm -f era5_A_ifthen_"$((y))"01.nc

#"$((y))"02 
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"02.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"02.nc era5_U_"$((y))"02.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"02.nc era5_hourly_10m_v_component_of_wind_"$((y))"02.nc era5_A_"$((y))"02.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"02.nc era5_Ufv_"$((y))"02.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"02.nc era5_Uefv_"$((y))"02.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"02.nc era5_qb_"$((y))"02.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"02.nc era5_A_"$((y))"02.nc era5_A_ifthen_"$((y))"02.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"02.nc era5_qa_"$((y))"02.nc
#delete intermediate result 
rm -f era5_U_"$((y))"02.nc
rm -f era5_A_"$((y))"02.nc
rm -f era5_Ufv_"$((y))"02.nc
rm -f era5_Uefv_"$((y))"02.nc
rm -f era5_A_ifthen_"$((y))"02.nc

#"$((y))"03
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"03.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"03.nc era5_U_"$((y))"03.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"03.nc era5_hourly_10m_v_component_of_wind_"$((y))"03.nc era5_A_"$((y))"03.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"03.nc era5_Ufv_"$((y))"03.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"03.nc era5_Uefv_"$((y))"03.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"03.nc era5_qb_"$((y))"03.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"03.nc era5_A_"$((y))"03.nc era5_A_ifthen_"$((y))"03.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"03.nc era5_qa_"$((y))"03.nc
#delete intermediate result 
rm -f era5_U_"$((y))"03.nc
rm -f era5_A_"$((y))"03.nc
rm -f era5_Ufv_"$((y))"03.nc
rm -f era5_Uefv_"$((y))"03.nc
rm -f era5_A_ifthen_"$((y))"03.nc

#"$((y))"04
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"04.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"04.nc era5_U_"$((y))"04.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"04.nc era5_hourly_10m_v_component_of_wind_"$((y))"04.nc era5_A_"$((y))"04.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"04.nc era5_Ufv_"$((y))"04.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"04.nc era5_Uefv_"$((y))"04.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"04.nc era5_qb_"$((y))"04.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"04.nc era5_A_"$((y))"04.nc era5_A_ifthen_"$((y))"04.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"04.nc era5_qa_"$((y))"04.nc
#delete intermediate result 
rm -f era5_U_"$((y))"04.nc
rm -f era5_A_"$((y))"04.nc
rm -f era5_Ufv_"$((y))"04.nc
rm -f era5_Uefv_"$((y))"04.nc
rm -f era5_A_ifthen_"$((y))"04.nc

#"$((y))"05
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"05.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"05.nc era5_U_"$((y))"05.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"05.nc era5_hourly_10m_v_component_of_wind_"$((y))"05.nc era5_A_"$((y))"05.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"05.nc era5_Ufv_"$((y))"05.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"05.nc era5_Uefv_"$((y))"05.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"05.nc era5_qb_"$((y))"05.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"05.nc era5_A_"$((y))"05.nc era5_A_ifthen_"$((y))"05.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"05.nc era5_qa_"$((y))"05.nc
#delete intermediate result 
rm -f era5_U_"$((y))"05.nc
rm -f era5_A_"$((y))"05.nc
rm -f era5_Ufv_"$((y))"05.nc
rm -f era5_Uefv_"$((y))"05.nc
rm -f era5_A_ifthen_"$((y))"05.nc

#"$((y))"06
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"06.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"06.nc era5_U_"$((y))"06.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"06.nc era5_hourly_10m_v_component_of_wind_"$((y))"06.nc era5_A_"$((y))"06.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"06.nc era5_Ufv_"$((y))"06.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"06.nc era5_Uefv_"$((y))"06.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"06.nc era5_qb_"$((y))"06.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"06.nc era5_A_"$((y))"06.nc era5_A_ifthen_"$((y))"06.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"06.nc era5_qa_"$((y))"06.nc
#delete intermediate result
rm -f era5_U_"$((y))"06.nc
rm -f era5_A_"$((y))"06.nc
rm -f era5_Ufv_"$((y))"06.nc
rm -f era5_Uefv_"$((y))"06.nc
rm -f era5_A_ifthen_"$((y))"06.nc

#"$((y))"07
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"07.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"07.nc era5_U_"$((y))"07.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"07.nc era5_hourly_10m_v_component_of_wind_"$((y))"07.nc era5_A_"$((y))"07.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"07.nc era5_Ufv_"$((y))"07.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"07.nc era5_Uefv_"$((y))"07.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"07.nc era5_qb_"$((y))"07.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"07.nc era5_A_"$((y))"07.nc era5_A_ifthen_"$((y))"07.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"07.nc era5_qa_"$((y))"07.nc
#delete intermediate result
rm -f era5_U_"$((y))"07.nc
rm -f era5_A_"$((y))"07.nc
rm -f era5_Ufv_"$((y))"07.nc
rm -f era5_Uefv_"$((y))"07.nc
rm -f era5_A_ifthen_"$((y))"07.nc

#"$((y))"08
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"08.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"08.nc era5_U_"$((y))"08.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"08.nc era5_hourly_10m_v_component_of_wind_"$((y))"08.nc era5_A_"$((y))"08.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"08.nc era5_Ufv_"$((y))"08.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"08.nc era5_Uefv_"$((y))"08.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"08.nc era5_qb_"$((y))"08.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"08.nc era5_A_"$((y))"08.nc era5_A_ifthen_"$((y))"08.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"08.nc era5_qa_"$((y))"08.nc
#delete intermediate result
rm -f era5_U_"$((y))"08.nc
rm -f era5_A_"$((y))"08.nc
rm -f era5_Ufv_"$((y))"08.nc
rm -f era5_Uefv_"$((y))"08.nc
rm -f era5_A_ifthen_"$((y))"08.nc

#"$((y))"09
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"09.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"09.nc era5_U_"$((y))"09.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"09.nc era5_hourly_10m_v_component_of_wind_"$((y))"09.nc era5_A_"$((y))"09.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"09.nc era5_Ufv_"$((y))"09.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"09.nc era5_Uefv_"$((y))"09.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"09.nc era5_qb_"$((y))"09.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"09.nc era5_A_"$((y))"09.nc era5_A_ifthen_"$((y))"09.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"09.nc era5_qa_"$((y))"09.nc
#delete intermediate result
rm -f era5_U_"$((y))"09.nc
rm -f era5_A_"$((y))"09.nc
rm -f era5_Ufv_"$((y))"09.nc
rm -f era5_Uefv_"$((y))"09.nc
rm -f era5_A_ifthen_"$((y))"09.nc

#"$((y))"10
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"10.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"10.nc era5_U_"$((y))"10.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"10.nc era5_hourly_10m_v_component_of_wind_"$((y))"10.nc era5_A_"$((y))"10.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"10.nc era5_Ufv_"$((y))"10.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"10.nc era5_Uefv_"$((y))"10.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"10.nc era5_qb_"$((y))"10.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"10.nc era5_A_"$((y))"10.nc era5_A_ifthen_"$((y))"10.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"10.nc era5_qa_"$((y))"10.nc
#delete intermediate result
rm -f era5_U_"$((y))"10.nc
rm -f era5_A_"$((y))"10.nc
rm -f era5_Ufv_"$((y))"10.nc
rm -f era5_Uefv_"$((y))"10.nc
rm -f era5_A_ifthen_"$((y))"10.nc

#"$((y))"11
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"11.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"11.nc era5_U_"$((y))"11.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"11.nc era5_hourly_10m_v_component_of_wind_"$((y))"11.nc era5_A_"$((y))"11.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"11.nc era5_Ufv_"$((y))"11.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"11.nc era5_Uefv_"$((y))"11.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"11.nc era5_qb_"$((y))"11.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"11.nc era5_A_"$((y))"11.nc era5_A_ifthen_"$((y))"11.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"11.nc era5_qa_"$((y))"11.nc
#delete intermediate result
rm -f era5_U_"$((y))"11.nc
rm -f era5_A_"$((y))"11.nc
rm -f era5_Ufv_"$((y))"11.nc
rm -f era5_Uefv_"$((y))"11.nc
rm -f era5_A_ifthen_"$((y))"11.nc

#"$((y))"12
#calculate wind speed, U
cdo -b 32 -chname,u10,U -sqrt -add -sqr -selname,u10 era5_hourly_10m_u_component_of_wind_"$((y))"12.nc -sqr -selname,v10 era5_hourly_10m_v_component_of_wind_"$((y))"12.nc era5_U_"$((y))"12.nc
#calculate azimuth, A
cdo -b 32 -chname,u10,A -mulc,57.2957805 -atan2 era5_hourly_10m_u_component_of_wind_"$((y))"12.nc era5_hourly_10m_v_component_of_wind_"$((y))"12.nc era5_A_"$((y))"12.nc
#calculate friction velocity, U=Ufv/kappa*ln(z/z0)
cdo expr,'Ufv=U*0.4/ln(10/0.001);' era5_U_"$((y))"12.nc era5_Ufv_"$((y))"12.nc
#extract wind speed ≤ threshold friction velocity, effective friction velocity
cdo -chname,Ufv,Uefv -setrtomiss,0,0.2210001 era5_Ufv_"$((y))"12.nc era5_Uefv_"$((y))"12.nc
#caculate possible volume flux, qb, where 5 is flux scaling parameter(martin and kok sa), 0.221 m/s is threshold friction velocity(Utfv=sqrt(g*d*rho_s/rho_f)/10, in which g = 9.81 m/s2 is gravity acceleration; d = 0.00023 m (0.23±0.06mm) the mean of median grain diameter for 423 dunes of Chinese deserts in this study; rho_s=2650kg/m3 is sand density; rho_f=1.22kg/m3 is air density; fianally derive threshold friction velocity Utfv=0.221m/s)
cdo expr,'qb=5*0.221/9.81*1.22/1580*(Uefv*Uefv-0.221*0.221);' era5_Uefv_"$((y))"12.nc era5_qb_"$((y))"12.nc
#extract all azimuths with effective friction velocity, effective friction azimuth
cdo ifthen era5_qb_"$((y))"12.nc era5_A_"$((y))"12.nc era5_A_ifthen_"$((y))"12.nc
#revise azimuth A into flux azimuth qa
cdo chname,A,qa era5_A_ifthen_"$((y))"12.nc era5_qa_"$((y))"12.nc
#delete intermediate result
rm -f era5_U_"$((y))"12.nc
rm -f era5_A_"$((y))"12.nc
rm -f era5_Ufv_"$((y))"12.nc
rm -f era5_Uefv_"$((y))"12.nc
rm -f era5_A_ifthen_"$((y))"12.nc


#"$((y))"
#combine monthly qb
cdo cat era5_qb_"$((y))"01.nc era5_qb_"$((y))"02.nc era5_qb_"$((y))"03.nc era5_qb_"$((y))"04.nc era5_qb_"$((y))"05.nc era5_qb_"$((y))"06.nc era5_qb_"$((y))"07.nc era5_qb_"$((y))"08.nc era5_qb_"$((y))"09.nc era5_qb_"$((y))"10.nc era5_qb_"$((y))"11.nc era5_qb_"$((y))"12.nc era5_qb_"$((y))".nc
#delete intermediate result
rm -f era5_qb_"$((y))"01.nc
rm -f era5_qb_"$((y))"02.nc
rm -f era5_qb_"$((y))"03.nc
rm -f era5_qb_"$((y))"04.nc
rm -f era5_qb_"$((y))"05.nc
rm -f era5_qb_"$((y))"06.nc
rm -f era5_qb_"$((y))"07.nc
rm -f era5_qb_"$((y))"08.nc
rm -f era5_qb_"$((y))"09.nc
rm -f era5_qb_"$((y))"10.nc
rm -f era5_qb_"$((y))"11.nc
rm -f era5_qb_"$((y))"12.nc
#consider wind intermittence, we set the above monthly settomiss flux to zero, in order to make zero to participate the subsequent mean calculation; then calculate yearly mean of hourly qb, multiply 365days*24hours*60minutes*60seconds, the unit m2/s is converted to m2/yr; finally extract by land
cdo -chname,qb,FP -mulc,31536000 -timmean -setmisstoc,0 era5_qb_"$((y))".nc era5_FP_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_FP_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_"$((y))".nc
#delete intermediate result
rm -f era5_FP_setmisstoc_timmean_mulc_chname_"$((y))".nc

#combine monthly qa
cdo cat era5_qa_"$((y))"01.nc era5_qa_"$((y))"02.nc era5_qa_"$((y))"03.nc era5_qa_"$((y))"04.nc era5_qa_"$((y))"05.nc era5_qa_"$((y))"06.nc era5_qa_"$((y))"07.nc era5_qa_"$((y))"08.nc era5_qa_"$((y))"09.nc era5_qa_"$((y))"10.nc era5_qa_"$((y))"11.nc era5_qa_"$((y))"12.nc era5_qa_"$((y))".nc
#delete intermediate result
rm -f era5_qa_"$((y))"01.nc
rm -f era5_qa_"$((y))"02.nc
rm -f era5_qa_"$((y))"03.nc
rm -f era5_qa_"$((y))"04.nc
rm -f era5_qa_"$((y))"05.nc
rm -f era5_qa_"$((y))"06.nc
rm -f era5_qa_"$((y))"07.nc
rm -f era5_qa_"$((y))"08.nc
rm -f era5_qa_"$((y))"09.nc
rm -f era5_qa_"$((y))"10.nc
rm -f era5_qa_"$((y))"11.nc
rm -f era5_qa_"$((y))"12.nc

#combine qb and qa to form a new file
cdo merge era5_qb_"$((y))".nc era5_qa_"$((y))".nc era5_merge_"$((y))".nc
#calculate the due-east component of qb, the expression is qb_E=qb*sin(qa) 
cdo expr,'qb_E=qb*sin(qa);' era5_merge_"$((y))".nc era5_qb_E_"$((y))".nc
#calculate the due-north component of qb, the expression is qb_N=qb*cos(qa)
cdo expr,'qb_N=qb*cos(qa);' era5_merge_"$((y))".nc era5_qb_N_"$((y))".nc
#consider wind intermittence, we set the above monthly settomiss flux to zero, in order to make zero to participate the subsequent mean calculation; then calculate yearly mean of hourly qb_E, multiply 365days*24hours*60minutes*60seconds, the unit m2/s is converted to m2/yr; finally extract by land
cdo -chname,qb_E,RFP_E -mulc,31536000 -timmean -setmisstoc,0 era5_qb_E_"$((y))".nc era5_RFP_E_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_RFP_E_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_RFP_E_"$((y))".nc
#consider wind intermittence, we set the above monthly settomiss flux to zero, in order to make zero to participate the subsequent mean calculation; then calculate yearly mean of hourly qb_N, multiply 365days*24hours*60minutes*60seconds, the unit m2/s is converted to m2/yr; finally extract by land
cdo -chname,qb_N,RFP_N -mulc,31536000 -timmean -setmisstoc,0 era5_qb_N_"$((y))".nc era5_RFP_N_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_RFP_N_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_RFP_N_"$((y))".nc
#calculate the resultant possible volume flux, RFP, the unit is coverted from m2/s to m2/yr
cdo -chname,RFP_E,RFP -sqrt -add -sqr -selname,RFP_E era5_RFP_E_"$((y))".nc -sqr -selname,RFP_N era5_RFP_N_"$((y))".nc era5_RFP_"$((y))".nc
#calculate azimuth of the resultant possible volume flux, RFD, and convert to the normal 
cdo -chname,RFP_E,RFD -addc,180 -mulc,57.2957805 -atan2 -mulc,-1 era5_RFP_E_"$((y))".nc -mulc,-1 era5_RFP_N_"$((y))".nc era5_RFD_flawed_"$((y))".nc
#calculate flux variability index, FDV
cdo -chname,RFP,FDV -div era5_RFP_"$((y))".nc era5_FP_"$((y))".nc era5_FDV_flawed_"$((y))".nc
#the reason of using FP>0 to extract RFD and FDV: for the RFD, operate setmisstoc to due-east and due-north components, and result in false result due to atan2+180; and the reason of using FP>0 to constrain is that if FP is zero, RFP is zero, the corresponding RFD does not exist, so use FP>0 to extract to ensure the existence of RFD; for FDV, because in special situations, the ratio of RFP = 0 and FP = 0, is equal to 1
cdo setctomiss,0 era5_FP_"$((y))".nc era5_FP_setctomiss_"$((y))".nc
cdo ifthen era5_FP_setctomiss_"$((y))".nc era5_RFD_flawed_"$((y))".nc era5_RFD_"$((y))".nc
cdo ifthen era5_FP_setctomiss_"$((y))".nc era5_FDV_flawed_"$((y))".nc era5_FDV_"$((y))".nc
#delete intermediate result
rm -f era5_merge_"$((y))".nc
rm -f era5_qb_E_"$((y))".nc
rm -f era5_qb_N_"$((y))".nc
rm -f era5_RFP_E_setmisstoc_timmean_mulc_chname_"$((y))".nc
rm -f era5_RFP_N_setmisstoc_timmean_mulc_chname_"$((y))".nc
rm -f era5_RFD_flawed_"$((y))".nc
rm -f era5_FDV_flawed_"$((y))".nc
rm -f era5_FP_setctomiss_"$((y))".nc

#divide flux azimuth
#N, -11.25≤N＜11.25
cdo setvrange,-11.25,11.2499999 era5_qa_"$((y))".nc era5_qa_setvrange_N_"$((y))".nc
#extract the flux at azimuth N
cdo ifthen era5_qa_setvrange_N_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_N_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth N fluxes, finally extract by land
cdo -chname,qb,FP_N -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_N_"$((y))".nc era5_qb_ifthen_N_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_N_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_N_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_N_"$((y))".nc
rm -f era5_qb_ifthen_N_"$((y))".nc
rm -f era5_qb_ifthen_N_setmisstoc_timmean_mulc_chname_"$((y))".nc
#NNE, 11.25≤NNE＜33.75
cdo setvrange,11.25,33.7499999 era5_qa_"$((y))".nc era5_qa_setvrange_NNE_"$((y))".nc
#extract the flux at azimuth NNE
cdo ifthen era5_qa_setvrange_NNE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_NNE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth NNE fluxes, finally extract by land
cdo -chname,qb,FP_NNE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_NNE_"$((y))".nc era5_qb_ifthen_NNE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_NNE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_NNE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_NNE_"$((y))".nc
rm -f era5_qb_ifthen_NNE_"$((y))".nc
rm -f era5_qb_ifthen_NNE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#NE, 33.75≤NE＜56.25
cdo setvrange,33.75,56.2499999 era5_qa_"$((y))".nc era5_qa_setvrange_NE_"$((y))".nc
#extract the flux at azimuth NE
cdo ifthen era5_qa_setvrange_NE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_NE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth NE fluxes, finally extract by land
cdo -chname,qb,FP_NE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_NE_"$((y))".nc era5_qb_ifthen_NE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_NE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_NE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_NE_"$((y))".nc
rm -f era5_qb_ifthen_NE_"$((y))".nc
rm -f era5_qb_ifthen_NE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#ENE, 56.25≤ENE＜78.75
cdo setvrange,56.25,78.7499999 era5_qa_"$((y))".nc era5_qa_setvrange_ENE_"$((y))".nc
#extract the flux at azimuth ENE
cdo ifthen era5_qa_setvrange_ENE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_ENE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth ENE fluxes, finally extract by land
cdo -chname,qb,FP_ENE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_ENE_"$((y))".nc era5_qb_ifthen_ENE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_ENE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_ENE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_ENE_"$((y))".nc
rm -f era5_qb_ifthen_ENE_"$((y))".nc
rm -f era5_qb_ifthen_ENE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#E, 78.75≤E＜101.25
cdo setvrange,78.75,101.2499999 era5_qa_"$((y))".nc era5_qa_setvrange_E_"$((y))".nc
#extract the flux at azimuth E
cdo ifthen era5_qa_setvrange_E_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_E_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth E fluxes, finally extract by land
cdo -chname,qb,FP_E -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_E_"$((y))".nc era5_qb_ifthen_E_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_E_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_E_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_E_"$((y))".nc
rm -f era5_qb_ifthen_E_"$((y))".nc
rm -f era5_qb_ifthen_E_setmisstoc_timmean_mulc_chname_"$((y))".nc
#ESE, 101.25≤ESE＜123.75
cdo setvrange,101.25,123.7499999 era5_qa_"$((y))".nc era5_qa_setvrange_ESE_"$((y))".nc
#extract the flux at azimuth ESE
cdo ifthen era5_qa_setvrange_ESE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_ESE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth ESE fluxes, finally extract by land
cdo -chname,qb,FP_ESE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_ESE_"$((y))".nc era5_qb_ifthen_ESE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_ESE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_ESE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_ESE_"$((y))".nc
rm -f era5_qb_ifthen_ESE_"$((y))".nc
rm -f era5_qb_ifthen_ESE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#SE, 123.75≤SE＜146.25
cdo setvrange,123.75,146.2499999 era5_qa_"$((y))".nc era5_qa_setvrange_SE_"$((y))".nc
#extract the flux at azimuth SE
cdo ifthen era5_qa_setvrange_SE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_SE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth SE fluxes, finally extract by land
cdo -chname,qb,FP_SE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_SE_"$((y))".nc era5_qb_ifthen_SE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_SE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_SE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_SE_"$((y))".nc
rm -f era5_qb_ifthen_SE_"$((y))".nc
rm -f era5_qb_ifthen_SE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#SSE, 146.25≤SSE＜168.75
cdo setvrange,146.25,168.7499999 era5_qa_"$((y))".nc era5_qa_setvrange_SSE_"$((y))".nc
#extract the flux at azimuth SSE
cdo ifthen era5_qa_setvrange_SSE_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_SSE_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth SSE fluxes, finally extract by land
cdo -chname,qb,FP_SSE -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_SSE_"$((y))".nc era5_qb_ifthen_SSE_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_SSE_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_SSE_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_SSE_"$((y))".nc
rm -f era5_qb_ifthen_SSE_"$((y))".nc
rm -f era5_qb_ifthen_SSE_setmisstoc_timmean_mulc_chname_"$((y))".nc
#S, -180＜S＜-168.75, 168.75≤S≤180, note that here use setrtomiss
cdo setrtomiss,-168.75,168.7499999 era5_qa_"$((y))".nc era5_qa_setrtomiss_S_"$((y))".nc
#extract the flux at azimuth S
cdo ifthen era5_qa_setrtomiss_S_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_S_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth S fluxes, finally extract by land
cdo -chname,qb,FP_S -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_S_"$((y))".nc era5_qb_ifthen_S_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_S_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_S_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setrtomiss_S_"$((y))".nc
rm -f era5_qb_ifthen_S_"$((y))".nc
rm -f era5_qb_ifthen_S_setmisstoc_timmean_mulc_chname_"$((y))".nc
#SSW, -168.75≤SSW＜-146.25
cdo setvrange,-168.75,-146.2500001 era5_qa_"$((y))".nc era5_qa_setvrange_SSW_"$((y))".nc
#extract the flux at azimuth SSW
cdo ifthen era5_qa_setvrange_SSW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_SSW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth SSW fluxes, finally extract by land
cdo -chname,qb,FP_SSW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_SSW_"$((y))".nc era5_qb_ifthen_SSW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_SSW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_SSW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_SSW_"$((y))".nc
rm -f era5_qb_ifthen_SSW_"$((y))".nc
rm -f era5_qb_ifthen_SSW_setmisstoc_timmean_mulc_chname_"$((y))".nc
#SW, -146.25≤SW＜-123.75
cdo setvrange,-146.25,-123.7500001 era5_qa_"$((y))".nc era5_qa_setvrange_SW_"$((y))".nc
#extract the flux at azimuth SW
cdo ifthen era5_qa_setvrange_SW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_SW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth SW fluxes, finally extract by land
cdo -chname,qb,FP_SW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_SW_"$((y))".nc era5_qb_ifthen_SW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_SW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_SW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_SW_"$((y))".nc
rm -f era5_qb_ifthen_SW_"$((y))".nc
rm -f era5_qb_ifthen_SW_setmisstoc_timmean_mulc_chname_"$((y))".nc
#WSW, -123.75≤WSW＜-101.25
cdo setvrange,-123.75,-101.2500001 era5_qa_"$((y))".nc era5_qa_setvrange_WSW_"$((y))".nc
#extract the flux at azimuth WSW
cdo ifthen era5_qa_setvrange_WSW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_WSW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth WSW fluxes, finally extract by land
cdo -chname,qb,FP_WSW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_WSW_"$((y))".nc era5_qb_ifthen_WSW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_WSW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_WSW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_WSW_"$((y))".nc
rm -f era5_qb_ifthen_WSW_"$((y))".nc
rm -f era5_qb_ifthen_WSW_setmisstoc_timmean_mulc_chname_"$((y))".nc
#W, -101.25≤W＜-78.75
cdo setvrange,-101.25,-78.7500001 era5_qa_"$((y))".nc era5_qa_setvrange_W_"$((y))".nc
#extract the flux at azimuth W
cdo ifthen era5_qa_setvrange_W_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_W_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth W fluxes, finally extract by land
cdo -chname,qb,FP_W -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_W_"$((y))".nc era5_qb_ifthen_W_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_W_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_W_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_W_"$((y))".nc
rm -f era5_qb_ifthen_W_"$((y))".nc
rm -f era5_qb_ifthen_W_setmisstoc_timmean_mulc_chname_"$((y))".nc
#WNW, -78.75≤WNW＜-56.25
cdo setvrange,-78.75,-56.2500001 era5_qa_"$((y))".nc era5_qa_setvrange_WNW_"$((y))".nc
#extract the flux at azimuth WNW
cdo ifthen era5_qa_setvrange_WNW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_WNW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth WNW fluxes, finally extract by land
cdo -chname,qb,FP_WNW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_WNW_"$((y))".nc era5_qb_ifthen_WNW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_WNW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_WNW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_WNW_"$((y))".nc
rm -f era5_qb_ifthen_WNW_"$((y))".nc
rm -f era5_qb_ifthen_WNW_setmisstoc_timmean_mulc_chname_"$((y))".nc
#NW, -56.25≤NW＜-33.75
cdo setvrange,-56.25,-33.7500001 era5_qa_"$((y))".nc era5_qa_setvrange_NW_"$((y))".nc
#extract the flux at azimuth NW
cdo ifthen era5_qa_setvrange_NW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_NW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth NW fluxes, finally extract by land
cdo -chname,qb,FP_NW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_NW_"$((y))".nc era5_qb_ifthen_NW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_NW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_NW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_NW_"$((y))".nc
rm -f era5_qb_ifthen_NW_"$((y))".nc
rm -f era5_qb_ifthen_NW_setmisstoc_timmean_mulc_chname_"$((y))".nc
#NNW, -33.75≤NNW＜-11.25
cdo setvrange,-33.75,-11.2500001 era5_qa_"$((y))".nc era5_qa_setvrange_NNW_"$((y))".nc
#extract the flux at azimuth NNW
cdo ifthen era5_qa_setvrange_NNW_"$((y))".nc era5_qb_"$((y))".nc era5_qb_ifthen_NNW_"$((y))".nc
#first setmisstoc, then calculate the sum of azimuth NNW fluxes, finally extract by land
cdo -chname,qb,FP_NNW -mulc,31536000 -timmean -setmisstoc,0 era5_qb_ifthen_NNW_"$((y))".nc era5_qb_ifthen_NNW_setmisstoc_timmean_mulc_chname_"$((y))".nc
cdo ifthen era5_hourly_10m_u_component_of_wind_"$((y))"01.nc era5_qb_ifthen_NNW_setmisstoc_timmean_mulc_chname_"$((y))".nc era5_FP_NNW_"$((y))".nc
#delete intermediate result
rm -f era5_qa_setvrange_NNW_"$((y))".nc
rm -f era5_qb_ifthen_NNW_"$((y))".nc
rm -f era5_qb_ifthen_NNW_setmisstoc_timmean_mulc_chname_"$((y))".nc


#finally, delete intermediate result
rm -f era5_qb_"$((y))".nc
rm -f era5_qa_"$((y))".nc













done
