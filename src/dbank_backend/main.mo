import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Dbank{
  stable var currentvalue: Float =100;
  // currentvalue:=200;
  stable var startTime=Time.now();
  public func topup(amount: Float){
    currentvalue += amount;
    Debug.print(debug_show(currentvalue));

  };
  public func withdrawl(amount: Float){
    currentvalue -= amount;
    Debug.print(debug_show(currentvalue));

  };
  public query func checkbalance ():async Float{
    return currentvalue;
  };
  public func compound(){
    let currentTime=Time.now();
    let timeElapsed=(currentTime-startTime)/1000000000;
    currentvalue:=currentvalue*(1.01**Float.fromInt(timeElapsed));
    startTime:=currentTime;
  };
}