within PropulsionSystem.Elements.BasicElements;

model Compressor
  extends PropulsionSystem.BaseClasses.BasicElements.Compressor_Base;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
    Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  
  
  //********** Type definitions, only valid in this class **********
  //##### none #####
  
  
  //********** Parameters **********
  //----- inner-connected parameters -----
  inner parameter Real PRdes= 20 
    "pressure ratio at design point"
    annotation(
    Dialog(group = "Characteristics"));
  
  inner parameter Real effDes= 0.80 
    "adiabatic efficiency at design point"
    annotation(
    Dialog(group = "Characteristics"));
  
  
  
  //----- inner-connected parameters -----
  //##### none #####
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_Wc_1
      =PropulsionSystem.Types.switches.switch_parameter_input.asCalculated
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
    
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_PR
      =PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_eff
      =PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  
      
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate WcCalc_1(start= WcDes_1_def);
  //----- inner-connected variables -----
  //##### none #####
  //----- outer-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Internal model **********
  //##### none #####
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
  
  
  //********** Internal model **********
  //##### none #####
  
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput Wc_1_in
    if (switchInput_Wc_1== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-80, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput PR_in
    if (switchInput_PR== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {0, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput eff_in
    if (switchInput_eff== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-40, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {40, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  
  
algorithm
//##### none #####
equation
  //********** Geometries **********
  //##### none #####
  
  
  //********** Connections, interface <-> internal variables **********
  //--- Wc_1 ---
  if (switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
    WcCalc_1 = WcDes_1;
    Wc_1= WcCalc_1;
  elseif (switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) then
    WcCalc_1 = Wc_1_in;
    Wc_1= WcCalc_1;
  elseif (switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) then
    Wc_1= WcCalc_1;
  end if;
  //--- PR ---
  if (switchInput_PR == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
    PR = PRdes;
  elseif (switchInput_PR == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) then
    PR = PR_in;
  end if;
  //--- eff ---
  if (switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
    eff = effDes;
  elseif (switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) then
    eff = eff_in;
  end if;
  
  
  //********** Eqns describing physics **********
  //##### none #####
  
  
  
/********************************************************
  Graphics
********************************************************/
//identical to "Compressor_Base"


end Compressor;
