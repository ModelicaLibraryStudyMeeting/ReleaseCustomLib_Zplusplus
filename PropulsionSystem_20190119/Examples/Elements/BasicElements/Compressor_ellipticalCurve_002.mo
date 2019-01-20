within PropulsionSystem.Examples.Elements.BasicElements;

model Compressor_ellipticalCurve_002
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_ellipticalCurve compressor_ellipticalCurve001(redeclare package Medium = Modelica.Media.Air.DryAirNasa, NmechDes = 3000, dmDes_1 = 10, switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 4, height = 0, offset = 3000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.FlowSink flowSink1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, m_flow(start = -10)) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(switchInput_Nmech = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 4, height = 0, offset = -10000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torque1.tau, ramp2.y) annotation(
    Line(points = {{62, 0}, {80, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, torque1.flange) annotation(
    Line(points = {{30, 0}, {40, 0}, {40, 0}, {40, 0}}));
  connect(constrain_Nmech1.NmechDes_in, ramp1.y) annotation(
    Line(points = {{14, -6}, {14, -6}, {14, -12}, {20, -12}, {20, -18}, {20, -18}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, constrain_Nmech1.flange_a) annotation(
    Line(points = {{0, 0}, {10, 0}, {10, 0}, {10, 0}}));
  connect(compressor_ellipticalCurve001.port_2, flowSink1.port_a) annotation(
    Line(points = {{-30, 38}, {-20, 38}, {-20, 40}, {-10, 40}, {-10, 40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], compressor_ellipticalCurve001.port_1) annotation(
    Line(points = {{-72, 40}, {-72, 38}, {-50, 38}}, color = {0, 127, 255}, thickness = 0.5));
  connect(compressor_ellipticalCurve001.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-30, 30}, {-26, 30}, {-26, 0}, {-20, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end Compressor_ellipticalCurve_002;
