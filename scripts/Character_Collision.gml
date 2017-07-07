//React to inputs

move = key_left + key_right;
hsp = move * movespeed;

if (global.Convo = true)
{
    move = 0;
    hsp = 0;
}

if (key_down || place_meeting(x,y,obj_roof))
{
    key_down = true;
}

if(key_jump && jump_current > 0)
{
    vsp = key_jump * -jumpspeed;
    jump_current--;
}

//Gravity maximum speed
if(vsp < 20)
{
    vsp += grav;
}

//Horizontal Collision
if (place_meeting(x+hsp, y, obj_wall))
{
    while(!place_meeting(x+sign(hsp), y, obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

//Vertical Collision
if (place_meeting(x, y+vsp, obj_wall))
{
    while(!place_meeting(x, y+sign(vsp), obj_wall))
    {
        y += sign(vsp);
    } 
    if(vsp > 0)
    {
        jump_current = jump_number;
    }
    vsp = 0;
}
//Horizontal Collision to roofs
if (place_meeting(x+hsp, y, obj_roof))
{
    while(!place_meeting(x+sign(hsp), y, obj_roof))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

//Vertical Collision to roofs
if (place_meeting(x, y+vsp, obj_roof) && !key_down)
{
    while(!place_meeting(x, y+sign(vsp), obj_roof))
    {
        y += sign(vsp);
    }    
    if(vsp > 0)
    {
        jump_current = jump_number;
    }
    vsp = 0;
}
// If the key_down was pressed, the character should fall
else if(place_meeting(x, y+vsp, obj_roof) && key_down)
{
    vsp = key_down * jumpspeed-3;
}



x += hsp;
y += vsp;
