% problem 3.131 & 3.132
% A plate with a radius of 5-meters experiences loads at four evenly-spaced
% points, 4-meters from the center O.
% 3.131: Find the resultant force and moment about O.
% 2.132: Find the minimum load force required to maintain equilibrium.

% Problem 3.131
Fa = [ 0 -25 0 ];
Ra = [ 4   0 0 ];
Ma = cross( Ra , Fa );

Fb = [ 0 -75 0 ];
Rb = [ 0   0 4 ];
Mb = cross( Rb , Fb );

Fc = [ 0 -100 0 ];
Rc = [ -4   0 0 ];
Mc = cross( Rc , Fc );

Fd = [ 0 -125  0 ];
Rd = [ 0    0 -4 ];
Md = cross( Rd , Fd );

RF = Fa + Fb + Fc + Fd;
RM = Ma + Mb + Mc + Md;

fprintf( ...
    "The resultant force RF is %+.2fi %+.2fj %+.2fk\n" + ...
    "The resultant moment RM is %+.2fi %+.2fj %+.2fk\n" , ...
    RF , RM ...
);

lambda = [ 0 0 0 ];
lambda(1) = RM(3) /  RF(2);
lambda(3) = RM(1) / -RF(2);
magF = norm( RF );

fprintf("" + ...
    "\nThe point of contact of RF is %+.2fi %+.2fj %+.2fk\n" + ...
    "The magnitude of RF is %.2f\n" , ...
    lambda , magF ...
);

% Problem 3.132

rho = lambda / norm(lambda);
R_nf = -rho * 5;

fprintf( ...
    "\nThe point of application of the new force is %+.2fi %+.2fj %+.2fk\n" , ...
    R_nf ...
);

F_nf = [ 0 0 0 ];
F_nf(2) = -RM(3) / R_nf(1);
M_nf = cross( R_nf , F_nf );

fprintf("The new force is %+.2fi %+.2fj %+.2fk\n" , F_nf );

% Check work:

RF_nf = RF + F_nf;
RM_nf = RM + M_nf;

fprintf( ...
    "\nThe resultant force, including the new force, is %+.2fi %+.2fj %+.2fk\n" + ...
    "The resultant moment, including the new moment, is %+.2fi %+.2fj %+.2fk\n" , ...
    RF_nf , RM_nf ...
);

%-----------------------------------------------------------------------------
% Figure Window
figure( 'Position' , [ 25 , 65 , 450 , 450 ] );
quiver3( 0 , 0 , 0 , 0 , 0 , 0 );
hold on
% FBD
% Bottom Circular Plate
cxy = 0;
cr = 500;
th = 0 : pi/100 : 2*pi;
xunit = cr * cos(th) + cxy;
yunit = cr * sin(th) + cxy;
zunit = zeros( 1 , 201 );
plot3( xunit , yunit , zunit );

% Axes
xyax = [ -500 500 ]; zax = [ 0 0 ];
line( xyax , zax , zax , 'color' , '#888888');
line( zax , xyax , zax , 'color' , '#888888');

% Forces
quiver3( 400 , 0 , 25 , 0 , 0 , -25 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#0072BD' , ...
    'MaxHeadSize' , 1.5 ...
    );
quiver3( 0 , 400 , 75 , 0 , 0 , -75 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#EDB120' , ...
    'MaxHeadSize' , .75 ...
    );
quiver3( -400 , 0 , 100 , 0 , 0 , -100 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , 'red' , ...
    'MaxHeadSize' , .35 ...
    );
quiver3( 0 , -400 , 125 , 0 , 0 , -125 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , 'green' , ...
    'MaxHeadSize' , .35 ...
    );

title("Free Body Diagram [ kN-cm ]", 'FontSize', 16 );

xlim([ -500 500 ])
xticks( -600.00:100:600.00 );
xlabel("Z-axis");

ylim([ -500 500 ]);
yticks( -600.00:100:600.00 );
ylabel("X-axis");

zlim([ -1.00 150 ]);
zticks( -1.00:50:150.00 );
zlabel("Y-Axis")

view( [ 135.00 45.00 ] );

hold off

%-----------------------------------------------------------------------------
% Figure Window
figure( 'Position' , [ 500 , 65 , 450 , 450 ] );
quiver3( 0 , 0 , 0 , 0 , 0 , 0 , 0 );
hold on
% FBD
cxy = 0;
cr = 500;
th = 0 : pi/100 : 2*pi;
xunit = cr * cos(th) + cxy;
yunit = cr * sin(th) + cxy;
zunit = zeros( 1 , 201 );
plot3( xunit , yunit , zunit );

xyax = [ -600 600 ]; zax = [ 0 0 ];
line( xyax , zax , zax , 'color' , '#888888');
line( zax , xyax , zax , 'color' , '#888888');

% Forces
quiver3( -62 , -92 , 325 , 0 , 0 , -325 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#0072BD' ...
    );
quiver3( 0 , 0 , 0 , -62 , -92 , 0 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#EDB120' , ...
    'MaxHeadSize' , 12 ...
    );
quiver3( -62 , -92 , 0 , 300 , -200 , 0 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , 'red' , ...
    'MaxHeadSize' , .5 ...
    );

title("Force-Couple Diagram [ kN-cm ]", 'FontSize', 16 );

xlim([ -550 550 ])
xticks( -600:100:600 );
xlabel("Z-axis");

ylim([ -550 550 ]);
yticks( -600:100:600 );
ylabel("X-axis");

zlim([ -5 350 ]);
zticks( -100:100:500 );
zlabel("Y-Axis")

view( [ 135.00 45.00 ] );

hold off

%-----------------------------------------------------------------------------
% Figure Window
figure( 'Position' , [ 975 , 65 , 450 , 450 ] );
quiver3( 0 , 0 , 0 , 0 , 0 , 0 , 0 );
hold on
% FBD
cxy = 0;
cr = 500;
th = 0 : pi/100 : 2*pi;
xunit = cr * cos(th) + cxy;
yunit = cr * sin(th) + cxy;
zunit = zeros( 1 , 201 );
plot3( xunit , yunit , zunit );

xyax = [ -600 600 ]; zax = [ 0 0 ];
line( xyax , zax , zax , 'color' , '#888888');
line( zax , xyax , zax , 'color' , '#888888');

% Forces
quiver3( -62 , -92 , 325 , 0 , 0 , -325 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#0072BD' ...
    );
quiver3( 0 , 0 , 0 , -62 , -92 , 0 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#EDB120' , ...
    'MaxHeadSize' , 12 ...
    );
quiver3( 277 , 416 , 72.11 , 0 , 0 , -72.11 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#77AC30' , ...
    'MaxHeadSize' , 4 ...
    );
quiver3( 0 , 0 , 0 , 277 , 416 , 0 , 0 , ...
    'LineWidth' , 1.5 , ...
    'Color' , '#D95319' , ...
    'MaxHeadSize' , .5 ...
    );

title("Equilibrium Load Force [ kN-cm ]", 'FontSize', 16 );

xlim([ -550 550 ])
xticks( -600:100:600 );
xlabel("Z-axis");

ylim([ -550 550 ]);
yticks( -600:100:600 );
ylabel("X-axis");

zlim([ -5 350 ]);
zticks( -100:100:500 );
zlabel("Y-Axis")

view( [ 135.00 45.00 ] );

hold off
