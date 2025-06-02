% Solar System Expert System

% -------------------------------
% Planets in our solar system
% -------------------------------

planet(mercury).
planet(venus).
planet(earth).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).

% -------------------------------
% Dwarf planets
% -------------------------------

dwarf_planet(pluto).
dwarf_planet(haumea).
dwarf_planet(makemake).
dwarf_planet(eris).
dwarf_planet(ceres).

% -------------------------------
% Moons (Some major examples)
% -------------------------------

moon(earth, moon).
moon(mars, phobos).
moon(mars, deimos).
moon(jupiter, io).
moon(jupiter, europa).
moon(jupiter, ganymede).
moon(jupiter, callisto).
moon(saturn, titan).
moon(saturn, enceladus).
moon(uranus, titania).
moon(neptune, triton).

% -------------------------------
% Distance from Sun (in million km)
% -------------------------------

distance_from_sun(mercury, 57.9).
distance_from_sun(venus, 108.2).
distance_from_sun(earth, 149.6).
distance_from_sun(mars, 227.9).
distance_from_sun(jupiter, 778.5).
distance_from_sun(saturn, 1434).
distance_from_sun(uranus, 2871).
distance_from_sun(neptune, 4495).
distance_from_sun(pluto, 5906.4).

% -------------------------------
% Planet type
% -------------------------------

terrestrial_planet(mercury).
terrestrial_planet(venus).
terrestrial_planet(earth).
terrestrial_planet(mars).

gas_giant(jupiter).
gas_giant(saturn).

ice_giant(uranus).
ice_giant(neptune).

% -------------------------------
% Presence of rings
% -------------------------------

has_rings(jupiter).
has_rings(saturn).
has_rings(uranus).
has_rings(neptune).

% -------------------------------
% Star Types (Simplified)
% -------------------------------

star(sun, g_type).
star(sirius, a_type).
star(betelgeuse, m_type).
star(vega, a_type).
star(rigel, b_type).
star(proxima_centauri, m_type).
star(alpha_centauri_a, g_type).
star(alpha_centauri_b, k_type).

% -------------------------------
% Star Temperatures (approx. K)
% -------------------------------

star_temperature(o_type, 30000).
star_temperature(b_type, 20000).
star_temperature(a_type, 10000).
star_temperature(f_type, 7500).
star_temperature(g_type, 5800).
star_temperature(k_type, 4500).
star_temperature(m_type, 3000).

% -------------------------------
% Star Color
% -------------------------------

star_color(o_type, blue).
star_color(b_type, blue_white).
star_color(a_type, white).
star_color(f_type, yellow_white).
star_color(g_type, yellow).
star_color(k_type, orange).
star_color(m_type, red).

% -------------------------------
% Predicates
% -------------------------------

is_planet(X) :- planet(X).
is_dwarf_planet(X) :- dwarf_planet(X).
is_moon(Planet, Moon) :- moon(Planet, Moon).

planet_type(X, 'Terrestrial') :- terrestrial_planet(X).
planet_type(X, 'Gas Giant') :- gas_giant(X).
planet_type(X, 'Ice Giant') :- ice_giant(X).
planet_type(X, 'Dwarf Planet') :- dwarf_planet(X).

has_moons(X) :- moon(X, _).

star_type(Star, Type) :- star(Star, Type).
star_temp(Star, Temp) :-
    star(Star, Type),
    star_temperature(Type, Temp).

star_visual_color(Star, Color) :-
    star(Star, Type),
    star_color(Type, Color).

planet_has_rings(X) :- has_rings(X).

% -------------------------------
% Sample Queries
% -------------------------------

% 1. List all planets
% ?- planet(X).

% 2. List all dwarf planets
% ?- dwarf_planet(X).

% 3. What type of planet is Earth?
% ?- planet_type(earth, Type).

% 4. Which planets have rings?
% ?- has_rings(X).

% 5. Does Mars have any moons?
% ?- has_moons(mars).

% 6. List moons of Jupiter
% ?- moon(jupiter, Moon).

% 7. What is the temperature of Sirius?
% ?- star_temp(sirius, Temp).

% 8. What is the color of Betelgeuse?
% ?- star_visual_color(betelgeuse, Color).

% 9. What type of star is Sun?
% ?- star_type(sun, Type).

% 10. Which stars are M-type?
% ?- star(Star, m_type).

% -------------------------------
% Advanced Inference Examples
% -------------------------------

% Stars hotter than Sun
hotter_star_than_sun(Star) :-
    star(sun, SunType),
    star_temperature(SunType, SunTemp),
    star(Star, Type),
    star_temperature(Type, Temp),
    Temp > SunTemp.

% Planets beyond 1000 million km
distant_planet(Planet) :-
    distance_from_sun(Planet, Distance),
    Distance > 1000.

