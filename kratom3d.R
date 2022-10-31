# Using Raytracer on Kratom Data
library(ggplot2)
library(rayshader)
mtplot = ggplot(KratomSales1) + 
  geom_point(aes(x = TotalSales, y = KratomSales1$ViolentCrime, color = KratomSales1$Units))

par(mfrow = c(1, 2))
plot_gg(mtplot, width = 3.5, raytrace = TRUE, preview = TRUE)

plot_gg(mtplot, width = 3.5, multicore = TRUE, windowsize = c(1080, 1080), 
        zoom = 0.85, phi = 35, theta = 30, sunangle = 225, soliddepth = -0.5)
Sys.sleep(0.2)
render_snapshot(clear = TRUE)
# Fancier Rendering
Sys.sleep(0.2)
render_highquality(samples = 256, aperture=30, light = FALSE, focal_distance = 1700,
                   obj_material = rayrender::dielectric(attenuation = c(1,1,0.3)/200), 
                   ground_material = rayrender::diffuse(checkercolor = "grey80",sigma=90,checkerperiod = 100),
                   environment_light = tempfilehdr, camera_lookat = c(0,-150,0))