function [strainEnergy] = strainEnergyAssign(s, i, j, grainID, strain_energy)
    % Assign strain energy based on the spin value

    if s(i, j) ~= grainID
        strainEnergy = strain_energy;
    else
        strainEnergy = 0;
    end

end
