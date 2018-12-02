within PropulsionSystem.BaseClasses;

partial model PartialElementTwoPorts
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
    
  parameter Modelica.SIunits.Area Amech_1= 1.0 
    annotation(Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Area Amech_2= 1.0
    annotation(Dialog(group = "Geometry"));
  //********** Internal variables **********
  Medium.BaseProperties fluid_1 "flow station of inlet";
  Medium.BaseProperties fluid_2 "flow station of outlet";
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
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//##### none #####
end PartialElementTwoPorts;
