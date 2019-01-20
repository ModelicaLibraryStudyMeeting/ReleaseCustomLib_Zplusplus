within PropulsionSystem.Examples.Engines;

model TurboFan001_003
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlt010(redeclare package Medium = engineAir, effRamDes = 0.98) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct023(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.05) annotation(
    Placement(visible = true, transformation(origin = {140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1800, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {170, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel MainComb annotation(
    Placement(visible = true, transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {230, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShH(J = 200) annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct125(redeclare package Medium = engineAir, dPqPdes = 0.01) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct130(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {250, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct055(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {290, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShL(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance Perf001 annotation(
    Placement(visible = true, transformation(origin = {380, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add calc_engineFg annotation(
    Placement(visible = true, transformation(origin = {350, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp120(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp020(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division calc_BPR annotation(
    Placement(visible = true, transformation(origin = {10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT annotation(
    Placement(visible = true, transformation(origin = {150, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp120(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp025(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb040(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {202, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb046(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {260, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl170(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {280, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {320, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_TIT.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{161, 20}, {181, 20}, {181, -58}, {179, -58}, {179, -56}}, color = {0, 0, 127}));
  connect(ShH.flange_b, Trb040.flange_1) annotation(
    Line(points = {{180, -90}, {186, -90}, {186, -60}, {192, -60}, {192, -60}}));
  connect(Cmp025.flange_2, ShH.flange_a) annotation(
    Line(points = {{120, -60}, {124, -60}, {124, -90}, {160, -90}, {160, -90}}));
  connect(ShL.flange_b, Trb046.flange_1) annotation(
    Line(points = {{130, -110}, {244, -110}, {244, -60}, {250, -60}, {250, -60}}));
  connect(Cmp020.flange_2, ShL.flange_a) annotation(
    Line(points = {{60, -60}, {64, -60}, {64, -110}, {110, -110}, {110, -110}}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{30, -20}, {34, -20}, {34, -60}, {40, -60}, {40, -60}}));
  connect(MainComb.dm_fuel_out, Perf001.dm_fuel_in) annotation(
    Line(points = {{161, -34}, {306, -34}, {306, -156}, {369, -156}}, color = {0, 0, 127}));
  connect(calc_engineFg.y, Perf001.Fg_in) annotation(
    Line(points = {{361, -130}, {366, -130}, {366, -144}, {369, -144}}, color = {0, 0, 127}));
  connect(inlt010.Fram_out, Perf001.Fram_in) annotation(
    Line(points = {{-53, -64}, {-44, -64}, {-44, -148}, {371, -148}}, color = {0, 0, 127}));
  connect(Nzl170.Fg_out, calc_engineFg.u2) annotation(
    Line(points = {{285, -20}, {291, -20}, {291, -136}, {337, -136}, {337, -136}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, calc_engineFg.u1) annotation(
    Line(points = {{325, -60}, {333, -60}, {333, -100}, {327, -100}, {327, -124}, {337, -124}, {337, -124}}, color = {0, 0, 127}));
  connect(Duct055.port_2, Nzl070.port_1) annotation(
    Line(points = {{302, -52}, {312, -52}, {312, -52}, {312, -52}}, color = {0, 127, 255}));
  connect(Trb046.port_2, Duct055.port_1) annotation(
    Line(points = {{270, -52}, {280, -52}, {280, -52}, {280, -52}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp020.m_flow, calc_BPR.u2) annotation(
    Line(points = {{10, -61}, {10, -81}, {-16, -81}, {-16, -134}, {-2, -134}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp120.m_flow, calc_BPR.u1) annotation(
    Line(points = {{-10, -21}, {-10, -124}, {-2, -124}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Trb046.port_1) annotation(
    Line(points = {{240, -52}, {250, -52}, {250, -52}, {250, -52}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl170.port_2) annotation(
    Line(points = {{-90, -50}, {-90, 10}, {292, 10}, {292, -12}}, color = {0, 127, 255}));
  connect(Duct130.port_2, Nzl170.port_1) annotation(
    Line(points = {{260, -12}, {268, -12}, {268, -12}, {270, -12}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -50}, {-90, 16}, {332, 16}, {332, -52}}, color = {0, 127, 255}));
  connect(Trb040.port_2, Duct045.port_1) annotation(
    Line(points = {{212, -52}, {220, -52}, {220, -52}, {220, -52}}, color = {0, 127, 255}));
  connect(Duct125.port_2, Duct130.port_1) annotation(
    Line(points = {{70, -12}, {238, -12}}, color = {0, 127, 255}));
  connect(Trb040.port_1, Brn036.port_2) annotation(
    Line(points = {{194, -52}, {182, -52}, {182, -52}, {182, -52}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Duct030.port_1) annotation(
    Line(points = {{120, -52}, {128, -52}, {128, -52}, {130, -52}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{152, -52}, {157, -52}, {157, -54}, {162, -54}}, color = {0, 127, 255}));
  connect(MainComb.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{160, -30}, {170, -30}, {170, -52}}, color = {191, 0, 0}));
  connect(Duct023.port_2, Cmp025.port_1) annotation(
    Line(points = {{90, -52}, {100, -52}, {100, -52}, {100, -52}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct023.port_1) annotation(
    Line(points = {{60, -52}, {70, -52}, {70, -52}, {70, -52}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Duct125.port_1) annotation(
    Line(points = {{30, -12}, {50, -12}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp020.port_b, Cmp020.port_1) annotation(
    Line(points = {{22, -50}, {30, -50}, {30, -52}, {42, -52}, {42, -52}}, color = {0, 127, 255}));
  connect(inlt010.port_2, massFlowRate_Cmp020.port_a) annotation(
    Line(points = {{-50, -52}, {2, -52}, {2, -50}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp120.port_b, Cmp120.port_1) annotation(
    Line(points = {{0, -10}, {6, -10}, {6, -12}, {10, -12}}, color = {0, 127, 255}));
  connect(inlt010.port_2, massFlowRate_Cmp120.port_a) annotation(
    Line(points = {{-50, -52}, {-34, -52}, {-34, -8}, {-18, -8}, {-18, -10}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluid2Eng, inlt010.port_1) annotation(
    Line(points = {{-80, -54}, {-70, -54}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, inlt010.V_tot_in) annotation(
    Line(points = {{-79, -66}, {-67, -66}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    version = "",
    uses(Modelica(version = "3.2.2")),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TurboFan001_003;
