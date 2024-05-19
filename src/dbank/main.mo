import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor DBank {
    // Initial value of the bank's current value
    stable var currentValue: Float = 300;
    currentValue := 300;
    Debug.print(debug_show(currentValue));

    stable var startTime = Time.now();
    // startTime := Time.now();
    Debug.print(debug_show(startTime));

    // Unique ID for the bank
    let id = 34234252542525;

    // Uncomment this line if you want to print the ID using Debug
    // Debug.print(debug_show(id));

    // Function to top up the bank balance
    public func topUp(amount: Float) {
        currentValue += amount;
        Debug.print(debug_show(currentValue));
    };

    // Function to withdraw from the bank balance
    public func withdrawal(amount: Float) {
        let tempValue: Float = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print(debug_show(currentValue));
        } else {
            Debug.print("Amount too large, currentValue would be negative.");
        }
    };

    // Query function to check the balance asynchronously
    public query func checkBalance(): async Float {
        return currentValue;
    };


    // topUp();

    public func compound() {
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 *+ Float.fromInt(timeElapsedS));
        startTime := currentTime;
    }
}



