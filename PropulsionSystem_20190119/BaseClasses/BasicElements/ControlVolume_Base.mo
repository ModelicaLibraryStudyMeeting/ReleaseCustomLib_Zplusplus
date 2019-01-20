within PropulsionSystem.BaseClasses.BasicElements;

partial model ControlVolume_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Rectangle(origin = {-74, 80}, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-26, 2}, {14, -2}}), Rectangle(origin = {86, 80}, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-26, 2}, {14, -2}}), Rectangle(origin = {-60, 56}, rotation = -90, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-26, 2}, {4, -2}}), Rectangle(origin = {60, 56}, rotation = -90, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-26, 2}, {4, -2}}), Ellipse(origin = {-28, 29}, fillColor = {0, 174, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-52, 51}, {108, -109}}, endAngle = 360), Text(origin = {-9, 90}, fillPattern = FillPattern.Solid, extent = {{-51, -12}, {69, 8}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end ControlVolume_Base;
