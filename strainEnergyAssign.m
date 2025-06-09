function strainEnergy = strainEnergyAssign(s, i, j, grainID, EsMap)
    % Assign strain energy based on the spin value and stored energy map

    if s(i, j) ~= grainID
        strainEnergy = EsMap(i, j);
    else
        strainEnergy = 0;
    end

end
