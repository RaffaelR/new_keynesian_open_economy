function r1 = find_func_min_point_nc(x_opt_name,upper,lower,steps,inst,outparams,x_full_name)

final_coord=[];
min_response=10e6;
i=1;
r3_final=generate_param_space(lower,upper,steps);
for i=1:length(r3_final)
r3_cell = r3_final{i};
welf_value = welfare_calculator(r3_cell,upper,lower,x_opt_name,inst,outparams,x_full_name);
if welf_value < min_response
            min_response = welf_value;
            final_coord = [welf_value r3_cell];
end
end

dynare Open_Nk_nl_tau_Opt_fun_nc.mod;
if inst==1
welf_final = welfare_calculator(final_coord(2:end),upper,lower,x_opt_name,3,outparams,x_full_name);
elseif inst==2
welf_final = welfare_calculator(final_coord(2:end),upper,lower,x_opt_name,4,outparams,x_full_name);    
end
r1= [welf_final final_coord(2:end)];

function r2 = generate_param_space(lower,upper, steps)
	resp={};
	vec=zeros(1,length(lower));
	r2_1 = helper(1, lower, upper, steps, vec,resp);
    r2=r2_1;

function r3 = helper(cur_dimension, lower, upper, steps, accumulated_point, output_set)
    if cur_dimension == length(lower)+1
        output_set{length(output_set)+1} = accumulated_point;
        r3=output_set;
        return
    end
    num_steps = fix((upper(cur_dimension) - lower(cur_dimension))/steps(cur_dimension));
    for k=0:num_steps
        cur_param_val = lower(cur_dimension) + k*steps(cur_dimension);
        accumulated_point(cur_dimension) = cur_param_val;
        output_set = helper(cur_dimension+1, lower, upper, steps, accumulated_point, output_set);
    end
r3 = output_set;