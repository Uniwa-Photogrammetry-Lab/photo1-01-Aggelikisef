clf;
figure;
hold on;
xlim([-0.5 0.5 ])
ylim([-0.5  0.5])
grid on;

% Οι τέσσερις μπροστινές κορυφές
vAf = [-2 -0.5 5];
vBf = [-2  0.5 5];
vCf = [-1  0.5 5];
vDf = [-1 -0.5 5];

% Οι τέσσερις πίσω κορυφές
vAb = [-2 -0.5 6];
vBb = [-2  0.5 6];
vCb = [-1  0.5 6];
vDb = [-1 -0.5 6];

% Η μπροστινή έδρα
drawLine(projectVertex(vAf), projectVertex(vBf), 'blue');
drawLine(projectVertex(vBf), projectVertex(vCf), 'blue');
drawLine(projectVertex(vCf), projectVertex(vDf), 'blue');
drawLine(projectVertex(vDf), projectVertex(vAf), 'blue');

% Η πίσω έδρα
drawLine(projectVertex(vAb), projectVertex(vBb), 'red');
drawLine(projectVertex(vBb), projectVertex(vCb), 'red');
drawLine(projectVertex(vCb), projectVertex(vDb), 'red');
drawLine(projectVertex(vDb), projectVertex(vAb), 'red');

% Οι συνδέσεις μπροστινής και πίσω έδρας
drawLine(projectVertex(vAf), projectVertex(vAb), 'green');
drawLine(projectVertex(vBf), projectVertex(vBb), 'green');
drawLine(projectVertex(vCf), projectVertex(vCb), 'green');
drawLine(projectVertex(vDf), projectVertex(vDb), 'green');

function drawLine(v1, v2, color)
    % Συνάρτηση σχεδίασης γραμμών
    % Συνδέει τα σημεία v1 και v2 με μια γραμμή του χρώματος color
    line([v1(1) v2(1)], [v1(2) v2(2)], 'color', color)
end

function res = projectVertex(v)
    % Συνάρτηση προβολής σημείου στο επίπεδο προβολής
    % Το σημείο v = [X, Y, Z] προβάλλεται στο επίπεδο μέσω προοπτικής προβολής

    f = 0.1; % Εστιακή απόσταση
    
    % Υπολογισμός προβολής στο επίπεδο Z = f
    x_proj = f * (v(1) / v(3));
    y_proj = f * (v(2) / v(3));
    
    % Επιστροφή της δισδιάστατης προβολής
    res = [x_proj, y_proj];
end

