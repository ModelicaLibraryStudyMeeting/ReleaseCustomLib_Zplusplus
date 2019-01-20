within PropulsionSystem.Interfaces.ElementFrames;

partial model ElementFrame_2FluidPorts_2ShaftPorts
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
    Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium= Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching= true);
  //********** Parameters **********
  parameter Boolean allowFlowReversal= true
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);
  
  //----- inner-connected parameters -----
  //-----
  inner parameter Modelica.SIunits.MassFlowRate dmDes_1=10.0
    "design point dm at st.1, refered in subelement"
    annotation(
    Dialog(group = "Design Point Definition"));
  
  inner parameter Modelica.SIunits.AbsolutePressure pDes_1(displayUnit="Pa")= 101.3*1000
    "design point p at st.1, refered in subelement"
    annotation(
    Dialog(group = "Design Point Definition"));
  
  inner parameter Modelica.SIunits.Temperature Tdes_1= 288.15
    "design point T at st.1, refered in subelement"
    annotation(
    Dialog(group = "Design Point Definition"));
  
  inner parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes= 3000.0
    ""
    annotation(
    Dialog(group = "Characteristics"));
  
  
  parameter Modelica.SIunits.Area Amech_1= 1.0 
    annotation(Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Area Amech_2= 1.0
    annotation(Dialog(group = "Geometry"));
  //********** Internal variables **********
  Medium.BaseProperties fluid_1 "flow station of inlet";
  Medium.BaseProperties fluid_2 "flow station of outlet";
  Modelica.SIunits.Power pwr "power via shaft, positive if fluid generates power";
  Modelica.SIunits.Torque trq(start= 1.0) "trq via shaft";
  Modelica.SIunits.AngularVelocity omega(start= 1.0) "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi(start= 0.0) "mechanical rotation displacement, rad";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start=NmechDes) "mechanical rotation speed, rpm";
  //----- inner-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1
  (
    redeclare package Medium = Medium,
    m_flow(min=if allowFlowReversal then -Constants.inf else 0.0
          , start= m_flow_start)
  ) 
    annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_2
  (
    redeclare package Medium = Medium,
    m_flow(max=if allowFlowReversal then +Constants.inf else 0.0
          , start= m_flow_start)
  ) 
    annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1
    annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2
    annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********** Initialization **********
  parameter Medium.AbsolutePressure p_a_start= 101.3*1000
    "Start value of pressure at port a"
    annotation(Dialog(tab = "Initialization"));
  
  parameter Medium.AbsolutePressure p_b_start= 101.3*1000*0.99
    "Start value of pressure at port b"
    annotation(Dialog(tab = "Initialization"));
  
  parameter Medium.MassFlowRate m_flow_start = 1.0
    "Start value for mass flow rate"
     annotation(Evaluate=true, Dialog(tab = "Initialization"));
  //********** Protected objects **********
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Boolean port_a_exposesState = false
    "= true if port_a exposes the state of a fluid volume";
  parameter Boolean port_b_exposesState = false
    "= true if port_b.p exposes the state of a fluid volume";
  parameter Boolean showDesignFlowDirection = false
    "= false to hide the arrow in the model icon"; 


/********************************************************
  Model coding
********************************************************/
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  port_1.h_outflow= fluid_1.h;
  fluid_1.h= actualStream(port_1.h_outflow);
  fluid_1.Xi= actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h= actualStream(port_2.h_outflow);
  fluid_2.Xi= actualStream(port_2.Xi_outflow);
//-- shaft-front, flange_a --
  flange_1.phi = phi;
//-- shaft-front, flange_b --
  flange_2.phi = phi;
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//##### none #####


end ElementFrame_2FluidPorts_2ShaftPorts;
