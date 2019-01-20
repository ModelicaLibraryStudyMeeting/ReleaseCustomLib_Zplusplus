within PropulsionSystem.Examples.Elements.BasicElements;

model Turbine_exponentialCurve_001
  extends Modelica.Icons.Example;
  
  package engineAir = Modelica.Media.Air.DryAirNasa;
 //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1000, nPorts = 1, p = 3 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_exponentialCurve turbine_exponentialCurve1(redeclare package Medium = engineAir, Tdes_1(displayUnit = "K") = 1000, pDes_1 = 3 * 101.3 * 1000, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 100)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir,m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
 Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.Ramp ramp1(duration = 4, height = 0, offset = 100, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(turbine_exponentialCurve1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{10, 38}, {16, 38}, {16, 40}, {20, 40}, {20, 40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], turbine_exponentialCurve1.port_1) annotation(
    Line(points = {{-80, 40}, {-56, 40}, {-56, 38}, {-12, 38}}, color = {0, 127, 255}, thickness = 0.5));
  connect(inertia1.flange_b, turbine_exponentialCurve1.flange_1) annotation(
    Line(points = {{-20, 0}, {-14, 0}, {-14, 30}, {-10, 30}}));
  connect(speed1.flange, inertia1.flange_a) annotation(
    Line(points = {{-50, 0}, {-40, 0}, {-40, 0}, {-40, 0}}));
  connect(ramp1.y, speed1.w_ref) annotation(
    Line(points = {{-79, 0}, {-73, 0}, {-73, 0}, {-73, 0}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
 
end Turbine_exponentialCurve_001;
