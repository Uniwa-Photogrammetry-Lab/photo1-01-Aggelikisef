clf;
figure;
hold on;
xlim([-0.5 0.5 ])
ylim([-0.5 0.5])
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
    line([v1(1) v2(1)], [v1(2) v2(2)], 'color', color)
end

function res = projectVertex(v)
    % Αυθαίρετες παράμετροι για τον μετασχηματισμό
    x0 = -0.2;   % Μετατόπιση προβολής στον άξονα X
    y0 = -0.2;   % Μετατόπιση προβολής στον άξονα Y
    f  = 0.2; % Εστιακή απόσταση
    X0 = 0;   % Θέση κάμερας στον άξονα X
    Y0 = 0;   % Θέση κάμερας στον άξονα Y
    Z0 = -1;   % Θέση κάμερας στον άξονα Z

    % Μετατόπιση συντεταγμένων σύμφωνα με τη θέση της κάμερας
    X = v(1) - X0;
    Y = v(2) - Y0;
    Z = v(3) - Z0;

    % Υπολογισμός προβολής στο επίπεδο Z = f
    x_proj = x0 + f * (X / Z);
    y_proj = y0 + f * (Y / Z);
    
    % Επιστροφή της δισδιάστατης προβολής
    res = [x_proj, y_proj];
end
