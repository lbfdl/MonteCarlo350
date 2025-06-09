function [s, MCS, n, q, pacc, prex, time, strain_energy, temperature, E0, totalEnergyArr, grainBoundaryEnergyArr, strainEnergyArr, total_en, grain_boundary_en, strain_en] = loadMCPotts(MCS, new_strain_energy, new_temperature, new_E0)
    % Load the saved variables from a previous run

    file_name = ['restart_', num2str(MCS)];
    filepath = fullfile('output', file_name);

    load(filepath, 's', 'MCS', 'n', 'q', 'pacc', 'prex', 'time', 'strain_energy', 'temperature', 'E0', 'totalEnergyArr', 'grainBoundaryEnergyArr', 'strainEnergyArr', 'total_en', 'grain_boundary_en', 'strain_en');

    % Check if the new temperature is different from the previous one
    if new_temperature ~= temperature
        temperature = new_temperature;
    end

    % Check if the new E0 value is different from the previous one
    if new_E0 ~= E0
        E0 = new_E0;
    end

    % Check if the new strain energy is different from the previous one
    if new_strain_energy ~= strain_energy
        strain_en = 0;

        % Recalculate the strain energy for each lattice site
        for i = 1:n

            for j = 1:n
                strain_en = strain_en + strainEnergyAssign(s, i, j, 1, new_strain_energy);
            end

        end

        strain_energy = new_strain_energy;
    end

end
