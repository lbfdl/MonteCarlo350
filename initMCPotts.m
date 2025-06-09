function [s, MCS, n, q, pacc, prex, time, N, nconfig, strain_energy, temperature, E0, EsMap, totalEnergyArr, grainBoundaryEnergyArr, strainEnergyArr, total_en, grain_boundary_en, strain_en] = initMCPotts(n, nstep, q, strain_energy, temperature, E0)
    % Initialize the Monte Carlo Potts model

    % initialize variables
    s = randi(q, n);
    MCS = 0;
    pacc = double.empty;
    prex = double.empty;
    time = double.empty;

    N = n * n;
    nconfig = N * nstep;
    totalEnergyArr = double.empty;
    grainBoundaryEnergyArr = double.empty;
    strainEnergyArr = double.empty;

    total_en = 0;
    grain_boundary_en = 0;
    strain_en = 0;

    % create stored energy map from the provided value or matrix
    if isscalar(strain_energy)
        EsMap = strain_energy * ones(n);
    else
        EsMap = strain_energy;
    end
    % zero out recrystallized cells
    EsMap(s == 1) = 0;

    % calculate initial grain boundary energy and strain energy
    for i = 1:n

        for j = 1:n
            sij = s(i, j);
            sig = calculateEnergy(sij, s, n, i, j);
            grain_boundary_en = grain_boundary_en + E0 * (8 - sig) / 2;
            strain_en = strain_en + strainEnergyAssign(s, i, j, 1, EsMap);
        end

    end

end
