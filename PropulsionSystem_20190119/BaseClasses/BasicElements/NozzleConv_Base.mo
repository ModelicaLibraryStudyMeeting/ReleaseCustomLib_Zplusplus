within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleConv_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
                 Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switch_Nozzle_Subelement = enumeration(
                                NoSubelement "",
                                curve_PR ""
                                )
                                annotation(
    Documentation(info = "<html>
    </html>"));
  
  type switch_calcFg=enumeration(
                      FullyExpandedFlow "",
                      NozzleExitFlow ""
                      )
                      annotation(
    Documentation(info = "<html>
    </html>"));
  //********** Parameters **********
  //----- switches -----
  parameter switch_calcFg switchCalc_Fg
    =switch_calcFg.NozzleExitFlow
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  //********** Internal variables **********
  Medium.BaseProperties fluid_2Tot "flow station of outlet, total";
  Modelica.SIunits.Velocity V_2(start = 10);
  Modelica.SIunits.Velocity V_2is(start = 10);
  Real PR(start = 1);
  Real CdTh(start = CdThDes);
  Real Cv(start = CvDes);
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  Modelica.SIunits.Force Fg "";
  //-----
  //-throat-
  Modelica.SIunits.MassFlowRate dmTh(start=10.0);
  Modelica.SIunits.Area Amech_th;
  Modelica.SIunits.Area AeTh;
  Modelica.SIunits.Velocity V_th(start= 10);
  Real MNth;
  Medium.BaseProperties fluidStat_th "static flow station of throat";
  Medium.BaseProperties fluid_th "flow station of throat";
  //-----
  //--full expansion--
  Modelica.SIunits.Velocity V_th_fullExp(start=344.0);
  Medium.BaseProperties fluidStat_th_fullExp "";
  //--choked states--
  Modelica.SIunits.Velocity V_th_choked(start=344.0);
  Medium.BaseProperties fluidStat_th_choked "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealOutput Fg_out annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 2.9976e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
initial equation
  port_1.m_flow=dmTh;
  
  
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  Fg_out = Fg;
//********** Eqns describing physics **********
  fluid_2Tot.p = fluid_1.p;
  PR = fluid_1.p / fluid_2.p;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- full expansion --
  fluid_1.h = h_2is + V_2is ^ 2.0 / 2.0;
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  V_2 = Cv * V_2is;
  fluid_1.h = fluid_2.h + V_2 ^ 2.0 / 2.0;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2Tot.h = 0;
//--- throat p, T ---
  fluid_th.p = fluid_1.p;
  fluid_th.h= fluid_1.h;
//fluidStat_th.p= fluid_2.p;
  fluidStat_th_fullExp.p = fluid_2.p;
  fluidStat_th_choked.p= fluid_2.p;
//--- fully-expanded ---
  fluidStat_th_fullExp.h = Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
  V_th_fullExp= sqrt( abs(2.0*(fluid_1.h - fluidStat_th_fullExp.h )) );
//--- velocity if choked state ---
  V_th_choked = 1.0 * Medium.velocityOfSound(fluidStat_th_choked.state);
  fluidStat_th_choked.h= fluid_1.h - 1.0/2.0 * V_th_choked^(2.0);
//evaluate choked or not
  if V_th_fullExp >= V_th_choked then
//--- case of choked ---
    V_th = V_th_choked;
  else
//--- case of unchoked ---
    V_th = V_th_fullExp;
  end if;
//--- throat state ---
  MNth = V_th / Medium.velocityOfSound(fluidStat_th.state);
  fluidStat_th.h= fluid_1.h - 1.0/2.0 * V_th^(2.0);
  
  fluidStat_th.h= Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
  
  dmTh= fluid_th.d*V_th*AeTh;
  dmTh= abs(port_1.m_flow);
  AeTh= Amech_th*CdTh;
//-- performance characteristics --
  if switchCalc_Fg == switch_calcFg.FullyExpandedFlow then
    Fg = (-1) * port_2.m_flow * V_2;
  elseif switchCalc_Fg == switch_calcFg.NozzleExitFlow then
    Fg = Cv * V_th * dmTh + (fluidStat_th.p - fluid_2.p) * AeTh;
  end if;
  
/********************************************************
  Graphics
********************************************************/  


  annotation(
    Icon(graphics = {Polygon(origin = {0, 10}, fillColor = {255, 221, 96}, fillPattern = FillPattern.Solid, points = {{-80, 70}, {-80, -90}, {60, -50}, {60, 30}, {-80, 70}}), Text(origin = {-54, 20}, extent = {{-26, -8}, {94, -30}}, textString = "%name"), Rectangle(origin = {-94, 80}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-6, 2}, {14, -2}}), Text(origin = {88, 53}, extent = {{-16, 11}, {8, 1}}, textString = "*static"), Line(origin = {81.88, 37.0395}, points = {{-23, 2}, {17, 2}, {17, 42}}, pattern = LinePattern.Dot, thickness = 0.5), Line(origin = {53.048, -69.232}, points = {{-15, 23}, {11, -17}}), Line(origin = {-10, 20}, points = {{-30, 0}, {30, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)));

  
end NozzleConv_Base;
