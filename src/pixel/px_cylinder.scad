function _px_cylinder_px_circle(radius, filled = true) = 
    let(range = [-radius: radius - 1])
    filled ? [
        for(y = range)        
           for(x = range)
               let(v = [x, y])
               if(norm(v) < radius) v
    ] :
    let(ishell = radius * radius - 2 * radius)
    [
        for(y = range)        
           for(x = range)
               let(
                   v = [x, y],
                   leng = norm(v)
               )
               if(leng < radius && (leng * leng) > ishell) v    
    ];

function _px_cylinder_diff_r(r, h, filled) =
    let(
        r1 = r[0],
        r2 = r[1],
        dr = (r2 - r1) / (h - 1)
    )
    [
        for(i = 0; i < h; i = i + 1)
        let(r = round(r1 + dr * i))
        each [
            for(pt = _px_cylinder_px_circle(r, filled))
            [pt[0], pt[1], i]
        ]
    ]; 

function _px_cylinder_same_r(r, h, filled) =
    let(c = _px_cylinder_px_circle(r, filled))
    [
        for(i = 0; i < h; i = i + 1)
        each [
            for(pt = c)
            [pt[0], pt[1], i]
        ]
    ]; 

function px_cylinder(r, h, filled = true) =
    is_num(r) ? 
        _px_cylinder_same_r(r, h, filled) :
        _px_cylinder_diff_r(r, h, filled); 