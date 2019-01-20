within PropulsionSystem.Examples.Engines;

model temp
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary_Cmp(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-102, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Cmp(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {-32, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech_Cmp(duration = 4, height = 0, offset = 3000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-2, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech_Cmp(switchInput_Nmech = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-2, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_Cmp annotation(
    Placement(visible = true, transformation(origin = {28, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_torque_Cmp(duration = 5, height = 0, offset = -10000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Turbine_exponentialCurve Trb041(redeclare package Medium = engineAir, PRcurveDes = 6, PRdes = 8, Tdes_1(displayUnit = "K") = 1800, pDes_1 = 8.13 * 101.3 * 1000, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Trb(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_torque_Trb(duration = 5, height = 0, offset = 10000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech_Trb annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_Trb annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech_Trb(duration = 4, height = 0, offset = 3000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.FlowSink flowSink_Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {190, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel Brn036 annotation(
    Placement(visible = true, transformation(origin = {94, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector HeatInject036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1800) annotation(
    Placement(visible = true, transformation(origin = {118, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_ellipticalCurve Cmp020(redeclare package Medium = engineAir, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-150, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cmp020.port_2, HeatInject036.port_1) annotation(
    Line(points = {{-60, 98}, {42, 98}, {42, -32}, {108, -32}, {108, -32}}, color = {0, 127, 255}));
  connect(Trb041.port_2, flowSink_Trb.port_a) annotation(
    Line(points = {{170, -32}, {172, -32}, {172, -30}, {174, -30}, {174, -30}, {180, -30}, {180, -30}}, color = {0, 127, 255}));
  connect(inertia_Trb.flange_b, Trb041.flange_1) annotation(
    Line(points = {{140, -70}, {146, -70}, {146, -40}, {150, -40}}));
  connect(HeatInject036.port_2, Trb041.port_1) annotation(
    Line(points = {{128, -32}, {150, -32}, {150, -32}, {150, -32}}, color = {0, 127, 255}));
  connect(constrain_Nmech_Trb.flange_b, inertia_Trb.flange_a) annotation(
    Line(points = {{110, -70}, {114, -70}, {114, -68}, {116, -68}, {116, -68}, {119, -68}, {119, -70}, {120, -70}}));
  connect(torque_Trb.flange, constrain_Nmech_Trb.flange_a) annotation(
    Line(points = {{80, -70}, {90, -70}, {90, -68}, {90, -68}, {90, -70}, {90, -70}}));
  connect(ramp_Nmech_Trb.y, constrain_Nmech_Trb.NmechDes_in) annotation(
    Line(points = {{100, -89}, {100, -89}, {100, -87}, {98, -87}, {98, -85}, {94, -85}, {94, -75}, {94, -75}, {94, -77}, {94, -77}}, color = {0, 0, 127}));
  connect(ramp_torque_Trb.y, torque_Trb.tau) annotation(
    Line(points = {{51, -70}, {53, -70}, {53, -70}, {53, -70}, {53, -70}, {56, -70}, {56, -70}, {57, -70}}, color = {0, 0, 127}));
  connect(Brn036.HeatPort_b, HeatInject036.HeatPort_1) annotation(
    Line(points = {{102, -10}, {116, -10}, {116, -30}, {116, -30}}, color = {191, 0, 0}));
  connect(Cmp020.flange_2, inertia_Cmp.flange_a) annotation(
    Line(points = {{-60, 90}, {-54, 90}, {-54, 60}, {-42, 60}, {-42, 60}}));
  connect(boundary_Cmp.ports[1], Cmp020.port_1) annotation(
    Line(points = {{-92, 100}, {-86, 100}, {-86, 98}, {-80, 98}, {-80, 98}}, color = {0, 127, 255}, thickness = 0.5));
  connect(torque_Cmp.tau, ramp_torque_Cmp.y) annotation(
    Line(points = {{40, 58}, {49, 58}, {49, 60}, {51, 60}}, color = {0, 0, 127}));
  connect(constrain_Nmech_Cmp.NmechDes_in, ramp_Nmech_Cmp.y) annotation(
    Line(points = {{-8, 51}, {-8, 55.4}, {-10, 55.4}, {-10, 49.4}, {-4, 49.4}, {-4, 43.4}, {-2, 43.4}, {-2, 39}}, color = {0, 0, 127}));
  connect(inertia_Cmp.flange_b, constrain_Nmech_Cmp.flange_a) annotation(
    Line(points = {{-22, 60}, {-17, 60}, {-17, 64}, {-12, 64}, {-12, 58}}));
  connect(constrain_Nmech_Cmp.flange_b, torque_Cmp.flange) annotation(
    Line(points = {{8, 58}, {13, 58}, {13, 62}, {18, 62}, {18, 60}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    __OpenModelica_commandLineOptions = "");
end temp;
