-- CommonLib
--	by Rubenwardy
-------------------------------------------------------------------------------
-- Adds common functions that help minetest modders achieve
-- perfection in both their mod, and in interacting with other mods
-------------------------------------------------------------------------------
-- #### vector_cmp.lua
-- functions that compare vectors
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Misc vector functions by celeron55, wtfpl
-------------------------------------------------------------------------------
function v3.cmp(v, w)
    return (
        v.x == w.x and
        v.y == w.y and
        v.z == w.z
    )
end
function v3.equal(v1, v2)
	return v1.x == v2.x and v1.y == v2.y and v1.z == v2.z
end
function v3.distance(v, w)
    return math.sqrt(
        math.pow(v.x - w.x, 2) +
        math.pow(v.y - w.y, 2) +
        math.pow(v.z - w.z, 2)
    )
end
function v3.rotate_y(v, a)
    return {
        x = v.x * math.cos(a) - v.z * math.sin(a),
        y = v.y,
        z = v.x * math.sin(a) + v.z * math.cos(a),
    }
end

-------------------------------------------------------------------------------
-- v3.get_direction(pos1,pos2)
-------------------------------------------------------------------------------
-- pos1: source point
-- pos2: destination point
-------------------------------------------------------------------------------
function v3.get_direction(pos1,pos2)

	local x_raw = pos2.x -pos1.x
	local y_raw = pos2.y -pos1.y
	local z_raw = pos2.z -pos1.z


	local x_abs = math.abs(x_raw)
	local y_abs = math.abs(y_raw)
	local z_abs = math.abs(z_raw)

	if 	x_abs >= y_abs and
		x_abs >= z_abs then

		y_raw = y_raw * (1/x_abs)
		z_raw = z_raw * (1/x_abs)

		x_raw = x_raw/x_abs

	end

	if 	y_abs >= x_abs and
		y_abs >= z_abs then


		x_raw = x_raw * (1/y_abs)
		z_raw = z_raw * (1/y_abs)

		y_raw = y_raw/y_abs

	end

	if 	z_abs >= y_abs and
		z_abs >= x_abs then

		x_raw = x_raw * (1/z_abs)
		y_raw = y_raw * (1/z_abs)

		z_raw = z_raw/z_abs

	end

	return {x=x_raw,y=y_raw,z=z_raw}

end