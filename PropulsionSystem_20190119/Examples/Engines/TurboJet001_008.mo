within PropulsionSystem.Examples.Engines;

model TurboJet001_008
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(dm_fuel_des = 0.1, switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384) annotation(
    Placement(visible = true, transformation(origin = {240, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {270, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, Tdes_1(displayUnit = "K") = 288.16, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 0.1, height = 0.2, offset = 0.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 1.0e3, a(fixed = true, start = 0), w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium=engineAir,diameter = 0.1, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium=engineAir,V = 0.01, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium=engineAir,diameter=0.1, length=0.2) annotation(
    Placement(visible = true, transformation(origin = {200, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{150, -30}, {156, -30}, {156, -20}, {170, -20}, {170, -20}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{170, -20}, {184, -20}, {184, -30}, {190, -30}, {190, -30}}, color = {0, 127, 255}));
  connect(pipe1.port_b, Nzl070.port_1) annotation(
    Line(points = {{210, -30}, {218, -30}, {218, -22}, {230, -22}, {230, -22}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -20}, {-90, 22}, {250, 22}, {250, -22}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{245, -30}, {253.3, -30}, {253.3, -84}, {259, -84}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{61, -4}, {125, -4}, {125, -96}, {259, -96}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -34}, {-48, -34}, {-48, -88}, {259, -88}}, color = {0, 0, 127}));
  connect(ramp_rating.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{12, 30}, {22, 30}, {22, 6}, {40, 6}, {40, 6}}, color = {0, 0, 127}));
  connect(Trb041.port_2, pipe.port_a) annotation(
    Line(points = {{120, -22}, {126, -22}, {126, -30}, {130, -30}, {130, -30}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -22}, {-42, -22}, {-42, -22}, {-42, -22}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-22, -30}, {-16, -30}, {-16, -60}, {50, -60}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{-22, -22}, {30, -22}, {30, -22}, {30, -22}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -60}, {94, -60}, {94, -30}, {100, -30}, {100, -30}}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{80, -22}, {100, -22}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{50, -22}, {60, -22}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{60, 0}, {70, 0}, {70, -20}}, color = {191, 0, 0}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -20}, {-68, -20}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -32}, {-67, -32}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {300, 100}}), graphics = {Rectangle(origin = {55, -15}, pattern = LinePattern.Dash, extent = {{-29, 27}, {35, -31}}), Text(origin = {40, 17}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {300, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));

end TurboJet001_008;
