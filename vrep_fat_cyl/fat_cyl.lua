-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
    handle=simGetObjectHandle('Cylinder')
    init_pose=io.open("/home/ratnesh/projects/riss/vrep/fat_cyl_child_script/data/init_pose.csv", "w");
    final_pose=io.open("/home/ratnesh/projects/riss/vrep/fat_cyl_child_script/data/final_pose.csv", "w");
    erlCount=1;
    -- erlDebug=0;
    no_of_trials = 100;
    r2a = 180/math.pi;
end


if (sim_call_type==sim_childscriptcall_actuation) then

    local position=simGetObjectPosition(handle,-1)
    local orientation=simGetObjectOrientation(handle,-1)

    if erlCount < no_of_trials then

        if erlCount ~= 1 then -- no final pose written at the beginning of the simulation 
           -- if erlDebug == 0 then          
            final_pose:write(position[1],",",position[2],",",position[3],",",r2a*orientation[1],","
                ,r2a*orientation[2],",",r2a*orientation[3],"\n")
           -- end
        end

        --if erlDebug == 1 then 
       --       erlFile:write("\n RESET\n");
        --end

        position[1] =  math.random(); 
        position[2] =  math.random();
        position[3] =  0.1+math.random();

        orientation[1] =  math.random(-180,180)*math.pi/180.0;
        orientation[2] =  math.random(-180,180)*math.pi/180.0;
        orientation[3] =  math.random(-180,180)*math.pi/180.0;

        simSetObjectPosition(handle,-1,position);
        simSetObjectOrientation(handle,-1,orientation)

        --last value is garbage
        if erlCount ~= no_of_trials then
            init_pose:write(position[1],",",position[2],",",position[3],",",r2a*orientation[1],","
                ,r2a*orientation[2],",",r2a*orientation[3],"\n")
        end
     
        
       -- if erlDebug == 0 then 
        --    erlFile:write(position[1]," ",position[2]," ",position[3]," ",r2a*orientation[1]," "
         --      ,r2a*orientation[2]," ",r2a*orientation[3]," ")
        --end
    end

    --if erlDebug == 1 then
      --  erlFile:write(position[1]," ",position[2]," ",position[3]," ",r2a*orientation[1]," "
        --   ,r2a*orientation[2]," ",r2a*orientation[3],"\n")
    --end

    erlCount = erlCount+1;

end


if (sim_call_type==sim_childscriptcall_sensing) then

-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then
    erlFile:close()

-- Put some restoration code here

end