/**
* nz_worley2.scad
*
* @copyright Justin Lin, 2020
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-nz_worley2.html
*
**/

use <../util/rand.scad>;
use <_impl/_nz_worley2_impl.scad>;

function nz_worley2(x, y, seed, grid_w = 10, dist = "euclidean") =
    let(sd = is_undef(seed) ? floor(rand(0, 256)) : seed % 256)
    _nz_worley2([x, y], sd, grid_w, dist); 