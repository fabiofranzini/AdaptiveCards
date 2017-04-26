/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.microsoft.adaptivecards.objectmodel;

public final class AdaptiveCardSchemaKey {
  public final static AdaptiveCardSchemaKey Type = new AdaptiveCardSchemaKey("Type", AdaptiveCardObjectModelJNI.AdaptiveCardSchemaKey_Type_get());
  public final static AdaptiveCardSchemaKey Body = new AdaptiveCardSchemaKey("Body");
  public final static AdaptiveCardSchemaKey Version = new AdaptiveCardSchemaKey("Version");
  public final static AdaptiveCardSchemaKey MinVersion = new AdaptiveCardSchemaKey("MinVersion");
  public final static AdaptiveCardSchemaKey FallbackText = new AdaptiveCardSchemaKey("FallbackText");
  public final static AdaptiveCardSchemaKey BaseCardElement = new AdaptiveCardSchemaKey("BaseCardElement");
  public final static AdaptiveCardSchemaKey Separation = new AdaptiveCardSchemaKey("Separation");
  public final static AdaptiveCardSchemaKey Speak = new AdaptiveCardSchemaKey("Speak");
  public final static AdaptiveCardSchemaKey Url = new AdaptiveCardSchemaKey("Url");
  public final static AdaptiveCardSchemaKey ImageStyle = new AdaptiveCardSchemaKey("ImageStyle");
  public final static AdaptiveCardSchemaKey ImageSize = new AdaptiveCardSchemaKey("ImageSize");
  public final static AdaptiveCardSchemaKey AltText = new AdaptiveCardSchemaKey("AltText");
  public final static AdaptiveCardSchemaKey HorizontalAlignment = new AdaptiveCardSchemaKey("HorizontalAlignment");
  public final static AdaptiveCardSchemaKey Text = new AdaptiveCardSchemaKey("Text");
  public final static AdaptiveCardSchemaKey TextSize = new AdaptiveCardSchemaKey("TextSize");
  public final static AdaptiveCardSchemaKey TextWeight = new AdaptiveCardSchemaKey("TextWeight");
  public final static AdaptiveCardSchemaKey TextColor = new AdaptiveCardSchemaKey("TextColor");
  public final static AdaptiveCardSchemaKey IsSubtle = new AdaptiveCardSchemaKey("IsSubtle");
  public final static AdaptiveCardSchemaKey Wrap = new AdaptiveCardSchemaKey("Wrap");
  public final static AdaptiveCardSchemaKey MaxLines = new AdaptiveCardSchemaKey("MaxLines");
  public final static AdaptiveCardSchemaKey Items = new AdaptiveCardSchemaKey("Items");
  public final static AdaptiveCardSchemaKey Columns = new AdaptiveCardSchemaKey("Columns");
  public final static AdaptiveCardSchemaKey Size = new AdaptiveCardSchemaKey("Size");
  public final static AdaptiveCardSchemaKey Facts = new AdaptiveCardSchemaKey("Facts");
  public final static AdaptiveCardSchemaKey Title = new AdaptiveCardSchemaKey("Title");
  public final static AdaptiveCardSchemaKey Value = new AdaptiveCardSchemaKey("Value");
  public final static AdaptiveCardSchemaKey Images = new AdaptiveCardSchemaKey("Images");

  public final int swigValue() {
    return swigValue;
  }

  public String toString() {
    return swigName;
  }

  public static AdaptiveCardSchemaKey swigToEnum(int swigValue) {
    if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
      return swigValues[swigValue];
    for (int i = 0; i < swigValues.length; i++)
      if (swigValues[i].swigValue == swigValue)
        return swigValues[i];
    throw new IllegalArgumentException("No enum " + AdaptiveCardSchemaKey.class + " with value " + swigValue);
  }

  private AdaptiveCardSchemaKey(String swigName) {
    this.swigName = swigName;
    this.swigValue = swigNext++;
  }

  private AdaptiveCardSchemaKey(String swigName, int swigValue) {
    this.swigName = swigName;
    this.swigValue = swigValue;
    swigNext = swigValue+1;
  }

  private AdaptiveCardSchemaKey(String swigName, AdaptiveCardSchemaKey swigEnum) {
    this.swigName = swigName;
    this.swigValue = swigEnum.swigValue;
    swigNext = this.swigValue+1;
  }

  private static AdaptiveCardSchemaKey[] swigValues = { Type, Body, Version, MinVersion, FallbackText, BaseCardElement, Separation, Speak, Url, ImageStyle, ImageSize, AltText, HorizontalAlignment, Text, TextSize, TextWeight, TextColor, IsSubtle, Wrap, MaxLines, Items, Columns, Size, Facts, Title, Value, Images };
  private static int swigNext = 0;
  private final int swigValue;
  private final String swigName;
}

