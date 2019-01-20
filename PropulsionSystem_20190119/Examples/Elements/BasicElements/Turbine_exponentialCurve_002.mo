within PropulsionSystem.Examples.Elements.BasicElements;

model Turbine_exponentialCurve_002
  extends Modelica.Icons.Example;
  
  package engineAir = Modelica.Media.Air.DryAirNasa;
 //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1800, nPorts = 1, p = 20 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_exponentialCurve turbine_exponentialCurve1(redeclare package Medium = engineAir, PRdes = 5, Tdes_1(displayUnit = "K") = 1800, pDes_1 = 20 * 101.3 * 1000, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1000)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.Ramp ramp_torque(duration = 5, height = 0, offset = 10000, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1 annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 4, height = 0, offset = 3000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
 PropulsionSystem.Sources.FlowSink flowSink1(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(turbine_exponentialCurve1.port_2, flowSink1.port_a) annotation(
    Line(points = {{40, 38}, {44, 38}, {44, 40}, {50, 40}, {50, 40}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, turbine_exponentialCurve1.flange_1) annotation(
    Line(points = {{10, 0}, {16, 0}, {16, 30}, {20, 30}}));
  connect(boundary.ports[1], turbine_exponentialCurve1.port_1) annotation(
    Line(points = {{0, 40}, {8, 40}, {8, 38}, {18, 38}}, color = {0, 127, 255}, thickness = 0.5));
  connect(ramp_Nmech.y, constrain_Nmech1.NmechDes_in) annotation(
    Line(points = {{-30, -21}, {-30, -21}, {-30, -17}, {-36, -17}, {-36, -9}, {-36, -9}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{-20, 0}, {-12, 0}, {-12, 0}, {-10, 0}}));
  connect(ramp_torque.y, torque1.tau) annotation(
    Line(points = {{-79, -2}, {-75, -2}, {-75, -2}, {-73, -2}}, color = {0, 0, 127}));
  connect(torque1.flange, constrain_Nmech1.flange_a) annotation(
    Line(points = {{-50, 0}, {-40, 0}, {-40, 0}, {-40, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01));
 
end Turbine_exponentialCurve_002;
