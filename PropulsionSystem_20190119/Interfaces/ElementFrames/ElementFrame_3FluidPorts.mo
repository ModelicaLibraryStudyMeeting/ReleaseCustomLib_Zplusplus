within PropulsionSystem.Interfaces.ElementFrames;

partial model ElementFrame_3FluidPorts

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
    annotation(
    Dialog(tab="Assumptions"), Evaluate=true);
  //********** Internal variables **********
  Medium.BaseProperties fluid_1 "flow station of port_1 with isentropic compression";
  Medium.BaseProperties fluid_2 "flow station of port_2 with isentropic compression";
  Medium.BaseProperties fluid_3 "flow station of port_3 with isentropic compression";
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
      m_flow(min=if allowFlowReversal then -Constants.inf else 0.0
            )
    )
      annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  Modelica.Fluid.Interfaces.FluidPort_b port_3
    (
      redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Constants.inf else 0.0
            )
    ) 
      annotation(
      Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //********** Initialization **********
  parameter Medium.MassFlowRate m_flow_start = 1.0
    "Start value for mass flow rate"
     annotation(Evaluate=true, Dialog(tab = "Initialization"));
  //********** Protected objects **********
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  
  
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
//-- fluidPort_3 --
  fluid_3.p = port_3.p;
  fluid_3.h= actualStream(port_3.h_outflow);
  fluid_3.Xi= actualStream(port_3.Xi_outflow);
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//##### none #####


end ElementFrame_3FluidPorts;
