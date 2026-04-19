clc;
disp("Initializing Rectifier Assignment project...")

% ===== Force Project Root (location of this file) =====
project_root = fileparts(mfilename('fullpath'));
cd(project_root);

fprintf("Project root set to: %s\n", project_root);

% ===== Core Folders =====
folders = ["models", "scripts", "results", "report"];

for k = 1:length(folders)
    folder_path = fullfile(project_root, folders(k));
    
    if ~isfolder(folder_path)
        mkdir(folder_path);
        fprintf("Created folder: %s\n", folders(k));
    end
    
    addpath(folder_path);
end

% ===== Results Subfolders =====
results_sub = ["Q1", "Q2", "Q3"];

for k = 1:length(results_sub)
    sub_path = fullfile(project_root, "results", results_sub(k));
    
    if ~isfolder(sub_path)
        mkdir(sub_path);
        fprintf("Created results/%s\n", results_sub(k));
    end
end

% ===== Remove Conflicting Old Projects (important) =====
old_projects = ["Line_Coding", "Super-heterodyne_Receiver"];

for k = 1:length(old_projects)
    if contains(path, old_projects(k))
        rmpath(genpath(fullfile("E:\EECE_Projects", old_projects(k))));
        fprintf("Removed old project from path: %s\n", old_projects(k));
    end
end

% ===== Save Path =====
savepath;

disp("Project initialized successfully ✅")